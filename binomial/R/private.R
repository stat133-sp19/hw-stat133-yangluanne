# private function to check input is a valid probability value
check_prob <- function(prob) {
  if (prob < 0 | prob > 1) {
    stop('invalid prob value')
  } else {
    return(TRUE)
  }
}

# private function to check that the input is a valid value for number of trials
check_trials <- function(trials) {
  if (trials < 0) {
    stop('invalid trials value')
  } else {
    return(TRUE)
  }
}

# test if an input success is a valid value for number of successes
check_success <- function(success, trials) {
  check_trials(trials)
  if (!is.numeric(success) | length(success) < 1) {
    stop("invalid success value")
  } else if (any(trials < success)) {
    stop("success cannot be greater than trials")
  } else {
    return(TRUE)
  }
}

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
  if (m %% 1 == 0) {
    return(m)
    return(m - 1)
  } else {
    return(round(m, digits = 0))
  }
}

# measure the asymmetry of the probability distribution of a random variable about its mean
aux_skewness <- function(trials, prob) {
  return((1 - 2 * prob) / ((trials * prob * (1 - prob)) ** 0.5))
}

# measures the "tailedness" of the probability distribution of a random variable
aux_kurtosis <- function(trials, prob) {
  return((1 - 6 * prob * (1 - prob)) / (trials * prob * (1 - prob)))
}

