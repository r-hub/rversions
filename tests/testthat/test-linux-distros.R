test_that("linux_distros", {
  local_proxy()
  withr::local_options(width = 500)
  expect_snapshot(
    print(linux_distros(), n = Inf)
  )
})
