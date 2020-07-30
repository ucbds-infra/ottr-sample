library(testthat)

test_metadata = "
cases:
- hidden: false
  name: q3a
  points: 1
- hidden: false
  name: q3b
  points: 1
name: q3

"

test_that("q3a", {
  expect_equal(length(names(iris)), 7)
  for (col_name in c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width", "Species")) {
    expect_true(col_name %in% names(iris))
  }
  expect_equal(length(names(iris)[names(iris) %in% iris$Species]), 2)
})

test_that("q3b", {
  expect_equal(length(model$coefficients), 4)
  expect_true("Sepal.Width" %in% names(model$coefficients))
  expect_true("Sepal.Length" %in% colnames(model$model))
  expect_false("Sepal.Length" %in% names(model$coefficients))
})
