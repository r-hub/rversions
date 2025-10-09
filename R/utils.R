`%||%` <- function(a, b) {
  if (!is.null(a)) a else b
}

`%|NA|%` <- function(a, b) {
  ifelse(is.na(a), b, a)
}

is_rcmd_check <- function() {
  if (identical(Sys.getenv("NOT_CRAN"), "true")) {
    FALSE
  } else {
    Sys.getenv("_R_CHECK_PACKAGE_NAME_", "") != ""
  }
}

is_online <- function() {
  if (is_rcmd_check()) {
    return(FALSE)
  }
  tolower(Sys.getenv("R_OFFLINE")) != "true"
}

is_string <- function(x) {
  is.character(x) && length(x) == 1 && !is.na(x)
}

vcapply <- function(x, fun, ...) {
  vapply(x, fun, character(1), ...)
}

vlapply <- function(x, fun, ...) {
  vapply(x, fun, logical(1), ...)
}
