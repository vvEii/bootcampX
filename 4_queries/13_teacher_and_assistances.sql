--SELECT name of teachers that assisted and total number of assistances during cohort 'JUL02'
SELECT DISTINCT teachers.name AS teacher, cohorts.name AS cohort, COUNT(assistance_requests) AS total_assistance
FROM teachers
  JOIN assistance_requests ON teachers.id = teacher_id
  JOIN students ON student_id = students.id
  JOIN cohorts ON cohort_id = cohorts.id
WHERE  cohorts.name = 'JUL02'
GROUP BY teachers.name, cohorts.name
ORDER BY teacher;