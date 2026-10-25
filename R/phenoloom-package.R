#' CTTIR Spatial Biology Suite
#'
#' A metapackage for installing and attaching `segmantR`, `cellspecR`,
#' `gatekeepR`, and `phenoscapR`. Use [phenoloom_packages()] to list members and
#' [phenoloom_status()] to report installed versions.
#'
#' Attaching `phenoloom` attaches all four member packages through the standard
#' R dependency mechanism. Use explicit `package::function()` calls when
#' writing analyses to make function ownership clear. Optional external
#' segmentation engines are configured through `segmantR` separately.
#'
#' @seealso <https://github.com/CTTIR/phenoloom>
#' @keywords internal
"_PACKAGE"
