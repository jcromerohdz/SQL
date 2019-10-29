SELECT name, continent, population FROM world


-- Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros.
SELECT name FROM world
WHERE population >= 200000000

-- Give the name and the per capita GDP for those countries with a population of at least 200 million.
SELECT name, gdp/population FROM world
WHERE population >= 200000000

-- Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.
SELECT name, population/1000000 FROM world
WHERE continent = 'South America'

-- Show the name and population for France, Germany, Italy
SELECT name, population FROM world
WHERE name IN('France', 'Germany', 'Italy')

-- Show the countries which have a name that includes the word 'United'
SELECT name FROM world
WHERE name LIKE '%United%'

-- A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million.
SELECT name, population, area FROM world
WHERE area >= 3000000 OR population >= 250000000;

-- Show the countries that are big by area or big by population but not both.
SELECT name, population, area FROM world
WHERE area >= 3000000 XOR population >= 250000000;

-- Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'.
SELECT name, ROUND(population/1000000, 2) AS population_in_millions, ROUND(GDP/1000000000, 2) AS GDP_in_Billions FROM world
WHERE continent = 'South America'

-- Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000.
SELECT name, ROUND((GDP/population), -3) AS Per_Capita_GDP FROM world
WHERE GDP >= 1000000000000;

-- Show the name and capital where the name and the capital have the same number of characters.
SELECT name, capital
  FROM world
 WHERE LENGTH(name) = LENGTH(capital);

-- Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
SELECT name, capital
FROM world
where LEFT(name,1) = LEFT(capital,1) AND NOT name = capital;

-- Find the country that has all the vowels and no spaces in its name.
SELECT name
   FROM world
WHERE name LIKE '%a%'
  AND name LIKE '%e%'
  AND name LIKE '%i%'
  AND name LIKE '%o%'
  AND name LIKE '%u%'
  AND name NOT LIKE '% %'