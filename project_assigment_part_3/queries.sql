-- View

-- Caso uma view com o mesmo nome ja exista, entao esta e eliminada
DROP VIEW IF EXISTS supervisors_substations;

-- Cricao da View
CREATE VIEW supervisors_substations(name, address, N_substations)
AS
SELECT A.name, A.address, COUNT(*) as N_substations
FROM (SELECT SUP.name, SUP.address, SUB.gpslat, SUB.gpslong
      FROM supervisor SUP LEFT OUTER JOIN substation SUB
          ON SUP.name = SUB.sname AND SUP.address = SUB.saddress
      WHERE SUB.gpslat IS NOT NULL
     ) AS A
GROUP BY A.name, A.address;

 SELECT * FROM supervisors_substations; -- for debugging purposes

SELECT SUP.name, SUP.address, SUB.gpslat, SUB.gpslong
      FROM supervisor SUP LEFT OUTER JOIN substation SUB
          ON SUP.name = SUB.sname AND SUP.address = SUB.saddress;

-- Queries SQL

-- 1
-- Who are the analysts that have analyzed
-- every incident of element ‘B-789’?

SELECT DISTINCT name,address
FROM analyses
WHERE (analyses.id = 'B-789');


-- 2
-- Who are the supervisors that do not supervise
-- substations south of Rio Maior (Portugal)
-- Maior coordinates: 39.336775, -8.936379

SELECT name,address
FROM supervisor
WHERE (name,address) NOT IN (SELECT distinct sname as name, saddress as address
                             FROM substation
                             WHERE (substation.gpslat < 39.336775)
                             );

-- 3
-- What are the elements with the smallest amount of incidents?

SELECT element.id, COUNT(instant)
FROM element LEFT OUTER JOIN incident
    ON element.id = incident.id
GROUP BY element.id
HAVING COUNT(instant) = (SELECT MIN(A.N)
                         FROM (SELECT element.id, COUNT(instant) AS N
                               FROM element LEFT OUTER JOIN incident
                                   ON element.id = incident.id

                         GROUP BY element.id) AS A);

-- 4
-- How many substations does each supervisor supervise?
-- (include supervisors that do not supervise any at the moment)

SELECT A.name, A.address, COUNT(DISTINCT A.gpslat)
FROM (SELECT SUP.name, SUP.address, SUB.gpslat, SUB.gpslong
      FROM supervisor SUP LEFT OUTER JOIN substation SUB
          ON SUP.name = SUB.sname AND SUP.address = SUB.saddress
     ) AS A
GROUP BY A.name, A.address;
