
<!-- README.md is generated from README.Rmd. Please edit that file -->

# wizehiver <img src='man/figures/logo.png' align="right" height="150" />

[![Codecov test
coverage](https://codecov.io/gh/ivelasq/wizehiver/branch/master/graph/badge.svg)](https://codecov.io/gh/ivelasq/wizehiver?branch=master)
[![CRAN
status](https://www.r-pkg.org/badges/version/wizehiver)](https://cran.r-project.org/package=wizehiver)
[![R-CMD-check](https://github.com/ivelasq/wizehiver/workflows/R-CMD-check/badge.svg)](https://github.com/ivelasq/wizehiver/actions)
[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

wizehiver is currently a **work in progress**.

The Zengine API, created by WizeHive, is a cloud-based platform that can
organize the collection, review, and management of data and applications
for grants and other business processes. The goal of wizehiver is to
build functionality to:

1.  Input and manage Zengine RESTful API tokens
2.  Get available API resources
3.  Process API response content into analysis-ready tibbles

The wizehiver package has no relationship or affiliation with,
sponsorship, or endorsement by WizeHive.

## Installation

You can install the development version of wizehiver from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("ivelasq/wizehiver")
```

## Setup

### Get and store the API key

Generate a Zengine API personal access token from your [Zengine account
page](https://platform.zenginehq.com/account/developer).

wizehiver functions will read your Zengine API personal access token or
key from the environment variable `ZENGINE_PAT` stored in `.Renviron`.

If `ZENGINE_PAT` is not stored in `.Renviron`, you will be prompted to
edit it. You can also edit `.Renviron` by calling the function
`set_token()` or `set_key()` directly.

To verify your access token or key is stored in `.Renviron`, use
function `get_token()` or `get_key()`.

## Usage

### Get massive Zengine API JSON response

To obtain the Zengine API data, use `get_zen()`. Common choices include
“forms” and “workspaces”. A full list of resources is available
[here](https://zenginehq.github.io/developers/rest-api/resources/).

<p align="center">
<img src="https://media.giphy.com/media/pkzecz3ucmVaw/giphy.gif" alt="zen_gif">
</p>

------------------------------------------------------------------------

Please note that this project is released with a [Contributor Code of
Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree
to abide by its terms.
