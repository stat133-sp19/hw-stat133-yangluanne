  ##################################################
  ## Title: Data Preparation Code
  ## Description: This script organizes the raw data for later analysis
  ## Input(s): raw data of five CSV files (one for each player)
  ## Output(s): summaries of each five players, all five players, and a csv file containing all the players data (global table)
  ##################################################

  ## Section: read data sets
  ##################################################

  data_types <- c('character', 'character', 'integer', 'integer', 'integer', 'integer', 'factor', 'factor', 'factor', 'integer', 'character', 'integer', 'integer')
  Iguodala <- read.csv('../data/andre-iguodala.csv', stringsAsFactors = FALSE, colClasses = data_types)
  Green <- read.csv('../data/draymond-green.csv', stringsAsFactors = FALSE, colClasses = data_types)
  Durant <- read.csv('../data/kevin-durant.csv', stringsAsFactors = FALSE, colClasses = data_types)
  Thompson <- read.csv('../data/klay-thompson.csv', stringsAsFactors = FALSE, colClasses = data_types)
  Curry <- read.csv('../data/stephen-curry.csv', stringsAsFactors = FALSE, colClasses = data_types)

  ## Section: add column name
  ##################################################
  Iguodala$name <- 'Andre Iguodala'
  Green$name <- 'Draymond Green'
  Durant$name <- 'Kevin Durant'
  Thompson$name <- 'Klay Thompson'
  Curry$name <- 'Stephen Curry'

  ## Section: change original values of shot_made_flag to more descriptive values
  ##################################################

  levels(Iguodala$shot_made_flag)[match('n', levels(Iguodala$shot_made_flag))] <- 'shot_no'
  levels(Iguodala$shot_made_flag)[match('y', levels(Iguodala$shot_made_flag))] <- 'shot_yes'

  levels(Green$shot_made_flag)[match('n', levels(Green$shot_made_flag))] <- 'shot_no'
  levels(Green$shot_made_flag)[match('y', levels(Green$shot_made_flag))] <- 'shot_yes'
  
  levels(Durant$shot_made_flag)[match('n', levels(Durant$shot_made_flag))] <- 'shot_no'
  levels(Durant$shot_made_flag)[match('y', levels(Durant$shot_made_flag))] <- 'shot_yes'

  levels(Thompson$shot_made_flag)[match('n', levels(Thompson$shot_made_flag))] <- 'shot_no'
  levels(Thompson$shot_made_flag)[match('y', levels(Thompson$shot_made_flag))] <- 'shot_yes'

  levels(Curry$shot_made_flag)[match('n', levels(Curry$shot_made_flag))] <- 'shot_no'
  levels(Curry$shot_made_flag)[match('y', levels(Curry$shot_made_flag))] <- 'shot_yes'

  ## Section: add minute column
  ##################################################

  Iguodala$minute <- Iguodala$period * 12 - Iguodala$minutes_remaining
  Green$minute <- Green$period * 12 - Green$minutes_remaining
  Durant$minute <- Durant$period * 12 - Durant$minutes_remaining
  Thompson$minute <- Thompson$period * 12 - Thompson$minutes_remaining
  Curry$minute <- Curry$period * 12 - Curry$minutes_remaining

  ## Section: summary of each data frame
  ##################################################
  sink(file = '../output/andre-iguodala-summary.txt')
  summary(Iguodala)
  sink()

  sink(file = '../output/draymond-green-summary.txt')
  summary(Green)
  sink()

  sink(file = '../output/kevin-durant-summary.txt')
  summary(Durant)
  sink()

  sink(file = '../output/klay-thompson-summary.txt')
  summary(Thompson)
  sink()

  sink(file = '../output/stephen-curry-summary.txt')
  summary(Curry)
  sink()

  ## Section: stack tables into a new data frame
  ##################################################
  dat <- rbind(Iguodala, Green, Durant, Thompson, Curry)

  ## Section: export new table as a CSV file
  ##################################################
  write.csv(dat, '../data/shots-data.csv')

  ## Section: summary of new table
  ##################################################
  sink(file = '../output/shots-data-summary.txt')
  summary(dat)
  sink()


  