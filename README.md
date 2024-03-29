# Ottr Sample Repo

This repository contains three example assignments to demonstrate how to use [Otter-Grader](https://github.com/ucbds-infra/otter-grader)'s R autograder ottr. This repo contains a master notebook and Rmd file for the same assignment. The workflow for each assignment is the same.

## Installation

To use ottr, you need to install the package using `devtools::install_github`:

```r
devtools::install_github("ucbds-infra/ottr@stable")
```

This will install the most recent stable release of ottr.

To create the grading configurations for Gradescope, you will need the Python package for Otter installed.

```console
pip install otter-grader
```

## Using Ottr with Otter Assign

### R Jupyter Notebooks

Otter Assign is compatible with creating R Jupyter notebooks. The format is very similar to the regular assign format, and an example notebook is provided in `hw01.ipynb`.

To use Otter Assign, run

```console
otter assign hw01.ipynb dist
```

All configurations are taken care of in the assignment configuration in the notebook. We don't need to specify the `-l r` flag because Otter Assign will use the kernel information in the notebook to auto-detect the language of the assignment.

Look through the files in the new `dist` directory. Otter Assign was also configured to generate an autograder configuration zip file, so you can also check that that works by grading the solutions notebook [locally](https://otter-grader.readthedocs.io/en/latest/workflow/executing_submissions/otter_grade.html) or on Gradescope.

You can find more information about the Otter Assign format for notebooks (both Python and R) [here](https://otter-grader.readthedocs.io/en/latest/otter_assign/notebook_format.html).

### Rmd Documents

Otter Assign is compatible with Rmd files as well. The `hw01.Rmd` file contains the same assignment as `hw01.ipynb` but as an Rmd document. Using Otter Assign with Rmd files is the same as normal Otter Assign:

```console
otter assign hw01.Rmd dist
```

Take a look at the Rmd file to see what the format is like. Solution removal behaviors are the same as Otter Assign for Juptyer Notebooks as is the question metadata format.

You can find more information about the Otter Assign formats for R markdown [here](https://otter-grader.readthedocs.io/en/latest/otter_assign/rmd_format.html).

## Running the Assignments

After running Otter Assign, you'll end up with two versions of the notebook: one with solutions and one without solutions. You can play around with executing these and changing the code in each to see how the tests pass and fail.

## Using Ottr for Other Assignments

To use ottr for your own assignments, you'll want to start by writing an assignment and test files like those found in the `dist/*` directories. Use the `ottr::check` function to run your test case files against the current R environment:

```r
. = ottr::check("relative/path/to/test/file")
```

The fact that the path is relative is **important** because the working directory when grading will be the directory containing the student's submission. Therefore, **all paths in the assignment should be relative to the directory containing the assignment file**.

Test cases rely on error throwing. If a test case throws an error, it fails; if it throws no errors, it passes.

You can find more information about the R test file format [here](https://otter-grader.readthedocs.io/en/latest/test_files/r_format.html).

Once you have these components, you can use Otter Assign to generate your result directories, or just use [Otter Generate](https://otter-grader.readthedocs.io/en/latest/workflow/otter_generate/index.html) to create a zip file you can use to grade assignments.
