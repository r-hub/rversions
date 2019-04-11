
keep_head <- function(base_url, extension) {
  versions <- tail(r_versions(dots = TRUE), 3)
  handle <- new_handle()
  handle_setopt(handle, customrequest = "HEAD")
  handle_setopt(handle, nobody = TRUE)

  for (v in nrow(versions):1) {
    filename <- paste0("R-", versions[v, "version"], extension)
    url <- paste0(base_url, filename)
    resp <- curl_fetch_memory(url, handle = handle)
    if (resp$status_code == 200) {
      df <- versions[v, , drop = FALSE]
      df$URL <- url
      othercols <- setdiff(colnames(df), c("version", "date", "URL"))
      df <- df[, c("version", "date", "URL", othercols)]
      return(df)
    }
  }

  stop("Cannot find R-release version to download", call. = FALSE)
}
