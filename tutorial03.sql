-- SQL tasks from https://sqlzoo.net/wiki/SQL_Tutorial

/*
===============================================================
**                                                           **
***** *****            TUTORIAL - 3            ***** *****   **
**                                                           **
===============================================================
*/

-- 1-Task solution:  Change the query shown so that it displays Nobel prizes for 1950.

SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

-- 2-Task solution: Show who won the 1962 prize for Literature.

SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

-- 3-Task solution: Show the year and subject that won 'Albert Einstein' his prize.

SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein'


-- 4-Task solution: Give the name of the 'Peace' winners since the year 2000, including 2000.

SELECT winner
FROM nobel
WHERE subject = 'Peace' AND yr >= 2000


-- 5-Task solution: Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.

SELECT yr, subject, winner from nobel WHERE subject = 'Literature' AND yr >= 1980 AND yr <=1989 

--OR

SELECT yr, subject, winner
FROM nobel
WHERE subject = 'Literature' AND yr BETWEEN 1980 AND 1989

-- 6-Task solution: Show all details of the presidential winners:Theodore Roosevelt, Woodrow Wilson, Jimmy Carter, Barack Obama

 SELECT * 
FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama')


-- 7-Task solution: Show the winners with first name John

SELECT winner FROM nobel WHERE winner LIKE 'John%'

-- 8-Task solution: Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984.

SELECT yr, subject,winner FROM nobel WHERE (subject = 'Physics'AND yr = 1980) OR (subject = 'Chemistry' AND yr= 1984)

-- 9-Task solution: Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine

SELECT yr, subject, winner FROM nobel WHERE yr = 1980 AND subject != 'Chemistry' AND subject != 'Medicine'

--OR

 SELECT yr, subject, winner
FROM nobel
WHERE yr = 1980 AND NOT subject IN ('Chemistry ', 'Medicine')

-- 10-Task solution : Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)

SELECT yr, subject, winner FROM nobel WHERE (subject = 'Medicine' AND yr < 1910) OR (subject = 'Literature' AND yr >= 2004) 

--OR 

-- 11-Task solution: Find all details of the prize won by PETER GRÜNBERG

SELECT *
FROM nobel
WHERE winner = 'PETER GRÜNBERG'

-- 12-Task solution: Find all details of the prize won by EUGENE O'NEILL

 SELECT *
FROM nobel
WHERE winner = 'EUGENE O''NEILL'

-- 13-Task solution: List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.

SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir%' ORDER BY yr DESC, winner ASC

-- 14-Task solution: The expression subject IN ('Chemistry','Physics') can be used as a value - it will be 0 or 1. Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last.

SELECT winner, subject
FROM nobel
WHERE yr=1984
ORDER BY (subject IN ('Physics','Chemistry')) ASC, subject, winner




