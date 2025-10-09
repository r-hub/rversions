RE_DASH <- "^[0-9]+-[0-9]+(-[0-9]+)?$"
RE_DOT <- "^[0-9]+\\.[0-9]+(\\.[0-9]+)?$"

test_that("versions", {
  skip_on_cran()
  d <- r_versions()
  expect_s3_class(d, "data.frame")
  expect_equal(names(d), c("version", "date", "nickname", "semver"))
  expect_true(is.character(d$version))
  expect_s3_class(d$date, "POSIXt")
})

test_that("dots", {
  skip_on_cran()
  expect_match(tail(r_versions(FALSE)$version, 1), RE_DASH)
  expect_match(tail(r_versions(TRUE)$version, 1), RE_DOT)
  expect_equal(gsub("-", ".", r_versions(FALSE)$version),
               r_versions(TRUE)$version)
})

test_that("r_release respects dots", {
  skip_on_cran()
  expect_match(r_release(TRUE)$version, RE_DOT)
  expect_match(r_release(FALSE)$version, RE_DASH)
})

test_that("r_oldrel respects dots", {
  skip_on_cran()
  expect_match(r_oldrel(TRUE)$version, RE_DOT)
  expect_match(r_oldrel(FALSE)$version, RE_DASH)
})
