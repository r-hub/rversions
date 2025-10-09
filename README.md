
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rversions <a href='https://r-hub.github.io/rversions/'><img src='man/figures/logo.png' align="right" height="138.5" /></a>

> Past and present R versions

<!-- badges: start -->

[![R-CMD-check](https://github.com/r-hub/rversions/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/r-hub/rversions/actions/workflows/R-CMD-check.yaml)
[![CRAN
downloads](https://cranlogs.r-pkg.org/badges/rversions)](https://r-pkg.org/pkg/rversions)
[![CRAN
version](https://www.r-pkg.org/badges/version/rversions)](https://r-pkg.org/pkg/rversions)
[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Codecov test
coverage](https://codecov.io/gh/r-hub/rversions/graph/badge.svg)](https://app.codecov.io/gh/r-hub/rversions)
<!-- badges: end -->

The R version numbers and dates are queried from R-hub’s [R version
API](https://api.r-hub.io/rversions/).

`rversions` is in particular useful for determining at any given moment
what versions “R-release” and “R-oldrel” refer to. This is useful for
e.g. [R-hub](https://docs.r-hub.io/).

## Installation

``` r
install.packages("rversions")
```

## Usage

### List all R releases

``` r
r_versions()
```

    #> # A data frame: 161 × 4
    #>    version date                nickname semver    
    #>    <chr>   <dttm>              <chr>    <pckg_vrs>
    #>  1 0.0     1995-06-20 00:00:00 <NA>     0.0.0     
    #>  2 0.1     1996-02-12 03:22:00 <NA>     0.1.0     
    #>  3 0.2     1996-03-14 21:59:00 <NA>     0.2.0     
    #>  4 0.3     1996-03-22 06:46:00 <NA>     0.3.0     
    #>  5 0.4     1996-04-01 23:18:00 <NA>     0.4.0     
    #>  6 0.5     1996-05-13 04:06:00 <NA>     0.5.0     
    #>  7 0.6     1996-05-17 04:53:00 <NA>     0.6.0     
    #>  8 0.7     1996-05-28 03:31:00 <NA>     0.7.0     
    #>  9 0.8     1996-05-31 04:51:00 <NA>     0.8.0     
    #> 10 0.9     1996-06-07 04:40:00 <NA>     0.9.0     
    #> # ℹ 151 more rows

### List available R builds

For the current platform:

``` r
available()
```

    #> # A data frame: 20 × 5
    #>    version date                semver     type    url                           
    #>    <chr>   <dttm>              <pckg_vrs> <chr>   <chr>                         
    #>  1 4.1.0   2021-05-18 07:05:22 4.1.0      release https://cran.rstudio.com/bin/…
    #>  2 4.1.1   2021-08-10 07:05:06 4.1.1      release https://cran.rstudio.com/bin/…
    #>  3 4.1.2   2021-11-01 08:05:12 4.1.2      release https://cran.rstudio.com/bin/…
    #>  4 4.1.3   2022-03-10 08:05:38 4.1.3      release https://cran.rstudio.com/bin/…
    #>  5 4.2.0   2022-04-22 07:05:41 4.2.0      release https://cran.rstudio.com/bin/…
    #>  6 4.2.1   2022-06-23 07:05:33 4.2.1      release https://cran.rstudio.com/bin/…
    #>  7 4.2.2   2022-10-31 08:05:54 4.2.2      release https://cran.rstudio.com/bin/…
    #>  8 4.2.3   2023-03-15 08:06:01 4.2.3      release https://cran.rstudio.com/bin/…
    #>  9 4.3.0   2023-04-21 07:06:14 4.3.0      release https://cran.rstudio.com/bin/…
    #> 10 4.3.1   2023-06-16 07:06:07 4.3.1      release https://cran.rstudio.com/bin/…
    #> 11 4.3.2   2023-10-31 08:07:42 4.3.2      release https://cran.rstudio.com/bin/…
    #> 12 4.3.3   2024-02-29 08:07:53 4.3.3      release https://cran.rstudio.com/bin/…
    #> 13 4.4.0   2024-04-24 04:07:56 4.4.0      release https://cran.rstudio.com/bin/…
    #> 14 4.4.1   2024-06-14 07:08:17 4.4.1      release https://cran.rstudio.com/bin/…
    #> 15 4.4.2   2024-10-31 08:09:02 4.4.2      release https://cran.rstudio.com/bin/…
    #> 16 4.4.3   2025-02-28 08:08:59 4.4.3      release https://cran.rstudio.com/bin/…
    #> 17 4.5.0   2025-04-11 08:51:39 4.5.0      release https://cran.rstudio.com/bin/…
    #> 18 4.5.1   2025-06-13 07:12:01 4.5.1      release https://cran.rstudio.com/bin/…
    #> 19 4.5.1   NA                  4.5.1      patched https://mac.r-project.org/big…
    #> 20 4.6.0   NA                  4.6.0      devel   https://mac.r-project.org/big…

For another platform:

``` r
available("windows")
```

    #> # A data frame: 97 × 5
    #>    version date                semver     type    url                           
    #>    <chr>   <dttm>              <pckg_vrs> <chr>   <chr>                         
    #>  1 2.0.0   2004-10-04 14:24:38 2.0.0      release https://cran-archive.r-projec…
    #>  2 2.0.1   2004-11-15 14:16:30 2.0.1      release https://cran-archive.r-projec…
    #>  3 2.1.0   2005-04-18 22:26:33 2.1.0      release https://cran-archive.r-projec…
    #>  4 2.1.1   2005-06-20 09:27:13 2.1.1      release https://cran-archive.r-projec…
    #>  5 2.2.0   2005-10-06 10:22:14 2.2.0      release https://cran-archive.r-projec…
    #>  6 2.2.1   2005-12-20 10:35:21 2.2.1      release https://cran-archive.r-projec…
    #>  7 2.3.0   2006-04-24 10:37:20 2.3.0      release https://cran-archive.r-projec…
    #>  8 2.3.1   2006-06-01 08:25:33 2.3.1      release https://cran-archive.r-projec…
    #>  9 2.4.0   2006-10-03 10:15:04 2.4.0      release https://cran-archive.r-projec…
    #> 10 2.4.1   2006-12-18 09:49:23 2.4.1      release https://cran-archive.r-projec…
    #> # ℹ 87 more rows

### Resolve R version specifications

Current R release:

``` r
resolve("release")
```

    #> # A data frame: 1 × 6
    #>   version date                nickname          semver     url             type 
    #>   <chr>   <dttm>              <chr>             <pckg_vrs> <chr>           <chr>
    #> 1 4.5.1   2025-06-13 07:12:01 Great Square Root 4.5.1      https://cran.r… rele…

Development version:

``` r
resolve("devel")
```

    #> # A data frame: 1 × 6
    #>   version date   nickname                semver     url                    type 
    #>   <chr>   <dttm> <chr>                   <pckg_vrs> <chr>                  <chr>
    #> 1 4.6.0   NA     Unsuffered Consequences 4.6.0      https://mac.r-project… devel

Next version of R:

``` r
resolve("next")
```

    #> # A data frame: 1 × 6
    #>   version date   nickname          semver     url                          type 
    #>   <chr>   <dttm> <chr>             <pckg_vrs> <chr>                        <chr>
    #> 1 4.5.1   NA     Great Square Root 4.5.1      https://mac.r-project.org/b… next

Previous release:

``` r
resolve("oldrel")
```

    #> # A data frame: 1 × 6
    #>   version date                nickname    semver     url                   type 
    #>   <chr>   <dttm>              <chr>       <pckg_vrs> <chr>                 <chr>
    #> 1 4.4.3   2025-02-28 08:08:59 Trophy Case 4.4.3      https://cran.rstudio… oldr…

Last release of a branch:

``` r
resolve("4.2")
```

    #> # A data frame: 1 × 6
    #>   version date                nickname         semver     url              type 
    #>   <chr>   <dttm>              <chr>            <pckg_vrs> <chr>            <chr>
    #> 1 4.2.3   2023-03-15 08:06:01 Shortstop Beagle 4.2.3      https://cran.rs… 4.2

### List of Rtools versions

``` r
rtools_versions()
```

    #> # A data frame: 21 × 4
    #>    version url                                                       first last 
    #>    <chr>   <chr>                                                     <chr> <chr>
    #>  1 26      https://cran.rstudio.com/bin/windows/Rtools/Rtools26.exe  2.0.0 2.6.2
    #>  2 27      https://cran.rstudio.com/bin/windows/Rtools/Rtools27.exe  2.6.0 2.7.2
    #>  3 28      https://cran.rstudio.com/bin/windows/Rtools/Rtools28.exe  2.7.0 2.8.1
    #>  4 29      https://cran.rstudio.com/bin/windows/Rtools/Rtools29.exe  2.8.0 2.9.2
    #>  5 210     https://cran.rstudio.com/bin/windows/Rtools/Rtools210.exe 2.9.0 2.10…
    #>  6 211     https://cran.rstudio.com/bin/windows/Rtools/Rtools211.exe 2.10… 2.11…
    #>  7 212     https://cran.rstudio.com/bin/windows/Rtools/Rtools212.exe 2.12… 2.12…
    #>  8 213     https://cran.rstudio.com/bin/windows/Rtools/Rtools213.exe 2.13… 2.13…
    #>  9 214     https://cran.rstudio.com/bin/windows/Rtools/Rtools214.exe 2.13… 2.14…
    #> 10 215     https://cran.rstudio.com/bin/windows/Rtools/Rtools215.exe 2.14… 2.15…
    #> # ℹ 11 more rows

### Linux distros supported by Posit, or R-hub

``` r
linux_distros()
```

    #> # A data frame: 42 × 13
    #>    id    aliases name  version codename url   docker eol                 retired
    #>  * <chr> <I<nam> <chr> <chr>   <chr>    <chr> <chr>  <dttm>              <lgl>  
    #>  1 alma… <chr>   Alma… 10      <NA>     http… almal… 2035-05-31 00:00:00 FALSE  
    #>  2 alma… <NULL>  Alma… 8       <NA>     http… almal… 2029-03-01 00:00:00 FALSE  
    #>  3 alma… <chr>   Alma… 9       <NA>     http… almal… 2032-05-31 00:00:00 FALSE  
    #>  4 cent… <chr>   Cent… 6       <NA>     http… cento… 2020-11-30 00:00:00 TRUE   
    #>  5 cent… <chr>   Cent… 7       <NA>     http… cento… 2024-06-30 00:00:00 FALSE  
    #>  6 cent… <NULL>  Cent… 8       <NA>     http… cento… 2024-05-31 00:00:00 FALSE  
    #>  7 debi… <chr>   Debi… 10      buster   http… debia… 2024-06-30 00:00:00 TRUE   
    #>  8 debi… <chr>   Debi… 11      bullseye http… debia… 2024-08-14 00:00:00 TRUE   
    #>  9 debi… <chr>   Debi… 12      bookworm http… debia… NA                  FALSE  
    #> 10 debi… <chr>   Debi… 9       stretch  http… debia… 2022-06-30 00:00:00 TRUE   
    #> # ℹ 32 more rows
    #> # ℹ 4 more variables: aarch64 <chr>, ppm_binaries <lgl>, ppm_aarch64 <lgl>,
    #> #   ppm_url <chr>

## License

MIT © [Gábor Csárdi](https://github.com/gaborcsardi), [Posit Software,
PBC](https://posit.co)
