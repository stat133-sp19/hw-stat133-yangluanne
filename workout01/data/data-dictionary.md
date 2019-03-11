
## Data Dictionary
---  

* team_name: name of NBA team player was playing with. For example, Golden Stat Warriors (character).
* game_date: date for which the game occurred on (character).
* season: year that each game occurred in (integer).
* period: an NBA game is divided in 4. periods of 12 mins each. For example, a value for period = 1 refers to the first period (the first 12 mins of the game) (integer).
* minutes_remaining: minutes that remained to be played in a given period (integer).
* seconds_remaining: seconds that remained to be played in a given period (integer).
* shot_made_flag: indicates whether a shot was made (y) or missed (n) (factor).
* action_types: basketball moves used by players, either to pass by defenders to gain access to the basket, or to get a clean pass to a teammate to score a two pointer or three pointer (factor).
* shot_types: indicates whether a shot is a 2-point field goal, or a 3-point field goal (factor).
* shot_distance: distance to the basket (measured in feet) (integer).
* opponent: opponent team's name (character).
* x and y: court coordinates (measured in inches) where a shot occurred (integer).
