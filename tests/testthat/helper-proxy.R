proxy_app <- function(fixtures) {
  app <- webfakes::new_app()
  app$locals$fixtures <- fixtures
  app$get(webfakes::new_regexp(""), function(req, res) {
    res$set_type("application/json")
    path <- sub("^/", "", req$path)
    fixfile <- paste0(gsub("/", "-", path), ".json")
    fixpath <- file.path(app$locals$fixtures, fixfile)
    if (file.exists(fixpath)) {
      res$send_file(fixfile, root = app$locals$fixtures)
    } else {
      resp <- curl::curl_fetch_memory(
        paste0("https://api.r-hub.io/rversions/", path)
      )
      if (resp$status_code == 200) {
        mkdirp(dirname(fixpath))
        writeBin(resp$content, fixpath)
      }
      res$set_status(resp$status)
      res$send(resp$content)
    }
  })
  app
}

proxy <- webfakes::local_app_process(
  proxy_app(fixtures = testthat::test_path("fixtures/snap"))
)

local_proxy <- function(url = "", .envir = parent.frame()) {
  testthat::skip_on_cran()
  proxy_url <- strip_last_slash(proxy$url())
  withr::local_envvar(R_VERSION_API_URL = proxy_url, .local_envir = .envir)
  invisible(proxy$url(url))
}

strip_last_slash <- function(x) {
  sub("/$", "", x)
}

bad_proxy_app <- function() {
  app <- webfakes::new_app()
  app$get(webfakes::new_regexp(""), function(req, res) {
    res$set_status(404)
    res$set_type("application/json")
    res$send_json(list(error = "Internal server error"))
  })
  app
}
