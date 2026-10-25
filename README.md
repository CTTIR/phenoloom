# phenoloom

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

With R 4.1 or later:

```r
install.packages("remotes")
remotes::install_github("CTTIR/phenoloom", dependencies = NA)
```

The member packages are declared in `Imports`, with their GitHub sources in
`Remotes`. The installation includes required dependencies recursively.
`dependencies = NA` does not request every optional package in `Suggests`.

Use the installed packages directly, for example `cellspecR::cs_example()`.
There is no need to call `library(phenoloom)`: it exports no functions and does
not attach the member packages.

Native image and geospatial dependencies, including `imager`, `sf`, and
`stars`, may require platform-specific libraries or a compiler. Optional
segmentation engines such as Cellpose, StarDist, and Mesmer require separate
setup through `segmantR`; this metapackage does not install their environments
or model weights.

## License

[MIT](LICENSE.md). Member packages and external engines retain their own
licenses. Development orchestration remains excluded from Git and R builds.
