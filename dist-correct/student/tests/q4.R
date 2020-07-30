library(testthat)

test_metadata = "
cases:
- hidden: false
  name: q4a
  points: 1
name: q4

"

test_that("q4a", {
  expect_equal(length(model$coefficients), 3)
  expect_true("father" %in% names(model$coefficients))
  expect_true("mother" %in% names(model$coefficients))
})
