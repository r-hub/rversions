# The rest is from pkgcache

#' Current R platform
#'
#' `current_r_platform()` detects the platform of the current R version.
#'
#' It returns a string of the form `cpu-vendor-os-abi`, a target triplet,
#' see some examples below. On Linux it also includes the distribution
#' name and version and part of the ABI.
#'
#' Examples:
#' - `x86_64-apple-darwin17.0`: macOS High Sierra.
#' - `aarch64-apple-darwin20`: macOS Big Sur on arm64.
#' - `x86_64-w64-mingw32`: 64 bit Windows.
#' - `i386-w64-mingw32`: 32 bit Windows.
#' - `i386+x86_64-w64-mingw32`: 64 bit + 32 bit Windows.
#' - `i386-pc-solaris2.10`: 32 bit Solaris. (Some broken 64 Solaris
#'   builds might have the same platform string, unfortunately.)
#' - `x86_64-pc-linux-gnu-debian-10`: Debian Linux 10 on x86_64.
#' - `x86_64-pc-linux-musl-alpine-3.14.1`: Alpine Linux.
#' - `x86_64-pc-linux-gnu-unknown`: Unknown Linux Distribution on x86_64.
#' - `s390x-ibm-linux-gnu-ubuntu-20.04`: Ubuntu Linux 20.04 on S390x.
#' - `amd64-portbld-freebsd12.1`: FreeBSD 12.1 on x86_64.
#'
#' @export
#' @examples
#' current_r_platform()

current_r_platform <- function() {
  current_r_platform_data()$platform
}

current_r_platform_data <- function() {
  forced <- forced_platform()
  if (!is.null(forced)) {
    platform <- parse_platform(forced)
  } else {
    raw <- get_platform(forced = FALSE)
    platform <- parse_platform(raw)
    if (platform$os == "linux" || substr(platform$os, 1, 6) == "linux-") {
      platform <- current_r_platform_data_linux(platform)
    }
  }

  platform$platform <- apply(platform, 1, paste, collapse = "-")
  platform
}

valid_platform_string <- function(x) {
  grepl("^[^-].*[-][^-].*[-][^-].*$", x)
}

forced_platform <- function() {
  opt <- getOption("pkg.current_platform")
  if (!is.null(opt)) {
    if (!is_string(opt)) {
      stop("The `pkg.current_platform` option must be a string scalar.")
    }
    if (!valid_platform_string(opt)) {
      stop(
        "The pkg.current_platform` option must be a valid platform ",
        "triple: `cpu-vendor-os`. \"",
        opt,
        "\" is not."
      )
    }
    return(opt)
  }
  env <- Sys.getenv("PKG_CURRENT_PLATFORM")
  if (env != "") {
    if (is.na(env) || !valid_platform_string(env)) {
      stop(
        "The `PKG_CURRENT_PLATFORM` environment variable must be a valid ",
        "platform triple: \"cpu-vendor-os\". \"",
        env,
        "\" is not."
      )
    }
    return(env)
  }

  NULL
}

get_platform <- function(forced = TRUE) {
  (if (forced) forced_platform()) %||% R.version$platform
}

default_platforms <- function() {
  unique(c(current_r_platform(), "source"))
}

parse_platform <- function(x) {
  # Allow for missing cpu and vendor on Linux
  linux_prefix <- startsWith(x, "linux-")
  x[linux_prefix] <- paste0("x86_64-unknown-", x[linux_prefix])

  pcs <- strsplit(x, "-", fixed = TRUE)
  plt <- data.frame(
    stringsAsFactors = FALSE,
    cpu = vcapply(pcs, "[", 1),
    vendor = vcapply(pcs, "[", 2),
    os = vcapply(pcs, function(y) {
      if (length(y) < 3) NA_character_ else paste(y[-(1:2)], collapse = "-")
    })
  )
  linuxos <- re_match(plt$os, re_linux_platform())
  islinux <- !is.na(linuxos$.match)
  if (any(islinux)) {
    plt$os[islinux] <- linuxos$os[islinux]
    linuxos$distribution[linuxos$distribution == ""] <- NA_character_
    linuxos$release[linuxos$release == ""] <- NA_character_
    plt <- cbind(plt, linuxos[, c("distribution", "release")])
  }
  plt
}

re_linux_platform <- function() {
  paste0(
    "^",
    "(?P<os>linux(?:-gnu|-musl|-uclibc|-dietlibc)?)?",
    "(?:(?:-)(?P<distribution>[^-]+))?",
    "(?:(?:-)(?P<release>.+))?",
    "$"
  )
}

current_r_platform_data_linux <- function(raw, etc = "/etc") {
  os <- tryCatch(
    suppressWarnings(readLines(file.path(etc, "os-release"))),
    error = function(e) NULL
  )
  rh <- tryCatch(
    suppressWarnings(readLines(file.path(etc, "redhat-release"))),
    error = function(e) NULL
  )

  cbind(
    raw[, setdiff(names(raw), c("distribution", "release")), drop = FALSE],
    parse_linux_platform_info(os, rh)
  )
}

unknown_dist <- function() {
  data.frame(
    stringsAsFactors = FALSE,
    distribution = "unknown"
  )
}

parse_linux_platform_info <- function(
  os_release = NULL,
  redhat_release = NULL
) {
  if (
    is.null(os_release) &&
      is.null(redhat_release)
  ) {
    unknown_dist()
  } else if (!is.null(os_release)) {
    parse_os_release(os_release)
  } else {
    parse_redhat_release(redhat_release)
  }
}

is_quoted <- function(x) {
  l <- nchar(x)
  l >= 2 &&
    substr(x, 1, 1) %in% c("'", '"') &&
    substr(x, 1, 1) == substr(x, l, l)
}

remove_quotes <- function(x) {
  l <- nchar(x)
  if (l < 2) {
    x
  } else {
    substr(x, 2, l - 1)
  }
}

parse_os_release <- function(lines) {
  id <- grep("^ID=", lines, value = TRUE)[1]
  if (is.na(id)) {
    return(unknown_dist())
  }
  id <- trimws(sub("^ID=(.*)$", "\\1", id, perl = TRUE))
  if (is_quoted(id)) {
    id <- remove_quotes(id)
  }

  ver <- grep("^VERSION_ID=", lines, value = TRUE)[1]
  if (!is.na(ver)) {
    ver <- trimws(sub("VERSION_ID=(.*)$", "\\1", ver, perl = TRUE))
    if (is_quoted(ver)) ver <- remove_quotes(ver)
  }

  out <- data.frame(
    stringsAsFactors = FALSE,
    distribution = id
  )
  if (!is.na(ver)) {
    out$release <- ver
  }

  if (is.na(ver) && id == "debian") {
    pn <- grep("^PRETTY_NAME=", lines, value = TRUE)[1]
    if (!is.na(pn) && grepl("/sid\"?$", pn)) {
      out$release <- "unstable"
    }
  }

  out
}

parse_redhat_release <- function(lines) {
  pcs <- strsplit(lines[1], " ", fixed = TRUE)[[1]]
  id <- tolower(pcs[1])
  if (id == "" || is.na(id)) {
    return(unknown_dist())
  }

  wver <- grepl("^[-\\.0-9]+$", pcs)

  out <- data.frame(
    stringsAsFactors = FALSE,
    distribution = id
  )
  if (any(wver)) {
    out$release <- pcs[wver][1]
  }

  out
}
