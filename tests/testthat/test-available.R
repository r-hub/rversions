test_that("available, macos", {
  local_proxy()
  loadNamespace("pillar")
  withr::local_options(width = 200)
  expect_snapshot(
    available("macos")
  )
})

test_that("available, macos-x86_64", {
  local_proxy()
  loadNamespace("pillar")
  withr::local_options(width = 200)
  expect_snapshot(
    available("macos-x86_64")
  )
})

test_that("available, windows", {
  local_proxy()
  loadNamespace("pillar")
  withr::local_options(width = 200)
  expect_snapshot(
    utils::tail(available("windows"))
  )
})

test_that("available, windows-aarch64", {
  local_proxy()
  loadNamespace("pillar")
  withr::local_options(width = 200)
  expect_snapshot(
    available("windows-aarch64")
  )
})

test_that("available, ubuntu", {
  local_proxy()
  loadNamespace("pillar")
  withr::local_options(width = 200)
  expect_snapshot(
    utils::tail(available("linux-ubuntu-24.04"))
  )
})

test_that("available, ubuntu aarch64", {
  local_proxy()
  loadNamespace("pillar")
  withr::local_options(width = 200)
  expect_snapshot(
    utils::tail(available("aarch64-unknown-linux-ubuntu-24.04"))
  )
})
