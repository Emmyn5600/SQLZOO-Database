-- SQL tasks from https://sqlzoo.net/wiki/SQL_Tutorial

/*
===============================================================
**                                                           **
***** *****     TUTORIAL - 1 - SELECT name     ***** *****   **
**                                                           **
===============================================================
*/

-- 1-Task solution: Find the country that start with Y

SELECT name FROM world
WHERE name LIKE 'Y%'

-- 2-Task solution: Find the countries that end with y

SELECT name FROM world
WHERE name LIKE '%y'

-- 3-Task solution: Find the countries that contain the letter x

SELECT name FROM world
WHERE name LIKE '%x%'

-- 4-Task solution: Find the countries that end with land

SELECT name FROM world
WHERE name LIKE '%land'

-- 5-Task solution: Find the countries that start with C and end with ia

SELECT name FROM world
WHERE name LIKE 'C%ia'

-- 6-Task solution: Find the country that has oo in the name

SELECT name FROM world
WHERE name LIKE '%oo%'

-- 7-Task solution: Find the countries that have three or more a in the name

SELECT name FROM world
WHERE name LIKE '%a%a%a%'

  -- 8-Task solution: Find the countries that have "t" as the second character.

SELECT name FROM world
WHERE name LIKE '_t%'
ORDER BY name

  -- 9-Task solution: Find the countries that have two "o" characters separated by two others.

SELECT name FROM world
WHERE name LIKE '%o__o%'

  -- 10-Task solution: Find the countries that have exactly four characters.

SELECT name FROM world
WHERE name LIKE '____'

  -- 11-Task solution: Find the country where the name is the capital city.

SELECT name
FROM world
WHERE name LIKE capital

  -- 12-Task solution: Find the country where the capital is the country plus "City".

SELECT name
  FROM world
 WHERE capital = concat (name , ' City')

-- 13-Task solution: Find the capital and the name where the capital includes the name of the country.

SELECT capital, name
FROM world
WHERE capital LIKE concat(name, '%')

-- 14-Task solution: Find the capital and the name where the capital is an extension of name of the country.

SELECT capital, name
FROM world
WHERE capital LIKE concat(name, '%') AND NOT capital = name

-- 15-Task solution: For Monaco-Ville the name is Monaco and the extension is -Ville..
-- Show the name and the extension where the capital is an extension of name of the country.

SELECT name, REPLACE(capital, name, '') AS ext
FROM world
WHERE capital LIKE concat(name, '_%')


