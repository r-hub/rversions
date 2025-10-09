#' Resolve an R version specification
#'
#' @details
#' `resolve()` caches its results in the current R session. To clear the
#' cache restart R or set the `R_VERSION_CACHE_TIMEOUT` environment
#' variable to `0`.
#'
#' @param version Symbolic version name to resolve. Possible values are
#'   * `release`: the latest release version,
#'   * `devel`: Development version of R.
#'   * `next`: The next version of R. This is R-patched if there is no
#'      ongoing release process currently. Otherwise it may be R-alpha,
#'      R-beta, or R-rc or R-prerelease.
#'   * `oldrel`: The previous version of R, not counting patch versions.
#'   * `oldrel/<n>`: The n-th previous version of R, not counting patch
#'      versions.
#'   * `x.y.z`: A specific R version, e.g. 4.5.1.
#'   * `x.y`: The last patch release from a minor R branch, e.g. 4.4.
#' @param platform Operating system version. Defaults to
#'   [current_r_platform()]. Possible values are:
#'   `r dox_platform_values()`
#'
#' @return A one row data frame, with columns `version`, `date`,
#'   `nickname`, `semver`, `url`, `type`, `rtools_url` (only for Windows).
#' @export
#' @examplesIf rversions:::is_online()
#' resolve("release", "windows")
#' resolve("4.4", "windows-aarch64")
#' resolve("oldrel", "macos")
#' resolve("devel", "linux-gnu-ubuntu-24.04")
#' resolve("devel", "aarch64-unknown-linux-gnu-ubuntu-22.04")

resolve <- function(
  version = "release",
  platform = current_r_platform()
) {
  os <- os_from_platform(platform)
  arch <- arch_from_platform(platform)
  ep <- if (is.na(os)) {
    paste0("/resolve/", version)
  } else {
    paste0("/resolve/", version, "/", os, "/", arch)
  }
  df <- api_version_df1(ep)
  names(df) <- tolower(names(df))
  df
}

dox_platform_values <- function(na = TRUE) {
  paste0(
    collapse = "\n",
    "* ",
    c(
      if (na) {
        "`NA`: to get information about platform-independent release archives."
      },
      "`windows`: x86_64 Windows.",
      "`windows-x86_64`: the same.",
      "`windows-aarch64`: aarch64 Windows.",
      "`macos`: arm64 macOS.",
      "`macos-arm64`: the same.",
      "`macos-x86_64`: x86_64 macOS.",
      "`linux-<distro>-<release>`: x86_64 Linux on the given distribution
     and release, e.g. `linux-ubuntu-22.04`.",
      "A target triplet of the form `cpu-vendor-os-abi`. On Linux it should
     also include the distribution name and release. See
     [current_r_platform()] for examples."
    )
  )
}
