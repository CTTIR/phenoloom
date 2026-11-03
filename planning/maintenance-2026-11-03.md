# Installation maintenance — 3 November 2026

## Purpose, constraints and baseline

Base main: `183973d8c2dad08f978ee96966c1896af14d5487`. The original
checkout is clean; its 63 tracked files and source archive were preserved before
an isolated worktree was created and pulled. There are no repository or ancestor
AGENTS instructions. The existing MIT license, sole author metadata and branding
sources remain unchanged.

Commit `0953632` deliberately made phenoloom an installation-only metapackage.
Its purpose is to install segmantR, cellspecR, gatekeepR and phenoscapR with their
required R dependencies. No analysis wrappers, status API, automatic attachment,
model downloads or external-engine installation belong in this maintenance work.

The initial full package check could not find three required members in the
audit library: an environment limitation, not a confirmed package defect.
Incoming checks also warned about GitHub Remotes and unavailable external
dependencies: only cellspecR was indexed in the observed R-universe catalogue.
These distribution limitations must not be hidden by removing required members.

The documented public GitHub install was then run into a library initially
containing none of the five suite packages. Common R dependencies were reused
through a separate symlink library; this is not a clean-machine installation.
An initial empty JSON response from GitHub failed before installation; the same
command succeeded on retry. No local member checkout was used as a substitute.

The resolved public sources are:

| Package | Version | GitHub commit |
|---|---|---|
| phenoloom baseline | 0.1.1 | 183973d8c2dad08f978ee96966c1896af14d5487 |
| segmantR | 0.2.0 | 882c2fb7fe0546f71f6f11bbfd3de6103859b098 |
| cellspecR | 1.1.1.9000 | 11c6b86abd060b83b77c1cf4aee4392b18ea8567 |
| gatekeepR | 1.1.0 | 4ecea65d4dd5104ef3f6b2b62457977e6191cee6 |
| phenoscapR | 0.2.0 | d5959bd538374648ddb4207f8c54171ac48ebc32 |

The authoritative installed-source receipts are retained with the audit; they
must agree with this table before publication. Native sf/stars dependencies
loaded successfully. The current public segmantR makes imager optional; its
older local checkout differs and was not used to infer current requirements.

## Findings and roadmap

No runtime defect was found in this intentionally empty metapackage. The useful
improvements concern its installation contract and the evidence users need.

1. **Essential acceptance: real installation.** Exercise the documented public
   installer, load all four member namespaces, validate the synthetic cellspec
   example and verify a fresh canonical write/read. Record source revisions,
   library boundaries and native requirements. A source-package check alone is
   insufficient evidence that member namespaces can load.
2. **Dependable everyday use.** Add a small base-R installed-package check to the
   existing CI path, preserving zero exports and no automatic member attachment.
   Clarify required geospatial libraries versus optional imaging/deep-learning
   engines. Provide a runnable first use and an exact-version recording recipe.
3. **Discovery and distribution.** Add package keywords and a universe URL,
   retain valid GitHub Remotes, and separately inspect registry/build availability.
   Do not claim that registry inclusion is CRAN acceptance or formal rOpenSci
   software review. Validate final package metadata, manual, archive and CI syntax.
4. **Deferred outside this release.** Scientific qualification of member methods,
   native SDK/model setup, a frozen cross-package distribution and formal CRAN
   submission require separate evidence. Do not restore removed analysis helpers
   or add a test framework for an installation-only package.

## Verification and remaining gates

Independent installed checks confirm no exported functions, no attached member
packages on loading phenoloom, four loadable namespaces and a valid public
synthetic example. The canonical Parquet write/verify/read workflow preserves
cells, measurements, dictionary, images, channels and adjacency exactly.
gatekeepR replaces the registered print.cellspec method when loaded after
cellspecR; both printers display the same valid example correctly. This observed
formatting choice is informational, not a confirmed data-integrity defect.

Final source archive: `phenoloom_0.1.2.tar.gz`, 1,789,674 bytes, SHA-256
`4c75f8374617295a61e3b842f21d30261aa1ecf4dba13434b2f0bc596be6dd5d`.
All 33 non-DESCRIPTION source payloads match the reviewed files; DESCRIPTION
differs only by standard build metadata. The installation test is included;
Git metadata, orchestration, planning and audit libraries are excluded.

| Validation | Observed result |
|---|---|
| Exact archive, normal package check | Zero errors, warnings or notes; documented example and installed contract run successfully; PDF manual built. |
| Exact archive, required-dependency-only check | Zero errors, warnings or notes, with `--no-manual`. The graph has 80 nodes including candidate/base and 70 dependency symlinks. Global user/site libraries are excluded; testthat and imager are absent, sf/stars present. |
| Strict `--as-cran` check | Zero errors, one incoming-feasibility WARNING. It identifies GitHub Remotes, non-CRAN/Bioconductor members, three not-yet-indexed universe dependencies and the not-yet-available phenoloom universe URL. The warning is retained; CRAN readiness is not claimed. |
| Fresh candidate installation | Exact archive installed as 0.1.2 into a separate library. The installed contract and nine canonical write/read checks pass with exact data/provenance readback and no warnings. |
| Independent documentation review | All three final manual pages visually reviewed; installation/first-use text and all five source-revision table entries agree with observed receipts. |
| CI syntax and source review | Existing shared workflow passes actionlint; no check or dependency gate is weakened. The prior main workflow passed, but candidate hosted results remain a separate observation after publication. |

The README contains the exact prerequisites and commands. Local acceptance for
the intended GitHub installation path is satisfied. A formal release still
requires the published commit's hosted matrix and the maintainer's chosen
release/version process. R-universe visibility requires actual member builds
and indexing, and CRAN submission requires resolving the separate distribution
warning; neither follows merely from adding metadata.

The R minimum remains the declared 4.1; only R 4.6.1 on ARM64 macOS 27.0.1 was
exercised locally. Common native/R dependencies were reused, and external
engines, real study data and every member algorithm were not independently
qualified by this metapackage audit. No release tag, submission, model download
or manual deployment is part of this source-maintenance publication.
