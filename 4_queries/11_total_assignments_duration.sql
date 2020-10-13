--SELECT each day with total number of assignments and total duration of assignments
SELECT day, COUNT(assignments) AS number_of_assignments, SUM(duration) AS duration
FROM assignments
GROUP BY day
ORDER BY day;