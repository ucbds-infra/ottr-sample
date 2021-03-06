library(testthat)

test_metadata = "
name: q2
cases:
  - name: q2a
    hidden: false
    points: 1
  - name: q2b
    hidden: false
    points: 1
  - name: q2c
    hidden: true
    points: 1
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
