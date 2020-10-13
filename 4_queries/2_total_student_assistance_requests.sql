--SELECT total number of assistance_requests for student 'Elliot Dickinson'
SELECT COUNT(assistance_requests.*) AS total_assistances, name
FROM students JOIN assistance_requests ON students.id = student_id
WHERE name = 'Elliot Dickinson'
GROUP BY name;