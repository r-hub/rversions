library(testthat)
library(rversions)

if (Sys.getenv("NOT_CRAN") == "true") test_check("rversions")
