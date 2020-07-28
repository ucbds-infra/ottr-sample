# Ottr Sample Repo

This repository contains three example assignments to demonstrate how to use Otter-Grader's R autograder ottr. Each of the folders contains the solutions and tests for a single assignment in different formats: R script, Rmd file, and Jupyter notebook. The workflow for each assignment is the same.

## Installation

To use ottr, you need to install the package using `devtools::install_github`:

```r
devtools::install_github("ucbds-infra/ottr")
```

To create the grading configurations for Gradescope, you will need the Python package for Otter installed. This functionality is currently only supported by the beta release, so you need to explicity specify a version.

```console
pip install otter-grader==1.0.0.b7
```

## Running the Assignments

Each assignment is actually the same; all that varies is the file type. To run `hw00` and `hw01`, open the `.Rproj` files in Rstudio and execute the files. **Using the `.Rproj` files is important** because the paths in these files are relative and not absolute, as this is required for grading in the Gradescope containers. To run `hw02`, spin up a Jupyter notebook server or pull this repo into a JupyterHub using nbgitpuller.

## Building the Autogrder

To build the autograder, use the `otter` command-line utility. In your terminal, `cd` into one of the `hw0*` directories and run the following:

```console
otter generate autograder -r requirements.R data
```

This will create a zip file in that directory called `autograder.zip` which you can upload to Gradescope to build the autograder. Then test the autograder by uploading _any_ of the solutions files (`hw00.R`, `hw01.Rmd`, or `hw02.ipynb`) to the assignment. _Regardless of which directory you generate the zip file from, the any solution file format should work_ as the Gradescope autograder is agnostic of file type.
