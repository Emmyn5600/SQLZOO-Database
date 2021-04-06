-- SQL tasks from sqlzoo.net

/*
***************************************************************
**                                                           **
***** *****      TUTORIAL - 8 - Using Null     ***** *****   **
**                                                           **
***************************************************************
*/

-- 1-Task solution: List the teachers who have NULL for their department.

SELECT name
FROM teacher
WHERE dept IS NULL


-- 2-Task solution: Note the INNER JOIN misses the teachers with no department and the departments with no teacher.

SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)


-- 3-Task solution: Use a different JOIN so that all teachers are listed.

SELECT teacher.name, dept.name
  FROM teacher LEFT JOIN dept ON (teacher.dept = dept.id)


-- 4-Task solution: Use a different JOIN so that all departments are listed.

SELECT teacher.name,dept.name
FROM dept LEFT JOIN teacher ON (dept.id = teacher.dept)


-- 5-Task solution: Use COALESCE to print the mobile number. Use the number '07986 444 2266' if there is no number given. Show teacher name and mobile number or '07986 444 2266'

SELECT teacher.name, COALESCE(mobile,'07986 444 2266')
FROM teacher LEFT JOIN dept ON (teacher.dept = dept.id)


-- 6-Task solution: Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. Use the string 'None' where there is no department.

SELECT teacher.name, COALESCE(dept.name, 'None')
FROM teacher LEFT JOIN dept ON (teacher.dept = dept.id)


-- 7-Task solution: Use COUNT to show the number of teachers and the number of mobile phones.

SELECT COUNT(name), COUNT(mobile)
FROM teacher


-- 8-Task solution: Use COUNT and GROUP BY dept.name to show each department and the number of staff. Use a RIGHT JOIN to ensure that the Engineering department is listed.

SELECT dept.name, COUNT(teacher.name)
FROM teacher RIGHT JOIN dept ON (teacher.dept = dept.id)
GROUP BY dept.name


-- 9-Task solution: Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2 and 'Art' otherwise.

SELECT name,
CASE WHEN dept IS NULL THEN 'Art'
     ELSE 'Sci'
END
FROM teacher


-- 10-Task solution: Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, show 'Art' if the teacher's dept is 3 and 'None' otherwise.

SELECT name,
CASE WHEN dept = 1 THEN 'Sci'
     WHEN dept = 2 THEN 'Sci'
     WHEN dept = 3 THEN 'Art'
     ELSE 'None'
END
FROM teacher