test_that("resolve", {
  local_proxy()
  loadNamespace("pillar")
  withr::local_options(width = 500)
  expect_snapshot({
    resolve("release", NA)
  })
  expect_snapshot({
    resolve("devel", "macos")
    resolve("next", "aarch64-apple-darwin20")
  })
  expect_snapshot({
    resolve("oldrel", "x86_64-apple-darwin20")
    resolve("4.3", "macos-x86_64")
  })
  expect_snapshot({
    resolve("release", "linux-gnu-ubuntu-22.04")
    resolve("oldrel", "x86_64-unknown-linux-gnu-ubuntu-24.04")
    resolve("oldrel", "aarch64-unknown-linux-gnu-ubuntu-24.04")
  })
  expect_snapshot({
    resolve("release", "windows")
    resolve("4.4", "x86_64-w64-mingw32")
  })
  expect_snapshot({
    resolve("devel", "windows-aarch64")
    resolve("4.4", "aarch64-w64-mingw32")
  })
})
