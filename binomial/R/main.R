#library(ggplot2)

#' @title bin_choose
#' @param n number of trials; a numeric vector
#' @param k number of successes out of the number of trials; a numeric vector
#' @return the number of combinantions in which k successes can occur in n trials
#' @export
#' @examples
#' bin_choose(n = 5, k = 2)
#'
#' bin_choose(5, 0)
#'
#' bin_choose(5, 1:3)
bin_choose <- function(n, k) {
  if (any(k > n)) {
    stop('k cannot be greater than n')
  } else {
    return(factorial(n) / (factorial(k) * factorial(n - k)))
  }
}

#' @title bin_probability
#' @description takes in three arguments and caculates the binomial probability of k successes in n trials given p probability
#' @param success number of successes out of the trials; numeric vector
#' @param trials number of trials; numeric vector
#' @param prob probability of success; numberic vector
#'
#' @return binomial probability of k successes in n trials given p probability
#' @export
#'
#' @examples
#' bin_probability(2, 5, 0.5)
#'
#' bin_probability(success = 0:2, trials = 5, prob = 0.5)
#'
#' bin_probability(success = 55, trials = 100, prob = 0.45)
bin_probability <- function(success, trials, prob) {
  check_trials(trials)
  check_prob(prob)
  check_success(success, trials)
  return(bin_choose(trials, success) * (prob ** success) * ((1 - prob) ** (trials - success)))
}

#' @title bin_distribution
#' @description caculates the probability distribution of success out of a given number trials with a given probability
#' @param trials number of trials; numeric vector
#' @param prob probability of success; numberic vector
#'
#' @return return a data frame with the probability distribution: sucesses in the first column, probability in the second column
#' @export
#'
#' @examples
#' bin_distribution(trials = 5, prob = 0.5)
#'
#' X <- bin_distribution(5, 0.5)
#'
#' plot(X)
bin_distribution <- function(trials, prob) {
  data <- data.frame(
    success = 0:trials,
    probability = bin_probability(0:trials, trials, prob)
  )
  class(data) <- c('bindis', 'data.frame')
  return(data)
}

#' @export
plot.bindis <- function(x, ...) {
  return(ggplot2::ggplot(x, ggplot2::aes(x = x$success, y = x$probability)) +
           ggplot2::geom_bar(stat = 'identity') +
           ggplot2::ggtitle('Probability Distribution') + ggplot2::ylab('Probability') + ggplot2::xlab('Success'))
}

# barplot(x$Success, x$probability, names.arg = x$Success,
#         main = 'Probability Distribution'),
# xlab = 'Success', ylab = 'Probability')

#' @title bin_cumulative
#' @description caculates the cumulated probability for each additional trial
#' @param trials number of trials; numeric vector
#' @param prob probability of success; numberic vector
#'
#' @return a data frame with both the probability distribution and the cumulative probabilities: sucesses in the first column, probability in the second column, and cumulative in the third column
#' @export
#'
#' @examples
#' X <- bin_cumulative(trials = 5, prob = 0.5)
#' plot(X)
bin_cumulative <- function(trials, prob) {
  prob_dist <- bin_probability(0:trials, trials, prob)
  data <- data.frame(
    success = 0:trials,
    probability = prob_dist,
    cumulative = cumsum(prob_dist)
  )

  class(data) <- c('bincum', 'data.frame')
  return(data)
}

#' @export
plot.bincum <- function(x, ...) {
  return(ggplot2::ggplot(x, ggplot2::aes(x$success, x$cumulative)) + ggplot2::geom_point()
         + ggplot2::geom_line() + ggplot2::xlab('Success') + ggplot2::ylab('Probability'))
}


# plot(x$success, x$cumulative, pch = 19, type = 'b',
#      xlab = 'Success', ylab = 'Probability')

#' @title bin_variable
#' @description an object of class "binvar", that is, a binomial random variable object
#' @param trials number of trials; numeric vector
#' @param prob probability of success; numberic vector
#'
#' @return a list with named elements: trials (a number of trials) and prob (probability of success)
#' @export
#'
#' @examples
#' var <- bin_variable(trials = 5, prob = 0.5)
#'
#' summary(var)
bin_variable <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  lst <- list(trials = trials,
              prob = prob)

  class(lst) <- c('binvar')
  lst
}

#' @export
print.binvar <- function(x, ...) {
  cat('"Binomial variable" \n\n')

  cat('Parameters\n')
  cat('- number of trials:', x$trials, '\n')
  cat('- prob of success:', x$prob)
  invisible(x)
}

#' @export
summary.binvar <- function(object, ...) {
  lst <- list(trials = object$trials,
              prob = object$prob,
              mean = aux_mean(object$trials, object$prob),
              variance = aux_variance(object$trials, object$prob),
              mode = aux_mode(object$trials, object$prob),
              skewness = aux_skewness(object$trials, object$prob),
              kurtosis = aux_kurtosis(object$trials, object$prob))
  class(lst) <- 'summary.binvar'
  lst
}

#' @export
print.summary.binvar <- function(x, ...) {
  cat('"Summary Binomial" \n\n')
  cat('Parameters \n')
  cat('- number of trials:', x$trials, '\n')
  cat('- prob of success:', x$prob, '\n\n')
  cat('Measures \n')
  cat('- mean    :', x$mean, '\n')
  cat('- variance:', x$variance, '\n')
  cat('- mode    :', x$mode, '\n')
  cat('- skewness:', x$skewness, '\n')
  cat('- kurtosis:', x$kurtosis)
  invisible(x)
}

#' @title bin_mean
#' @description summary measure for finding mean of a binomial distribution
#' @param trials number of trials; numeric vector
#' @param prob probability of success; numberic vector
#' @return the mean of a binomial distribution when given trials and prob
#' @export
#' @examples
#' bin_mean(10, 0.3)
bin_mean <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_mean(trials, prob))
}

#' @title bin_variance
#' @description summary measure for finding variance of a binomial distribution
#' @param trials number of trials; numeric vector
#' @param prob probability of success; numberic vector
#' @return the variance of a binomial distribution when given trials and prob
#' @export
#' @examples
#' bin_variance(10, 0.3)
bin_variance <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_variance(trials, prob))
}

#' @title bin_mode
#' @description summary measure for finding mode of a binomial distribution
#' @param trials number of trials; numeric vector
#' @param prob probability of success; numberic vector
#' @return the mode of a binomial distribution when given trials and prob
#' @export
#' @examples
#' bin_mode(10, 0.3)
bin_mode <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_mode(trials, prob))
}

#' @title bin_skewness
#' @description summary measure for finding skewness of a binomial distribution
#' @param trials number of trials; numeric vector
#' @param prob probability of success; numberic vector
#' @return the skewness of a binomial distribution when given trials and prob
#' @export
#' @examples
#' bin_skewness(10, 0.3)
bin_skewness <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_skewness(trials, prob))
}

#' @title bin_kurtosis
#' @description summary measure for finding kurtosis of a binomial distribution
#' @param trials number of trials; numeric vector
#' @param prob probability of success; numberic vector
#' @return the kurtosis of a binomial distribution when given trials and prob
#' @export
#' @examples
#' bin_kurtosis(10, 0.3)
bin_kurtosis <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_kurtosis(trials, prob))
}
