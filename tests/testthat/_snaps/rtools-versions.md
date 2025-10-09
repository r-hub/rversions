# rtools_versions

    Code
      utils::tail(rtools_versions("x86_64"))
    Output
      # A data frame: 6 x 4
        version url                                                                     first last   
      * <chr>   <chr>                                                                   <chr> <chr>  
      1 35      https://cran.rstudio.com/bin/windows/Rtools/Rtools35.exe                3.3.0 3.6.3  
      2 40      https://cran.rstudio.com/bin/windows/Rtools/rtools40-x86_64.exe         4.0.0 4.2.100
      3 42      https://github.com/r-hub/rtools42/releases/download/latest/rtools42.exe 4.2.0 4.2.100
      4 43      https://github.com/r-hub/rtools43/releases/download/latest/rtools43.exe 4.3.0 4.3.100
      5 44      https://github.com/r-hub/rtools44/releases/download/latest/rtools44.exe 4.4.0 4.4.100
      6 45      https://github.com/r-hub/rtools45/releases/download/latest/rtools45.exe 4.5.0 100.0.0
    Code
      utils::tail(rtools_versions("aarch64"))
    Output
      # A data frame: 2 x 4
        version url                                                                             first last   
      * <chr>   <chr>                                                                           <chr> <chr>  
      1 44      https://github.com/r-hub/rtools44/releases/download/latest/rtools44-aarch64.exe 4.4.0 4.4.100
      2 45      https://github.com/r-hub/rtools45/releases/download/latest/rtools45-aarch64.exe 4.5.0 100.0.0
    Code
      utils::tail(rtools_versions("arm64"))
    Output
      # A data frame: 2 x 4
        version url                                                                             first last   
      * <chr>   <chr>                                                                           <chr> <chr>  
      1 44      https://github.com/r-hub/rtools44/releases/download/latest/rtools44-aarch64.exe 4.4.0 4.4.100
      2 45      https://github.com/r-hub/rtools45/releases/download/latest/rtools45-aarch64.exe 4.5.0 100.0.0

