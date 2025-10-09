test_that("r_release_tarball", {
  local_proxy()
  loadNamespace("pillar")
  withr::local_options(width = 500)
  expect_snapshot({
    r_release_tarball()
  })
})
