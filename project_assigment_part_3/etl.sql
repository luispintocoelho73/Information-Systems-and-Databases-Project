-- Criacao de funcoes

-- Funcao impedir_locations_nulas atua quando um dado incidente ocorre com um elemento, cuja localizacao e desconhecida (valor NULL). Quando isto
-- acontece, o seu id_location apontara para a primeira linha da tabela d_location, que corresponde a uma localizacao desconhecida.
CREATE	OR	REPLACE	FUNCTION impedir_locations_nulas(
    id_location INTEGER
    )
	RETURNS	INTEGER	AS
$$
BEGIN
    IF id_location IS NULL THEN id_location := 1;
    END IF;

    RETURN id_location;

END;
$$
LANGUAGE	plpgsql;


-- Funcao obter_trimestre recebe como argumento um dado mes e devolve o trimestre correspondente.
CREATE	OR	REPLACE	FUNCTION obter_trimestre(
    x DOUBLE PRECISION
    )
	RETURNS	INTEGER	AS
$$
DECLARE
    trimestre INTEGER;
BEGIN
    IF x < 4 THEN trimestre := 1;
    ELSIF x < 7 THEN trimestre := 2;
    ELSIF x < 10 THEN trimestre := 3;
    ELSE trimestre := 4;
    END IF;

    RETURN trimestre;

END;
$$
LANGUAGE	plpgsql;


-- Carregamento das dimension tables.
INSERT INTO d_reporter(name,address) (SELECT name, address from analyses group by name,address);

-- d reporter
-- SELECT * from d_reporter; -- for debugging purposes

INSERT INTO d_location(latitude,longitude,locality) VALUES(999.999999,99.999999,'Unknown'); -- Linha numero 1 da tabela d_location corresponde a uma localizacao desconhecida
INSERT INTO d_location(latitude,longitude,locality) (SELECT gpslat,gpslong,locality FROM incident NATURAL JOIN transformer NATURAL JOIN substation
                                                     GROUP BY gpslat,gpslong,locality);

-- d location
-- SELECT * from d_location; -- for debugging purposes

INSERT INTO d_element(element_id,element_type) (SELECT DISTINCT busbar.id, 'BusBar' from busbar JOIN incident ON busbar.id = incident.id);
INSERT INTO d_element(element_id,element_type) (SELECT DISTINCT line.id, 'Line' from line JOIN incident ON line.id = incident.id);
INSERT INTO d_element(element_id,element_type) (SELECT DISTINCT transformer.id, 'Transformer' from transformer JOIN incident ON transformer.id = incident.id);

-- d element
-- SELECT * from d_element; -- for debugging purposes

INSERT INTO d_time(week_day,week,month,trimester,year) (SELECT DATE_PART('isodow', instant),
                                                               DATE_PART('week', instant),
                                                               DATE_PART('month', instant),
                                                               obter_trimestre(DATE_PART('month', instant)),
                                                               DATE_PART('year', instant)
                                                        FROM incident);

-- d time
-- SELECT * from d_time; -- for debugging purposes

-- SELECT * FROM (analyses NATURAL JOIN incident NATURAL JOIN element); -- for debugging purposes

-- substation
-- SELECT * FROM substation; -- for debugging purposes

-- Carregamento da fact table.
--
INSERT INTO f_incident(id_reporter,id_time,id_location,id_element,severity) (
    (SELECT id_reporter, id_time, impedir_locations_nulas(id_location), id_element, severity
    -- operational table
    FROM (analyses NATURAL JOIN incident NATURAL JOIN element) LEFT OUTER JOIN transformer ON transformer.id = analyses.id
    -- dimension tables
            LEFT OUTER JOIN d_reporter ON d_reporter.name = analyses.name AND d_reporter.address = analyses.address

            LEFT OUTER JOIN d_time ON d_time.week_day = DATE_PART('isodow', incident.instant) AND d_time.week = DATE_PART('week', incident.instant)
                                        AND d_time.month = DATE_PART('month', incident.instant) AND d_time.year = DATE_PART('year', incident.instant)

            LEFT OUTER JOIN d_element ON d_element.element_id = incident.id

            LEFT OUTER JOIN d_location ON d_location.latitude = transformer.gpslat AND d_location.longitude = transformer.gpslong AND
                    (d_element.element_id = transformer.id OR d_element.element_id = transformer.pbbid OR d_element.element_id = transformer.sbbid)
    ORDER BY id_time
    ));

-- SELECT * from f_incident; -- for debugging purposes