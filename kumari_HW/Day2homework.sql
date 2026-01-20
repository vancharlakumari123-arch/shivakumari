--Q1: Count how many students passed the exam.
  SELECT
  COUNT (student_name) AS STUDENTS_PASSED
  FROM
  day_1_exam
  WHERE result_status = 'Pass'


  
--Q2: Find the average score of all students who failed.
  SELECT
  ROUND(AVG(total_score),2) AS AVERAGE_OF_FAILED_STUDENTS
  FROM
  day_1_exam
  WHERE result_status = 'Fail'
  


--Q3: Get the highest score among all students.
  SELECT
  MAX(total_score) AS HIGHEST_SCORE
  FROM
  day_1_exam


  
--Q4: Get the lowest score among passed students.
  SELECT
  MIN(total_score) AS LOWEST_SCORE
  FROM
  day_1_exam
  WHERE result_status = 'Pass'


  
--Q5: Sum the total marks of all students who scored above 40.
  SELECT
  SUM(total_score) AS SUM_TOTALMARKS
  FROM
  day_1_exam
  WHERE total_score > 40



--Q6: Count students by result status for those who scored 35 or more.
  SELECT
  result_status,
  COUNT(result_status) AS COUNT_OF_STUDENTS
  FROM
  day_1_exam
  WHERE total_score >= 35
  GROUP BY result_status


  
--Q7: Find average score grouped by result status for students with scores between 30 and 40.
  SELECT
  result_status,
  COUNT(result_status)
  FROM
  day_1_exam
  WHERE total_score BETWEEN 30 AND 40
  GROUP BY result_status


    
--Q8: Get maximum and minimum scores grouped by result status for students who scored less than 35.
  SELECT
  result_status,
  MAX(total_score) AS HIGHEST_SCORE,
  MIN(total_score) AS LOWEST_SCORE
  FROM
  day_1_exam
  WHERE total_score < 35
  GROUP BY result_status


    
--Q9: Count students grouped by result status for those whose names start with 'A'.
  SELECT
  result_status,
  COUNT(student_name) AS COUNT_OF_A_NAME
  FROM
  day_1_exam
  WHERE student_name LIKE 'A%'
  GROUP BY result_status


  
--Q10: Sum total scores grouped by result status for students who scored exactly 35, 40, or 45.
  SELECT
  SUM(total_score) AS SUM_OF_35_40_45
  FROM
  day_1_exam
  WHERE total_score = 35 OR total_score = 40 OR total_score = 45
  GROUP BY result_status


    
--Q11: Count students by each score value, ordered by score descending.
  SELECT
  total_score,
  COUNT(total_score) AS COUNT_OF_EACH_SCORE
  FROM
  day_1_exam
  GROUP BY total_score
  ORDER BY total_score DESC


    
--Q12: Show average score for each result status, ordered by average score.
  SELECT
  result_status,
  ROUND(AVG(total_score),2) AS AVERAGE
  FROM
  day_1_exam
  GROUP BY 1
  ORDER BY AVG(total_score) 


    
--Q13: Count how many students got each score, only for scores above 30, ordered by frequency.
  SELECT
  total_score,
  COUNT(total_score) AS COUNT_OF_EACH_SCORE
  FROM
  day_1_exam
  WHERE total_score > 30
  GROUP BY total_score
  ORDER BY total_score 


    
--Q14: Get total marks sum for each result status, ordered by sum.
  SELECT
  result_status,
  SUM(total_score) AS SUM_OF_SCORE
  FROM
  day_1_exam
  GROUP BY result_status
  ORDER BY SUM(total_score)


    
--Q15: Find minimum score for each result status, ordered by min score.
  SELECT
  result_status,
  MIN(total_score) AS LOWEST_SCORE
  FROM
  day_1_exam
  GROUP BY 1
  ORDER BY MIN(total_score)


    
--Q16: For passed students only, show count, average, max and min scores grouped by whether score is above 40.
  SELECT
  total_score,
  COUNT(total_score) AS COUNT_OF_EACH_SCORE,
  ROUND(AVG(total_score),2) AS AVERAGE,
  MAX(total_score) AS HIGHEST_SCORE,
  MIN(total_score) AS LOWEST_SCORE
  FROM
  day_1_exam
  WHERE total_score > 40 AND result_status = 'Pass'
  GROUP BY total_score


    
 Q17: Count and average score for each result status, only for scores not equal to 35.
  SELECT
  result_status,
  COUNT(total_score) AS COUNT_OF_EACH_SCORE,
  ROUND(AVG(total_score),2) AS AVERAGE
  FROM
  day_1_exam
  WHERE NOT total_score = 35
  GROUP BY result_status


 

--Q19: For each result status, show count of students with scores greater than 30 and less than 40.
  SELECT
  result_status,
  COUNT(total_score) AS COUNT_OF_EACH_SCORE
  FROM
  day_1_exam
  WHERE total_score > 30 AND total_score < 40
  GROUP BY result_status
