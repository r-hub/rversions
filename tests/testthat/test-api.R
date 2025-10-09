test_that("api errors", {
  skip_on_cran()
  proxy <- webfakes::local_app_process(bad_proxy_app())
  withr::local_envvar(R_VERSION_API_URL = proxy$url())
  expect_snapshot(error = TRUE, transform = redact_port, {
    r_versions()
  })
})

test_that("version without nickname", {
  skip_on_cran()
  local_proxy()
  loadNamespace("pillar")
  withr::local_options(width = 500)
  expect_snapshot({
    resolve("2.0.0", platform = NA)
  })
})
