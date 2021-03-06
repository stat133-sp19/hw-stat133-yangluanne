% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/main.R
\name{bin_variance}
\alias{bin_variance}
\title{bin_variance}
\usage{
bin_variance(trials, prob)
}
\arguments{
\item{trials}{number of trials; numeric vector}

\item{prob}{probability of success; numeric vector}
}
\value{
the variance of a binomial distribution when given trials and prob
}
\description{
summary measure for finding variance of a binomial distribution
}
\examples{
bin_variance(10, 0.3)
}
