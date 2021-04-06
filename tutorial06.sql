-- SQL tasks from https://sqlzoo.net/wiki/SQL_Tutorial

/*
***************************************************************
**                                                           **
***** *****            TUTORIAL - 6 - JOIN     ***** *****   **
**                                                           **
***************************************************************
*/

-- 1-Task solution: Modify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'

SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'


-- 2-Task solution: Show id, stadium, team1, team2 for just game 1012

SELECT id,stadium,team1,team2
  FROM game
  WHERE id  = 1012


-- 3-Task solution: Modify it to show the player, teamid, stadium and mdate for every German goal.
SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
  WHERE teamid = 'GER'


-- 4-Task solution: Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'

SELECT team1, team2, player
  FROM goal JOIN game ON (matchid=id)
  WHERE player LIKE 'Mario%'

-- 5-Task solution: Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10

SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON (teamid=id)
 WHERE gtime<=10


 -- 6-Task solution: List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.

 SELECT mdate, teamname
FROM game JOIN eteam ON (team1=eteam.id)
WHERE coach = 'Fernando Santos'


 -- 7-Task solution: List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'

 SELECT player
FROM goal JOIN game ON (matchid=id)
WHERE stadium = 'National Stadium, Warsaw'


 -- 8-Task solution: The example query shows all goals scored in the Germany-Greece quarterfinal. Instead show the name of all players who scored a goal against Germany.

 SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id 
    WHERE (team1='GER' OR team2='GER')
      AND game.id = goal.matchid
      AND goal.teamid != 'GER'


 -- 9-Task solution: Show teamname and the total number of goals scored.

 SELECT teamname, COUNT(player)
  FROM eteam JOIN goal ON id=teamid
 GROUP BY teamname


-- 10-Task solution: Show the stadium and the number of goals scored in each stadium.

SELECT stadium, COUNT(player)
FROM game JOIN goal ON id=matchid
 GROUP BY stadium


-- 11-Task solution: For every match involving 'POL', show the matchid, date and the number of goals scored.

SELECT id, mdate, COUNT(*)
  FROM game JOIN goal ON id = matchid
 WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY id, mdate


-- 12-Task solution: For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'

SELECT id, mdate, COUNT(*)
FROM game JOIN goal ON id = matchid
WHERE teamid = 'GER'
GROUP BY id, mdate


-- 13-Task solution: List every match with the goals scored by each team as shown. This will use "CASE WHEN" which has not been explained in any previous exercises.

SELECT mdate, team1,
  SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) AS score1,
  team2,
  SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) AS score2
  
  FROM game LEFT JOIN goal ON matchid = id
  GROUP BY mdate, team1, team2
  ORDER BY mdate, matchid, team1, team2