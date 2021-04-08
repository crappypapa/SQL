-- https://sqlzoo.net/wiki/Self_join


-- Question 1
-- How many stops are in the database.
SELECT COUNT(*) 
  FROM stops;

--Question 2
-- Find the id value for the stop 'Craiglockhart'
SELECT DISTINCT stops.id 
  FROM stops
  JOIN route ON route.stop = stops.id
 WHERE stops.name = 'Craiglockhart';


--Question 3
--Give the id and the name for the stops on the '4' 'LRT' service.
SELECT DISTINCT id, name 
  FROM stops
  JOIN route ON route.stop = stops.id
 WHERE route.num = '4' AND route.company = 'LRT';

--Question 4
--Run the query and notice the two services that link these stops have a count of 2. Add a HAVING clause to restrict the output to these two 
SELECT company, num, COUNT(*)
  FROM route WHERE stop=149 OR stop=53
 GROUP BY company, num
HAVING COUNT(*) > 1;


--Question 5
--Execute the self join shown and observe that b.stop gives all the places you can get to from Craiglockhart, without changing routes. Change the query so that it shows the services from Craiglockhart to London Road.
SELECT a.company, a.num, a.stop, b.stop
  FROM route a
  JOIN route b ON (a.company=b.company AND a.num=b.num)
 WHERE a.stop=53 AND b.stop=149;4


--Question 6
--Change the query so that the services between 'Craiglockhart' and 'London Road' are shown. If you are tired of these places try 'Fairmilehead' against 'Tollcross'
SELECT a.company, a.num, stopa.name, stopb.name
  FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
 WHERE stopa.name='Craiglockhart' AND stopb.name = 'London Road';


--Question 7
--Give a list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith')
SELECT DISTINCT a.company, a.num
  FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
 WHERE stopa.name='Haymarket' AND stopb.name = 'Leith';


--Question 8
--Give a list of the services which connect the stops 'Craiglockhart' and 'Tollcross'
SELECT DISTINCT a.company, a.num
  FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
 WHERE stopa.name='Craiglockhart' AND stopb.name = 'Tollcross';


--Question 9
--Give a distinct list of the stops which may be reached from 'Craiglockhart' by taking one bus, including 'Craiglockhart' itself, offered by the LRT company. Include the company and bus no. of the relevant services.
SELECT DISTINCT name, a.company, a.num 
  FROM route a
  JOIN route b ON (a.company = b.company AND a.num = b.num)
  JOIN stops ON a.stop = stops.id
 WHERE b.stop = 53;