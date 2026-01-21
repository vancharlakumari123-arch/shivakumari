Q1.Find the Average, Maximum, and Minimum marks obtained in the Day 1 Exam to see how the class performed as a whole.
SELECT
AVG(total_score) AS Average_marks,
MAX(total_score)AS highest_marks,
MIN(total_score) AS lowest_marks
FROM day_1_exam


Q2.List the names of MBA students who scored above 35 on Day 2.
SELECT
T1.full_name,
T2.total_score
FROM
"RSVP_New" AS T1
JOIN day_2_exam AS T2
ON T1.hall_ticket_no = T2.hall_ticket_no
WHERE T2.total_score > 35



Q3.Identify students whose Day 2 score was strictly higher than their Day 1 score.
SELECT
full_name,
T2.total_score AS DAY1,
T3.total_score AS DAY2
FROM
"RSVP_New" AS T1
JOIN day_1_exam AS T2
ON T1.hall_ticket_no = T2.hall_ticket_no
JOIN day_2_exam AS T3
ON T1.hall_ticket_no = T3.hall_ticket_no
WHERE T3.total_score > T2.total_score



Q4.Do passing students work faster? Join day_2_exam with qaday2 to find the average 'Total Time' for students who 'Pass' vs those who 'Fail'.
SELECT
result_status,
AVG("Total Time")
FROM
day_2_exam AS T1
JOIN qaday2 AS T2
ON T1.hall_ticket_no = T2.hall_ticket_no
GROUP BY 1



Q5.Which students have NULLs in Q1 or Q2 but still passed the Day 2 exam? (This helps identify students who skip but are still accurate).
SELECT
T1.hall_ticket_no
FROM
day_2_exam AS T1
JOIN qaday2 AS T2
ON T1.hall_ticket_no = T2.hall_ticket_no
WHERE ("Q1" IS NULL OR "Q2" IS NULL) AND result_status = 'Pass'



Q6.For each department, show the total number of registrations, total students who took Day 1, and total students who took Day 2.
SELECT
T1.department_name,
COUNT (T1.*) AS REGISTRATION,
COUNT (T2.*) AS ATTENDED_DAY1,
COUNT (T3.*) AS ATTENDED_DAY2
FROM
"RSVP_New" AS T1
LEFT JOIN day_1_exam AS T2
ON T1.hall_ticket_no = T2.hall_ticket_no
LEFT JOIN day_2_exam AS T3
ON T1.hall_ticket_no = T3.hall_ticket_no
GROUP BY 1
ORDER BY department_name



Q7.Using the dob (Date of Birth) in RSVP_New, identify students born before the year 2000 as 'Senior Students' and those born in 2000 or later as 'Junior Students'.
SELECT
full_name,
dob,
CASE
WHEN (dob) < DATE '2000-01-01' THEN 'SENIOR STUDENT'
ELSE 'JUNIOR STUDENT'
END AS AGE_GROUP
FROM
"RSVP_New"



Q8.Join day_2_exam with qaday2. Create a logic: If 'Total Time' is less than 1000 and 'Result' is 'Pass', label them as 'High Efficiency'. If they passed but took longer, label them as 'Hard Worker'.
SELECT
T1.hall_ticket_no,
result_status,
"Total Time",
CASE
WHEN "Total Time" < 1000 AND result_status = 'Pass' THEN 'HIGH EFFICIENCY'
WHEN "Total Time" > 1000 AND result_status = 'Pass' THEN 'HARD WORKER'
ELSE 'NEEDS SUPPORT'
END AS EFFICIEMCY_RANK
FROM
day_2_exam AS T1
JOIN qaday2 AS T2
ON T1.hall_ticket_no = T2.hall_ticket_no



Q9.If a student finished Question 1 (Q1) in under 15 seconds, they are 'Quick to Fall in Love.' If they took over 60 seconds, they are 'Hard to Get.' If they skipped (NULL), they are 'Focusing on their Career'.
SELECT
hall_ticket_no,
"Q1",
CASE
WHEN "Q1" < 15 THEN 'Quick to Fall in Love'
WHEN "Q1" > 60 THEN 'Hard to Get'
WHEN "Q1" IS NULL THEN 'Focusing on their Career'
ELSE 'Waiting for the Right One'
END AS LOVE_LOGIC
FROM
qaday2



Q10.Get the full details from RSVP_New for the student who got the absolute maximum score on Day 2.(use subquery)
SELECT
T1.*
FROM
"RSVP_New" AS T1
JOIN day_2_exam AS T2
ON T1.hall_ticket_no = T2.hall_ticket_no
WHERE total_score = (SELECT MAX(total_score) FROM day_2_exam)



Q11.Who registered for the class before 'AMENAH AHSAN'?(use subquery)
SELECT
full_name,
created_at
FROM
"RSVP_New"
WHERE created_at < (select created_at FROM "RSVP_New" WHERE full_name = 'AMENAH AHSAN' )



Q12.Show the details of students who are among the 5 fastest finishers of the Day 2 exam.
SELECT
T1.*
FROM
"RSVP_New" AS T1
JOIN qaday2 AS T2
ON T1.hall_ticket_no = T2.hall_ticket_no
ORDER BY ("Total Time")
LIMIT 5
