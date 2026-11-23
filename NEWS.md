# phenoloom 0.2.0

* Add a reproducible cross-package acceptance script and platform CI for
  canonical storage, gating, spatial counts and calibrated segmentation
  features. The installation-only package API is unchanged.
* The acceptance script `tools/check-suite.R` also requires a sample
  identifier with double quotes in the cell table to come back unchanged from
  Parquet and TSV storage, which cellspecR 1.2.0 fixed for TSV directories;
  with an earlier cellspecR the script now stops. It passes with segmantR
  0.3.0, cellspecR 1.2.0, gatekeepR 1.2.0 and phenoscapR 1.0.1.
* The README and the package help page name segmantR 0.3.0 as the tested
  version in which `imager` is optional.
* The installation test also checks that `Imports` declares exactly the four
  suite members.
* The README links the maintenance record by its repository address, so the
  link also works on the package website and in the source package, which
  leave out the `planning` folder.
* Install through the CTTIR R-universe (declared in `Additional_repositories`)
  instead of GitHub `Remotes`; the `Remotes` field is removed.
* Use the maintainer address raban.heller@uni-ulm.de.
* Add `cran-comments.md`. CRAN submission remains blocked until segmantR,
  cellspecR, gatekeepR and phenoscapR are available from CRAN.
* The documentation uses British English (`Language: en-GB`).
* `CITATION.cff` names the author as R. Heller.

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
  while keeping its topic colors.

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
