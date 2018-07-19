context("test-unnest_wide.R")

test_that("unnest_wide works", {
  input_df <- tibble::tribble(
    ~v1,     ~v2,                      ~v3, ~v4,
    "one",   c("four", "five", "six"), 3,   4L,
    "two",   NA_character_,            2,   c(6L, 5L, 4L),
    "three", "five",                   1,   5L
  )
  output_df <- tibble::tribble(
    ~v1,     ~v3, ~v2_1,         ~v2_2,         ~v2_3,         ~v4_1,       ~v4_2,       ~v4_3,
    "one",   3,   "four",        "five",        "six",         4L,          NA_integer_, NA_integer_,
    "two",   2,   NA_character_, NA_character_, NA_character_, 4L,          6L,          5L,
    "three", 1,   NA_character_, "five",        NA_character_, NA_integer_, NA_integer_, 5L
  )
  expect_equal(unnest_wide(input_df), output_df)
})
