library(testthat)

test_metadata = "
cases:
- hidden: false
  name: q1a
  points: 1
name: q1

"

test_that("q1a", {
  expect_true(ans.1 > 1)
  expect_true(ans.1 < 2)
})
