
#' Query R's past and present versions
#'
#' R version numbers consist of three numbers (since version 1.4.1):
#' major, minor and patch.
#'
#' We extract the version numbers from the tags in the SVN repository.
#'
#' @param dots Whether to use dots instead of dashes in the version
#'   number.
#' @return A data frame with three columns: \sQuote{version},
#'   \sQuote{date} and \sQuote{nickname}.
#'
#' @export
#' @examplesIf rversions:::is_online()
#' r_versions()

r_versions <- function(dots = TRUE) {
  df <- api_version_df("/r-versions", dots)
  df
}

#' Version number of R-release
#'
#' The latest tag in the SVN repository (in terms of version numbers,
#' not dates).
#'
#' @inheritParams r_versions
#' @return A one row data frame, with columns \sQuote{version},
#'   \sQuote{date} and \sQuote{nickname}.
#'
#' @export
#' @examplesIf rversions:::is_online()
#' r_release()

r_release <- function(dots = TRUE) {
  df <- api_version_df1("/r-release", dots)
  df
}

#' Version number of R-oldrel
#'
#' R-oldrel is the latest version of the previous minor version.
#' We extract version numbers from the R SVN repository tags.
#'
#' @inheritParams r_versions
#' @return A one row data frame, with columns \sQuote{version},
#'   \sQuote{date} and \sQuote{nickname}.
#'
#' @export
#' @examplesIf rversions:::is_online()
#' r_oldrel()

r_oldrel <- function(dots = TRUE) {
  df <- api_version_df1("/r-oldrel", dots)
  df
}
