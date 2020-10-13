--SELECT cohorts with 18 or more students
SELECT cohorts.name AS cohort_name, COUNT(cohorts.id) AS student_count
FROM cohorts
  JOIN students ON cohorts.id = students.cohort_id
GROUP BY cohort_name
HAVING COUNT(cohorts.id) >= 18
ORDER BY student_count;