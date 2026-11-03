# phenoloom 0.1.2

* Check the installed suite during package checks: all four member namespaces
  must load and the documented synthetic cell-table example must validate.
  Loading the metapackage continues to export no functions and attach no members.
* Clarify required native dependencies and optional segmentation backends,
  provide a verified first-use path, and show how to record installed versions
  and source revisions for a reproducible analysis.
* Add package discovery metadata for the CTTIR R-universe registry.

# phenoloom 0.1.1

* The logo marks the suite with the CTTIR gold border it shares with cttiR,
  while keeping its topic colours.

* Standardize the named v5 package logo across README, documentation pages
  and available application headers, with matching light and dark artwork.


* Simplify the metapackage to an installation framework for the four member
  packages and their required dependencies.
* Declare suite members in `Imports` so loading the metapackage does not
  attach them.
* Remove inventory functions, analysis examples, and their test and coverage
  scaffolding. Retain package installation guidance and shared package checks.

# phenoloom 0.1.0

* Introduce the CTTIR Spatial Biology Suite metapackage with `segmantR`,
  `cellspecR`, `gatekeepR`, and `phenoscapR` as required dependencies.
* Add suite membership and installed-version reporting helpers.
* Include an introductory vignette and shared CTTIR quality workflows.
