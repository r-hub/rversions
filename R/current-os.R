os_from_platform <- function(platform, na = TRUE) {
  if (na && is.na(platform)) {
    return(NA_character_)
  }

  psd <- parse_platform(platform)

  os <- switch(platform,
    "windows" = "windows",
    "windows-x86_64" = "windows",
    "windows-aarch64" = "windows",
    "macos" = "macos",
    "macos-x86_64" = "macos",
    "macos-arm64" = "macos",
    "macos-aarch64" = "macos",
    paste0(
      psd$os,
      if (!is.na(psd$distribution %||% NA)) paste0("-", psd$distribution),
      if (!is.na(psd$release %||% NA)) paste0("-", psd$release)
    )
  )

  os <- if (os == "mingw32") {
    "windows"
  } else if (startsWith(os, "darwin")) {
    "macos"
  } else {
    os
  }
  os
}

arch_from_platform <- function(platform, na = TRUE) {
  if (na && is.na(platform)) {
    return(NA_character_)
  }

  arch <- switch(platform,
    "windows" = "x86_64",
    "windows-x86_64" = "x86_64",
    "windows-aarch64" = "aarch64",
    "macos" = "arm64",
    "macos-x86_64" = "x86_64",
    "macos-arm64" = "arm64",
    "macos-aarch64" = "arm64",
    parse_platform(platform)$cpu
  )

  arch
}
