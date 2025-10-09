test_that("r_release_macos", {
  local_proxy()
  loadNamespace("pillar")
  withr::local_options(width = 500)
  expect_snapshot({
    r_release_macos("x86_64")
    r_release_macos("arm64")
  })
  expect_snapshot(error = TRUE, {
    r_release_macos("foobar")
  })
})
