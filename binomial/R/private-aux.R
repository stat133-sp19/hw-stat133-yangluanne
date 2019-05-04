# return the mean when given trials and prob
aux_mean <- function(trials, prob) {
  return(trials * prob)
}

# return the variance when given trails and prob
aux_variance <- function(trials, prob) {
  return(trials * prob * (1 - prob))
}

# measures the most likely number of success in a number of trials with probability prob
aux_mode <- function(trials, prob) {
  m <-  trials * prob + prob
  mod <- c()
  for (ele in m) {
    if (as.integer(ele) == ele) {
      mod <- c(mod, c(ele, ele-1))
    } else {
      mod <- c(mod, as.integer(ele))
    }
  }
  return(mod)
}

# measure the asymmetry of the probability distribution of a random variable about its mean
aux_skewness <- function(trials, prob) {
  return((1 - 2 * prob) / ((trials * prob * (1 - prob)) ** 0.5))
}

# measures the "tailedness" of the probability distribution of a random variable
aux_kurtosis <- function(trials, prob) {
  return((1 - 6 * prob * (1 - prob)) / (trials * prob * (1 - prob)))
}


