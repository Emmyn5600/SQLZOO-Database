-- SQL tasks from https://sqlzoo.net/wiki/SQL_Tutorial

/*
===============================================================
**                                                           **
***** *****     TUTORIAL - 0 - SELECT basics   ***** *****   **
**                                                           **
===============================================================
*/

-- 1-Task solution:

SELECT population FROM world
  WHERE name = 'Germany'

-- 2-Task solution:

SELECT name, population FROM world
  WHERE name IN ('Sweden','Norway', 'Denmark');

-- 3-Task solution:

  SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000


