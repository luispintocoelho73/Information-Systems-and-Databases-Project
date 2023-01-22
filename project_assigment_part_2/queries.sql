--A
SELECT Analyses.name
FROM Analyses
WHERE id='B-789'
GROUP BY Analyses.name, Analyses.address
;

--B
SELECT Analyses.name
FROM Analyses
GROUP BY Analyses.name, Analyses.address
HAVING count(Analyses.name) >= ALL(
        (SELECT count(name)
        FROM Analyses
        GROUP BY name,address))
;

--C
SELECT Substation.locality_name, Transformer.latitude, Transformer.longitude
FROM (Transformer NATURAL JOIN Substation)
GROUP BY Substation.locality_name, Transformer.latitude, Transformer.longitude
HAVING count(*) > 1
;

--D
SELECT Substation.locality_name
FROM Substation
GROUP BY Substation.locality_name
HAVING count(Substation.locality_name) >= ALL(
        SELECT count(Substation.locality_name)
        FROM Substation
        GROUP BY Substation.locality_name)
;