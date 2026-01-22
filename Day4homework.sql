Q1.Find the names of students who improved their scores every single day (Day 3 > Day 2 AND Day 2 > Day 1). 
  Also, display the name of the Month they were born in using a date function.
SELECT full_name,
TO_CHAR(dob,'MONTH') AS BIRTH_MONTH,
T2.total_score AS DAY1,
T3.total_score AS DAY2,
T4.total_score AS DAY3
FROM "RSVP_New" AS T1
JOIN day_1_exam AS T2
ON T1.hall_ticket_no = T2.hall_ticket_no
JOIN day_2_exam AS T3
ON T2.hall_ticket_no = T3.hall_ticket_no
JOIN day_3_exam AS T4
ON T1.hall_ticket_no = T4.hall_ticket_no
WHERE T3.total_score > T2.total_score AND  T4.total_score > T3.total_score


Q2.List the names and contact numbers of students who attended the Day 1 AND Day 2 exams, but EXCEPT those who showed up for Day 3.
select
full_name,
contact_no
from "RSVP_New"
where hall_ticket_no in(
  select
  hall_ticket_no from day_1_exam
  intersect
  select hall_ticket_no from day_2_exam
  except
  select hall_ticket_no from day_3_exam 
)

Q3.Find the students who registered in the Morning (before 12:00 PM) and scored higher than the average class score of Day 3.
SELECT
full_name,
created_at,
total_score
FROM
"RSVP_New" AS T1
JOIN day_3_exam AS T2
ON T1.hall_ticket_no = T2.hall_ticket_no
WHERE
EXTRACT(HOUR FROM created_at) < 12 AND
total_score > (SELECT AVG(total_score) FROM day_3_exam)
ORDER BY total_score DESC


Q4.Create a master leaderboard. Combine the Hall Ticket Numbers and scores from all 3 days. 
Use a CASE statement to label them: if the combined score across all 3 days is >120, they are a 'GOAT', otherwise 'Rising Legend'
SELECT
T1.hall_ticket_no,
(SUM(T2.total_score) + SUM(T3.total_score) + SUM(T4.total_score)) AS TOTAL_POINTS,
CASE
WHEN (SUM(T2.total_score) + SUM(T3.total_score) + SUM(T4.total_score)) > 120 THEN 'GOAT'
ELSE 'RISING LEGEND'
END AS FINAL_STATUS
FROM "RSVP_New" AS T1
JOIN day_1_exam AS T2
ON T1.hall_ticket_no = T2.hall_ticket_no
JOIN day_2_exam AS T3
ON T1.hall_ticket_no = T3.hall_ticket_no
JOIN day_3_exam AS T4
ON T1.hall_ticket_no = T4.hall_ticket_no
GROUP BY T1.hall_ticket_no
ORDER BY 2 DESC
