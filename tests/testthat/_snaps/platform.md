# parse_platform

    Code
      parse_platform(c("something-else", "aarch64-apple-darwin20",
        "x86_64-w64-mingw32", "i386+x86_64-w64-mingw32", "aarch64-pc-linux",
        "aarch64-pc-linux-gnu", "aarch64-pc-linux-ubuntu",
        "aarch64-pc-linux-ubuntu-22.04", "aarch64-pc-linux-ubuntu-22.04-libc++",
        "aarch64-pc-linux-gnu-ubuntu", "aarch64-pc-linux-gnu-ubuntu-24.04",
        "aarch64-pc-linux-gnu-ubuntu-24.04-libc++",
        "aarch64-pc-linux-musl-alpine-13.4"))
    Output
                 cpu vendor         os distribution      release
      1    something   else       <NA>         <NA>         <NA>
      2      aarch64  apple   darwin20         <NA>         <NA>
      3       x86_64    w64    mingw32         <NA>         <NA>
      4  i386+x86_64    w64    mingw32         <NA>         <NA>
      5      aarch64     pc      linux         <NA>         <NA>
      6      aarch64     pc  linux-gnu         <NA>         <NA>
      7      aarch64     pc      linux       ubuntu         <NA>
      8      aarch64     pc      linux       ubuntu        22.04
      9      aarch64     pc      linux       ubuntu 22.04-libc++
      10     aarch64     pc  linux-gnu       ubuntu         <NA>
      11     aarch64     pc  linux-gnu       ubuntu        24.04
      12     aarch64     pc  linux-gnu       ubuntu 24.04-libc++
      13     aarch64     pc linux-musl       alpine         13.4

# re_linux_platform

    Code
      re_match(c("something-else", "linux", "linux-gnu", "linux-ubuntu",
        "linux-ubuntu-22.04", "linux-ubuntu-22.04-libc++", "linux-gnu-ubuntu",
        "linux-gnu-ubuntu-24.04", "linux-gnu-ubuntu-24.04-libc++",
        "linux-musl-alpine-13.4"), re_linux_platform())
    Output
      # A data frame: 10 x 5
         os         distribution release        .text                         .match  
         <chr>      <chr>        <chr>          <chr>                         <chr>   
       1 <NA>        <NA>         <NA>          something-else                <NA>    
       2 linux      ""           ""             linux                         linux   
       3 linux-gnu  ""           ""             linux-gnu                     linux-g~
       4 linux      "ubuntu"     ""             linux-ubuntu                  linux-u~
       5 linux      "ubuntu"     "22.04"        linux-ubuntu-22.04            linux-u~
       6 linux      "ubuntu"     "22.04-libc++" linux-ubuntu-22.04-libc++     linux-u~
       7 linux-gnu  "ubuntu"     ""             linux-gnu-ubuntu              linux-g~
       8 linux-gnu  "ubuntu"     "24.04"        linux-gnu-ubuntu-24.04        linux-g~
       9 linux-gnu  "ubuntu"     "24.04-libc++" linux-gnu-ubuntu-24.04-libc++ linux-g~
      10 linux-musl "alpine"     "13.4"         linux-musl-alpine-13.4        linux-m~

# current_r_platform_data_linux

    Code
      nlapply(etc, current_r_platform_data_linux, raw = raw)
    Output
      $`fixtures/linux/almalinux/8`
        raw distribution release
      1 foo    almalinux    8.10
      
      $`fixtures/linux/almalinux/9`
        raw distribution release
      1 foo    almalinux     9.5
      

---

    Code
      nlapply(etc, current_r_platform_data_linux, raw = raw)
    Output
      $`fixtures/linux/alpine/3.11`
        raw distribution release
      1 foo       alpine 3.11.11
      
      $`fixtures/linux/alpine/3.12`
        raw distribution release
      1 foo       alpine  3.12.7
      
      $`fixtures/linux/alpine/3.13`
        raw distribution release
      1 foo       alpine  3.13.5
      
      $`fixtures/linux/alpine/3.14`
        raw distribution release
      1 foo       alpine  3.14.1
      
      $`fixtures/linux/alpine/3.18`
        raw distribution release
      1 foo       alpine 3.18.12
      
      $`fixtures/linux/alpine/3.19`
        raw distribution release
      1 foo       alpine  3.19.7
      
      $`fixtures/linux/alpine/3.20`
        raw distribution release
      1 foo       alpine  3.20.6
      
      $`fixtures/linux/alpine/3.21`
        raw distribution release
      1 foo       alpine  3.21.3
      
      $`fixtures/linux/alpine/edge`
        raw distribution              release
      1 foo       alpine 3.22.0_alpha20250108
      

---

    Code
      nlapply(etc, current_r_platform_data_linux, raw = raw)
    Output
      $`fixtures/linux/arch/base`
        raw distribution           release
      1 foo         arch 20250511.0.348143
      
      $`fixtures/linux/arch/base-devel`
        raw distribution           release
      1 foo         arch 20250511.0.348143
      

---

    Code
      nlapply(etc, current_r_platform_data_linux, raw = raw)
    Output
      $`fixtures/linux/centos/5`
        raw distribution release
      1 foo       centos    5.11
      
      $`fixtures/linux/centos/6`
        raw distribution release
      1 foo       centos    6.10
      
      $`fixtures/linux/centos/7`
        raw distribution release
      1 foo       centos       7
      
      $`fixtures/linux/centos/8`
        raw distribution release
      1 foo       centos       8
      

---

    Code
      nlapply(etc, current_r_platform_data_linux, raw = raw)
    Output
      $`fixtures/linux/debian/10`
        raw distribution release
      1 foo       debian      10
      
      $`fixtures/linux/debian/11`
        raw distribution release
      1 foo       debian      11
      
      $`fixtures/linux/debian/12`
        raw distribution release
      1 foo       debian      12
      
      $`fixtures/linux/debian/8`
        raw distribution release
      1 foo       debian       8
      
      $`fixtures/linux/debian/9`
        raw distribution release
      1 foo       debian       9
      
      $`fixtures/linux/debian/testing`
        raw distribution  release
      1 foo       debian unstable
      
      $`fixtures/linux/debian/unstable`
        raw distribution  release
      1 foo       debian unstable
      

---

    Code
      nlapply(etc, current_r_platform_data_linux, raw = raw)
    Output
      $`fixtures/linux/fedora/32`
        raw distribution release
      1 foo       fedora      32
      
      $`fixtures/linux/fedora/33`
        raw distribution release
      1 foo       fedora      33
      
      $`fixtures/linux/fedora/34`
        raw distribution release
      1 foo       fedora      34
      
      $`fixtures/linux/fedora/35`
        raw distribution release
      1 foo       fedora      35
      
      $`fixtures/linux/fedora/38`
        raw distribution release
      1 foo       fedora      38
      
      $`fixtures/linux/fedora/39`
        raw distribution release
      1 foo       fedora      39
      
      $`fixtures/linux/fedora/40`
        raw distribution release
      1 foo       fedora      40
      
      $`fixtures/linux/fedora/41`
        raw distribution release
      1 foo       fedora      41
      
      $`fixtures/linux/fedora/42`
        raw distribution release
      1 foo       fedora      42
      

---

    Code
      nlapply(etc, current_r_platform_data_linux, raw = raw)
    Output
      $`fixtures/linux/opensuse/15.0`
        raw  distribution release
      1 foo opensuse-leap    15.0
      
      $`fixtures/linux/opensuse/15.1`
        raw  distribution release
      1 foo opensuse-leap    15.1
      
      $`fixtures/linux/opensuse/15.2`
        raw  distribution release
      1 foo opensuse-leap    15.2
      
      $`fixtures/linux/opensuse/15.3`
        raw  distribution release
      1 foo opensuse-leap    15.3
      
      $`fixtures/linux/opensuse/15.4`
        raw  distribution release
      1 foo opensuse-leap    15.4
      
      $`fixtures/linux/opensuse/15.5`
        raw  distribution release
      1 foo opensuse-leap    15.5
      
      $`fixtures/linux/opensuse/15.6`
        raw  distribution release
      1 foo opensuse-leap    15.6
      
      $`fixtures/linux/opensuse/42.3`
        raw distribution release
      1 foo     opensuse    42.3
      
      $`fixtures/linux/opensuse/tumbleweed`
        raw        distribution  release
      1 foo opensuse-tumbleweed 20210810
      

---

    Code
      nlapply(etc, current_r_platform_data_linux, raw = raw)
    Output
      $`fixtures/linux/oraclelinux/6`
        raw distribution release
      1 foo           ol    6.10
      
      $`fixtures/linux/oraclelinux/7`
        raw distribution release
      1 foo           ol     7.9
      
      $`fixtures/linux/oraclelinux/8`
        raw distribution release
      1 foo           ol     8.4
      

---

    Code
      nlapply(etc, current_r_platform_data_linux, raw = raw)
    Output
      $`fixtures/linux/rhel/7`
        raw distribution release
      1 foo         rhel     7.9
      
      $`fixtures/linux/rhel/8`
        raw distribution release
      1 foo         rhel    8.10
      
      $`fixtures/linux/rhel/9`
        raw distribution release
      1 foo         rhel     9.6
      

---

    Code
      nlapply(etc, current_r_platform_data_linux, raw = raw)
    Output
      $`fixtures/linux/rocky/8`
        raw distribution release
      1 foo        rocky     8.9
      
      $`fixtures/linux/rocky/9`
        raw distribution release
      1 foo        rocky     9.3
      

---

    Code
      nlapply(etc, current_r_platform_data_linux, raw = raw)
    Output
      $`fixtures/linux/sl/6`
        raw distribution release
      1 foo   scientific    6.10
      
      $`fixtures/linux/sl/7`
        raw distribution release
      1 foo   scientific     7.9
      

---

    Code
      nlapply(etc, current_r_platform_data_linux, raw = raw)
    Output
      $`fixtures/linux/sles/15.3`
        raw distribution release
      1 foo         sles    15.3
      
      $`fixtures/linux/sles/15.4`
        raw distribution release
      1 foo         sles    15.4
      
      $`fixtures/linux/sles/15.5`
        raw distribution release
      1 foo         sles    15.5
      
      $`fixtures/linux/sles/15.6`
        raw distribution release
      1 foo         sles    15.6
      

---

    Code
      nlapply(etc, current_r_platform_data_linux, raw = raw)
    Output
      $`fixtures/linux/ubuntu/14.04`
        raw distribution release
      1 foo       ubuntu   14.04
      
      $`fixtures/linux/ubuntu/16.04`
        raw distribution release
      1 foo       ubuntu   16.04
      
      $`fixtures/linux/ubuntu/18.04`
        raw distribution release
      1 foo       ubuntu   18.04
      
      $`fixtures/linux/ubuntu/20.04`
        raw distribution release
      1 foo       ubuntu   20.04
      
      $`fixtures/linux/ubuntu/21.04`
        raw distribution release
      1 foo       ubuntu   21.04
      
      $`fixtures/linux/ubuntu/21.10`
        raw distribution release
      1 foo       ubuntu   21.10
      
      $`fixtures/linux/ubuntu/22.04`
        raw distribution release
      1 foo       ubuntu   22.04
      
      $`fixtures/linux/ubuntu/22.10`
        raw distribution release
      1 foo       ubuntu   22.10
      
      $`fixtures/linux/ubuntu/24.04`
        raw distribution release
      1 foo       ubuntu   24.04
      

# option, env var

    Code
      current_r_platform()
    Condition
      Error in `forced_platform()`:
      ! The `pkg.current_platform` option must be a string scalar.

---

    Code
      current_r_platform()
    Condition
      Error in `forced_platform()`:
      ! The pkg.current_platform` option must be a valid platform triple: `cpu-vendor-os`. "foobar" is not.

---

    Code
      current_r_platform()
    Condition
      Error in `forced_platform()`:
      ! The `PKG_CURRENT_PLATFORM` environment variable must be a valid platform triple: "cpu-vendor-os". "foobar" is not.

# platform with flavors

    Code
      current_r_platform_data()
    Output
           cpu vendor        os distribution      release
      1 x86_64     pc linux-gnu       ubuntu 22.04-libc++
                                       platform
      1 x86_64-pc-linux-gnu-ubuntu-22.04-libc++

---

    Code
      current_r_platform()
    Output
      [1] "x86_64-pc-linux-gnu-ubuntu-22.04-libc++"

