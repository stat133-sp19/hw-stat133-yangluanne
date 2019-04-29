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
