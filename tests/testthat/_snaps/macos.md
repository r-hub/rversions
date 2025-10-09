# r_release_macos

    Code
      r_release_macos("x86_64")
    Output
      # A data frame: 1 x 5
        version date                nickname          semver     URL                                                                       
        <chr>   <dttm>              <chr>             <pckg_vrs> <chr>                                                                     
      1 4.5.1   2025-06-13 07:12:01 Great Square Root 4.5.1      https://cran.rstudio.com/bin/macosx/big-sur-x86_64/base/R-4.5.1-x86_64.pkg
    Code
      r_release_macos("arm64")
    Output
      # A data frame: 1 x 5
        version date                nickname          semver     URL                                                                     
        <chr>   <dttm>              <chr>             <pckg_vrs> <chr>                                                                   
      1 4.5.1   2025-06-13 07:12:01 Great Square Root 4.5.1      https://cran.rstudio.com/bin/macosx/big-sur-arm64/base/R-4.5.1-arm64.pkg

---

    Code
      r_release_macos("foobar")
    Condition
      Error in `match.arg()`:
      ! 'arg' should be one of "x86_64", "arm64"

