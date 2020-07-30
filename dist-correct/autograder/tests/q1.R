library(testthat)

test_metadata = "
cases:
- hidden: false
  name: q1a
  points: 1
- hidden: true
  name: q1b
  points: 1
name: q1

"

test_that("q1a", {
  expect_true(ans.1 > 1)
  expect_true(ans.1 < 2)
})

test_that("q1b", {
  tol = 1e-5
  actual_answer = 1.27324
  expect_true(ans.1 > actual_answer - tol)
  expect_true(ans.1 < actual_answer + tol)
})
