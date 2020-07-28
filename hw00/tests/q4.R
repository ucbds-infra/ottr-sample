library(testthat)
library(dplyr)

test_metadata = "
name: q4
cases:
  - name: q4a
    hidden: false
    points: 1
  - name: q4b
    hidden: false
    points: 1
"

test_that("q4a", {
  expect_equal(length(model$coefficients), 3)
  expect_true("father" %in% names(model$coefficients))
  expect_true("mother" %in% names(model$coefficients))
})

test_that("q4b", {
  tol = 1e-5
  actual_values = c(22.6432797, 0.3682823, 0.2905100)
  coeffs = model$coefficients[c("(Intercept)", "father", "mother")]
  for (i in 1:3) {
    expect_true(coeffs[i] > actual_values[i] - tol)
    expect_true(coeffs[i] < actual_values[i] + tol)
  }
})
