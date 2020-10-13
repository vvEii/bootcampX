--SELECT current average time to complete an assistance request
SELECT AVG(completed_at - started_at) AS average_assistance_request_duration 
FROM assistance_requests;