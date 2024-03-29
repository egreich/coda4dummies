% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dumsum.R
\name{dumsum}
\alias{dumsum}
\title{Organize jagsUI output as a dataframe}
\usage{
dumsum(jagsobj, type, col.names = NULL)
}
\arguments{
\item{jagsobj}{jagsUI or rjags object}

\item{type}{rjags or jagsUI. Indicates what object type jagsobj is}

\item{col.names}{Optional. Takes a list of column names you want your ID columns labeled as. Default is ID1, ID2, etc.}
}
\value{
A data frame of columns for posterior means, 2.5 \%, and 97.5 CI quantiles for each variable
}
\description{
Function to extract posterior means, and 2.5 and 97.5 CI quantiles from jags coda output.
It takes a list of variable names and the coda summary.
All variables in the list MUST have the same length posterior outputs.
}
