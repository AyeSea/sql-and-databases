-- The JOIN operation

-- 1. Show matchid and player name for all goals scored by Germany. (teamid = 'GER')
			SELECT matchid, player
			FROM goal
			WHERE teamid = 'GER';

-- 2. Show id, stadium, team1, team2 for game 1012
			SELECT id, stadium, team1, team2
			FROM game
			WHERE id = 1012;

-- 3. Show the player, teamid and mdate and for every German goal. teamid='GER'
			SELECT player, teamid, mdate
			FROM game JOIN goal ON (id = matchid)
			WHERE teamid = 'GER';

-- 4. Show the team1, team2 and player for every goal scored by a player called Mario (player LIKE 'Mario%')
			SELECT team1, team2, player
			FROM game JOIN goal ON (id = matchid)
			WHERE player LIKE 'Mario%';

-- 5. Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
			SELECT player, teamid, coach, gtime
			FROM goal JOIN eteam ON (teamid = id)
			WHERE gtime <= 10;

-- 6. List the the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
			SELECT mdate, teamname
			FROM game JOIN eteam ON (team1 = eteam.id)
			WHERE coach = 'Fernando Santos';

-- 7. List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
			SELECT player
			FROM game JOIN goal ON (id = matchid)
			WHERE stadium = 'National Stadium, Warsaw';

-- 8. Instead show the name of all players who scored a goal against Germany.
			SELECT distinct player
			FROM game JOIN goal ON (id = matchid)
			WHERE teamid <> 'GER' AND (team1 = 'GER' OR team2 = 'GER');

-- 9. Show teamname and the total number of goals scored.
			SELECT teamname, COUNT(*)
			FROM goal JOIN eteam ON (teamid = id)
			GROUP BY teamname;

--10. Show the stadium and the number of goals scored in each stadium.
			SELECT stadium, COUNT(*)
			FROM game JOIN goal ON (id = matchid)
			GROUP BY stadium;

--11. For every match involving 'POL', show the matchid, date and the number of goals scored.
			SELECT matchid, mdate, COUNT(*)
			FROM game JOIN goal ON (id = matchid)
			WHERE team1 = 'POL' OR team2 = 'POL'
			GROUP BY matchid;

--12. For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
			SELECT matchid, mdate, COUNT(*)
			FROM game JOIN goal ON (id = matchid)
			WHERE teamid = 'GER'
			GROUP BY matchid;

--13. List every match with the goals scored by each team as shown.
	 -- This will use "CASE WHEN" which has not been explained in any previous exercises.
	 		SELECT mdate,
  		team1, SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) as score1,
  		team2, SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) as score2
  		FROM game LEFT OUTER JOIN goal ON (id = matchid)
  		GROUP BY id
  		ORDER BY mdate, matchid, team1, team2;

-- Exercises from Old JOIN Tutorial

-- 1. Show the athelete (who) and the country name for medal winners in 2000.
			SELECT who, name
			FROM ttms JOIN country ON (country = id)
			WHERE games = 2000;

-- 2. Show the who and the color of the medal for the medal winners from 'Sweden'.
			SELECT who, color
			FROM ttms JOIN country ON (country = id)
			WHERE name = 'Sweden';

-- 3. Show the years in which 'China' won a 'gold' medal.
			SELECT games
			FROM ttms JOIN country ON (country = id)
			WHERE name = 'China' AND color = 'gold';

-- 4. Show who won medals in the 'Barcelona' games.
			SELECT who
			FROM ttws JOIN games ON (games = yr)
			WHERE city = 'Barcelona';

-- 5. Show which city 'Jing Chen' won medals. Show the city and the medal color.
			SELECT city, color
			FROM ttws JOIN games ON (games = yr)
			WHERE who = 'Jing Chen';

-- 6. Show who won the gold medal and the city.
			SELECT who, city
			FROM ttws JOIN games ON (games = yr)
			WHERE color = 'gold';

-- 7. Show the games and color of the medal won by the team that includes 'Yan Sen'.
			SELECT games, color
			FROM ttmd JOIN team ON (team = id)
			WHERE name = 'Yan Sen';

-- 8. Show the 'gold' medal winners in 2004.
			SELECT name
			FROM ttmd JOIN team ON (team = id)
			WHERE games = 2004 AND color = 'gold';

-- 9. Show the name of each medal winner country 'FRA'.
			SELECT name
			FROM ttmd JOIN team ON (team = id)
			WHERE country = 'FRA';