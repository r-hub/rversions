
#' Query R's past and present versions
#'
#' R version numbers consist of three numbers (since version 1.4.1):
#' major, minor and patch.
#'
#' We extract the version numbers from the tags in the SVN repository.
#'
#' @param dots Whether to use dots instead of dashes in the version
#'   number.
#' @return A data frame with two chracter columns: \sQuote{version} and
#'   \sQuote{date}.
#'
#' @export
#' @importFrom RCurl getURLContent
#' @importFrom XML xmlParse xmlRoot xmlChildren xpathApply xmlValue
#' @examples
#' r_versions()

r_versions <- function(dots = TRUE) {

  props<- getURLContent("http://svn.r-project.org/R/tags/",
                       customrequest = "PROPFIND",
                       httpheader=c("Depth"="1") )
  props <- xmlParse(props)
  props <- xmlRoot(props)
  props <- xmlChildren(props)
  props <- lapply(props, get_props)
  props <- unname(props)

  tags <- sapply(props, get_tags)
  tags <- sub("^.*/tags/R-([-0-9]+).*$", "\\1", tags)

  dates <- sapply(props, get_dates)

  versions <- grepl("^[0-9]+-[0-9]+(-[0-9]+|)$", tags)
  tags <- tags[versions]
  dates <- dates[versions]

  if (dots) tags <- gsub('-', '.', tags)

  versions <- data.frame(
    stringsAsFactors = FALSE,
    version = tags,
    date = dates
  )
  versions <- versions[order(package_version(tags)), ]
  rownames(versions) <- NULL
  versions
}

#' Version number of R-release
#'
#' The latest tag in the SVN repository (in terms of version numbers,
#' not dates).
#'
#' @inheritParams r_versions
#' @return A one row data frame, with columns \sQuote{version} and
#'   \sQuote{date}.
#'
#' @export
#' @examples
#' r_release()

r_release <- function(dots = TRUE) {
  tail(r_versions(dots), 1)
}


#' Version number of R-oldrel
#'
#' R-oldrel is the latest version of the previous minor version.
#' We extract version numbers from the R SVN repository tags.
#'
#' @inheritParams r_versions
#' @return A one row data frame, with columns \sQuote{version} and
#'   \sQuote{date}.
#'
#' @export
#' @examples
#' r_oldrel()

r_oldrel <- function(dots = TRUE) {

  versions <- r_versions(dots)

  version_strs <- package_version(versions$version)

  major <- version_strs$major
  minor <- version_strs$minor
  major_minor <- paste(major, sep = ".", minor)

  latest <- tail(major_minor, 1)
  tail(versions[ major_minor != latest, ], 1)
}


get_props <- function(x) unname(x[["propstat"]][["prop"]])


get_tags <- function(x) unname(xmlValue(x[["getetag"]]))


get_dates <- function(x) unname(xmlValue(x[["creationdate"]]))
