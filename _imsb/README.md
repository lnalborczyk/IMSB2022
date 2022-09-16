
<!-- README.md is generated from README.Rmd. Please edit that file -->

# IMSB

<!-- badges: start -->

![](https://img.shields.io/badge/version-1.0.0.9000-FFA70B.svg)
<!-- badges: end -->

The goal of the `imsb` package is to provide all the materials (e.g.,
data, utility functions) needed for the [IMSB
course](https://www.barelysignificant.com/IMSB2022/).

## Installation

You can install the development version of `imsb` from GitHub with:

``` r
install.packages("remotes")
remotes::install_github(repo = "lnalborczyk/IMSB2022/_imsb", dependencies = TRUE)
```

## Usage

Checking the packages install.

``` r
library(imsb)
check_install()
```

Opening the slides of the first course in browser.

``` r
open_slides(cours = 01)
```

Loading the `robot` data.

``` r
data(robot)
```
