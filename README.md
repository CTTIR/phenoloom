# phenoloom

**CTTIR Spatial Biology Suite**

`phenoloom` is the metapackage for the four CTTIR spatial biology packages.
Install the suite together, attach it with one call, and record its installed
versions for an analysis.

| Package | Role |
|:--|:--|
| [segmantR](https://github.com/CTTIR/segmantR) | Cell segmentation and reviewed segmentation workflows |
| [cellspecR](https://github.com/CTTIR/cellspecR) | Import, validation, and storage of multiplexed imaging cell tables |
| [gatekeepR](https://github.com/CTTIR/gatekeepR) | Reviewed marker gating and cell phenotyping |
| [phenoscapR](https://github.com/CTTIR/phenoscapR) | Spatial analysis and visualization of single-cell data |

## Installation

Install R 4.1 or later, then install from GitHub:

```r
install.packages("remotes")
remotes::install_github("CTTIR/phenoloom", dependencies = NA)
```

The four member packages are required dependencies. Their GitHub repositories
are declared in `Remotes`; `dependencies = NA` installs required dependencies
without requesting every optional analysis backend. Some dependencies contain
compiled code and may need system libraries or a compiler. In particular,
image and geospatial dependencies such as `imager`, `sf`, and `stars` have
platform-specific requirements; consult their installation documentation.

Optional segmentation engines such as Cellpose, StarDist, and Mesmer require
their own environments and configuration through `segmantR`. Installing or
loading `phenoloom` does not install Python environments or download model
weights.

## Use

```r
library(phenoloom)

phenoloom_packages()
phenoloom_status()
```

`library(phenoloom)` attaches all four member packages through R's standard
dependency mechanism. Functions with the same name may mask each other; use
explicit calls such as `cellspecR::cs_example()` in reproducible scripts.
Consult each member's help for its input contracts and supported workflows.

To inspect the suite without attaching it:

```r
phenoloom::phenoloom_status()
```

The status report reads installed package metadata. It reports versions, not
the availability of external engines or the validity of an analysis. Save it
alongside `sessionInfo()` when recording an analysis environment. See
`vignette("phenoloom")` for a short guide.

## Development

The repository calls the shared CTTIR package-check, lint, and test-coverage
workflows. Local development documentation can be built with
`pkgdown::build_site()` using the CTTIR `themakR` template. Development
orchestration is excluded from Git and R package builds.

## License

`phenoloom` is licensed under the [MIT license](LICENSE.md). Each member package
and any optional external engine retains its own license and citation
requirements. This metapackage does not redistribute their source or weights.
