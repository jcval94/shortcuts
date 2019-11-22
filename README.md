
<!-- README.md is generated from README.Rmd. Please edit that file -->

# shortcuts

<!-- badges: start -->

<!-- badges: end -->

The goal of shortcuts is to accelerate code writting in R via addins.

## Installation

You can install the released version of shortcuts from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("shortcuts")
# or
remotes::install_git("https://github.com/jcval94/shortcuts.git")
```

## Examples

### shortcuts

This is a basic example which shows you how to solve a common problem:

First, it is necessary to copy a table using Ctrl + C directly from your
browser, excel, google sheets, etc.

<https://en.wikipedia.org/wiki/Standard_normal_table>

``` r
library(shortcuts)
#> Loading required package: rstudioapi
## Not run
# shortcuts()
```

Now press Copy Paste in Addins menu

Check your data with new\_df

``` r
#>x

#      z  X.0.00  X.0.01  X.0.02  X.0.03  X.0.04  X.0.05
# 1  0.0 0.00000 0.00399 0.00798 0.01197 0.01595 0.01994
# 2  0.1 0.03983 0.04380 0.04776 0.05172 0.05567 0.05962
# 3  0.2 0.07926 0.08317 0.08706 0.09095 0.09483 0.09871
# 4  0.3 0.11791 0.12172 0.12552 0.12930 0.13307 0.13683
# 5  0.4 0.15542 0.15910 0.16276 0.16640 0.17003 0.17364
# 6  0.5 0.19146 0.19497 0.19847 0.20194 0.20540 0.20884
# 7  0.6 0.22575 0.22907 0.23237 0.23565 0.23891 0.24215
# 8  0.7 0.25804 0.26115 0.26424 0.26730 0.27035 0.27337
# 9  0.8 0.28814 0.29103 0.29389 0.29673 0.29955 0.30234
# 10 0.9 0.31594 0.31859 0.32121 0.32381 0.32639 0.32894
#     X.0.06  X.0.07  X.0.08  X.0.09
# 1  0.02392 0.02790 0.03188 0.03586
# 2  0.06356 0.06749 0.07142 0.07535
# 3  0.10257 0.10642 0.11026 0.11409
# 4  0.14058 0.14431 0.14803 0.15173
# 5  0.17724 0.18082 0.18439 0.18793
# 6  0.21226 0.21566 0.21904 0.22240
# 7  0.24537 0.24857 0.25175 0.25490
# 8  0.27637 0.27935 0.28230 0.28524
# 9  0.30511 0.30785 0.31057 0.31327
# 10 0.33147 0.33398 0.33646 0.33891
```

### r.args

Furthermore, r.args function returns all the arguments of a function in
the next line of code

Select text string of a function in the R Script and run:

``` r

# r.args()
# 
# rnorm(n=32)
# n=32;mean=0;sd=1
# 
# rnorm(n=32.3)
# n=32.3;mean=0;sd=1
# 
# rnorm(n=1+1)
# n=1+1;mean=0;sd=1
#
```

### libraries

Finally, libraries() function run all libraries written in a R Script
(and installs the package if it does not exist)

``` r
# libraries()
# 
# library(stats)
```

Also you can use Addins to create a shortcut and be faster
