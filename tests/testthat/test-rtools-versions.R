test_that("rtools_versions", {
  local_proxy()
  loadNamespace("pillar")
  withr::local_options(width = 500)
  expect_snapshot({
    utils::tail(rtools_versions("x86_64"))
    utils::tail(rtools_versions("aarch64"))
    utils::tail(rtools_versions("arm64"))
  })
})

test_that("default_windows_arch", {
  fake(default_windows_arch, "is_windows", TRUE)
  expect_equal(default_windows_arch(), R.version$arch)
  fake(default_windows_arch, "is_windows", FALSE)
  expect_equal(default_windows_arch(), "x86_64")
})

test_that("is_windows", {
  expect_equal(is_windows(), .Platform$OS.type == "windows")
})
