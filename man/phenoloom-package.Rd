\docType{package}
\name{phenoloom-package}
\alias{phenoloom}
\alias{phenoloom-package}
\title{CTTIR Spatial Biology Suite}
\description{
An installation framework for \pkg{segmantR}, \pkg{cellspecR},
\pkg{gatekeepR}, and \pkg{phenoscapR}, together with their required R
package dependencies.
}
\details{
Install from GitHub using
\code{remotes::install_github("CTTIR/phenoloom", dependencies = NA)}.
Required dependencies are installed recursively. Optional suggested packages,
external segmentation environments, and model weights require separate setup.

The metapackage exports no functions and does not attach its member packages.
Use the installed packages directly through their own APIs, such as
\code{cellspecR::cs_example()}.
}
\seealso{
\url{https://github.com/CTTIR/phenoloom}
}
\author{
R. Heller \email{raban.heller@charite.de}
}
\keyword{package}
