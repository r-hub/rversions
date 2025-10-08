#' Return information about Posit's (and some other) R builds for Linux
#'
#' @details
#' `linux_distros()` caches its results in the current R session. To clear
#' the cache restart R or set the `R_VERSION_CACHE_TIMEOUT` environment
#' variable to `0`.
#'
#' @return A data frame with the following columns:
#' * `id`: The distro ID, e.g. `ubuntu-2404`.
#' * `aliases`: A list column of character vectors with alternative names
#'   for the distro. Alternative names starting and ending with a forward
#'   slash are regular expressions.
#' * `name`: The full name of the distro, e.g. `Red Hat Enterprise Linux`.
#' * `version`: The version of the distro, e.g. `24.04` for Ubuntu, or `9`
#'   for RHEL.
#' * `codename`: The codename of the distro, e.g. `focal` for Ubuntu 20.04.
#' * `url`: The URL of the distro's homepage.
#' * `docker`: The name of the official Docker image for the distro,
#'   e.g. `ubuntu:20.04`.
#' * `eol`: The end-of-life date of the distro, or `NA` if unknown.
#' * `retired`: whether the distro version is retired for Posit and R-hub.
#' * `aarch64`: whether aarch64 builds are available for this distro.
#'    Possible values are `posit` (builds are available from Posit),
#'    `r-hub` (builds are available from R-hub), `none` (no builds are
#'    available).
#' * `ppm_binaries`: whether PPM binaries are available for this distro.
#' * `ppm_aarch64`: whether aarch64 PPM binaries are available for this
#'   distro.
#' * `ppm_url`: The URL of the PPM binaries for this distro.
#'
#' @export
#' @examplesIf rversions:::is_online()
#' linux_distros()

linux_distros <- function() {
  res <- api("/linux-distros")

  # Some distros are implemented as aliases of others
  bas <- Filter(function(x) is.null(x$implementation), res)
  names(bas) <- vcapply(bas, `[[`, "id")
  ali <- Filter(function(x) !is.null(x$implementation), res)
  for (i in seq_along(ali)) {
    ali[[i]] <- utils::modifyList(bas[[ali[[i]]$implementation]], ali[[i]])
  }
  res <- c(bas, ali)

  xc <- function(name) {
    unname(vcapply(res, function(x) x[[name]] %||% NA_character_))
  }

  xl <- function(name) {
    unname(vlapply(res, function(x) x[[name]] %||% NA))
  }

  eol <- xc("eol")
  eol[eol == "N/A"] <- NA_character_

  df <- data_frame(
    id = xc("id"),
    aliases = I(lapply(res, function(x) unlist(x$aliases))),
    name = xc("name"),
    version = xc("version"),
    codename = xc("codename"),
    url = xc("url"),
    docker = xc("docker"),
    eol = parse_iso_8601(eol),
    retired = xl("retired"),
    aarch64 = unname(vcapply(res, function(x) {
      if (isTRUE(x$aarch64)) {
        "posit"
      } else if (isFALSE(x$aarch64)) {
        "none"
      } else {
        x$aarch64
      }
    })),
    ppm_binaries = xl("ppm-binaries"),
    ppm_aarch64 = xl("aarch64-ppm-binaries"),
    ppm_url = xc("ppm-binary-url")
  )

  df <- df[order(df$id), ]

  df
}
