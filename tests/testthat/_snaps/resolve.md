# resolve

    Code
      resolve("release", NA)
    Output
      # A data frame: 1 x 6
        version date                nickname          semver     url                                                  type   
        <chr>   <dttm>              <chr>             <pckg_vrs> <chr>                                                <chr>  
      1 4.5.1   2025-06-13 07:12:01 Great Square Root 4.5.1      https://cran.rstudio.com/src/base/R-4/R-4.5.1.tar.gz release

---

    Code
      resolve("devel", "macos")
    Output
      # A data frame: 1 x 6
        version date   nickname                semver     url                                                              type 
        <chr>   <dttm> <chr>                   <pckg_vrs> <chr>                                                            <chr>
      1 4.6.0   NA     Unsuffered Consequences 4.6.0      https://mac.r-project.org/big-sur/last-success/R-devel-arm64.pkg devel
    Code
      resolve("next", "aarch64-apple-darwin20")
    Output
      # A data frame: 1 x 6
        version date   nickname          semver     url                                                                   type 
        <chr>   <dttm> <chr>             <pckg_vrs> <chr>                                                                 <chr>
      1 4.5.1   NA     Great Square Root 4.5.1      https://mac.r-project.org/big-sur/last-success/R-4.5-branch-arm64.pkg next 

---

    Code
      resolve("oldrel", "x86_64-apple-darwin20")
    Output
      # A data frame: 1 x 6
        version date                nickname    semver     url                                                                        type    
        <chr>   <dttm>              <chr>       <pckg_vrs> <chr>                                                                      <chr>   
      1 4.4.3   2025-02-28 08:08:59 Trophy Case 4.4.3      https://cran.rstudio.com/bin/macosx/big-sur-x86_64/base/R-4.4.3-x86_64.pkg oldrel/1
    Code
      resolve("4.3", "macos-x86_64")
    Output
      # A data frame: 1 x 6
        version date                nickname        semver     url                                                                        type 
        <chr>   <dttm>              <chr>           <pckg_vrs> <chr>                                                                      <chr>
      1 4.3.3   2024-02-29 08:07:53 Angel Food Cake 4.3.3      https://cran.rstudio.com/bin/macosx/big-sur-x86_64/base/R-4.3.3-x86_64.pkg 4.3  

---

    Code
      resolve("release", "linux-gnu-ubuntu-22.04")
    Output
      # A data frame: 1 x 6
        version date                nickname          semver     url                                                         type   
        <chr>   <dttm>              <chr>             <pckg_vrs> <chr>                                                       <chr>  
      1 4.5.1   2025-06-13 07:12:01 Great Square Root 4.5.1      https://cdn.posit.co/r/ubuntu-2204/pkgs/r-4.5.1_1_amd64.deb release
    Code
      resolve("oldrel", "x86_64-unknown-linux-gnu-ubuntu-24.04")
    Output
      # A data frame: 1 x 6
        version date                nickname    semver     url                                                         type    
        <chr>   <dttm>              <chr>       <pckg_vrs> <chr>                                                       <chr>   
      1 4.4.3   2025-02-28 08:08:59 Trophy Case 4.4.3      https://cdn.posit.co/r/ubuntu-2404/pkgs/r-4.4.3_1_amd64.deb oldrel/1
    Code
      resolve("oldrel", "aarch64-unknown-linux-gnu-ubuntu-24.04")
    Output
      # A data frame: 1 x 6
        version date                nickname    semver     url                                                         type    
        <chr>   <dttm>              <chr>       <pckg_vrs> <chr>                                                       <chr>   
      1 4.4.3   2025-02-28 08:08:59 Trophy Case 4.4.3      https://cdn.posit.co/r/ubuntu-2404/pkgs/r-4.4.3_1_arm64.deb oldrel/1

---

    Code
      resolve("release", "windows")
    Output
      # A data frame: 1 x 7
        version date                nickname          semver     url                                                       type    rtools_url                                                             
        <chr>   <dttm>              <chr>             <pckg_vrs> <chr>                                                     <chr>   <chr>                                                                  
      1 4.5.1   2025-06-13 07:12:01 Great Square Root 4.5.1      https://cran.rstudio.com/bin/windows/base/R-4.5.1-win.exe release https://github.com/r-hub/rtools45/releases/download/latest/rtools45.exe
    Code
      resolve("4.4", "x86_64-w64-mingw32")
    Output
      # A data frame: 1 x 7
        version date                nickname    semver     url                                                                 type  rtools_url                                                             
        <chr>   <dttm>              <chr>       <pckg_vrs> <chr>                                                               <chr> <chr>                                                                  
      1 4.4.3   2025-02-28 08:08:59 Trophy Case 4.4.3      https://cran.rstudio.com/bin/windows/base/old/4.4.3/R-4.4.3-win.exe 4.4   https://github.com/r-hub/rtools44/releases/download/latest/rtools44.exe

---

    Code
      resolve("devel", "windows-aarch64")
    Output
      # A data frame: 1 x 7
        version date   nickname                semver     url                                                                                       type  rtools_url                                                                     
        <chr>   <dttm> <chr>                   <pckg_vrs> <chr>                                                                                     <chr> <chr>                                                                          
      1 4.6.0   NA     Unsuffered Consequences 4.6.0      https://github.com/r-hub/R/releases/download/vdevel/R-devel-2025-10-06-r88901-aarch64.exe devel https://github.com/r-hub/rtools45/releases/download/latest/rtools45-aarch64.exe
    Code
      resolve("4.4", "aarch64-w64-mingw32")
    Output
      # A data frame: 1 x 7
        version date                nickname    semver     url                                                                     type  rtools_url                                                                     
        <chr>   <dttm>              <chr>       <pckg_vrs> <chr>                                                                   <chr> <chr>                                                                          
      1 4.4.3   2025-02-28 08:08:59 Trophy Case 4.4.3      https://github.com/r-hub/R/releases/download/v4.4.3/R-4.4.3-aarch64.exe 4.4   https://github.com/r-hub/rtools44/releases/download/latest/rtools44-aarch64.exe

