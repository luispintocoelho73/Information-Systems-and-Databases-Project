-- DROP EXISTING TABLES
DROP TABLE IF EXISTS Person cascade;
DROP TABLE IF EXISTS Supervisor cascade;
DROP TABLE IF EXISTS Analyst cascade;
DROP TABLE IF EXISTS Element cascade;
DROP TABLE IF EXISTS Incident cascade;
DROP TABLE IF EXISTS Line_incident cascade;
DROP TABLE IF EXISTS Analyses cascade;
DROP TABLE IF EXISTS Bus_bar cascade;
DROP TABLE IF EXISTS Line cascade;
DROP TABLE IF EXISTS Substation cascade;
DROP TABLE IF EXISTS Transformer cascade;
DROP TABLE IF EXISTS Line_connection cascade;


-- TABLE CREATION
CREATE TABLE Person (
    name VARCHAR(80),
    address VARCHAR(255),
    phone CHAR(9) NOT NULL,
    tax_id VARCHAR(30) NOT NULL,

    PRIMARY KEY (name,address),
    UNIQUE(phone),
    UNIQUE(tax_id)

    -- Cada pessoa tem de estar na tabela
    -- 'Supervisor' e/ou na tabela 'Analyst'
);

CREATE TABLE Supervisor (
    name VARCHAR(80),
    address VARCHAR(255),

    PRIMARY KEY (name,address),
    FOREIGN KEY (name,address) REFERENCES Person(name,address)

    -- (IC-5) se uma pessoa na tabela 'Analyst' esta a analisar um elemento
    -- de uma dada substacao presente na tabela 'Substation' de coodernadas unicas,
    -- a pessoa não podera supervisionar essa substacao
);

CREATE TABLE Analyst (
    name VARCHAR(80),
    address VARCHAR(255),
    PRIMARY KEY (name,address),
    FOREIGN KEY (name,address) REFERENCES Person(name,address)

    -- (IC-5) se uma pessoa na tabela 'Supervisor' estiver a supervisionar
    -- uma dada substacao de coodernadas unicas presente na tabela 'Substation',
    -- essa pessoa nao podera analisar um incidente presente na tabela 'Incident'
    -- registado na sua substacao
);

CREATE TABLE Element (
    id CHAR(5),

    PRIMARY KEY (id)

    -- Cada elemento tem de pertencer a uma e so uma
    -- tabela, das tabelas 'Line', 'Bus_bar' e 'Transformer'
);

CREATE TABLE Incident (
    id CHAR(5),
    instant timestamp,
    description text NOT NULL,
    severity VARCHAR(50) NOT NULL,

    PRIMARY KEY (id,instant),
    FOREIGN KEY (id) REFERENCES Element(id)

    -- so incidentes com linhas podem ser
    -- armazenados na tabela 'Line_incident'

    -- (IC-5) um incidente somente pode ser analisado por uma pessoa presente na
    -- tabela 'Analyst' se essa pessoa, caso esteja presente na tabela
    -- 'Supervisor', nao supervisione a substacao armazenada em 'Substation',
    -- na qual tenha ocorrido o mesmo incidente
);

CREATE TABLE Line_incident (
    id CHAR(5),
    instant timestamp,
    point NUMERIC(5,2) NOT NULL,

    PRIMARY KEY (id,instant),
    FOREIGN KEY (id,instant) REFERENCES Incident(id,instant)
);

CREATE TABLE Analyses (
    id CHAR(5),
    instant timestamp,
    name VARCHAR(80) NOT NULL,
    address VARCHAR(255) NOT NULL,
    report text NOT NULL,

    PRIMARY KEY (id, instant),
    FOREIGN KEY (name,address) REFERENCES Analyst(name,address),
    FOREIGN KEY (id, instant) REFERENCES Incident(id, instant)

    -- (IC-5) um report nao pode ser escrito por uma pessoa presente na tabela 'Analyst'
    -- sobre um incidente presente na tabela 'Incident' que corresponda a um elemento
    -- de uma substacao presente na tabela 'Substation' que seja supervisionada pela
    -- mesma pessoa, presente na tabela 'Supervisor'
);


CREATE TABLE Line (
    id CHAR(5),
    impedance NUMERIC(12,4) NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES Element(id)

    -- cada linha tem de pertencer a tabela line-connection
);

CREATE TABLE Bus_bar (
    id CHAR(5),
    voltage NUMERIC(12,4) NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES Element(id)
);

CREATE TABLE Substation (
    latitude  NUMERIC(9,6),
    longitude  NUMERIC(8,6),
    name VARCHAR(80) NOT NULL,
    address VARCHAR(255) NOT NULL,
    locality_name VARCHAR(30) NOT NULL,

    PRIMARY KEY (latitude,longitude),
    FOREIGN KEY (name,address) REFERENCES Supervisor(name,address)

    -- Todas as substacoes tem que estar presentes na tabela 'transformer'

    -- (IC-5) Uma substacao nao pode ser supervionada por uma pessoa presente na tabela
    -- 'Supervisor' que se encontre tambem na tabela 'Analyst', a analisar um
    -- incidente da tabela 'Incident', que tenha ocorrido nessa mesma substação
);

CREATE TABLE Transformer (
    id_transformer CHAR(5),
    id_bus_bar_1 CHAR(5) NOT NULL,
    id_bus_bar_2 CHAR(5) NOT NULL,
    primary_voltage NUMERIC(12,4) NOT NULL,
    secondary_voltage NUMERIC(12,4) NOT NULL,
    latitude  NUMERIC(9,6) NOT NULL,
    longitude  NUMERIC(8,6) NOT NULL,

    PRIMARY KEY (id_transformer),
    FOREIGN KEY (id_transformer) REFERENCES Element(id),
    FOREIGN KEY (id_bus_bar_1) REFERENCES Bus_bar(id),
    FOREIGN KEY (id_bus_bar_2) REFERENCES Bus_bar(id),
    FOREIGN KEY (latitude,longitude) REFERENCES Substation(latitude,longitude),

    CHECK (id_bus_bar_1 <> id_bus_bar_2)
    --  (IC-1) A tensao do bus bar presente na tabela 'Bus_bar' cujo id corresponde ao valor de 'id_bus_bar_1' tem de ser
    -- igual à tensao primaria do transformador de id 'id_transformer' na tabela 'Transformer'

    -- (IC-2) A tensao do bus bar presente na tabela 'Bus_bar' cujo id corresponde ao valor de 'id_bus_bar_2' tem de ser
    -- igual à tensao secundaria do transformador de id 'id_transformer' na tabela 'Transformer'
);

CREATE TABLE Line_connection (
    id_line CHAR(5),
    id_bus_bar_1 CHAR(5),
    id_bus_bar_2 CHAR(5),
    PRIMARY KEY(id_line, id_bus_bar_1, id_bus_bar_2),
    FOREIGN KEY (id_line) REFERENCES Line(id),
    FOREIGN KEY (id_bus_bar_1) REFERENCES Bus_bar(id),
    FOREIGN KEY (id_bus_bar_2) REFERENCES Bus_bar(id),
    CHECK (id_bus_bar_1 <> id_bus_bar_2)
);