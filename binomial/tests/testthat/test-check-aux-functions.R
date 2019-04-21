source('../../R/private.R')

context("Test Private Auxiliary Functions")

test_that("aux_mean works as expected", {
  expect_equal(aux_mean(10, 0.3), 3)
  expect_type(aux_mean(10, 0.3), 'double')
  expect_length(aux_mean(10, 0.3), 1)
})

test_that("aux_variance works as expected", {
  expect_equal(aux_variance(10, 0.3), 2.1)
  expect_type(aux_variance(10, 0.3), 'double')
  expect_length(aux_variance(10, 0.3), 1)
})

test_that("aux_mode works as expected", {
  expect_equal(aux_mode(10, 0.3), 3)
  expect_type(aux_variance(10, 0.3), 'double')
  expect_length(aux_variance(10, 0.3), 1)
})

test_that('aux_skewness works as expected', {
  expect_equal(round(aux_skewness(10, 0.3), 2), 0.28)
  expect_type(aux_skewness(10, 0.3), 'double')
  expect_length(aux_skewness(10, 0.3), 1)
})

test_that('aux_kurtosis works as expected', {
  expect_equal(round(aux_kurtosis(10, 0.3), 2), -0.12)
  expect_type(aux_kurtosis(10, 0.3), 'double')
  expect_length(aux_kurtosis(10, 0.3), 1)
})
