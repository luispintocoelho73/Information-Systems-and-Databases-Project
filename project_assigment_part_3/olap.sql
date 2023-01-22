-- Data Analytics Query
SELECT COUNT(*) as number_of_anomalies, f_incident.severity, d_location.locality, d_time.week_day
FROM f_incident NATURAL JOIN d_location NATURAL JOIN d_time
GROUP BY CUBE(f_incident.severity, d_location.locality, d_time.week_day)
ORDER BY f_incident.severity, d_location.locality, d_time.week_day;

-- COUNT() conta o numero de linhas em cada conjunto
-- (severity, locality e week_day) formado, ou seja, o numero de anomalias reportadas para cada combinacao de argumentos.