library(testthat)

test_metadata = "
cases:
- hidden: false
  name: q2a
  points: 1
- hidden: false
  name: q2b
  points: 1
- hidden: true
  name: q2c
  points: 1
name: q2

"

test_that("q2a", {
  expect_equal(nrow(iris), 150)
  expect_equal(length(names(iris)), 5)
  for (col_name in c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width", "Species")) {
    expect_true(col_name %in% names(iris))
  }
})

test_that("q2b", {
  expect_equal(nrow(setosas), 50)
  expect_equal(length(unique(setosas$Species)), 1)
})

test_that("q2c", {
  expect_equal(length(unique(iris$Species)), 3)
  expect_equal(iris[1, "Sepal.Length"], 5.1)
})
