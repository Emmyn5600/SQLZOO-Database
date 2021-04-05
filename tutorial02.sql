-- SQL tasks from https://sqlzoo.net/wiki/SQL_Tutorial

/*
===============================================================
**                                                           **
***** *****            TUTORIAL - 2            ***** *****   **
**                                                           **
===============================================================
*/

-- 1-Task solution:

SELECT name, continent, population FROM world

-- 2-Task solution: Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros.

SELECT name
FROM world
WHERE population > 200000000

-- 3-Task solution: Give the name and the per capita GDP for those countries with a population of at least 200 million.

SELECT name, GDP/population
FROM world
where population > 200000000

-- 4-Task solution: Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.

SELECT name, population/1000000 
FROM world
WHERE continent = 'South America'


-- 5-Task solution: Show the name and population for France, Germany, Italy

SELECT name, population FROM world
where name in ('France','Germany', 'Italy');


-- 6-Task solution: Show the countries which have a name that includes the word 'United'

SELECT name
FROM world
WHERE name LIKE '%united%'

-- 7-Task solution: Show the countries that are big by area or big by population. Show name, population and area.

SELECT name, population, area FROM world where area > 3000000 or population > 250000000

-- 8-Task solution:  Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.

SELECT name, population, area
FROM world
WHERE (area < 3000000 AND population > 250000000) OR (area > 3000000 AND population < 250000000)

-- 9-Task solution: Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'.

SELECT name,ROUND(population/1000000,2), ROUND(gdp/1000000000,2)
FROM world
WHERE continent = 'South America'

-- 10-Task solution:

-- 11-Task solution:

-- 12-Task solution: