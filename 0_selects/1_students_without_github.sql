--SELECT student without github
SELECT id, name, email, cohort_id
FROM students
WHERE github IS NULL
ORDER BY cohort_id;

-- table join example to get rollover students
SELECT students.name AS student_name, cohorts.name AS cohort_name, cohorts.start_date AS cohort_start_date, students.start_date AS student_start_date
FROM cohorts JOIN students on cohort_id = cohorts.id
WHERE students.start_date != cohorts.start_date; 