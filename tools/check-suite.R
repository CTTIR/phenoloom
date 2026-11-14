# Check interoperability of installed suite members with synthetic fixtures.
# Run from a project library: Rscript --vanilla tools/check-suite.R
# No external segmentation engine or study-level validity is exercised.

check_suite <- function() {
  packages <- c("phenoloom", "segmantR", "cellspecR", "gatekeepR", "phenoscapR")
  invisible(lapply(packages, loadNamespace))
  receipts <- do.call(rbind, lapply(packages, function(package) {
    d <- utils::packageDescription(package)
    revision <- d[["RemoteSha"]]
    if (is.null(revision)) revision <- NA_character_
    data.frame(package = package, version = d[["Version"]], revision = revision)
  }))
  print(receipts, row.names = FALSE)

  work <- tempfile("suite-integration-")
  dir.create(work)
  on.exit(unlink(work, recursive = TRUE), add = TRUE)
  x <- cellspecR::cs_example()
  x$cells$cell_id <- sprintf("%03d", as.integer(x$cells$cell_id))
  # Two distinct cells at one location must survive storage and targeting.
  stopifnot(x$cells$image_id[1] == x$cells$image_id[2])
  for (coordinate in c("x", "y", "x_px", "y_px")) {
    x$cells[[coordinate]][2] <- x$cells[[coordinate]][1]
  }
  x$measurements[1:2, "cell:CD3e:mean"] <- c(10, 30)
  cellspecR::cs_assert_valid(x)
  for (format in c("parquet", "tsv.gz")) {
    path <- file.path(work, format)
    cellspecR::cs_write(x, path, format = format)
    stopifnot(all(cellspecR::cs_verify(path)$ok))
    y <- gatekeepR::gk_read_cellspec(path)
    for (field in c("cells", "measurements", "dictionary", "images", "channels", "adjacency")) {
      stopifnot(identical(x[[field]], y[[field]]))
    }
    z <- phenoscapR::FromCellspec(y)
    stopifnot(
      identical(phenoscapR::GetData(z, slot = "counts"), x$measurements),
      identical(phenoscapR::Meta(z)$cell_id, x$cells$cell_id),
      identical(phenoscapR::Meta(z)$sample_id, x$cells$image_id),
      identical(phenoscapR::Meta(z)$source_sample_id, x$cells$sample_id),
      identical(unname(as.matrix(phenoscapR::Coords(z))), unname(as.matrix(x$cells[c("x", "y")])))
    )
    # Explicit synthetic threshold, no learned or clinical biological labels.
    panel <- gatekeepR::gk_panel("CD3e",
      role = "identity", transform = "none",
      threshold_method = "manual", threshold_args = list(CD3e = list(value = 20))
    )
    cfg <- gatekeepR::gk_config(gatekeepR::gk_signal_policy("CD3e"), panel,
      hierarchy = gatekeepR::gk_hierarchy(list(gatekeepR::gk_rule("R1", "Signal above threshold", all_of = "CD3e")), version = "1.0.0")
    )
    prep <- gatekeepR::gk_prepare(y, cfg, quiet = TRUE)
    th <- gatekeepR::gk_thresholds(prep, cfg, seed = 1L)
    cl <- gatekeepR::gk_classify(prep, th, cfg)
    stopifnot(identical(unname(cl$calls[, "CD3e"]), unname(x$measurements[, "cell:CD3e:mean"] >= 20)))
    # Radius density agrees with independent within-image pairwise calculation.
    z <- phenoscapR::CellDensity(z, radius = 100)
    expected <- numeric(nrow(x$cells))
    for (image_id in unique(x$cells$image_id)) {
      ii <- which(x$cells$image_id == image_id)
      dd <- as.matrix(dist(x$cells[ii, c("x", "y")]))
      diag(dd) <- Inf
      expected[ii] <- rowSums(dd <= 100)
    }
    stopifnot(identical(as.numeric(phenoscapR::Meta(z)$density), expected))
    stopifnot(identical(cl$cells$image_id, y$cells$image_id),
              identical(cl$cells$cell_id, y$cells$cell_id))
    y$cells$phenotype <- cl$cells$cell_type
    classified <- phenoscapR::FromCellspec(y)
    by_type <- lapply(unique(y$cells$phenotype), function(target) {
      result <- phenoscapR::CellDensity(classified, radius = 100, target = target)
      phenoscapR::Meta(result)$density
    })
    stopifnot(identical(as.numeric(Reduce(`+`, by_type)), expected))
    cat("PASS canonical roundtrip, gating and spatial import:", format, "\n")
  }
  # Hand-defined masks provide an oracle independent of each package's adapters.
  pixels <- array(0, dim = c(10L, 12L, 1L))
  labels <- matrix(0L, nrow = 10L, ncol = 12L)
  labels[2:4, 3:6] <- 7L
  labels[7:8, 9:10] <- 42L
  pixels[, , 1][labels == 7L] <- 10
  pixels[, , 1][labels == 42L] <- 30
  img <- segmantR::new_sg_image(pixels, channels = "CD3e")
  mask <- segmantR::new_sg_mask(labels)
  ft <- segmantR::sg_extract_features(img, mask, features = c("intensity", "morphology", "location"))
  source_path <- file.path(work, "segmant.csv")
  utils::write.csv(ft, source_path, row.names = FALSE)
  seg <- cellspecR::cs_read(source_path, format = "segmantr", pixel_size = 0.5, image_id = "frame001", sample_id = "sample001")
  cellspecR::cs_assert_valid(seg)
  stopifnot(
    identical(seg$cells$cell_id, c("7", "42")),
    isTRUE(all.equal(seg$cells$x, c(2, 4.5))),
    isTRUE(all.equal(seg$cells$y, c(1.25, 3.5))),
    isTRUE(all.equal(seg$cells$area, c(3, 1))),
    isTRUE(all.equal(unname(seg$measurements[, "cell:CD3e:mean"]), c(10, 30)))
  )
  spatial <- phenoscapR::FromCellspec(seg)
  stopifnot(
    identical(phenoscapR::Meta(spatial)$sample_id, rep("frame001", 2)),
    identical(phenoscapR::Meta(spatial)$source_sample_id, rep("sample001", 2))
  )
  cat("PASS segmentation feature table, explicit calibration and spatial frame preservation\n")
  print(sessionInfo())
  invisible(receipts)
}

check_suite()
