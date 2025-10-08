
#' Latest R release with a macOS installer available for download
#'
#' [r_release()] works based on the SVN tags in the main R source code
#' repository. However, an SVN tag does not mean that the same version
#' is available for download. `r_release_macos` returns the latest
#' version for which a macOS installer is available.
#'
#' @param arch The architecture, either \sQuote{x86_64} or \sQuote{arm64}.
#' @return A one row data frame, with columns \sQuote{version},
#'   \sQuote{date}, \sQuote{URL} and \sQuote{nickname}.
#'
#' @family R downloads
#' @export
#' @examplesIf rversions:::is_online()
#' r_release()
#' r_release_macos()
#' r_release_macos(arch = "arm64")

r_release_macos <- function(arch = c("x86_64", "arm64")) {
  arch <- match.arg(arch)
  ep <- switch(
    arch,
    x86_64 = "r-release-macos",
    arm64 = "r-release-macos-arm64",
    stop("Unknown architecture: ", arch)
  )
  df <- api_version_df1(ep)
  df
}
