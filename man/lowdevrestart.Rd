% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lowdevrestart.R
\name{lowdevrestart}
\alias{lowdevrestart}
\title{Create new initials based on the initials of the chain with the lowest deviance}
\usage{
lowdevrestart(saved_state, vary_by = 10)
}
\arguments{
\item{saved_state}{saved initials object from the keepvars function}

\item{vary_by}{the factor you want your new chains to vary around the lowest deviance chain}
}
\value{
new saved_state object of length three, where the second element is your new initials list
}
\description{
Function to the chain number with the lowest deviance.
}
