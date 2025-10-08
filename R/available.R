#' Available R Builds
#'
#' @details
#' `available()` caches its results in the current R session. To clear the
#' cache restart R or set the `R_VERSION_CACHE_TIMEOUT` environment
#' variable to `0`.
#'
#' @param platform Operating system version. Defaults to
#'   [current_r_platform()]. Possible values are:
#'   `r dox_platform_values(na = FALSE)`
#'
#' @return A data frame with columns `version`, `date`, `semver`, `type`,
#'   and `url`.
#'
#' @export
#' @examplesIf rversions:::is_online()
#' available()
#' available("windows")
#' available("macos-arm64")
#' available("linux-gnu-ubuntu-24.04")
#' available("aarch64-unknown-linux-gnu-ubuntu-22.04")

available <- function(platform = current_r_platform()) {
  os <- os_from_platform(platform, na = FALSE)
  arch <- arch_from_platform(platform, na = FALSE)
  ep <- paste0("available/", os, "/", arch)
  resp <- api(ep)
  cols <- c("version", "date", "semver", "type", "url")
  resp <- lapply(resp, function(x) structure(x[cols], names = cols))
  df <- list_as_df(resp)
  df$date <- parse_iso_8601(df$date)
  df$semver <- package_version(df$semver %|NA|% df$version)
  names(df) <- tolower(names(df))
  df
}
