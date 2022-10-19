CREATE TABLE aerolineas (
    codigo INTEGER NOT NULL,
    nombre VARCHAR(100) NOT NULL
);

ALTER TABLE aerolineas ADD CONSTRAINT aerolineas_pk PRIMARY KEY ( codigo );

CREATE TABLE aeropuertos (
    codigo        INTEGER NOT NULL,
    nombre        VARCHAR(100) NOT NULL,
    latitud       FLOAT,
    longitud      FLOAT,
    ciudades_codigo INTEGER NOT NULL
);

ALTER TABLE aeropuertos ADD CONSTRAINT aeropuertos_pk PRIMARY KEY ( codigo );

CREATE TABLE ciudades (
    codigo      INTEGER NOT NULL,
    nombre      VARCHAR(100) NOT NULL,
    paises_codigo INTEGER NOT NULL
);

ALTER TABLE ciudades ADD CONSTRAINT ciudades_pk PRIMARY KEY ( codigo );

CREATE TABLE paises (
    codigo INTEGER NOT NULL,
    nombre VARCHAR(100) NOT NULL
);

ALTER TABLE paises ADD CONSTRAINT paises_pk PRIMARY KEY ( codigo );

CREATE TABLE pasajeros (
    consecutivo        INTEGER NOT NULL,
    nombre             VARCHAR(100) NOT NULL,
    identificacion     VARCHAR(100) NOT NULL,
    correo_electronico VARCHAR(100) NOT NULL,
    celular            INTEGER NOT NULL,
    tiquetes_numero     INTEGER NOT NULL
);

ALTER TABLE pasajeros ADD CONSTRAINT pasajeros_pk PRIMARY KEY ( consecutivo );

CREATE TABLE tiquetes (
    numero       INTEGER NOT NULL,
    fecha_compra DATE NOT NULL
);

ALTER TABLE tiquetes ADD CONSTRAINT tiquetes_pk PRIMARY KEY ( numero );

CREATE TABLE Trayecto_tiquetes (
    numero         INTEGER NOT NULL,
    tiquetes_numero INTEGER NOT NULL
);

ALTER TABLE Trayecto_tiquetes ADD CONSTRAINT Trayecto_tiquetes_PK PRIMARY KEY ( numero );

CREATE TABLE vuelos (
    codigo             INTEGER NOT NULL,
    dia_semana         INTEGER NOT NULL,
    hora_salida        DATE NOT NULL,
    duracion           DATE NOT NULL,
    aeropuertos_codigo  INTEGER NOT NULL,
    aeropuertos_codigo2 INTEGER NOT NULL,dfewr
    aerolineas_codigo   INTEGER NOT NULL
);

ALTER TABLE vuelos ADD CONSTRAINT vuelos_pk PRIMARY KEY ( codigo );

ALTER TABLE aeropuertos
    ADD CONSTRAINT aeropuertos_ciudades_fk FOREIGN KEY ( ciudades_codigo )
        REFERENCES ciudades ( codigo );

ALTER TABLE ciudades
    ADD CONSTRAINT ciudades_paises_fk FOREIGN KEY ( paises_codigo )
        REFERENCES paises ( codigo );

ALTER TABLE pasajeros
    ADD CONSTRAINT pasajeros_tiquetes_fk FOREIGN KEY ( tiquetes_numero )
        REFERENCES tiquetes ( numero );

ALTER TABLE Trayecto_tiquetes
    ADD CONSTRAINT Trayecto_tiquetes_tiquetes_FK FOREIGN KEY ( tiquetes_numero )
        REFERENCES tiquetes ( numero );

ALTER TABLE vuelos
    ADD CONSTRAINT vuelos_aerolineas_fk FOREIGN KEY ( aerolineas_codigo )
        REFERENCES aerolineas ( codigo );

ALTER TABLE vuelos
    ADD CONSTRAINT vuelos_aeropuertos_fk FOREIGN KEY ( aeropuertos_codigo )
        REFERENCES aeropuertos ( codigo );

ALTER TABLE vuelos
    ADD CONSTRAINT vuelos_aeropuertos_fkv2 FOREIGN KEY ( aeropuertos_codigo2 )
        REFERENCES aeropuertos ( codigo );

--DROP TABLE IF EXISTS aerolineas;
--DROP TABLE IF EXISTS aeropuertos;
--DROP TABLE IF EXISTS ciudades;
--DROP TABLE IF EXISTS paises;
--DROP TABLE IF EXISTS pasajeros;
--DROP TABLE IF EXISTS tiquetes;
--DROP TABLE IF EXISTS Trayecto_tiquetes;
--DROP TABLE IF EXISTS vuelos;

