
r_svn_url <- "https://svn.r-project.org/R/tags/"

if (nzchar(Sys.getenv("R_RVERSIONS_CRAN_URL"))){
  cran_url <- Sys.getenv("R_RVERSIONS_CRAN_URL")
} else {
  cran_url <- "cran.r-project.org"
}

r_download_url <- paste0(cran_url, "/src/base/R-3/")
r_win_download_url <- paste0(cran_url, "/bin/windows/base/")
r_macos_download_url <- paste0(cran_url, "/bin/macosx/")
