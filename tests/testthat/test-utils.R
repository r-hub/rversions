test_that("%||%", {
  expect_equal(NULL %||% 1, 1)
  expect_equal(2 %||% 1, 2)
  expect_equal(1:5 %||% stop("nope"), 1:5)
})

test_that("%|NA|%", {
  expect_equal(NA %|NA|% 1, 1)
  expect_equal(2 %|NA|% 1, 2)
  expect_equal(c(1, NA, 3) %|NA|% 0, c(1, 0, 3))
})

test_that("is_rcmd_check", {
  withr::local_envvar(NOT_CRAN = "true")
  expect_false(is_rcmd_check())
  withr::local_envvar(NOT_CRAN = NA_character_)
  withr::local_envvar(`_R_CHECK_PACKAGE_NAME_` = "rversions")
  expect_true(is_rcmd_check())
  withr::local_envvar(`_R_CHECK_PACKAGE_NAME_` = NA_character_)
  expect_false(is_rcmd_check())
})

test_that("is_online", {
  fake(is_online, "is_rcmd_check", TRUE)
  expect_false(is_online())
  fake(is_online, "is_rcmd_check", FALSE)
  withr::local_envvar(R_OFFLINE = "true")
  expect_false(is_online())
  withr::local_envvar(R_OFFLINE = NA_character_)
  expect_true(is_online())
})

test_that("vcapply", {
  # edge cases
  expect_equal(vcapply(integer(), as.character), character())
  expect_equal(vcapply(1L, as.character), "1")

  expect_equal(vcapply(1:5, as.character), as.character(1:5))

  # names are preserved
  x <- list(a = 1L, b = 2L)
  expect_equal(vcapply(x, as.character), c(a = "1", b = "2"))
})

test_that("vlapply", {
  # edge cases
  expect_equal(vlapply(integer(), is.numeric), logical())
  expect_equal(vlapply(1L, is.numeric), TRUE)

  expect_equal(vlapply(1:5, is.numeric), rep(TRUE, 5))

  # names are preserved
  x <- list(a = 1L, b = "2")
  expect_equal(vlapply(x, is.numeric), c(a = TRUE, b = FALSE))
})

test_that("mkdirp", {
  tmp <- file.path(tempfile(), "foo", "bar")
  on.exit(unlink(tmp, recursive = TRUE), add = TRUE)
  mkdirp(tmp)
  expect_true(file.exists(tmp))
  expect_silent(mkdirp(tmp))
})
