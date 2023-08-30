# coda4dummies
Functions to summarize inconvenient rjags coda outputs. Especially helpful when your coda summary contains timeseries variables of different lengths (e.g., when calculating uncertainties for variables at daily, weekly, and seasonal timescales within the same model framework).

To install the package add the following code to your R script:

install.packages("devtools")
library(devtools)
devtools::install_github("egreich/coda4dummies")
library(postjags)
