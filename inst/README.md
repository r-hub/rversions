
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![Linux Build
Status](https://travis-ci.org/r-hub/rversions.svg?branch=master)](https://travis-ci.org/r-hub/rversions)
[![Windows Build
status](https://ci.appveyor.com/api/projects/status/github/r-hub/rversions?svg=true)](https://ci.appveyor.com/project/gaborcsardi/rversions)
[![CRAN RStudio mirror
downloads](http://cranlogs.r-pkg.org/badges/rversions)](http://r-pkg.org/pkg/rversions)
[![CRAN
version](http://www.r-pkg.org/badges/version/rversions)](http://r-pkg.org/pkg/rversions)
[![CRAN
checks](https://cranchecks.info/badges/summary/rversions)](https://cran.r-project.org/web/checks/check_results_rversions.html)

# rversions — past and present R versions

The R version numbers and dates are extracted from the main R SVN
repository at <http://svn.r-project.org/R/>.

`rversions` is in particular useful for determining at any given moment
what versions “R-release” and “R-oldrel” refer to. This is useful for
e.g. [R-hub](https://docs.r-hub.io/).

## Installation

``` r
install.packages("rversions")
```

## Usage

### R-release and R-oldrel

``` r
library(rversions)
r_release()
```

    #>     version                        date           nickname
    #> 113   3.6.0 2019-04-26T07:05:03.899333Z Planting of a Tree

``` r
r_oldrel()
```

    #>     version                        date    nickname
    #> 112   3.5.3 2019-03-11T08:04:49.379300Z Great Truth

### All R versions and release dates

``` r
r_versions()
```

    #>     version                        date                 nickname
    #> 1      0.60 1997-12-04T08:47:58.000000Z                     <NA>
    #> 2      0.61 1997-12-21T13:09:22.000000Z                     <NA>
    #> 3    0.61.1 1998-01-10T00:31:55.000000Z                     <NA>
    #> 4    0.61.2 1998-03-14T19:25:55.000000Z                     <NA>
    #> 5    0.61.3 1998-05-02T07:58:17.000000Z                     <NA>
    #> 6      0.62 1998-06-14T12:56:20.000000Z                     <NA>
    #> 7    0.62.1 1998-06-14T22:13:25.000000Z                     <NA>
    #> 8    0.62.2 1998-07-10T11:13:45.000000Z                     <NA>
    #> 9    0.62.3 1998-08-28T09:02:19.000000Z                     <NA>
    #> 10   0.62.4 1998-10-23T12:08:41.000000Z                     <NA>
    #> 11     0.63 1998-11-13T14:37:19.000000Z                     <NA>
    #> 12   0.63.1 1998-12-04T13:06:28.000000Z                     <NA>
    #> 13   0.63.2 1999-01-11T12:55:50.000000Z                     <NA>
    #> 14   0.63.3 1999-03-05T14:27:14.000000Z                     <NA>
    #> 15     0.64 1999-04-07T13:19:41.000000Z                     <NA>
    #> 16   0.64.1 1999-05-07T13:25:43.000000Z                     <NA>
    #> 17   0.64.2 1999-07-02T12:23:15.000000Z                     <NA>
    #> 18     0.65 1999-08-27T10:29:29.000000Z                     <NA>
    #> 19   0.65.1 1999-10-06T12:13:04.000000Z                     <NA>
    #> 20     0.90 1999-11-22T12:25:14.000000Z                     <NA>
    #> 21   0.90.1 1999-12-15T12:29:07.000000Z                     <NA>
    #> 22     0.99 2000-02-07T11:24:50.000000Z                     <NA>
    #> 23      1.0 2000-02-29T08:55:23.000000Z                     <NA>
    #> 24    1.0.1 2000-04-14T08:44:18.000000Z                     <NA>
    #> 25      1.1 2000-06-15T08:43:21.000000Z                     <NA>
    #> 26    1.1.1 2000-08-15T08:54:18.000000Z                     <NA>
    #> 27      1.2 2000-12-15T10:19:25.000000Z                     <NA>
    #> 28    1.2.1 2001-01-15T10:18:01.000000Z                     <NA>
    #> 29    1.2.2 2001-02-26T12:43:25.000000Z                     <NA>
    #> 30    1.2.3 2001-04-26T11:29:47.000000Z                     <NA>
    #> 31      1.3 2001-06-22T10:41:02.000000Z                     <NA>
    #> 32    1.3.1 2001-08-31T12:45:52.000000Z                     <NA>
    #> 33      1.4 2001-12-19T10:14:54.000000Z                     <NA>
    #> 34    1.4.1 2002-01-30T11:57:35.000000Z                     <NA>
    #> 35    1.5.0 2002-04-29T10:01:26.000000Z                     <NA>
    #> 36    1.5.1 2002-06-17T11:20:33.000000Z                     <NA>
    #> 37    1.6.0 2002-10-01T10:06:31.000000Z                     <NA>
    #> 38    1.6.1 2002-11-01T10:33:17.000000Z                     <NA>
    #> 39    1.6.2 2003-01-10T15:34:34.000000Z                     <NA>
    #> 40    1.7.0 2003-04-16T12:58:07.000000Z                     <NA>
    #> 41    1.7.1 2003-06-16T09:54:39.000000Z                     <NA>
    #> 42    1.8.0 2003-10-08T11:13:59.000000Z                     <NA>
    #> 43    1.8.1 2003-11-21T12:00:21.000000Z                     <NA>
    #> 44    1.9.0 2004-04-12T10:36:38.000000Z                     <NA>
    #> 45    1.9.1 2004-06-21T11:09:39.000000Z                     <NA>
    #> 46    2.0.0 2004-10-04T14:24:38.899055Z                     <NA>
    #> 47    2.0.1 2004-11-15T14:16:30.003793Z                     <NA>
    #> 48    2.1.0 2005-04-18T22:26:33.135566Z                     <NA>
    #> 49    2.1.1 2005-06-20T09:27:13.106513Z                     <NA>
    #> 50    2.2.0 2005-10-06T10:22:14.085752Z                     <NA>
    #> 51    2.2.1 2005-12-20T10:35:21.589612Z                     <NA>
    #> 52    2.3.0 2006-04-24T10:37:20.758200Z                     <NA>
    #> 53    2.3.1 2006-06-01T08:25:33.882724Z                     <NA>
    #> 54    2.4.0 2006-10-03T10:15:04.354469Z                     <NA>
    #> 55    2.4.1 2006-12-18T09:49:23.725060Z                     <NA>
    #> 56    2.5.0 2007-04-24T09:41:43.361786Z                     <NA>
    #> 57    2.5.1 2007-06-28T11:17:06.374019Z                     <NA>
    #> 58    2.6.0 2007-10-03T09:02:53.434461Z                     <NA>
    #> 59    2.6.1 2007-11-26T14:14:04.408327Z                     <NA>
    #> 60    2.6.2 2008-02-08T11:10:05.737877Z                     <NA>
    #> 61    2.7.0 2008-04-22T07:45:29.665494Z                     <NA>
    #> 62    2.7.1 2008-06-23T07:44:32.518990Z                     <NA>
    #> 63    2.7.2 2008-08-25T08:53:56.807981Z                     <NA>
    #> 64    2.8.0 2008-10-20T09:24:01.015723Z                     <NA>
    #> 65    2.8.1 2008-12-22T09:03:17.828643Z                     <NA>
    #> 66    2.9.0 2009-04-17T08:32:48.144754Z                     <NA>
    #> 67    2.9.1 2009-06-26T12:10:57.017685Z                     <NA>
    #> 68    2.9.2 2009-08-24T08:22:34.737538Z                     <NA>
    #> 69   2.10.0 2009-10-26T09:02:22.255015Z                     <NA>
    #> 70   2.10.1 2009-12-14T10:28:24.741988Z                     <NA>
    #> 71   2.11.0 2010-04-22T08:11:21.939620Z                     <NA>
    #> 72   2.11.1 2010-05-31T08:10:25.280185Z                     <NA>
    #> 73   2.12.0 2010-10-15T08:41:57.974589Z                     <NA>
    #> 74   2.12.1 2010-12-16T09:12:04.607865Z                     <NA>
    #> 75   2.12.2 2011-02-25T11:07:19.316500Z                     <NA>
    #> 76   2.13.0 2011-04-13T08:31:27.165034Z                     <NA>
    #> 77   2.13.1 2011-07-08T09:37:08.653178Z                     <NA>
    #> 78   2.13.2 2011-09-30T07:05:56.091789Z                     <NA>
    #> 79   2.14.0 2011-10-31T08:09:09.353781Z            Great Pumpkin
    #> 80   2.14.1 2011-12-22T08:10:18.809127Z      December Snowflakes
    #> 81   2.14.2 2012-02-29T08:10:10.445478Z      Gift-Getting Season
    #> 82   2.15.0 2012-03-30T07:16:05.708046Z            Easter Beagle
    #> 83   2.15.1 2012-06-22T07:09:44.415136Z     Roasted Marshmallows
    #> 84   2.15.2 2012-10-26T07:11:16.605580Z           Trick or Treat
    #> 85   2.15.3 2013-03-01T08:28:29.088755Z         Security Blanket
    #> 86    3.0.0 2013-04-03T07:12:36.801147Z            Masked Marvel
    #> 87    3.0.1 2013-05-16T07:11:33.885209Z               Good Sport
    #> 88    3.0.2 2013-09-25T07:11:09.016418Z          Frisbee Sailing
    #> 89    3.0.3 2014-03-06T08:12:33.995105Z               Warm Puppy
    #> 90    3.1.0 2014-04-10T07:11:10.831155Z             Spring Dance
    #> 91    3.1.1 2014-07-10T07:11:09.316022Z            Sock it to Me
    #> 92    3.1.2 2014-10-31T08:11:32.082768Z           Pumpkin Helmet
    #> 93    3.1.3 2015-03-09T08:12:20.229070Z          Smooth Sidewalk
    #> 94    3.2.0 2015-04-16T07:13:33.144514Z      Full of Ingredients
    #> 95    3.2.1 2015-06-18T07:15:04.589869Z   World-Famous Astronaut
    #> 96    3.2.2 2015-08-14T07:13:18.272871Z              Fire Safety
    #> 97    3.2.3 2015-12-10T08:13:08.415370Z    Wooden Christmas-Tree
    #> 98    3.2.4 2016-03-10T08:15:45.901354Z       Very Secure Dishes
    #> 99    3.2.5 2016-04-14T15:59:38.833914Z Very, Very Secure Dishes
    #> 100   3.3.0 2016-05-03T07:13:28.102867Z   Supposedly Educational
    #> 101   3.3.1 2016-06-21T07:21:38.894907Z         Bug in Your Hair
    #> 102   3.3.2 2016-10-31T08:13:15.868949Z    Sincere Pumpkin Patch
    #> 103   3.3.3 2017-03-06T08:16:31.646592Z            Another Canoe
    #> 104   3.4.0 2017-04-21T07:14:45.366247Z      You Stupid Darkness
    #> 105   3.4.1 2017-06-30T07:04:11.824142Z            Single Candle
    #> 106   3.4.2 2017-09-28T07:04:35.796221Z             Short Summer
    #> 107   3.4.3 2017-11-30T08:05:05.204665Z         Kite-Eating Tree
    #> 108   3.4.4 2018-03-15T08:04:27.234564Z       Someone to Lean On
    #> 109   3.5.0 2018-04-23T07:04:38.341063Z           Joy in Playing
    #> 110   3.5.1 2018-07-02T07:04:31.629927Z            Feather Spray
    #> 111   3.5.2 2018-12-20T08:04:40.536010Z           Eggshell Igloo
    #> 112   3.5.3 2019-03-11T08:04:49.379300Z              Great Truth
    #> 113   3.6.0 2019-04-26T07:05:03.899333Z       Planting of a Tree

## License

MIT © [Gábor Csárdi](http://gaborcsardi.org)
