
#' Latest release for which a source tarball is available for download
#'
#' [r_release()] works based on the SVN tags in the main R source code
#' repository. However, an SVN tag does not mean that the same version
#' is available for download. `r_release_tarball` returns the latest
#' version for which a source tarball is available.
#'
#' @return A one row data frame, with columns \sQuote{version},
#'   \sQuote{date}, \sQuote{URL} and \sQuote{nickname}.
#'
#' @export
#' @family R downloads
#' @importFrom curl new_handle handle_setopt
#' @examples
#' r_release()
#' r_release_tarball()

r_release_tarball <- function() {
  keep_head(r_download_url(), ".tar.gz")
}
