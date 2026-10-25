#' List the spatial biology suite members
#'
#' @return A character vector of the four package names in workflow order:
#'   segmentation, cell tables, phenotyping, and spatial analysis.
#' @export
#' @examples
#' phenoloom_packages()
phenoloom_packages <- function() {
  c("segmantR", "cellspecR", "gatekeepR", "phenoscapR")
}

#' Report installed spatial biology suite versions
#'
#' Reads installed package metadata from the active R library paths without
#' loading member namespaces or starting external engines. When multiple
#' versions are installed, the first library in `.libPaths()` takes priority.
#' This is an installation inventory; it does not test external engines or
#' establish compatibility of an analysis workflow.
#'
#' @return A data frame with one row per suite member and columns `package`
#'   (character), `installed` (logical), and `version` (character, `NA` for
#'   missing members).
#' @export
#' @examples
#' phenoloom_status()
phenoloom_status <- function() {
  packages <- phenoloom_packages()
  installed <- utils::installed.packages()
  rows <- match(packages, installed[, "Package"])
  data.frame(
    package = packages,
    installed = !is.na(rows),
    version = unname(installed[rows, "Version"]),
    stringsAsFactors = FALSE
  )
}
