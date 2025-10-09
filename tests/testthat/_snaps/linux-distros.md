# linux_distros

    Code
      print(linux_distros(), n = Inf)
    Output
      # A data frame: 42 x 13
         id           aliases         name                         version codename        url                        docker                              eol                 retired aarch64 ppm_binaries ppm_aarch64 ppm_url    
       * <chr>        <I<named list>> <chr>                        <chr>   <chr>           <chr>                      <chr>                               <dttm>              <lgl>   <chr>   <lgl>        <lgl>       <chr>      
       1 almalinux-10 <chr [1]>       AlmaLinux                    10      <NA>            https://almalinux.org/     almalinux:10                        2035-05-31 00:00:00 FALSE   posit   TRUE         TRUE        rhel10     
       2 almalinux-8  <NULL>          AlmaLinux                    8       <NA>            https://almalinux.org/     almalinux:8                         2029-03-01 00:00:00 FALSE   posit   TRUE         NA          centos8    
       3 almalinux-9  <chr [1]>       AlmaLinux                    9       <NA>            https://almalinux.org/     almalinux:9                         2032-05-31 00:00:00 FALSE   posit   TRUE         TRUE        rhel9      
       4 centos-6     <chr [1]>       CentOS Linux                 6       <NA>            https://www.centos.org/    centos:6                            2020-11-30 00:00:00 TRUE    none    FALSE        NA          <NA>       
       5 centos-7     <chr [1]>       CentOS Linux                 7       <NA>            https://www.centos.org/    centos:7                            2024-06-30 00:00:00 FALSE   posit   TRUE         NA          centos7    
       6 centos-8     <NULL>          CentOS Linux                 8       <NA>            https://www.centos.org/    centos:8                            2024-05-31 00:00:00 FALSE   posit   TRUE         NA          centos8    
       7 debian-10    <chr [1]>       Debian                       10      buster          https://www.debian.org/    debian:10                           2024-06-30 00:00:00 TRUE    rhub    FALSE        NA          <NA>       
       8 debian-11    <chr [1]>       Debian                       11      bullseye        https://www.debian.org/    debian:11                           2024-08-14 00:00:00 TRUE    rhub    TRUE         NA          bullseye   
       9 debian-12    <chr [1]>       Debian                       12      bookworm        https://www.debian.org/    debian:12                           NA                  FALSE   posit   TRUE         NA          bookworm   
      10 debian-9     <chr [1]>       Debian                       9       stretch         https://www.debian.org/    debian:9                            2022-06-30 00:00:00 TRUE    rhub    FALSE        NA          <NA>       
      11 fedora-37    <NULL>          Fedora Linux                 37      <NA>            https://fedoraproject.org/ fedora:37                           2023-11-14 00:00:00 TRUE    rhub    FALSE        NA          <NA>       
      12 fedora-38    <NULL>          Fedora Linux                 38      <NA>            https://fedoraproject.org/ fedora:38                           2024-05-14 00:00:00 TRUE    rhub    FALSE        NA          <NA>       
      13 fedora-39    <NULL>          Fedora Linux                 39      <NA>            https://fedoraproject.org/ fedora:39                           2024-11-12 00:00:00 TRUE    rhub    FALSE        NA          <NA>       
      14 fedora-40    <NULL>          Fedora Linux                 40      <NA>            https://fedoraproject.org/ fedora:40                           2025-05-13 00:00:00 TRUE    posit   FALSE        NA          <NA>       
      15 fedora-41    <NULL>          Fedora Linux                 41      <NA>            https://fedoraproject.org/ fedora:41                           2025-11-26 00:00:00 FALSE   posit   FALSE        NA          <NA>       
      16 fedora-42    <NULL>          Fedora Linux                 42      <NA>            https://fedoraproject.org/ fedora:42                           2026-05-13 00:00:00 FALSE   posit   FALSE        NA          <NA>       
      17 opensuse-15  <chr [6]>       openSUSE Leap                15.1    <NA>            https://www.opensuse.org/  opensuse/leap:15.1                  2021-02-01 00:00:00 TRUE    none    TRUE         NA          opensuse15 
      18 opensuse-152 <chr [2]>       openSUSE Leap                15.2    <NA>            https://www.opensuse.org/  opensuse/leap:15.2                  2022-01-04 00:00:00 TRUE    none    TRUE         NA          opensuse152
      19 opensuse-153 <chr [2]>       openSUSE Leap                15.3    <NA>            https://www.opensuse.org/  opensuse/leap:15.3                  2022-12-31 00:00:00 TRUE    rhub    TRUE         NA          opensuse153
      20 opensuse-154 <chr [2]>       openSUSE Leap                15.4    <NA>            https://www.opensuse.org/  opensuse/leap:15.4                  2023-12-31 00:00:00 TRUE    rhub    TRUE         NA          opensuse154
      21 opensuse-155 <chr [2]>       openSUSE Leap                15.5    <NA>            https://www.opensuse.org/  opensuse/leap:15.5                  2024-12-31 00:00:00 TRUE    rhub    TRUE         NA          opensuse155
      22 opensuse-156 <chr [2]>       openSUSE Leap                15.6    <NA>            https://www.opensuse.org/  opensuse/leap:15.6                  2025-12-31 00:00:00 FALSE   posit   TRUE         NA          opensuse156
      23 opensuse-42  <chr [2]>       openSUSE Leap                42.3    <NA>            https://www.opensuse.org/  opensuse/archive:42.3               2019-07-01 00:00:00 TRUE    none    TRUE         NA          opensuse42 
      24 rhel-10      <chr [1]>       Red Hat Enterprise Linux     10      <NA>            https://www.redhat.com/    redhat/ubi10                        2035-05-31 00:00:00 FALSE   posit   TRUE         TRUE        rhel10     
      25 rhel-7       <chr [1]>       Red Hat Enterprise Linux     7       <NA>            https://www.redhat.com/    registry.access.redhat.com/ubi7/ubi 2024-06-30 00:00:00 FALSE   posit   TRUE         NA          centos7    
      26 rhel-8       <NULL>          Red Hat Enterprise Linux     8       <NA>            https://www.redhat.com/    redhat/ubi8                         2029-05-31 00:00:00 FALSE   posit   TRUE         NA          centos8    
      27 rhel-9       <chr [1]>       Red Hat Enterprise Linux     9       <NA>            https://www.redhat.com/    redhat/ubi9                         2032-05-31 00:00:00 FALSE   posit   TRUE         TRUE        rhel9      
      28 rocky-10     <chr [1]>       Rocky Linux                  10      <NA>            https://rockylinux.org/    rockylinux/rockylinux:10            2035-05-31 00:00:00 FALSE   posit   TRUE         TRUE        rhel10     
      29 rocky-8      <NULL>          Rocky Linux                  8       <NA>            https://rockylinux.org/    rockylinux/rockylinux:8             2029-05-31 00:00:00 FALSE   posit   TRUE         NA          centos8    
      30 rocky-9      <chr [1]>       Rocky Linux                  9       <NA>            https://rockylinux.org/    rockylinux/rockylinux:9             2032-05-31 00:00:00 FALSE   posit   TRUE         TRUE        rhel9      
      31 sles-15      <chr [6]>       SUSE Linux Enterprise Server 15      <NA>            https://suse.com           registry.suse.com/suse/sle15:15.0   2019-12-31 00:00:00 TRUE    none    TRUE         NA          opensuse15 
      32 sles-15.1    <chr [6]>       SUSE Linux Enterprise Server 15.1    <NA>            https://suse.com           registry.suse.com/suse/sle15:15.1   2021-12-31 00:00:00 TRUE    none    TRUE         NA          opensuse15 
      33 sles-15.2    <chr [2]>       SUSE Linux Enterprise Server 15.2    <NA>            https://suse.com           registry.suse.com/suse/sle15:15.2   2021-12-31 00:00:00 TRUE    none    TRUE         NA          opensuse152
      34 sles-15.3    <chr [2]>       SUSE Linux Enterprise Server 15.3    <NA>            https://suse.com           registry.suse.com/bci/bci-base:15.3 2022-12-31 00:00:00 TRUE    rhub    TRUE         NA          opensuse153
      35 sles-15.4    <chr [2]>       SUSE Linux Enterprise Server 15.4    <NA>            https://suse.com           registry.suse.com/bci/bci-base:15.4 2023-12-31 00:00:00 TRUE    rhub    TRUE         NA          opensuse154
      36 sles-15.5    <chr [2]>       SUSE Linux Enterprise Server 15.5    <NA>            https://suse.com           registry.suse.com/bci/bci-base:15.5 2024-12-31 00:00:00 TRUE    rhub    TRUE         NA          opensuse155
      37 sles-15.6    <chr [2]>       SUSE Linux Enterprise Server 15.6    <NA>            https://suse.com           registry.suse.com/bci/bci-base:15.6 2025-12-31 00:00:00 FALSE   posit   TRUE         NA          opensuse156
      38 ubuntu-1604  <chr [2]>       Ubuntu                       16.04   Xenial Xerus    https://ubuntu.com/        ubuntu:16.04                        2021-04-30 00:00:00 TRUE    none    TRUE         NA          xenial     
      39 ubuntu-1804  <chr [2]>       Ubuntu                       18.04   Bionic Beaver   https://ubuntu.com/        ubuntu:18.04                        2023-05-31 00:00:00 TRUE    rhub    TRUE         NA          bionic     
      40 ubuntu-2004  <chr [2]>       Ubuntu                       20.04   Focal Fossa     https://ubuntu.com/        ubuntu:20.04                        2025-05-31 00:00:00 FALSE   posit   TRUE         NA          focal      
      41 ubuntu-2204  <chr [2]>       Ubuntu                       22.04   Jammy Jellyfish https://ubuntu.com/        ubuntu:22.04                        2027-04-01 00:00:00 FALSE   posit   TRUE         NA          jammy      
      42 ubuntu-2404  <chr [2]>       Ubuntu                       24.04   Noble Numbat    https://ubuntu.com/        ubuntu:24.04                        2034-04-01 00:00:00 FALSE   posit   TRUE         TRUE        noble      

