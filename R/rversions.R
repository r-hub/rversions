
#' Query R's past and present versions
#'
#' R version numbers consist of three numbers (since version 1.4.1):
#' major, minor and patch.
#'
#' We extract the version numbers from the tags in the SVN repository.
#'
#' @param dots Whether to use dots instead of dashes in the version
#'   number.
#' @return A data frame with three chracter columns: \sQuote{version},
#'   \sQuote{date} and \sQuote{nickname}.
#'
#' @export
#' @importFrom curl new_handle handle_setheaders curl_fetch_memory
#' @importFrom xml2 read_xml xml_find_all xml_ns xml_find_first xml_text
#' @examples
#' r_versions()

r_versions <- function(dots = TRUE) {
  df <- r_versions_fetch()
  dotver <- gsub('-', '.', df$version)
  if (dots) df$version <- dotver

  nicks <- cached_nicks()
  nonick <- setdiff(dotver, names(nicks))
  if (length(nonick)) nicks <- c(nicks, get_nicknames(nonick))

  df$nickname <- rep(NA_character_, nrow(df))
  df$nickname[match(names(nicks), dotver)] <- nicks
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
#' @importFrom utils tail
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
#' @return A one row data frame, with columns \sQuote{version},
#'   \sQuote{date} and \sQuote{nickname}.
#'
#' @export
#' @importFrom utils tail
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

cache <- new.env(parent = emptyenv())
r_versions_fetch <- function() {
  if (is.null(cache$versions)) {
    # issue http request to svn
    h <- handle_setheaders(new_handle(customrequest = "PROPFIND"), Depth="1")
    req <- curl_fetch_memory(r_svn_url, handle = h)

    # extract xml nodes
    doc <- read_xml(rawToChar(req$content))
    prop <- xml_find_all(doc, ".//D:propstat/D:prop", xml_ns(doc))

    # extract dates and tages
    dates <- xml_text(xml_find_first(prop, ".//D:creationdate", xml_ns(doc)))
    tags <- xml_text(xml_find_first(prop, ".//D:getetag", xml_ns(doc)))
    tags <- sub("^.*/tags/R-([-0-9]+).*$", "\\1", tags)

    # filter out working branches
    is_release <- grepl("^[0-9]+-[0-9]+(-[0-9]+|)$", tags)
    tags <- tags[is_release]
    dates <- dates[is_release]

    # output structure
    versions <- data.frame(
      stringsAsFactors = FALSE,
      version = tags,
      date = dates
    )

    df <- versions[order(package_version(tags)), ]
    rownames(df) <- NULL
    cache$versions <- df
  }
  cache$versions
}
