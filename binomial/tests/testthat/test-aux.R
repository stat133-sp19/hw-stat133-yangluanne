context("test-aux")

test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

test_that("aux_mean works as expected", {
  expect_equal(aux_mean(10, 0.3), 3)
  expect_equal(aux_mean(1:3, 0.5), c(0.5, 1, 1.5))
  expect_type(aux_mean(10, 0.3), 'double')
  expect_length(aux_mean(10, 0.3), 1)
})

test_that("aux_variance works as expected", {
  expect_equal(aux_variance(10, 0.3), 2.1)
  expect_equal(aux_variance(1:3, 0.5), c(0.25, 0.5, 0.75))
  expect_type(aux_variance(10, 0.3), 'double')
  expect_length(aux_variance(10, 0.3), 1)
})

test_that("aux_mode works as expected", {
  expect_equal(aux_mode(10, 0.3), 3)
  expect_equal(aux_mode(1:3, 0.5), c(1, 0, 1, 2, 1))
  expect_type(aux_variance(10, 0.3), 'double')
  expect_length(aux_variance(10, 0.3), 1)
})

test_that('aux_skewness works as expected', {
  expect_equal(round(aux_skewness(10, 0.3), 2), 0.28)
  expect_equal(aux_skewness(1:3, 0.5), c(0, 0, 0))
  expect_type(aux_skewness(10, 0.3), 'double')
  expect_length(aux_skewness(10, 0.3), 1)
})

test_that('aux_kurtosis works as expected', {
  expect_equal(round(aux_kurtosis(10, 0.3), 2), -0.12)
  expect_equal(round(aux_kurtosis(1:3, 0.5)), c(-2, -1, -1))
  expect_type(aux_kurtosis(10, 0.3), 'double')
  expect_length(aux_kurtosis(10, 0.3), 1)
})


