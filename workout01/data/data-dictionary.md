
## Data Dictionary
---  

Name of Variable | Variable | Description | Data Type 
---------| ---------------- | -------------------------------------------------------------- | ----------- 
team_name | Team Name | name of NBA team player was playing with; for example, Golden Stat Warriors | character 
game_date | Game Date | date for which the game occurred on | character
season | Season | year that each game occurred in | integer
period | Period | an NBA game is divided in 4 periods, each period is 12 minutes; for example, a value for period = 1 refers to the first period (the first 12 mins of the game) | integer
minutes_remaining | Minutes Remaining | minutes that remain to be played in a given period | integer | 
seconds_remaining | Seconds Remaining | seconds that remain to be played in a given period | integer | 
shot_made_flag | Shot Made | indicates whether a shot was made (y) or missed (n) | factor
action_types | Action Types | basketball moves used by players | factor
shot_types | Shot Types | indicates whether a shot is a 2-point field goal or a 3-point field goal | factor
shot_distance | Shot Distance | distance to the basket | integer
opponent | Opponent Team | opponent team name | character
x | Court Coordinate | court coordinate (measured in inches) where a shot occurred | integer
y | Court Coordinate | court coordinate (measured in inches) where a shot occurred | integer


