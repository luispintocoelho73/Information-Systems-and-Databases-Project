-- Apagar tabelas do star schema caso ja existam
DROP TABLE IF EXISTS d_reporter cascade;
DROP TABLE IF EXISTS d_time cascade;
DROP TABLE IF EXISTS d_location cascade;
DROP TABLE IF EXISTS d_element  cascade;
DROP TABLE IF EXISTS f_incident cascade;

-- Criacao do Star Schema

-- Criacao das Dimension Tables
CREATE TABLE d_reporter(
    id_reporter INTEGER GENERATED ALWAYS AS IDENTITY, -- id_reporter vai ter o valor correspondente ao numero da linha em questao
    name VARCHAR(80) NOT NULL,
    address VARCHAR(80) NOT NULL,
    PRIMARY KEY (id_reporter)
);

CREATE TABLE d_time(
    id_time INTEGER GENERATED ALWAYS AS IDENTITY,
    week_day INTEGER NOT NULL,
    week NUMERIC(2) NOT NULL,
    month NUMERIC(2) NOT NULL,
    trimester INTEGER NOT NULL,
    year NUMERIC(4) NOT NULL,
    PRIMARY KEY (id_time)
);

CREATE TABLE d_location (
    id_location INTEGER GENERATED ALWAYS AS IDENTITY,
    latitude NUMERIC(9,6) NOT NULL,
    longitude NUMERIC(8,6) NOT NULL,
    locality VARCHAR(80) NOT NULL,
    PRIMARY KEY (id_location)
);

CREATE TABLE d_element (
    id_element INTEGER GENERATED ALWAYS AS IDENTITY,
    element_id VARCHAR(10) NOT NULL,
    element_type VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_element)
);

-- Criacao da Fact Table
CREATE TABLE f_incident (
    id_reporter INTEGER NOT NULL,
    id_time INTEGER NOT NULL,
    id_location INTEGER NOT NULL,
    id_element INTEGER NOT NULL,
    severity VARCHAR(30) NOT NULL,
    PRIMARY KEY (id_reporter, id_time, id_location, id_element),
    FOREIGN KEY (id_reporter) REFERENCES d_reporter(id_reporter),
    FOREIGN KEY (id_time) REFERENCES d_time(id_time),
    FOREIGN KEY (id_location) REFERENCES d_location(id_location),
    FOREIGN KEY (id_element) REFERENCES d_element(id_element)
);