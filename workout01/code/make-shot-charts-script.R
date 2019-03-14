  ##################################################
  ## Title: Short Charts Code
  ## Description: This script uses raw data of each player to make charts labeling where each player made a shot
  ## Input(s): raw data of five CSV files (one for each player) and an image of the NBA court
  ##              ../images/nba-court.jpg
  ##              ../data/andre-iguodala.csv
  ##              ../data/draymond-green.csv
  ##              ../data/kevin-durant.csv
  ##              ../data/klay-thompson.csv
  ##              ../data/stephen-curry.csv
  ## Output(s): creates shot charts for each player
  ##              ../images/gsw-shot-charts.pdf
  ##              ../images/gsw-shot-charts.png
  ##              ../images/andre-iguodala-shot-chart.pdf
  ##              ../images/draymond-green-shot-chart.pdf
  ##              ../images/kevin-durant-shot-chart.pdf
  ##              ../images/klay-thompson-shot-chart.pdf
  ##              ../images/stephen-curry-shot-chart.pdf
  ##################################################
  
  ## Section: shot charts of each player
  ##################################################
  library(ggplot2)
  library(grid)
  library(jpeg)
  library(dplyr)
  library(reshape2)
  
  court_file <- '../images/nba-court.jpg'

  
  court_image <- rasterGrob(
    readJPEG(court_file), 
    width = unit(1, 'npc'), 
    height = unit(1, 'npc'))  
  
  klay_shot_chart <- ggplot(data = Thompson) +
    annotation_custom(court_image, -250, 250, -50, 420) + 
    geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
    ylim(-50, 420) + 
    ggtitle('Shot Chart: Klay Thompson (2016 season)') + 
    theme_minimal()
  
  pdf('../images/klay-thompson-shot-chart.pdf', width = 6.5, height =5)
  klay_shot_chart
  dev.off()
  
  pdf('../images/andre-iguodala-shot-chart.pdf', width = 6.5, height =5)
  ggplot(data = Iguodala) +
    annotation_custom(court_image, -250, 250, -50, 420) + 
    geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
    ylim(-50, 420) + 
    ggtitle('Shot Chart: Andre Iguodala (2016 season)') + 
    theme_minimal()
  dev.off()
  
  pdf('../images/draymond-green-shot-chart.pdf', width = 6.5, height =5)
  ggplot(data = Green) +
    annotation_custom(court_image, -250, 250, -50, 420) + 
    geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
    ylim(-50, 420) + 
    ggtitle('Shot Chart: Draymond Green (2016 season)') + 
    theme_minimal()
  dev.off()
  
  pdf('../images/kevin-durant-shot-chart.pdf', width = 6.5, height =5)
  ggplot(data = Durant) +
    annotation_custom(court_image, -250, 250, -50, 420) + 
    geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
    ylim(-50, 420) + 
    ggtitle('Shot Chart: Kevin Durant (2016 season)') + 
    theme_minimal()
  dev.off()
  
  pdf('../images/stephen-curry-shot-chart.pdf', width = 6.5, height =5)
  ggplot(data = Curry) +
    annotation_custom(court_image, -250, 250, -50, 420) + 
    geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
    ylim(-50, 420) + 
    ggtitle('Shot Chart: Stephen Curry (2016 season)') + 
    theme_minimal()
  dev.off()
  
  ## Section: facetted shot chart
  ##################################################
  pdf('../images/gsw-shot-charts.pdf', width = 8, height = 7)
  ggplot(data = dat) + 
    annotation_custom(court_image, -250, 250, -50, 420) + 
    geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
    ylim(-50, 420) + 
    ggtitle('Shot Chart: GSW (2016 season)') + 
    theme_minimal() + 
    facet_wrap(~ name)
  dev.off()
  
  png('../images/gsw-shot-charts.png', width = 8, height = 7, units = 'in', res = 120)
  ggplot(data = dat) + 
    annotation_custom(court_image, -250, 250, -50, 420) + 
    geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
    ylim(-50, 420) + 
    ggtitle('Shot Chart: GSW (2016 season)') + 
    theme_minimal() + 
    facet_wrap(~ name)
  dev.off()
  
  
  