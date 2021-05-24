r_svn_url <- function() {
  "https://svn.r-project.org/R/tags/"
}

cran_url <- function() {
  if (nzchar(Sys.getenv("R_RVERSIONS_CRAN_URL"))){
    Sys.getenv("R_RVERSIONS_CRAN_URL")
  } else {
    "https://cran.r-project.org"
  }
}

r_download_url <- function() {
  paste0(cran_url(), "/src/base/R-4/")
}

r_win_download_url <- function() {
  paste0(cran_url(), "/bin/windows/base/")
}

r_macos_download_url <- function() {
  paste0(cran_url(), "/bin/macosx/base/")
}
