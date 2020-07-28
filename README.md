# Ottr Sample Repo

This repository contains three example assignments to demonstrate how to use Otter-Grader's R autograder ottr. Each of the folders contains the solutions and tests for a single assignment in different formats: R script, Rmd file, and Jupyter notebook. The workflow for each assignment is the same.

## Installation

To use ottr, you need to install the package using `devtools::install_github`:

```r
devtools::install_github("ucbds-infra/ottr@0.0.1.b1")
```

To create the grading configurations for Gradescope, you will need the Python package for Otter installed. This functionality is currently only supported by one branch on GitHub, so you will need to install from git:

```console
pip install git+https://github.com/ucbds-infra/otter-grader.git@ottr
```

## Running the Assignments

Each assignment is actually the same; all that varies is the file type. To run `hw00` and `hw01`, open the `.Rproj` files in Rstudio and execute the files. **Using the `.Rproj` files is important** because the paths in these files are relative and not absolute, as this is required for grading in the Gradescope containers. To run `hw02`, spin up a Jupyter notebook server or pull this repo into a JupyterHub using nbgitpuller.

## Building the Autogrder

To build the autograder, use the `otter` command-line utility. In your terminal, `cd` into one of the `hw0*` directories and run the following:

```console
otter generate autograder -l r -r requirements.R data
```

This will create a zip file in that directory called `autograder.zip` which you can upload to Gradescope to build the autograder. Then test the autograder by uploading _any_ of the solutions files (`hw00.R`, `hw01.Rmd`, or `hw02.ipynb`) to the assignment. _Regardless of which directory you generate the zip file from, the any solution file format should work_ as the Gradescope autograder is agnostic of file type.

**Please try changing various combinations of answers in each file type** to verify that the scores are correct for different possible answers.

## Using Ottr for Other Assignments

To use ottr for your own assignments, you'll want to start by writing an assignment and test files like those found in the `hw0*/tests` directories. When writing checks in assignments, `ottr::check` _must_ be called in that format or else Gradescope won't be able to collect the results properly. To make the output look nice, ottr check call's by convention have the form

```r
. = ottr::check("relative/path/to/test/file")
```

The fact that the path is relative is **important** because the working directory when grading will be the directory containing the student's submission. Therefore, **all paths in the assignment should be relative to the directory containing the assignment file**.

Test files rely on the [testthat](https://testthat.r-lib.org/) library to run tests. A test passes if there is no failure in a call to `testthat::test_that`.

* All test files need to define a global variable `test_metadata` that is a YAML-formatted string provided metadata for each `test_that` call in the file.
* Calls to `test_that` should have their first argument (the identifier string) match the name of a case in `test_metadata[cases]`.
* Cases can be hidden to students on Gradescope by setting `cases[][hidden]` to `true`.
* Each individual test case has _its own_ point value. This is a notable difference from the OK-format, which has a single point value for the entire test file.

Next, define an R requirements file that uses functions like `install.packages` or `devtools::install_github` to install any requirements needed for executing students' code or grading. We'll call this file `requirements.R`. 

Finally, gather any support files (e.g. data files) needed to grading. For this example, we'll say that everything needed is in a subdirectory called `data`.

Gather all of these files into a directory structure mirroring the `hw0*` directories:

```
| some_assignment
  | - requirements.R
  | data
    | - data.csv
    ...
  | tests
    | - q1.R
    ...
```

To generate the Gradescope zip file, `cd` into your assignment directory and run the following:

```console
otter generate autograder -l r -r requirements.R data
```

This command does a few things:

* Otter automatically finds `./tests` as the tests directory and includes that for you.
* `-l r` tells Otter that the language being used in this assignment is R, as opposed to the default Python.
* `-r requirements.R` tells Otter that we have a requirements file at `requirements.R`.
* `data` tells Otter to include the `data` directory in the autograder as a support file.

The usage of [Otter Generate](https://otter-grader.readthedocs.io/en/beta/otter_generate.html) is the same as normal with the exception of the additional `-l r` flag. Otter handles the rest once you tell it that it's going to be grading R files rather than Python files.

The last thing to do is upload your zip file to Gradescope and start grading!
