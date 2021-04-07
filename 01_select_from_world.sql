--https://sqlzoo.net/wiki/BBC_QUIZ

--Question 1
--The code which gives the name of countries beginning with U
SELECT name
  FROM world
 WHERE name LIKE 'U%';

--Question 2
--The code which shows just the population of United Kingdom
SELECT population
  FROM world
 WHERE name = 'United Kingdom';

-- Question 3
--the answer which shows the problem with this SQL code - the intended result should be the continent of France
SELECT continent 
  FROM world 
 WHERE 'name' = 'France';  --ANSWER:=> 'name' should be name

--Question 4

SELECT name, population / 10 
  FROM world 
 WHERE population < 10000; --ANSWER:=> Nauru	990

--Question 5
--The code which would reveal the name and population of countries in Europe and Asia
SELECT name, population
  FROM world
 WHERE continent IN ('Europe', 'Asia');

--Question 6
--The code which would give two rows
SELECT name 
  FROM world
 WHERE name IN ('Cuba', 'Togo');

 --Question 7

 SELECT name FROM world
 WHERE continent = 'South America'
   AND population > 40000000;    -- Answer:=> Brazil, Colombia
