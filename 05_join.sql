--https://sqlzoo.net/wiki/The_JOIN_operation

--Question 1
--Show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'
SELECT matchid, player 
  FROM goal 
 WHERE teamid = 'GER';


--Question 2
--Show id, stadium, team1, team2 for just game 1012
SELECT id,stadium,team1,team2
  FROM game
 WHERE id = 1012;


--Question 3
SELECT player, teamid, stadium, mdate
  FROM game 
  JOIN goal ON (id=matchid)
 WHERE teamid ='GER';


--Question 4
--Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
SELECT team1, team2, player
  FROM game 
  JOIN goal ON (id=matchid)
 WHERE player LIKE 'Mario%';

--Question 5
--Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
SELECT player, teamid, coach, gtime
  FROM goal 
  JOIN eteam ON (teamid=id)
 WHERE gtime<=10;

--Question 6
SELECT mdate,teamname
  FROM game 
  JOIN eteam ON (team1= eteam.id)
 WHERE coach ='Fernando Santos'


--Question 7
--List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
SELECT player 
  FROM game 
  JOIN goal ON(id=matchid)
 WHERE stadium = 'National Stadium, Warsaw';

--Question 8
--Show the name of all players who scored a goal against Germany.
SELECT DISTINCT player 
  FROM game 
  JOIN goal ON id=matchid
 WHERE teamid!='GER' AND (team1='GER' XOR team2='GER');

--Question 9
--Show teamname and the total number of goals scored.
SELECT teamname, COUNT(gtime)
  FROM eteam 
  JOIN goal ON id=teamid
 GROUP BY teamname;

--Question 10
--Show the stadium and the number of goals scored in each stadium.
SELECT stadium, COUNT(gtime)
  FROM game 
  JOIN goal ON (id=matchid)
 GROUP BY stadium;


--Question 11
--For every match involving 'POL', show the matchid, date and the number of goals scored.
SELECT matchid, mdate, COUNT(teamid)
  FROM game 
  JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')
 GROUP BY matchid, mdate;

--Question 12
-- For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'

SELECT DISTINCT matchid, mdate, COUNT(teamid)
  FROM game 
  JOIN goal ON matchid = id 
 WHERE (teamid ='GER')
 GROUP BY  matchid, mdate;


--Question 13
SELECT mdate, team1, 
SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
team2,
SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
FROM game LEFT JOIN goal ON (id=matchid)
GROUP BY mdate, teamid, team1,team2
ORDER BY mdate;