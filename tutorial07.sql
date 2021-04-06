-- SQL tasks from https://sqlzoo.net/wiki/SQL_Tutorial

/*
***************************************************************
**                                                           **
***** ***   TUTORIAL - 7 - More JOIN operations  *** *****   **
**                                                           **
***************************************************************
*/

-- 1-Task solution: List the films where the yr is 1962 [Show id, title]
SELECT id, title
 FROM movie
 WHERE yr=1962


-- 2-Task solution: Give year of 'Citizen Kane'.
SELECT yr
FROM movie
WHERE title = 'Citizen Kane'


-- 3-Task solution: List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.

SELECT id, title, yr
 FROM movie
 WHERE title LIKE '%Star Trek%'
 ORDER BY yr


-- 4-Task solution: What id number does the actor 'Glenn Close' have?

SELECT id
 FROM actor
 WHERE name = 'Glenn Close'


-- 5-Task solution: What is the id of the film 'Casablanca'

SELECT id
FROM movie
WHERE title =  'Casablanca' 


-- 6-Task solution: The cast list is the names of the actors who were in the movie. Use movieid=11768, (or whatever value you got from the previous question)

SELECT name
FROM casting JOIN actor ON casting.actorid = actor.id
WHERE movieid=11768


-- 7-Task solution: Obtain the cast list for the film 'Alien'
SELECT name
FROM casting JOIN actor ON casting.actorid = actor.id
WHERE movieid = (SELECT id FROM movie WHERE title = 'Alien')


-- 8-Task solution: List the films in which 'Harrison Ford' has appeared

SELECT title
FROM casting 
  JOIN movie ON casting.movieid = movie.id
  JOIN actor ON casting.actorid = actor.id
WHERE name = 'Harrison Ford'


-- 9-Task solution: List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]

SELECT title
FROM casting 
  JOIN movie ON casting.movieid = movie.id
  JOIN actor ON casting.actorid = actor.id
WHERE name = 'Harrison Ford' AND ord != 1


-- 10-Task solution: List the films together with the leading star for all 1962 films.

SELECT title, name
FROM casting 
  JOIN movie ON casting.movieid = movie.id
  JOIN actor ON casting.actorid = actor.id
WHERE yr = 1962 AND ord = 1


-- 11-Task solution: Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies

SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2


-- 12-Task solution: List the film title and the leading actor for all of the films 'Julie Andrews' played in.

SELECT title, name
FROM movie JOIN casting ON (movieid = movie.id AND ord=1)
           JOIN actor ON (actorid=actor.id)
WHERE movie.id IN (
      SELECT movieid FROM casting
         WHERE actorid IN (
           SELECT id FROM actor
              WHERE name='Julie Andrews'))


-- 13-Task solution: Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles

SELECT name
FROM actor
  JOIN casting ON (id = actorid AND (SELECT COUNT(ord) FROM casting WHERE actorid = actor.id AND ord=1)>=15)
GROUP BY name


-- 14-Task solution: List the films released in the year 1978 ordered by the number of actors in the cast, then by title.

SELECT title, COUNT(actorid)
FROM movie JOIN casting ON (movie.id = movieid)
WHERE yr = 1978
GROUP BY title
ORDER BY COUNT(actorid) DESC, title


-- 15-Task solution: List all the people who have worked with 'Art Garfunkel'.

SELECT name
FROM actor JOIN casting ON (actor.id = actorid)
WHERE movieid IN
  (SELECT id FROM movie WHERE title IN
     (SELECT title FROM movie JOIN casting ON movie.id = movieid WHERE actorid IN
       (SELECT id FROM actor WHERE name = 'Art Garfunkel')))
AND name != 'Art Garfunkel'