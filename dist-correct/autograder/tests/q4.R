library(testthat)

test_metadata = "
cases:
- hidden: false
  name: q4a
  points: 1
- hidden: true
  name: q4b
  points: 1
name: q4

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
