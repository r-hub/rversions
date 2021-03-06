% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rversions.R
\name{r_oldrel}
\alias{r_oldrel}
\title{Version number of R-oldrel}
\usage{
r_oldrel(dots = TRUE)
}
\arguments{
\item{dots}{Whether to use dots instead of dashes in the version
number.}
}
\value{
A one row data frame, with columns \sQuote{version},
\sQuote{date} and \sQuote{nickname}.
}
\description{
R-oldrel is the latest version of the previous minor version.
We extract version numbers from the R SVN repository tags.
}
\examples{
\dontshow{if (rversions:::is_online()) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
r_oldrel()
\dontshow{\}) # examplesIf}
}
