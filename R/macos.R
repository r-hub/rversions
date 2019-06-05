
#' Latest R release with a macOS installer available for download
#'
#' [r_release()] works based on the SVN tags in the main R source code
#' repository. However, an SVN tag does not mean that the same version
#' is available for download. `r_release_macos` returns the latest
#' version for which a macOS installer is available.
#'
#' @return A one row data frame, with columns \sQuote{version},
#'   \sQuote{date}, \sQuote{URL} and \sQuote{nickname}.
#'
#' @family R downloads
#' @export
#' @importFrom curl new_handle handle_setopt
#' @examples
#' r_release()
#' r_release_macos()

r_release_macos <- function() {
  keep_head(r_macos_download_url(), ".pkg")
}
