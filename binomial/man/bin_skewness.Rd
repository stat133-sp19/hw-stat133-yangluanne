% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/main.R
\name{bin_skewness}
\alias{bin_skewness}
\title{bin_skewness}
\usage{
bin_skewness(trials, prob)
}
\arguments{
\item{trials}{number of trials; numeric vector}

\item{prob}{probability of success; numeric vector}
}
\value{
the skewness of a binomial distribution when given trials and prob
}
\description{
summary measure for finding skewness of a binomial distribution
}
\examples{
bin_skewness(10, 0.3)
}
