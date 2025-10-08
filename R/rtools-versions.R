#' List Rtools versions
#'
#' @param arch Architecture. Possible values are:
#'  * `x86_64`: x86_64 Windows,
#'  * `aarch64` or `arm64`: aarch64 Windows.
#'  Defaults tp the current architecture on Windows, and to `x86_64` on
#'  other systems.
#'
#' @return A data frame with columns
#'   * `version`: The Rtools version, e.g. `45`.
#'   * `url`: Download URL of the Rtools installer.
#'   * `first`: First R version supported by this Rtools version.
#'   * `last`: Last R version supported by this Rtools version.
#'
#' @export
#' @examplesIf rversions:::is_online()
#' rtools_versions()
#' rtools_versions("aarch64")

rtools_versions <- function(arch = NULL) {
  arch <- arch %||% default_windows_arch()
  if (arch == "arm64") {
    arch <- "aarch64"
  }
  ep <- if (arch == "x86_64") {
    "rtools-versions"
  } else {
    paste0("rtools-versions", "/", arch)
  }
  resp <- api(ep)
  list_as_df(resp)
}

default_windows_arch <- function() {
  if (is_windows()) {
    R.version$arch
  } else {
    "x86_64"
  }
}

is_windows <- function() {
  .Platform$OS.type == "windows"
}
