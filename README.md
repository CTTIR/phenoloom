# phenoloom <picture class="cttir-readme-logo"><source class="cttir-logo-dark-source" media="(prefers-color-scheme: dark)" srcset="man/figures/logo-with-name-dark.png" /><img src="man/figures/logo-with-name.png" align="right" alt="phenoloom logo" width="120" height="139" /></picture>

**CTTIR Spatial Biology Suite**

An installation framework that brings together these four packages and their
required R dependencies:

| Package | Role |
|:--|:--|
| [segmantR](https://github.com/CTTIR/segmantR) | Cell segmentation |
| [cellspecR](https://github.com/CTTIR/cellspecR) | Validated cell tables |
| [gatekeepR](https://github.com/CTTIR/gatekeepR) | Marker gating and phenotyping |
| [phenoscapR](https://github.com/CTTIR/phenoscapR) | Spatial analysis and visualization |

## Install

The package declares R 4.1 or later. Current member packages and their own
dependencies must also support the R version in use. The documented source
installation was exercised with R 4.6.1 on ARM64 macOS; this does not qualify
every older R or native-library combination.

```r
install.packages("remotes")
remotes::install_github("CTTIR/phenoloom", dependencies = NA)
```

The member packages are declared in `Imports`, with their GitHub sources in
`Remotes`. The installation includes required dependencies recursively.
`dependencies = NA` does not request every optional package in `Suggests`.
The command follows the members' current GitHub default branches. It can prompt
to update existing dependencies; for unattended installations, choose the
[`upgrade` policy](https://remotes.r-lib.org/reference/install_github.html)
deliberately. A fresh R library keeps an analysis environment separate from
other projects.

Required geospatial packages include `sf` and `stars`. Prefer compatible CRAN
binaries where available. Source builds require the compiler and GDAL, GEOS,
PROJ and other system libraries described in the
[official sf installation instructions](https://r-spatial.github.io/sf/#installing).
On Windows, source compilation requires Rtools matching R. On macOS, source
compilation requires the Xcode Command Line Tools; CRAN binaries and Homebrew
source installations have different native-library layouts.

`imager` is optional in the currently tested `segmantR` 0.2.0. If you choose a
workflow that needs it, follow its
[platform prerequisites](https://dahtah.github.io/imager/#dependencies), including
XQuartz for the documented macOS installation. Optional segmentation engines
such as Cellpose, StarDist, and Mesmer require separate setup through `segmantR`;
this metapackage does not install their environments or model weights.

## Verify and start

Load the member namespaces and exercise the documented synthetic cell table:

```r
members <- c("segmantR", "cellspecR", "gatekeepR", "phenoscapR")
invisible(lapply(members, loadNamespace))
x <- cellspecR::cs_example()
cellspecR::cs_assert_valid(x)
x
```

This checks an installed software path using fictional data. It does not
validate a segmentation model or establish biological or clinical performance.
There is no need to call `library(phenoloom)`: it exports no functions and does
not attach the member packages.

For canonical cell-table storage, choose a new output directory:

```r
folder <- tempfile("cellspec-example-")
cellspecR::cs_write(x, folder)
restored <- cellspecR::cs_read_cellspec(folder)
cellspecR::cs_assert_valid(restored)
```

Consult each member's documentation for its analysis workflows. Installing the
suite does not by itself qualify every combination of those workflows.

## Record an analysis environment

Default-branch installation is a moving target. Keep the installed versions and
GitHub revisions with the analysis, alongside inputs, configuration and results:

```r
packages <- c("phenoloom", members)
versions <- do.call(rbind, lapply(packages, function(package) {
  d <- utils::packageDescription(package)
  sha <- d[["RemoteSha"]]
  if (is.null(sha)) sha <- NA_character_
  data.frame(package = package, version = d[["Version"]], revision = sha)
}))
versions
sessionInfo()
```

A missing revision means the installation did not record a GitHub SHA; it does
not identify a particular source commit. Preserve a project library or lockfile
when exact reinstallation matters. Pinning only `phenoloom` does not pin its
floating member sources or their transitive dependencies.

## Distribution status

GitHub is the verified installation path. The CTTIR R-universe registry lists
packages separately and builds them asynchronously; a registry entry does not
prove that every suite binary is already available. CRAN submission is a
separate target because this package depends on members distributed outside
CRAN/Bioconductor and uses GitHub `Remotes`. See the
[maintenance record](planning/maintenance-2026-11-03.md) for exact observed
versions, checks and outstanding distribution gates.

## License

[MIT](LICENSE.md). Member packages and external engines retain their own
licenses. Development orchestration remains excluded from Git and R builds.

## Branding

Editable R sources and regeneration instructions are in
[tools/branding](https://github.com/CTTIR/phenoloom/tree/main/tools/branding).
