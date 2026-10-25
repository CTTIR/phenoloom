test_that("suite membership follows the declared workflow", {
  expected <- c("segmantR", "cellspecR", "gatekeepR", "phenoscapR")
  expect_identical(phenoloom_packages(), expected)
  depends <- utils::packageDescription("phenoloom")$Depends
  dependencies <- trimws(strsplit(depends, ",")[[1L]])
  dependencies <- sub("[[:space:]]*\\(.*\\)$", "", dependencies)
  expect_setequal(setdiff(dependencies, "R"), expected)
})

test_that("status reflects the active library metadata", {
  status <- phenoloom_status()
  expect_identical(names(status), c("package", "installed", "version"))
  expect_identical(status$package, phenoloom_packages())
  expect_true(all(status$installed))
  versions <- vapply(
    phenoloom_packages(),
    function(package) as.character(utils::packageVersion(package)),
    character(1)
  )
  expect_identical(status$version, unname(versions))
})

test_that("status reports missing members and first-library precedence", {
  metadata <- matrix(
    c("cellspecR", "cellspecR", "segmantR", "1.2.3", "0.9.0", "0.4.0"),
    ncol = 2,
    dimnames = list(NULL, c("Package", "Version"))
  )
  local_mocked_bindings(installed.packages = function(...) metadata,
                        .package = "utils")
  status <- phenoloom_status()
  expect_identical(status$installed, c(TRUE, TRUE, FALSE, FALSE))
  expect_identical(
    status$version, c("0.4.0", "1.2.3", NA_character_, NA_character_)
  )
})

test_that("status handles an empty package inventory", {
  metadata <- matrix(character(), nrow = 0L, ncol = 2L,
                     dimnames = list(NULL, c("Package", "Version")))
  local_mocked_bindings(installed.packages = function(...) metadata,
                        .package = "utils")
  status <- phenoloom_status()
  expect_false(any(status$installed))
  expect_true(all(is.na(status$version)))
})
