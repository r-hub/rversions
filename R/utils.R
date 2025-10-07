`%||%` <- function(a, b) {
  if (!is.null(a)) a else b
}

`%&&%` <- function(a, b) {
  if (!is.null(a)) b else NULL
}

is_rcmd_check <- function() {
  if (identical(Sys.getenv("NOT_CRAN"), "true")) {
    FALSE
  } else {
    Sys.getenv("_R_CHECK_PACKAGE_NAME_", "") != ""
  }
}

is_online <- function() {
  if (is_rcmd_check()) return(FALSE)
  tolower(Sys.getenv("R_OFFLINE")) != "true"
}

is_string <- function(x) {
  is.character(x) && length(x) == 1 && !is.na(x)
}
