library(testthat)
library(dplyr)

test_metadata = "
name: q3
cases:
  - name: q3a
    hidden: false
    points: 1
  - name: q3b
    hidden: false
    points: 1
  - name: q3c
    hidden: true
    points: 1
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

test_that("q3c", {
  for (col_name in names(iris)) {
    if (!(col_name %in% c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width", "Species"))) {
      expect_equal(sum(iris[, col_name]), 50)
    }
  }
  if ("setosa" %in% names(iris)) {
    setosas = iris %>% filter(setosa == 1)
    expect_equal(mean(setosas$Petal.Length), 1.462)
  }
  if ("versicolors" %in% names(iris)) {
    versicolors = iris %>% filter(versicolor == 1)
    expect_equal(mean(versicolors$Petal.Length), 4.26)
  }
})
