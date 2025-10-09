# api errors

    Code
      r_versions()
    Condition
      Error in `api()`:
      ! Failed to fetch http://127.0.0.1:<port>//r-versions
      {"error":["Internal server error"]}

# version without nickname

    Code
      resolve("2.0.0", platform = NA)
    Output
      # A data frame: 1 x 6
        version date                nickname semver     url                                                  type 
        <chr>   <dttm>              <chr>    <pckg_vrs> <chr>                                                <chr>
      1 2.0.0   2004-10-04 14:24:38 <NA>     2.0.0      https://cran.rstudio.com/src/base/R-2/R-2.0.0.tar.gz 2.0.0

