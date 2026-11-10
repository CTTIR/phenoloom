## Status: not ready for submission

phenoloom is an installation-only metapackage whose `Imports` are the four
CTTIR suite packages segmantR, cellspecR, gatekeepR and phenoscapR. These are
currently distributed only through <https://cttir.r-universe.dev> (declared in
`Additional_repositories`). CRAN requires strong dependencies to be available
from mainstream repositories, so phenoloom can only be submitted after all four
member packages have been accepted on CRAN.

## Test environments

* local macOS (aarch64-apple-darwin), R 4.6.1:
  `R CMD check --as-cran --no-manual` on the built tarball, with the member
  packages installed from the CTTIR R-universe or from their prepared
  tarballs. The PDF manual was built locally with TinyTeX (TeX Live 2026)
  via `R CMD Rd2pdf` without errors; the check run itself used `--no-manual`.
* GitHub Actions (r-lib/actions v2, `--as-cran`):
  * macos-latest (R release)
  * windows-latest (R release)
  * ubuntu-latest (R devel, release, oldrel-1)

## R CMD check results

0 errors | 1 warning | 0 notes

* checking CRAN incoming feasibility ... WARNING
  Maintainer: 'R. Heller <raban.heller@uni-ulm.de>'
  New submission
  Strong dependencies not in the CRAN or BioC software repositories:
    segmantR, cellspecR, gatekeepR, phenoscapR
  Availability using Additional_repositories specification:
    (all four) yes   https://cttir.r-universe.dev

  This WARNING is the submission blocker described above. Once the members
  are on CRAN it reduces to the "New submission" NOTE.

## Downstream dependencies

There are currently no downstream dependencies for this package.
