context("test-test-aux")

test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

test_that("check_prob works as expected", {
  expect_true(check_prob(0.5))
  expect_type(check_prob(0.5), 'logical')
  expect_length(check_prob(0.5), 1)
})

test_that("check_prob errors as expected", {
  expect_error(check_prob(-1), 'invalid prob value')
  expect_error(check_prob(2), 'invalid prob value')
})

test_that("check_trials works as expected", {
  expect_true(check_trials(1))
  expect_type(check_trials(1), 'logical')
})

test_that("check_trials errors as expected", {
  expect_error(check_trials(-1), 'invalid trials value')
})

test_that("check_success works as expected", {
  expect_true(check_success(c(1, 2, 3), 4))
  expect_type(check_success(c(1, 2, 3), 4), 'logical')
})

test_that("check_success errors as expect", {
  expect_error(check_success(c(TRUE, FALSE), 2), 'invalid success value')
  expect_error(check_success(c(), 2), 'invalid success value')
  expect_error(check_success(c(1, 2, 3), -1), 'invalid trials value')
})


