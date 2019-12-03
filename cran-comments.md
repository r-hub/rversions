## Test environments
- local Ubuntu install, R 3.6
- R-hub windows-x86_64-devel (r-devel)
- R-hub ubuntu-gcc-release (r-release)
- R-hub fedora-clang-devel (r-devel)

## R CMD check results

0 errors | 0 warnings | 0 note

## Reverse dependencies

Checked locally, none broken.

## Release summary

* The date columns of all data.frames is now POSIXt, POSIXct, not POSIXlt, so you can convert the data.frames with `tibble::as_tibble()` directly.