## Overview

The `"binomial"` package provides functions for calulating the properties of the binomial random variable, including probabilities, probability distribution, expected value, variance, etc.

## Motivation

The purpose of this workout is create an R package.

## Usage

``` r
library(binomial)

# binomial random variable
X <- bin_variable(trials = 5, prob = 0.5)
X

# binomial probability
bin_probability(success = 2, trials = 5, prob = 0.5)

# binomial distribution
dist <- bin_distributions(trials = 5, prob = 0.5)
dist

# binomial ditribution plot
plot(dist)

# binomial cumulative distribution
cumu <- bin_cumulative(trials = 5, prob = 0.5)
cumu

# binomial cumulative distribution plot
plot(cumu)

# binomial random variable summary statistics
summary(X)

# summary measures
bin_mean(5, 0.5)
bin_variance(5, 0.5)
bin_mode(5, 0.5)
bin_skewness(5, 0.5)
bin_kurtosis(5, 0.5)

```
