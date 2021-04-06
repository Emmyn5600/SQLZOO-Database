-- SQL tasks from https://sqlzoo.net/wiki/SQL_Tutorial

/*
***************************************************************
**                                                           **
***** ***** TUTORIAL - 9 - Window functions     ***** *****   **
**                                                           **
***************************************************************
*/

-- 1-Task solution: Show the lastName, party and votes for the constituency 'S14000024' in 2017.

SELECT lastName, party, votes
  FROM ge
 WHERE constituency = 'S14000024' AND yr = 2017
ORDER BY votes DESC


-- 2-Task solution: Show the party and RANK for constituency S14000024 in 2017. List the output by party

SELECT party, votes,
       RANK() OVER (ORDER BY votes DESC) as posn
  FROM ge
 WHERE constituency = 'S14000024' AND yr = 2017
ORDER BY party


-- 3-Task solution: Use PARTITION to show the ranking of each party in S14000021 in each year. Include yr, party, votes and ranking (the party with the most votes is 1).

SELECT yr,party, votes,
      RANK() OVER (PARTITION BY yr ORDER BY votes DESC) as posn
  FROM ge
 WHERE constituency = 'S14000021'
ORDER BY party,yr


-- 4-Task solution: Use PARTITION BY constituency to show the ranking of each party in Edinburgh in 2017. Order your results so the winners are shown first, then ordered by constituency.

SELECT constituency,party, votes,
  RANK() OVER (PARTITION BY constituency ORDER BY votes DESC) as posn
  FROM ge
 WHERE constituency BETWEEN 'S14000021' AND 'S14000026'
   AND yr  = 2017
ORDER BY posn, constituency


-- 5-Task solution: Show the parties that won for each Edinburgh constituency in 2017.

select  constituency,party from 
(
SELECT constituency,party, votes , 
rank() OVER (PARTITION BY constituency order by votes desc) rn
  FROM ge
 WHERE constituency BETWEEN 'S14000021' AND 'S14000026'
   AND yr  = 2017
ORDER BY constituency,votes DESC
) TAB WHERE rn =1


-- 6-Task solution: You can use COUNT and GROUP BY to see how each party did in Scotland. Scottish constituencies start with 'S'

SELECT party , COUNT(*)
FROM ge x 
WHERE constituency like 'S%'
AND yr  = 2017 AND votes >= ALL(SELECT votes FROM ge y  WHERE x.constituency = y. constituency AND y.yr = 2017)
GROUP BY party