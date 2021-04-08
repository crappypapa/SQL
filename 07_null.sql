--https://sqlzoo.net/wiki/Using_Null

--Question 1
--List the teachers who have NULL for their department.
SELECT name
  FROM teacher
 WHERE dept IS NULL;

--Question 2
--Note the INNER JOIN misses the teachers with no department and the departments with no teacher.
SELECT teacher.name, dept.name
FROM teacher 
INNER JOIN dept ON (teacher.dept=dept.id);


--Question 3
--Use a different JOIN so that all teachers are listed.
SELECT teacher.name, dept.name
  FROM teacher
  LEFT JOIN dept ON teacher.dept = dept.id;


--Question 4
--Use a different JOIN so that all departments are listed.
SELECT teacher.name, dept.name 
  FROM dept
  LEFT JOIN teacher ON teacher.dept = dept.id;


--Question 5
--Show teacher name and mobile number or '07986 444 2266'
SELECT name, COALESCE(mobile, '07986 444 2266') AS mobile
FROM teacher;


--Question 6
--Use the COALESCE function and a LEFT JOIN to print the teacher name and department name.
SELECT teacher.name, COALESCE(dept.name, 'None') 
  FROM teacher
  LEFT JOIN dept on teacher.dept = dept.id;


--Question 7
--Use COUNT to show the number of teachers and the number of mobile phones.
SELECT COUNT(teacher.name), COUNT(teacher.mobile) 
  FROM teacher;


--Question 8
--Use COUNT and GROUP BY dept.name to show each department and the number of staff. Use a RIGHT JOIN to ensure that the Engineering department is listed.
SELECT dept.name, COUNT(teacher.name)
  FROM teacher
 RIGHT JOIN dept on teacher.dept = dept.id
 GROUP BY dept.name;


--Question 9
--Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2 and 'Art' otherwise.
SELECT name, CASE WHEN dept = 1 OR dept = 2 THEN 'Sci' ELSE 'Art' END dept
FROM teacher


--Question 10
--Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, show 'Art' if the teacher's dept is 3 and 'None' otherwise.
SELECT name, CASE WHEN dept = 1 OR dept = 2 THEN 'Sci' WHEN dept = 3 THEN 'Art' ELSE 'None' END dept
FROM teacher