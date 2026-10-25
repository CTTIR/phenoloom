# phenoloom 0.1.1

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
