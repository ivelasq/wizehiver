
<!-- README.md is generated from README.Rmd. Please edit that file -->
wizehiver <img src= "https://image.ibb.co/bvfcUT/Webp_net_resizeimage.png" align = "right" />
=============================================================================================

[![Travis-CI Build Status](https://travis-ci.org/ivelasq/wizehiver.svg?branch=master)](https://travis-ci.org/ivelasq/wizehiver) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/ivelasq/wizehiver?branch=master&svg=true)](https://ci.appveyor.com/project/ivelasq/wizehiver) [![Coverage Status](https://img.shields.io/codecov/c/github/ivelasq/wizehiver/master.svg)](https://codecov.io/github/ivelasq/wizehiver?branch=master) [![CRAN status](https://www.r-pkg.org/badges/version/wizehiver)](https://cran.r-project.org/package=wizehiver) [![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

wizehive is currently a **work in progress**.

The Zengine API, created by WizeHive, is a cloud-based platform that can organize the collection, review, and management of data and applications for grants and other business processes. The goal of wizehiver is to build functionality to:

1.  Input and manage Zengine RESTful API tokens
2.  Get available API resources
3.  Process API response content into analysis-ready tibbles

The wizehiver package has no relationship or affiliation with, sponsorship, or endorsement by WizeHive.

Installation
------------

You can install the development version of wizehiver from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("ivelasq/wizehiver")
```

Setup
-----

### Get and store the API key

Generate a Zengine API personal access token from your [Zengine account page](https://platform.zenginehq.com/account/developer).

wizehiver functions will read your Zengine API personal access token from the environment variable `ZENGINE_PAT` stored in `.Renviron`.

To verify your access token is stored in `.Renviron`, use function `get_token()`. If `ZENGINE_PAT` is not stored in `.Renviron`, you will be prompted to edit it. You can also edit `.Renviron` by calling the function `set_token()` directly.

------------------------------------------------------------------------

Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.
