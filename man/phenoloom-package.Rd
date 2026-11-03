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
The required spatial packages include \pkg{sf} and \pkg{stars}; source builds
need their documented native libraries. \pkg{imager} is optional in the tested
\pkg{segmantR} 0.2.0. Consult each member's installation requirements for the
chosen workflow and platform.

The metapackage exports no functions and does not attach its member packages.
Use the installed packages directly through their own APIs, such as
\code{cellspecR::cs_example()}.

GitHub installation follows the members' current default branches. Record the
installed versions, source revisions and \code{sessionInfo()} with an analysis;
pinning the metapackage alone does not pin its transitive dependencies. The
README provides a recording recipe and a canonical cell-table write/read
example. Synthetic software checks do not establish biological or clinical
performance or qualify external segmentation engines.
}
\examples{
x <- cellspecR::cs_example()
cellspecR::cs_assert_valid(x)
}
\seealso{
\url{https://github.com/CTTIR/phenoloom},
\url{https://r-spatial.github.io/sf/}
}
\author{
R. Heller \email{raban.heller@charite.de}
}
\keyword{package}
