context("test-get-zen.R")

test_that("get_zen() stops when id is NULL and record is not NULL", {
  expect_error(get_zen("forms", id = NULL, record = "42"))
})
