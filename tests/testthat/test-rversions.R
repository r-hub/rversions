context("rversions")

RE_DASH <- "^[0-9]+-[0-9]+(-[0-9]+)?$"
RE_DOT <- "^[0-9]+\\.[0-9]+(\\.[0-9]+)?$"

test_that("versions", {
  d <- r_versions()
  expect_is(d, "data.frame")
  expect_equal(names(d), c("version", "date", "nickname"))
  expect_is(d$version, "character")
  expect_is(d$date, "POSIXt")
})

test_that("dots", {
  expect_match(tail(r_versions(FALSE)$version, 1), RE_DASH)
  expect_match(tail(r_versions(TRUE)$version, 1), RE_DOT)
  expect_equal(gsub("-", ".", r_versions(FALSE)$version),
               r_versions(TRUE)$version)
})

test_that("r_release respects dots", {
  expect_match(r_release(TRUE)$version, RE_DOT)
  expect_match(r_release(FALSE)$version, RE_DASH)
})

test_that("r_oldrel respects dots", {
  expect_match(r_oldrel(TRUE)$version, RE_DOT)
  expect_match(r_oldrel(FALSE)$version, RE_DASH)
})

test_that("on-demand nickname update", {
  d <- r_versions()
  nicks <- cached_nicks()

  ## We add foobar to make sure that mocking is in place
  nicks[length(nicks) - 3] <- "foobar"
  d$nickname[length(nicks) - 3] <- "foobar"

  mockery::stub(r_versions, "cached_nicks", head(nicks, -2))
  expect_equal(d, r_versions())
})
