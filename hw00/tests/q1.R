library(testthat)

test_metadata = "
name: q1
cases:
  - name: q1a
    hidden: false
    points: 1
  - name: q1b
    hidden: true
    points: 1
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
