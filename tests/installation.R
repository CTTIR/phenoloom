# Exercise the installed package's sole user-facing contract, without a test framework.
members <- c("segmantR", "cellspecR", "gatekeepR", "phenoscapR")
before <- search()
library(phenoloom)
stopifnot(length(getNamespaceExports("phenoloom")) == 0L)
stopifnot(identical(setdiff(search(), "package:phenoloom"), before))

# Installation alone can succeed without loading a member's native dependencies.
# Load the actual namespaces and use the documented public entry point.
invisible(lapply(members, loadNamespace))
example <- cellspecR::cs_example()
cellspecR::cs_assert_valid(example)
stopifnot(nrow(example$cells) > 0L)
