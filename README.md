# duckdbneo

<!-- badges: start -->
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

The overarching goal of duckdbneo is to rethink how duckdb is installed and used in R.

## Installation

You can install the development version of duckdbneo like so:

``` r
# install.packages("pak", repos = sprintf("https://r-lib.github.io/p/pak/stable/%s/%s/%s", .Platform$pkgType, R.Version()$os, R.Version()$arch))
pak::pak("krlmlr/duckdbneo")
```

## Goals

- No use of C++ API, only the [C API](https://duckdb.org/docs/api/c/api) of duckdb is used
- Use ADBC and the [adbi R package](https://adbi.r-dbi.org/) to implement DBI
- Expose R wrappers for the C API
    - Autogenerated bindings from a [JSON API spec](https://github.com/duckdb/duckdb/pull/12682)
    - Hand-written user interface for convenience, based on the autogenerated bindings, with support for ALTREP and [duckplyr](https://duckdblabs.github.io/duckplyr/)

## Non-goals

- Implement a full DBI interface
- Implement a full dplyr interface
- Extend duckdb
- Improve interoperability with other R packages
