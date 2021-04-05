-- SQL tasks from https://sqlzoo.net/wiki/SQL_Tutorial

/*
===============================================================
**                                                           **
***** *****            TUTORIAL - 5            ***** *****   **
**                                                           **
===============================================================
*/

-- 1-Task solution: Show the total population of the world.
SELECT SUM(population)
FROM world


-- 2-Task solution: List all the continents - just once each.
SELECT DISTINCT continent
FROM world


-- 3-Task solution: Give the total GDP of Africa
SELECT SUM(gdp)
FROM world
WHERE continent = 'Africa'


-- 4-Task solution: How many countries have an area of at least 1000000
SELECT COUNT(area)
FROM world
WHERE area > 1000000


-- 5-Task solution: What is the total population of ('Estonia', 'Latvia', 'Lithuania')
SELECT SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania')


-- 6-Task solution:  For each continent show the continent and number of countries.
SELECT continent, COUNT(name)
FROM world
GROUP BY continent


-- 7-Task solution: For each continent show the continent and number of countries with populations of at least 10 million.
SELECT continent, COUNT(name)
FROM world
WHERE population > 10000000
GROUP BY continent


-- 8-Task solution: List the continents that have a total population of at least 100 million.
SELECT continent
FROM world x
WHERE 100000000 < ALL(SELECT SUM(population)
                        FROM world y
                       WHERE x.continent = y.continent
)
GROUP BY continent