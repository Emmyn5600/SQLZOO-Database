-- SQL tasks from https://sqlzoo.net/wiki/SQL_Tutorial

/*
===============================================================
**                                                           **
***** *****            TUTORIAL - 4            ***** *****   **
**                                                           **
===============================================================
*/

-- 1-Task solution: List each country name where the population is larger than that of 'Russia'.

SELECT name 
FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

-- 2-Task solution: Show the countries in Europe with a per capita GDP greater than 'United Kingdom'. 

SELECT name 
FROM world 
WHERE continent ='Europe'  AND gdp/population > (SELECT gdp/population FROM world WHERE name='United Kingdom')

-- 3-Task solution: List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.

SELECT name, continent
FROM world
WHERE continent = (SELECT continent FROM world WHERE name = 'Argentina')
  OR continent = (SELECT continent FROM world WHERE name = 'Australia')
ORDER BY name

-- 4-Task solution: Which country has a population that is more than Canada but less than Poland? Show the name and the population.

SELECT name, population
FROM world
WHERE population > (SELECT population FROM world WHERE name = 'Canada')
  AND population < (SELECT population FROM world WHERE name = 'Poland')


-- 5-Task solution: Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.




-- 6-Task solution: Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)

SELECT name
FROM world
WHERE gdp > (SELECT MAX(gdp)
               FROM world
              WHERE continent = 'Europe')

-- 7-Task solution: Find the largest country (by area) in each continent, show the continent, the name and the area

SELECT continent, name, area
FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area >0)

-- 8-Task solution: List each continent and the name of the country that comes first alphabetically.

SELECT continent, MIN(name) AS name
FROM world
GROUP BY continent


-- 9-Task solution: Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.

SELECT name, continent, population
FROM world x
WHERE 25000000 >= ALL(SELECT population
                        FROM world y
                       WHERE x.continent = y.continent
                         AND y.population>0)

-- 10-Task solution: Some countries have populations more than three times that of any of their neighbours (in the same continent). Give the countries and continents.

SELECT name, continent
FROM world x
WHERE population > ALL(SELECT population*3
                         FROM world y
                        WHERE x.continent = y.continent
                          AND y.name != x.name)
      