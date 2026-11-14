## Status: not ready for submission

phenoloom is an installation-only metapackage whose `Imports` are the four
CTTIR suite packages segmantR, cellspecR, gatekeepR and phenoscapR. These are
currently distributed only through <https://cttir.r-universe.dev> (declared in
`Additional_repositories`). CRAN requires strong dependencies to be available
from mainstream repositories, so phenoloom can only be submitted after all four
member packages have been accepted on CRAN.

## Test environments

* Local macOS (aarch64-apple-darwin), R 4.6.1, 14 November 2026:
  full `R CMD check --as-cran` on the built tarball, including the PDF
  manual with TinyTeX and HTML validation with current HTML Tidy.
  Exact prepared member sources were installed into isolated audit libraries;
  ordinary third-party dependencies were reused from the local libraries.
  This is not a clean-machine installation claim.
* GitHub Actions baseline at `56c218a318` (`--as-cran --no-manual`):
  macOS and Windows R release; Ubuntu R devel, release, oldrel-1 and
  oldrel-3. All returned success at the audit snapshot. The oldest row
  is advisory in the shared workflow; this is not qualification of the
  declared R 4.1 minimum. Candidate hosted results must be checked after
  publication.
* The standalone suite interoperability script exercises canonical storage,
  explicit-threshold gating, within-image spatial counts and calibrated
  segmentation features. It is development tooling excluded from the R
  source tarball; it does not replace checks of member algorithms or
  external engines.

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
