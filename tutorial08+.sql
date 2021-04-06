-- SQL tasks from https://sqlzoo.net/wiki/SQL_Tutorial

/*
***************************************************************
**                                                           **
***** *****  TUTORIAL - 8+  Numeric Examples   ***** *****   **
**                                                           **
***************************************************************
*/

-- 1-Task solution: Show the the percentage who STRONGLY AGREE

SELECT A_STRONGLY_AGREE
  FROM nss
 WHERE question='Q01'
   AND institution='Edinburgh Napier University'
   AND subject='(8) Computer Science'


-- 2-Task solution: Show the institution and subject where the score is at least 100 for question 15.

SELECT institution, subject
  FROM nss
 WHERE score >= 100
   AND question='Q15'


-- 3-Task solution: Show the institution and score where the score for '(8) Computer Science' is less than 50 for question 'Q15'

SELECT institution,score
  FROM nss
 WHERE score <= 50 AND question='Q15'
   AND subject='(8) Computer Science'


-- 4-Task solution: Show the subject and total number of students who responded to question 22 for each of the subjects '(8) Computer Science' and '(H) Creative Arts and Design'.

SELECT subject,SUM(response)
  FROM nss
 WHERE question='Q22'
   AND (subject='(H) Creative Arts and Design'
   OR subject='(8) Computer Science')
GROUP BY subject


-- 5-Task solution: 

SELECT subject, SUM(response*A_STRONGLY_AGREE/100)
  FROM nss
 WHERE question='Q22'
   AND (subject='(H) Creative Arts and Design'
   OR subject='(8) Computer Science')
GROUP BY subject


-- 6-Task solution: Show the percentage of students who A_STRONGLY_AGREE to question 22 for the subject '(8) Computer Science' show the same figure for the subject '(H) Creative Arts and Design'.

SELECT subject, ROUND(SUM(response*A_STRONGLY_AGREE)/SUM(response),0) FROM nss
WHERE question='Q22' AND subject IN ('(8) Computer Science','(H) Creative Arts and Design')
GROUP BY subject


-- 7-Task solution: Show the average scores for question 'Q22' for each institution that include 'Manchester' in the name.

SELECT institution, ROUND(SUM(response*score)/SUM(response),0) FROM nss
WHERE question='Q22' AND (institution LIKE '%Manchester%') GROUP BY institution


-- 8-Task solution: Show the institution, the total sample size and the number of computing students for institutions in Manchester for 'Q01'.

SELECT institution,
       SUM(sample),
       (SELECT sample FROM nss y
         WHERE subject='(8) Computer Science'
         AND x.institution = y.institution
         AND question='Q01') AS comp
  FROM nss x
 WHERE question='Q01'
   AND (institution LIKE '%Manchester%')
   GROUP BY institution