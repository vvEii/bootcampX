--SELECT average wait to start a assistance request
SELECT AVG(started_at - created_at) AS average_wait_time
FROM assistance_requests;