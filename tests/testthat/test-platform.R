test_that("current_r_platform_data", {
  fake(current_r_platform_data, "get_platform", "x86_64-apple-darwin17.0")
  expect_equal(current_r_platform_data()$platform, "x86_64-apple-darwin17.0")
})

test_that("default_platforms", {
  fake(default_platforms, "current_r_platform", "macos")
  expect_equal(default_platforms(), c("macos", "source"))

  fake(default_platforms, "current_r_platform", "windows")
  expect_equal(default_platforms(), c("windows", "source"))

  fake(default_platforms, "current_r_platform", "source")
  expect_equal(default_platforms(), "source")
})

test_that("parse_platform", {
  expect_snapshot({
    parse_platform(c(
      "something-else",
      "aarch64-apple-darwin20",
      "x86_64-w64-mingw32",
      "i386+x86_64-w64-mingw32",
      "aarch64-pc-linux",
      "aarch64-pc-linux-gnu",
      "aarch64-pc-linux-ubuntu",
      "aarch64-pc-linux-ubuntu-22.04",
      "aarch64-pc-linux-ubuntu-22.04-libc++",
      "aarch64-pc-linux-gnu-ubuntu",
      "aarch64-pc-linux-gnu-ubuntu-24.04",
      "aarch64-pc-linux-gnu-ubuntu-24.04-libc++",
      "aarch64-pc-linux-musl-alpine-13.4"
    ))
  })
})

test_that("re_linux_platform", {
  loadNamespace("pillar")
  expect_snapshot({
    re_match(
      c(
        "something-else",
        "linux",
        "linux-gnu",
        "linux-ubuntu",
        "linux-ubuntu-22.04",
        "linux-ubuntu-22.04-libc++",
        "linux-gnu-ubuntu",
        "linux-gnu-ubuntu-24.04",
        "linux-gnu-ubuntu-24.04-libc++",
        "linux-musl-alpine-13.4"
      ),
      re_linux_platform()
    )
  })
})

test_that("current_r_platform_data_linux", {
  dists <- dir(test_path("fixtures", "linux"))
  vers <- lapply(dists, function(d) dir(test_path("fixtures", "linux", d)))

  nlapply <- function(X, FUN, ...) {
    ret <- lapply(X, FUN, ...)
    if (is.character(X) && is.null(names(ret))) {
      names(ret) <- X
    }
    ret
  }

  raw <- data.frame(stringsAsFactors = FALSE, raw = "foo")
  mapply(dists, vers, FUN = function(d, v) {
    etc <- test_path("fixtures", "linux", d, v)
    expect_snapshot(nlapply(etc, current_r_platform_data_linux, raw = raw))
  })
})

test_that("linux", {
  fake(current_r_platform_data, "get_platform", "x86_64-pc-linux-gnu")
  fake(
    current_r_platform_data,
    "current_r_platform_data_linux",
    data.frame(stringsAsFactors = FALSE, x = "boo")
  )
  expect_equal(current_r_platform_data()$platform, "boo")
})

test_that("unknown linux", {
  dummy <- data.frame(stringsAsFactors = FALSE, x = "foo")
  expect_equal(
    current_r_platform_data_linux(dummy, tempfile())$distribution,
    "unknown"
  )
  tmp <- tempfile()
  on.exit(unlink(tmp, recursive = TRUE), add = TRUE)
  dir.create(tmp)
  file.create(file.path(tmp, "os-release"))
  expect_equal(
    current_r_platform_data_linux(dummy, tmp)$distribution,
    "unknown"
  )
})

test_that("remove_quotes", {
  expect_equal(remove_quotes("x"), "x")
  expect_equal(remove_quotes("'xyz'"), "xyz")
  expect_equal(remove_quotes('"xyz"'), "xyz")
})

test_that("parse_redhat_release", {
  expect_equal(parse_redhat_release(""), unknown_dist())
  expect_equal(parse_redhat_release("Something")$distribution, "something")
})

test_that("valid_platform_string", {
  expect_true(valid_platform_string("a-b-c"))
  expect_true(valid_platform_string("a-b-c-"))
  expect_true(valid_platform_string("a-b-c-d"))
  expect_true(valid_platform_string("foo-bar-cup"))
  expect_true(valid_platform_string("foo-bar-cup-boo"))

  expect_false(valid_platform_string("-a-b-c"))
  expect_false(valid_platform_string("a---c"))
  expect_false(valid_platform_string("foo-bar"))
  expect_false(valid_platform_string("foobar"))
})

test_that("option, env var", {
  withr::local_options(pkg.current_platform = "foo-bar-foobar")
  expect_equal(current_r_platform(), "foo-bar-foobar")

  withr::local_options(pkg.current_platform = 1:10)
  expect_snapshot(
    error = TRUE,
    current_r_platform()
  )
  withr::local_options(pkg.current_platform = "foobar")
  expect_snapshot(
    error = TRUE,
    current_r_platform()
  )

  withr::local_options(pkg.current_platform = NULL)
  withr::local_envvar(PKG_CURRENT_PLATFORM = "foobar-foo-bar")
  expect_equal(current_r_platform(), "foobar-foo-bar")

  withr::local_envvar(PKG_CURRENT_PLATFORM = "foobar")
  expect_snapshot(
    error = TRUE,
    current_r_platform()
  )
})

test_that("platform with flavors", {
  withr::local_options(
    pkg.current_platform = "x86_64-pc-linux-gnu-ubuntu-22.04-libc++"
  )
  expect_snapshot(current_r_platform_data())
  expect_snapshot(current_r_platform())
})
