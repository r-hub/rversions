cache <- new.env(parent = emptyenv())

cache_timeout <- function() {
  as.numeric(Sys.getenv("R_VERSION_CACHE_TIMEOUT", 3600))
}

version_api_url <- function() {
  Sys.getenv("R_VERSION_API_URL", "https://api.r-hub.io/rversions")
}

#' @importFrom curl curl_fetch_memory

api <- function(endpoint) {
  if (!is.null(value <- cache[[endpoint]]) &&
      Sys.time() - value$time < cache_timeout()) {
    return(value$value)
  }

  url <- file.path(version_api_url(), endpoint)
  resp <- curl::curl_fetch_memory(url)
  if (resp$status_code != 200) {
    stop("Failed to fetch ", url, "\n", rawToChar(resp$content))
  }

  cache[[endpoint]] <- list(
    time = Sys.time(),
    value = json$parse(rawToChar(resp$content))
  )

  cache[[endpoint]]$value
}

api_version_df <- function(endpoint, dots = TRUE) {
  obj <- api(endpoint)

  obj <- lapply(obj, function(x) {
    x <- as.list(x)
    if (is.null(x$nickname)) {
      x$nickname <- NA_character_
    }
    if (is.null(x$date)) {
      x$date <- NA_character_
    }
    x
  })

  df <- list_as_df(obj)
  df <- as_version_df(df, dots)
  df
}

api_version_df1 <- function(endpoint, dots = TRUE) {
  obj <- as.list(api(endpoint))

  if (is.null(obj$nickname)) {
    obj$nickname <- NA_character_
  }
  if (is.null(obj$date)) {
    obj$date <- NA_character_
  }

  df <- list_as_df(list(obj))
  df <- as_version_df(df, dots)
  df
}

null_to_na <- function(x) {
  x[] <- lapply(x, function(y) if (is.null(y)) NA else y)
}

list_as_df <- function(x) {
  x <- lapply(x, null_to_na)
  df <- do.call(rbind.data.frame, x)
  df <- as_data_frame(df)
  df
}

as_version_df <- function(df, dots = TRUE) {
  df$date <- parse_iso_8601(df$date)
  df$version <- to_dots(df$version, dots)
  df$semver <- package_version(df$semver %||% df$version)
  df$URL <- df$URL %||% df$url

  cols <- c("version", "date", "nickname", "semver", "URL", "type", "rtools_url")
  df <- df[intersect(cols, names(df))]

  rownames(df) <- NULL
  df
}

to_dots <- function(x, dots) {
  if (dots) {
    gsub("-", ".", x, fixed = TRUE)
  } else {
    gsub(".", "-", x, fixed = TRUE)
  }
}
