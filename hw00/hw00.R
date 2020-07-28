# ottr sample repo: hw00
# this assumes you have already installed ottr from the repo

library(datasets)
library(dplyr)
library(readr)

# Question 1: Find the radius of a circle that has a 90 deg. arc of length 2. Assign this value to
# `ans.1`

ans.1 <- 2 * 2 * pi * 2 / pi / pi / 2

. = ottr::check("tests/q1.R")

# Question 2: Load the iris dataset. Use dplyr's `filter` function to create `setosas` as the subset
# of `iris` containing only setosas.

data(iris)
setosas <- iris %>% filter(Species == "setosa")

. = ottr::check("tests/q2.R")

# Question 3: Using the iris dataset, create two indicator variables for the iris species and then 
# create a linear regression model regressing sepal length on sepal width and the species dummy
# variables.

iris$setosa = iris$Species == "setosa"
iris$versicolor = iris$Species == "versicolor"
model = lm(Sepal.Length ~ Sepal.Width + setosa + versicolor, data=iris)

. = ottr::check("tests/q3.R")

# Question 4: Use dplyr to load `data/galton.csv`. Create a linear regression model of child height
# on father and mother height.

galton = read_csv("data/galton.csv")
model = lm(childHeight ~ mother + father, data=galton)

. = ottr::check("tests/q4.R")
