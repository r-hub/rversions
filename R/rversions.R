
#' Query which versions R-release and R-oldrel refer to
#'
#' R version numbers consist of three numbers (since version 1.4.1):
#' major, minor and patch.
#' 
#' We use the latest (in terms of versions numbers) tag in the
#' R SVN repository to determine R-release.
#'
#' For R-oldrel, the latest version of the previous minor version
#' is used, again, based on the SVN repo.
#'
#' @return A named character vector with entries \code{release} and
#' \code{oldrel}.
#'
#' @export
#' @importFrom RCurl getURLContent
#' @importFrom magrittr %>%
#' @examples
#' r_versions()

r_versions <- function() {
  
  ## Get the tag info from SVN
  tags <- getURLContent(
    "http://svn.r-project.org/R/tags/",
    customrequest = "PROPFIND",
    httpheader=c("Depth"="1")
  ) %>%
    get_tags()

  ## Extract versions numbers from tags and sort them
  versions <-  tags %>%
    sub(pattern = "/R/tags/R-([^/]+)/", replacement = "\\1") %>%
    grep(pattern = "^[0-9]+-[0-9]+(-[0-9]+|)$", value = TRUE) %>%
    sort_tags()

  ## Relase is easy, most recent
  release <- tail(versions, 1)

  ## Oldrel is latest from the previous minor
  ## (Careful with factors, they are ordered by default!)
  oldrel <- versions %>%
    sub(pattern = "-[0-9]+$", replacement = "") %>%
    factor(levels = unique(.)) %>%
    tapply(X = versions, FUN = tail, 1) %>%
    tail(2) %>%
    head(1) %>%
    unname()

  c(release = release, oldrel = oldrel) %>%
    gsub(pattern = "-", replacement = ".")
}

get_tags <- function(xml) {
  xml2 <- xml %>%
    gsub(pattern = "<D:propstat>(.*?)</D:propstat>", replacement = "")

  matches <- xml2 %>%
    gregexpr(pattern = "<D:href>[^<]+</D:href>")

  regmatches(xml2, matches)[[1]] %>%
    sub(pattern = "<D:href>", replacement = "") %>%
    sub(pattern = "</D:href>", replacement = "")
}
  
## Split a version number to major, minor, patch
split_versions <- function(x) {
  x %>%
    sub(pattern = "^([0-9]+-[0-9]+)$", replacement = "\\1-0") %>%
    strsplit(split = "-") %>%
    sapply(as.numeric)
}

## Sort version numbers
sort_tags <- function(x) {
  x_order <- x %>%
    split_versions() %>%
    apply(1, list) %>%
    lapply("[[", 1) %>%
    do.call(what = order)
  x [x_order]
}

. <- "Looking for job offers"
