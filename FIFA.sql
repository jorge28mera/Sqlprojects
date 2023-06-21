-- creating Schema: create database FIFA Data;

-- adding unique team/identifier to the teams 

ALTER TABLE teams ADD (
  team_id INT PRIMARY KEY Auto_increment 
);

-- adjusting the column settings
ALTER TABLE teams
MODIFY COLUMN `team` VARCHAR(50);

-- converting all caps text to only first letter upper case
UPDATE teams
SET team = CONCAT(UPPER(SUBSTRING(team, 1, 1)), LOWER(SUBSTRING(team, 2)));

-- adding a new column Match day as a DATE data type to replace the previous Date column
ALTER TABLE matches ADD match_day DATE;

-- duplicating the date column as match_day and converting its format from string to date
UPDATE matches 
SET match_day = STR_TO_DATE(`date`, '%d %b %Y');

-- droping the Date column
ALTER TABLE matches
DROP COLUMN `date`;

-- adding a new column Hour to replace the previous 
ALTER TABLE matches ADD match_hr TIME;

-- copying and updating the hour column as match_hr and coverting it to string to date
UPDATE matches 
SET match_hr = STR_TO_DATE(`hour`, '%H : %i');

-- droping the hour column
ALTER TABLE matches
DROP COLUMN `hour`;

-- Creating foreign key for team1 and team2 and primary key to later analyze the matches
ALTER TABLE matches
ADD team1_id INT,
ADD team2_id INT,
ADD FOREIGN KEY (team1_id) REFERENCES teams(team_id),
ADD FOREIGN KEY (team2_id) REFERENCES teams(team_id);

ALTER TABLE matches
ADD match_id INT primary key auto_increment;

-- Matching the team names in the "matches" table with the team names in the "teams" table and updating the foreign key columns accordingly.

UPDATE matches AS m
JOIN teams AS t1 ON m.team1 = t1.team
JOIN teams AS t2 ON m.team2 = t2.team
SET m.team1_id = t1.team_id, m.team2_id = t2.team_id;

--  Modifying column to specific data types ,

SELECT MAX(LENGTH(category)) AS longest_string_length -- counting the longest string within the matches columns which will be named Country 
FROM matches;

ALTER TABLE matches
MODIFY COLUMN `category` VARCHAR(30),
MODIFY COLUMN `team1` VARCHAR(20),
MODIFY COLUMN `team2` VARCHAR(20);

-- Creating primary and foreign keys to later analyze

ALTER TABLE stats
ADD stat_id INT primary key auto_increment,
Add match_id INT,
ADD FOREIGN KEY (match_id) REFERENCES matches(match_id);

-- Matching the stats columns to the matches columns and populating the stats.match_id columnn equal to the matches.match_id
UPDATE stats AS s
JOIN matches AS m ON s.team1 = m.team1
                   AND s.team2 = m.team2
                   AND s.category = m.category
SET s.match_id = m.match_id;

--  fixing the column names by removing the spaces,

ALTER TABLE stats 
CHANGE COLUMN `possession team1` possession_t1 decimal(5,2),
CHANGE COLUMN `possession team2` possession_t2 decimal(5,2),
CHANGE COLUMN `possession in contest` possession_in_contest decimal(5,2),
CHANGE COLUMN `number of goals team1` number_of_goals_t1 INT,
CHANGE COLUMN `number of goals team2` number_of_goals_t2 INT,
CHANGE COLUMN `total attempts team1` total_attempts_t1 INT,
CHANGE COLUMN `total attempts team2` total_attempts_t2 INT,
CHANGE COLUMN `goal inside the penalty area team1` goals_in_penalty_area_t1 int,
CHANGE COLUMN `goal inside the penalty area team2` goals_in_penalty_area_t2 int,
CHANGE COLUMN `goal outside the penalty area team1` goals_out_penalty_area_t1 int,
CHANGE COLUMN `goal outside the penalty area team2` goals_out_penalty_area_t2 int,
CHANGE COLUMN `assists team1` assits_t1 int,
CHANGE COLUMN `assists team2` assits_t2 int,
CHANGE COLUMN `on target attempts team1` attempts_on_target_t1 int,
CHANGE COLUMN `on target attempts team2` attempts_on_target_t2 int,
CHANGE COLUMN `off target attempts team1` attempts_off_target_t1 int,
CHANGE COLUMN `off target attempts team2` attempts_off_target_t2 int,
CHANGE COLUMN `left channel team1` left_channel_t1 int,
CHANGE COLUMN `left channel team2` left_channel_t2 int,
CHANGE COLUMN `left inside channel team1` left_inside_channel_t1 int,
CHANGE COLUMN `left inside channel team2` left_inside_channel_t2 int,
CHANGE COLUMN `central channel team1` central_channel_t1 int,
CHANGE COLUMN `central channel team2` central_channel_t2 int,
CHANGE COLUMN `right inside channel team1` right_inside_channel_t1 int,
CHANGE COLUMN `right inside channel team2` right_inside_channel_t2 int,
CHANGE COLUMN `right channel team1` right_channel_t1 int,
CHANGE COLUMN `right channel team2` right_channel_t2 int,
CHANGE COLUMN `attempted line breaks team1` attempted_line_breaks_t1 int,
CHANGE COLUMN `attempted line breaks team2` attempted_line_breaks_t2 int,
CHANGE COLUMN `completed line breaksteam1` completed_line_breaks_t1 int,
CHANGE COLUMN `completed line breaks team2` completed_line_breaks_t2 int,
CHANGE COLUMN `attempted defensive line breaks team1` attempted_defen_line_breaks_t1 int,
CHANGE COLUMN `attempted defensive line breaks team2` attempted_defen_line_breaks_t2 int,
CHANGE COLUMN `completed defensive line breaksteam1` completed_defen_line_breaks_t1 int,
CHANGE COLUMN `completed defensive line breaks team2` completed_defen_line_breaks_t2 int,
CHANGE COLUMN `yellow cards team1` yellow_cards_t1 int,
CHANGE COLUMN `yellow cards team2` yellow_cards_t2 int,
CHANGE COLUMN `red cards team1` red_cards_t1 int,
CHANGE COLUMN `red cards team2` red_cards_t2 int,
CHANGE COLUMN `fouls against team1` fouls_against_t1 int,
CHANGE COLUMN `fouls against team2` fouls_against_t2 int,
CHANGE COLUMN `passes team1` passes_t1 int,
CHANGE COLUMN `passes team2` passes_t2 int,
CHANGE COLUMN `passes completed team1` passes_completed_t1 int,
CHANGE COLUMN `passes completed team2` passes_completed_t2 int,
CHANGE COLUMN `crosses team1` crosses_t1 int,
CHANGE COLUMN `crosses team2` crosses_t2 int,
CHANGE COLUMN `crosses completed team1` crosses_completed_t1 int,
CHANGE COLUMN `crosses completed team2` crosses_completed_t2 int,
CHANGE COLUMN `corners team1` corners_t1 int,
CHANGE COLUMN `corners team2` corners_t2 int,
CHANGE COLUMN `penalties scored team1` penalties_scored_t1 int,
CHANGE COLUMN `penalties scored team2` penalties_scored_t2 int,
CHANGE COLUMN `own goals team1` own_goals_t1 int,
CHANGE COLUMN `own goals team2` own_goals_t2 int,
CHANGE COLUMN `forced turnovers team1` forced_turnovers_t1 int,
CHANGE COLUMN `forced turnovers team2` forced_turnovers_t2 int,
CHANGE COLUMN `attempts inside the penalty area team1` attempts_in_penalty_area_t1 int, 
CHANGE COLUMN `attempts inside the penalty area  team2` attempts_in_penalty_area_t2 int, 
CHANGE COLUMN `attempts outside the penalty area  team1` attempts_outside_penalty_area_t1 int, 
CHANGE COLUMN `attempts outside the penalty area  team2` attempts_outside_penalty_area_t2 int,
CHANGE COLUMN `free kicks team1` free_kicks_team1 INT,
CHANGE COLUMN `free kicks team2` free_kicks_team2 INT,
CHANGE COLUMN `conceded team1` goals_conceded_t1 INT,
CHANGE COLUMN `conceded team2` goals_conceded_t2 int;

ALTER TABLE stats 
CHANGE COLUMN `goal preventions team1` goal_prevention_t1 int,
CHANGE COLUMN `goal preventions team2` goal_prevention_t2 int;

-- grouping the categorys to be able to see what teams are in which group
SELECT DISTINCT
    (m.category), t.team
FROM
    matches m
        JOIN
    teams t ON team_id = team1_id OR team_id = team2_id
ORDER BY category , t.team;

-- number of matches each team played
SELECT 
    t.team, COUNT(m.category) AS num_games_played
FROM
    teams t
        JOIN
    Matches m ON t.team_id = team1_id
        OR t.team_id = team2_id
GROUP BY t.team
ORDER BY num_games_played DESC;

-- Which teams had the highest avg possession percentage rounded to a whole number?
SELECT 
    t.team,
    Concat(ROUND(AVG(CASE
                WHEN t.team = s.team1 THEN s.possession_team1
                WHEN t.team = s.team2 THEN s.possession_team2
                ELSE 0
            END),2),'%') AS avg_possession
FROM
    teams t
        JOIN
    Matches m ON t.team_id = m.team1_id
        OR t.team_id = m.team2_id
        JOIN
    stats s ON m.match_id = s.match_id
GROUP BY t.team
ORDER BY avg_possession;

-- How many goals were scored by each team throughout the tournament?
CREATE VIEW teams_goals_scored AS
SELECT 
    t.team,
    SUM(CASE
        WHEN t.team = s.team1 THEN s.number_of_goals_team1
        WHEN t.team = s.team2 THEN s.number_of_goals_team2
        ELSE 0
    END) AS num_of_goals_scored,
    (SELECT round(AVG(num_of_goals_scored),2) FROM teams_goals_scored) AS avg_goals_scored
FROM
    teams t
        JOIN
    Matches m ON t.team_id = m.team1_id
        OR t.team_id = m.team2_id
        JOIN
    stats s ON m.match_id = s.match_id
GROUP BY t.team
ORDER BY num_of_goals_scored;

select avg(num_of_goals_scored) as avg_goals_scored -- avg_number of goals from all teams using the view
from teams_goals_scored;

-- How many goals were conceeded by each team throughout the tournament?
-- CREATE VIEW team_goals_conceeded AS
SELECT 
    t.team,
    SUM(CASE
        WHEN t.team = s.team1 THEN s.goals_conceded_t1
        WHEN t.team = s.team2 THEN s.goals_conceded_t2
        ELSE 0
    END) AS num_of_goals_conceded,
  (SELECT round(AVG(num_of_goals_conceded),2) FROM team_goals_conceeded) AS avg_goals_conceeded
FROM
    teams t
        JOIN
    Matches m ON t.team_id = m.team1_id
        OR t.team_id = m.team2_id
        JOIN
    stats s ON m.match_id = s.match_id
GROUP BY t.team
ORDER BY num_of_goals_conceded;

SELECT AVG(num_of_goals_conceded) FROM team_goals_conceeded; -- avg number of goals conceeded 

-- combining the goals scored and the goals conceeded using subqueries also displaying the avg # scored and conceeded
-- including the ranks for most to least goals scored and goals conceeded

SELECT
    tgs.team,
    tgs.num_of_goals_scored,
    tgc.num_of_goals_conceded,
    tgs.tournament_avg_goals_scored,
    tgc.tournament_avg_goals_conceeded,
    RANK() OVER (ORDER BY tgs.num_of_goals_scored DESC) AS goals_scored_rank,
    RANK() OVER (ORDER BY tgc.num_of_goals_conceded ASC) AS goals_conceded_rank
FROM
    (
       SELECT 
    t.team,
    SUM(CASE
        WHEN t.team = s.team1 THEN s.number_of_goals_team1
        WHEN t.team = s.team2 THEN s.number_of_goals_team2
        ELSE 0
    END) AS num_of_goals_scored,
    (SELECT round(AVG(num_of_goals_scored),2) FROM teams_goals_scored) AS tournament_avg_goals_scored
FROM
    teams t
        JOIN
    Matches m ON t.team_id = m.team1_id
        OR t.team_id = m.team2_id
        JOIN
    stats s ON m.match_id = s.match_id
GROUP BY t.team
    ) AS tgs
    JOIN
    (
        SELECT 
    t.team,
    SUM(CASE
        WHEN t.team = s.team1 THEN s.goals_conceded_t1
        WHEN t.team = s.team2 THEN s.goals_conceded_t2
        ELSE 0
    END) AS num_of_goals_conceded,
  (SELECT round(AVG(num_of_goals_conceded),2) FROM team_goals_conceeded) AS tournament_avg_goals_conceeded
FROM
    teams t
        JOIN
    Matches m ON t.team_id = m.team1_id
        OR t.team_id = m.team2_id
        JOIN
    stats s ON m.match_id = s.match_id
GROUP BY t.team
    ) AS tgc ON tgs.team = tgc.team
ORDER BY goals_scored_rank, goals_conceded_rank;

-- How yellow and red cards were shown to each team?
select t.team,
sum(CASE
        WHEN t.team = s.team1 THEN yellow_cards_t1
        WHEN t.team = s.team2 THEN yellow_cards_t2
        ELSE 0
    END) AS num_of_yellow_cards,
    sum(CASE
        WHEN t.team = s.team1 THEN red_cards_t1
        WHEN t.team = s.team2 THEN red_cards_t2
        ELSE 0
    END) AS num_of_red_cards,
     sum(CASE
        WHEN t.team = s.team1 THEN goals_conceded_t1
        WHEN t.team = s.team2 THEN goals_conceded_t2
        ELSE 0
    END) AS num_of_goals_conceded
from teams t
     JOIN
    Matches m ON t.team_id = m.team1_id
        OR t.team_id = m.team2_id
        JOIN
    stats s ON m.match_id = s.match_id
Group by t.team
order by num_of_yellow_cards desc;

-- What were the top goal-scoring matches in terms of total goals scored?
select team1, team2, category,
number_of_goals_team1, number_of_goals_team2
from stats
order by number_of_goals_team1 desc, number_of_goals_team2 desc;

-- Which team had the highest number of assists?
select t.team,
sum(CASE
        WHEN t.team = s.team1 THEN assits_team1
        WHEN t.team = s.team2 THEN assits_team2
        ELSE 0
    END) AS num_of_assists_cards,
    sum(CASE
        WHEN t.team = s.team1 THEN forced_turnovers_t1
        WHEN t.team = s.team2 THEN forced_turnovers_t2
        ELSE 0
    END) AS num_of_forced_turnovers,
     sum(CASE
        WHEN t.team = s.team1 THEN number_of_goals_team1
        WHEN t.team = s.team2 THEN number_of_goals_team2
        ELSE 0
    END) AS num_of_goals_scored
from teams t
     JOIN
    Matches m ON t.team_id = m.team1_id
        OR t.team_id = m.team2_id
        JOIN
    stats s ON m.match_id = s.match_id
Group by t.team
order by num_of_goals_scored desc, num_of_forced_turnovers;

-- How aggressive were teams?

select t.team,
sum(CASE
        WHEN t.team = s.team1 THEN yellow_cards_t1
        WHEN t.team = s.team2 THEN yellow_cards_t2
        ELSE 0
    END) AS num_of_yellow_cards,
    sum(CASE
        WHEN t.team = s.team1 THEN red_cards_t1
        WHEN t.team = s.team2 THEN red_cards_t2
        ELSE 0
    END) AS num_of_red_cards,
     sum(CASE
        WHEN t.team = s.team1 THEN goals_conceded_t1
        WHEN t.team = s.team2 THEN goals_conceded_t2
        ELSE 0
    END) AS num_of_goals_conceded,
     sum(CASE
        WHEN t.team = s.team1 THEN fouls_against_t1
        WHEN t.team = s.team2 THEN fouls_against_t2
        ELSE 0
    END) AS num_of_fouls
from teams t
     JOIN
    Matches m ON t.team_id = m.team1_id
        OR t.team_id = m.team2_id
        JOIN
    stats s ON m.match_id = s.match_id
Group by t.team;

-- Teams tournament aggresiveness Goals scored and conceded,percent of shots on target (attempts * attempts on target)
-- percent Shot off target (attempts * attempts off target)

select t.team,
     sum(CASE
        WHEN t.team = s.team1 THEN number_of_goals_t1
        WHEN t.team = s.team2 THEN number_of_goals_t2
        ELSE 0
    END) AS num_of_goals_scored,
 sum(CASE
        WHEN t.team = s.team1 THEN goals_conceded_t1
        WHEN t.team = s.team2 THEN goals_conceded_t2
        ELSE 0
    END) AS num_of_goals_conceded
from teams t
     JOIN
    Matches m ON t.team_id = m.team1_id
        OR t.team_id = m.team2_id
        JOIN
    stats s ON m.match_id = s.match_id
Group by t.team;

-- by group

select s.category,
   sum(CASE
        WHEN t.team = s.team1 THEN number_of_goals_t1
        WHEN t.team = s.team2 THEN number_of_goals_t2
        ELSE 0
    END) AS num_of_goals_scored,
    SUM(CASE
            WHEN t.team = s.team1 THEN s.total_attempts_t1
            WHEN t.team = s.team2 THEN s.total_attempts_t2
            ELSE 0
        END) As total_attempts,
        SUM(CASE
            WHEN t.team = s.team1 THEN s.attempts_on_target_t1
            WHEN t.team = s.team2 THEN s.attempts_on_target_t2
            ELSE 0
        END) As attpmpts_on_target,
 CONCAT(
        ROUND((SUM(CASE
            WHEN t.team = s.team1 THEN s.attempts_on_target_t1
            WHEN t.team = s.team2 THEN s.attempts_on_target_t2
            ELSE 0
        END)) / SUM(CASE
            WHEN t.team = s.team1 THEN s.total_attempts_t1
            WHEN t.team = s.team2 THEN s.total_attempts_t2
            ELSE 0
        END),2)*100,
        '%'
        ) as Percent_of_atempts_on_target
from teams t
     JOIN
    Matches m ON t.team_id = m.team1_id
        OR t.team_id = m.team2_id
        JOIN
    stats s ON m.match_id = s.match_id
Group by s.category;

-- creating a view left,right,center channel touches
-- view for left channel
CREATE VIEW teams_attempts_on_left_channel AS
SELECT t.team,
    CONCAT(
        ROUND(SUM(CASE
            WHEN t.team = s.team1 THEN s.left_channel_t1
            WHEN t.team = s.team2 THEN s.left_channel_t2
            ELSE 0
        END), 2)
    ) AS attempts_on_left_channel
FROM teams t
JOIN Matches m ON t.team_id = m.team1_id OR t.team_id = m.team2_id
JOIN stats s ON m.match_id = s.match_id
GROUP BY t.team
Order by attempts_on_left_channel;

-- view for right channel
CREATE VIEW teams_attempts_on_right_channel AS
SELECT t.team,
    CONCAT(
        ROUND(SUM(CASE
            WHEN t.team = s.team1 THEN s.right_channel_t1
            WHEN t.team = s.team2 THEN s.right_channel_t2
            ELSE 0
        END), 2)
    ) AS attempts_on_right_channel
FROM teams t
JOIN Matches m ON t.team_id = m.team1_id OR t.team_id = m.team2_id
JOIN stats s ON m.match_id = s.match_id
GROUP BY t.team
Order by attempts_on_right_channel;

-- central chanel
CREATE VIEW teams_attempts_on_central_channel AS
SELECT t.team,
    CONCAT(
        ROUND(SUM(CASE
            WHEN t.team = s.team1 THEN s.central_channel_t1
            WHEN t.team = s.team2 THEN s.central_channel_t2
            ELSE 0
        END), 2)
    ) AS attempts_on_central_channel
FROM teams t
JOIN Matches m ON t.team_id = m.team1_id OR t.team_id = m.team2_id
JOIN stats s ON m.match_id = s.match_id
GROUP BY t.team
Order by attempts_on_central_channel;

-- Quality of possission, team, avg possession, intensity on the respective chanels left,right and central posession 

select t.team,
    CONCAT(Round(avg(CASE
            WHEN t.team = s.team1 THEN s.possession_t1
            WHEN t.team = s.team2 THEN s.possession_t2
            ELSE 0
        END),2),'%')AS Avg_possission_per_team,
	   CASE
     WHEN tl.attempts_on_left_channel <= 40 THEN 'low'
     WHEN tl.attempts_on_left_channel >= 100 THEN 'high'
     ELSE 'Medium'
     END AS left_channel_intensity,
       CASE
     WHEN tr.attempts_on_right_channel <= 40 THEN 'low'
     WHEN tr.attempts_on_right_channel >= 100 THEN 'high'
     ELSE 'Medium'
     END AS right_channel_intensity,
     CASE
     WHEN tc.attempts_on_central_channel <= 40 THEN 'low'
     WHEN tc.attempts_on_central_channel >= 100 THEN 'high'
     ELSE 'Medium'
     END AS central_channel_intensity
from teams t
     JOIN
    Matches m ON t.team_id = m.team1_id
        OR t.team_id = m.team2_id
        JOIN
    stats s ON m.match_id = s.match_id
    JOIN teams_attempts_on_left_channel tl ON t.team = tl.team
        JOIN teams_attempts_on_right_channel tr ON t.team = tr.team
         JOIN teams_attempts_on_central_channel tc ON t.team = tc.team
Group by t.team;

-- what is the best offensive team - total goals scored, avg goals score, % of completed line breaks 

select t.team,
sum(CASE
            WHEN t.team = s.team1 THEN s.number_of_goals_t1
            WHEN t.team = s.team2 THEN s.number_of_goals_t2
            ELSE 0
        END) AS Goals_per_team,
sum(CASE
            WHEN t.team = s.team1 THEN s.completed_line_breaks_t1
            WHEN t.team = s.team2 THEN s.completed_line_breaks_t2
            ELSE 0
        END) AS completed_line_breaks,
			sum(CASE
            WHEN t.team = s.team1 THEN s.attempted_line_breaks_t1
            WHEN t.team = s.team2 THEN s.attempted_line_breaks_t2
            ELSE 0
        END) AS Attempted_linebreaks,
        round(sum(CASE
            WHEN t.team = s.team1 THEN s.completed_line_breaks_t1
            WHEN t.team = s.team2 THEN s.completed_line_breaks_t2
            ELSE 0
        END) /
             sum(CASE
            WHEN t.team = s.team1 THEN s.attempted_line_breaks_t1
            WHEN t.team = s.team2 THEN s.attempted_line_breaks_t2
            ELSE 0
        END),2)*100 AS linebreaks_per_team
from teams t
     JOIN
    Matches m ON t.team_id = m.team1_id
        OR t.team_id = m.team2_id
        JOIN
    stats s ON m.match_id = s.match_id
   Group by t.team;
   
-- What is the best defensive team, goals conceded, goal prevention

select t.team,
sum(CASE
            WHEN t.team = s.team1 THEN s.goals_conceded_t1
            WHEN t.team = s.team2 THEN s.goals_conceded_t2
            ELSE 0
        END) AS Goals_conceded_per_team,
sum(CASE
            WHEN t.team = s.team1 THEN s.goal_prevention_t1
            WHEN t.team = s.team2 THEN s.goal_prevention_t2
            ELSE 0
        END) AS goal_preventions
from teams t
     JOIN
    Matches m ON t.team_id = m.team1_id
        OR t.team_id = m.team2_id
        JOIN
    stats s ON m.match_id = s.match_id
   Group by t.team;