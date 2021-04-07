--https://sqlzoo.net/wiki/Nobel_Quiz

--Question 1
--The code which shows the name of winner's names beginning with C and ending in n
SELECT winner 
  FROM nobel
 WHERE winner LIKE 'C%' AND winner LIKE '%n';

--Question 2
--The code that shows how many Chemistry awards were given between 1950 and 1960
SELECT COUNT(subject) FROM nobel
 WHERE subject = 'Chemistry'
   AND yr BETWEEN 1950 and 1960;

--Question 3
--The code that shows the amount of years where no Medicine awards were given
SELECT COUNT(DISTINCT yr) 
  FROM nobel
 WHERE yr NOT IN (SELECT DISTINCT yr FROM nobel WHERE subject = 'Medicine');

--Question 4
-- Select the result that would be obtained from the following code:
SELECT subject, winner 
  FROM nobel 
 WHERE winner LIKE 'Sir%' 
 AND yr LIKE '196%';
--  Answer:=> Medicine	Sir John Eccles
--            Medicine	Sir Frank Macfarlane Burnet


--Question 5
--The code which would show the year when neither a Physics or Chemistry award was given
SELECT yr 
  FROM nobel
 WHERE yr NOT IN(SELECT yr 
                  FROM nobel
                 WHERE subject IN ('Chemistry','Physics'));

--Question 6
--The code which shows the years when a Medicine award was given but no Peace or Literature award was
SELECT DISTINCT yr
  FROM nobel
 WHERE subject='Medicine' 
   AND yr NOT IN(SELECT yr FROM nobel 
                  WHERE subject='Literature')
   AND yr NOT IN (SELECT yr FROM nobel
                   WHERE subject='Peace');

--Question 7
--Pick the result that would be obtained from the following code:
SELECT subject, COUNT(subject) 
  FROM nobel 
 WHERE yr ='1960' 
 GROUP BY subject

--Answer :=> 
-- Chemistry	1
-- Literature	1
-- Medicine	2
-- Peace	1
-- Physics	1
