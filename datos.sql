CREATE DATABASE PECL2;

CREATE SCHEMA IF NOT EXISTS temp;

create schema fin;

-- Tablas iniciales en el esquema temporal, configuradas con todos los atributos como tipo TEXT y se han importado los datos completos correspondientes a cada tabla desde los archivos
--Tabla 1
CREATE TABLE IF NOT EXISTS temp.accidentes (
   crash_date TEXT,
   crash_time TEXT,
   borough TEXT,
   zip_code TEXT,
   latitude TEXT,
   longitude TEXT,
   location TEXT,
   on_street_name TEXT,
   cross_street_name TEXT,
   off_street_name TEXT,
   number_of_persons_injured TEXT,
   number_of_persons_killed TEXT,
   number_of_pedestrians_injured TEXT,
   number_of_pedestrians_killed TEXT,
   number_of_cyclist_injured TEXT,
   number_of_cyclist_killed TEXT,
   number_of_motorist_injured TEXT,
   number_of_motorist_killed TEXT,
   contributing_factor_vehicle_1 TEXT,
   contributing_factor_vehicle_2 TEXT,
   contributing_factor_vehicle_3 TEXT,
   contributing_factor_vehicle_4 TEXT,
   contributing_factor_vehicle_5 TEXT,
   collision_id TEXT,
   vehicle_type_code_1 TEXT,
   vehicle_type_code_2 TEXT,
   vehicle_type_code_3 TEXT,
   vehicle_type_code_4 TEXT,
   vehicle_type_code_5 TEXT
);

CREATE TABLE IF NOT EXISTS temp.personas (
   person_id TEXT,
   person_sex TEXT,
   person_lastname TEXT,
   person_firstname TEXT,
   person_phone TEXT,
   person_address TEXT,
   person_city TEXT,
   person_state TEXT,
   person_zip TEXT,
   person_ssn TEXT,
   person_dob TEXT
);

CREATE TABLE IF NOT EXISTS temp.vehiculos(
    vehicle_id  TEXT,
    vehicle_year    TEXT,
    vehicle_type    TEXT,
    vehicle_model   TEXT,
    vehicle_make    TEXT,
    state_registration TEXT
);


--DROP TABLE IF EXISTS temp.colision_persona;

CREATE TABLE IF NOT EXISTS temp.colision_persona (
   unique_id TEXT,
   collision_id TEXT,
   crash_date TEXT,
   crash_time TEXT,
   person_id TEXT,
   person_type TEXT,
   person_injury TEXT,
   vehicle_id TEXT,
   person_age TEXT,
   ejection TEXT,
   emotional_status TEXT,
   bodily_injury TEXT,
   position_in_vehicle TEXT,
   safety_equipment TEXT,
   ped_location TEXT,
   ped_action TEXT,
   complaint TEXT,
   ped_role TEXT,
   contributing_factor_1 TEXT,
   contributing_factor_2 TEXT,
   person_sex TEXT


);
--DROP TABLE IF EXISTS temp.colision_vehiculo;
CREATE TABLE IF NOT EXISTS temp.colision_vehiculo (
    unique_id TEXT,
    collision_id TEXT,
    crash_date TEXT,
    crash_time TEXT,
    vehicle_id TEXT,
    state_registration TEXT,
    vehicle_type TEXT,
    vehicle_make TEXT,
    vehicle_model TEXT,
    vehicle_year TEXT,
    travel_direction TEXT,
    vehicle_occupants TEXT,
    driver_sex TEXT,
    driver_license_status TEXT,
    driver_license_jurisdiction TEXT,
    pre_crash TEXT,
    point_of_impact TEXT,
    vehicle_damage TEXT,
    vehicle_damage_1 TEXT,
    vehicle_damage_2 TEXT,
    vehicle_damage_3 TEXT,
    public_property_damage TEXT,
    public_property_damage_type TEXT,
    contributing_factor_1 TEXT,
    contributing_factor_2 TEXT


);



-- Tablas finales con los tipos de datos correctos

CREATE TABLE IF NOT EXISTS fin.accidentes (
   collision_id VARCHAR(100),
   vehicle_type_code_1 VARCHAR(100),
   vehicle_type_code_2 VARCHAR(100),
   vehicle_type_code_3 VARCHAR(100),
   vehicle_type_code_4 VARCHAR(100),
   vehicle_type_code_5 VARCHAR(100),
   crash_date DATE,
   crash_time TIME without time zone,
   borough VARCHAR(15),
   zip_code VARCHAR(5),
   latitude DOUBLE PRECISION,
   longitude DOUBLE PRECISION,
   location POINT,
   on_street_name VARCHAR(35),
   cross_street_name VARCHAR(25),
   off_street_name VARCHAR(35),
   number_of_persons_injured INTEGER CHECK (number_of_persons_injured >= 0),
   number_of_persons_killed INTEGER CHECK (number_of_persons_killed >= 0),
   number_of_pedestrians_injured INTEGER CHECK (number_of_pedestrians_injured >= 0),
   number_of_pedestrians_killed INTEGER CHECK (number_of_pedestrians_killed >= 0),
   number_of_cyclist_injured INTEGER CHECK (number_of_cyclist_injured >= 0),
   number_of_cyclist_killed INTEGER CHECK (number_of_cyclist_killed >= 0),
   number_of_motorist_injured INTEGER CHECK (number_of_motorist_injured >= 0),
   number_of_motorist_killed INTEGER CHECK (number_of_motorist_killed >= 0),
   contributing_factor_vehicle_1 VARCHAR(100),
   contributing_factor_vehicle_2 VARCHAR(100),
   contributing_factor_vehicle_3 VARCHAR(100),
   contributing_factor_vehicle_4 VARCHAR(100),
   contributing_factor_vehicle_5 VARCHAR(100)
   --CONSTRAINT Collision_pk PRIMARY KEY (collision_id)
);




CREATE TABLE IF NOT EXISTS fin.persona (
   person_id VARCHAR(50) UNIQUE NOT NULL,
   person_sex CHAR(1) CHECK (person_sex='F' OR person_sex='M' OR person_sex='U' OR person_sex IS NULL),
   person_firstname VARCHAR(15),
   person_lastname VARCHAR(15),
   person_address VARCHAR(50),
   person_city VARCHAR(25),
   person_state VARCHAR(20),
   person_phone VARCHAR(20),
   person_zip CHAR(5),
   person_ssn CHAR(11),
   person_dob DATE
   --CONSTRAINT Persona_pk PRIMARY KEY (person_id)
);

CREATE TABLE IF NOT EXISTS fin.vehiculo (
   vehicle_id VARCHAR(50) NOT NULL,
   state_registration INT NULL,
   vehicle_year INT,
   vehicle_type VARCHAR(50),
   vehicle_model VARCHAR(25),
   vehicle_make VARCHAR(25)
   --CONSTRAINT Vehiculo_pk PRIMARY KEY (vehicle_id)        (no le vamos a poder poner a esta tabla PK porque hay ids repetidos por lo que no puede ser clave primaria, y los demás atributos tienen filas nulas)
);


CREATE TABLE IF NOT EXISTS fin.colision_persona (
   unique_id VARCHAR(100),
   collision_id VARCHAR(100),
   crash_date DATE,
   crash_time TIME without time zone,
   person_id VARCHAR(50),
   person_type VARCHAR(15),
   person_injury VARCHAR(15),
   vehicle_id VARCHAR(50),
   person_age INT,
   ejection VARCHAR(15),
   emotional_status VARCHAR(25),
   bodily_injury VARCHAR(25),
   position_in_vehicle VARCHAR(100),
   safety_equipment VARCHAR(25),
   ped_location VARCHAR(100),
   ped_action VARCHAR(25),
   complaint VARCHAR(40),
   ped_role VARCHAR(20),
   contributing_factor_1 VARCHAR(25),
   contributing_factor_2 VARCHAR(25),
   person_sex CHAR(1) CHECK (person_sex='F' OR person_sex='M' OR person_sex='U' OR person_sex IS NULL)

);

CREATE TABLE IF NOT EXISTS fin.accidentes (
   collision_id VARCHAR(100),
   vehicle_type_code_1 VARCHAR(100),
   vehicle_type_code_2 VARCHAR(100),
   vehicle_type_code_3 VARCHAR(100),
   vehicle_type_code_4 VARCHAR(100),
   vehicle_type_code_5 VARCHAR(100),
   crash_date DATE,
   crash_time TIME without time zone,
   borough VARCHAR(15),
   zip_code VARCHAR(5),
   latitude DOUBLE PRECISION,
   longitude DOUBLE PRECISION,
   location POINT,
   on_street_name VARCHAR(35),
   cross_street_name VARCHAR(25),
   off_street_name VARCHAR(35),
   number_of_persons_injured INTEGER CHECK (number_of_persons_injured >= 0),
   number_of_persons_killed INTEGER CHECK (number_of_persons_killed >= 0),
   number_of_pedestrians_injured INTEGER CHECK (number_of_pedestrians_injured >= 0),
   number_of_pedestrians_killed INTEGER CHECK (number_of_pedestrians_killed >= 0),
   number_of_cyclist_injured INTEGER CHECK (number_of_cyclist_injured >= 0),
   number_of_cyclist_killed INTEGER CHECK (number_of_cyclist_killed >= 0),
   number_of_motorist_injured INTEGER CHECK (number_of_motorist_injured >= 0),
   number_of_motorist_killed INTEGER CHECK (number_of_motorist_killed >= 0),
   contributing_factor_vehicle_1 VARCHAR(100),
   contributing_factor_vehicle_2 VARCHAR(100),
   contributing_factor_vehicle_3 VARCHAR(100),
   contributing_factor_vehicle_4 VARCHAR(100),
   contributing_factor_vehicle_5 VARCHAR(100)
   --CONSTRAINT Collision_pk PRIMARY KEY (collision_id)
);

CREATE TABLE IF NOT EXISTS fin.vehiculo (
   vehicle_id VARCHAR(100),
   state_registration INT NULL,
   vehicle_year INT,
   vehicle_type VARCHAR(50),
   vehicle_model VARCHAR(25),
   vehicle_make VARCHAR(25)
   --CONSTRAINT Vehiculo_pk PRIMARY KEY (vehicle_id)        (no le vamos a poder poner a esta tabla PK porque hay ids repetidos por lo que no puede ser clave primaria, y los demás atributos tienen filas nulas)
);


CREATE TABLE IF NOT EXISTS fin.colision_persona (
   unique_id VARCHAR(100),
   collision_id VARCHAR(100),
   crash_date DATE,
   crash_time TIME without time zone,
   person_id VARCHAR(50),
   person_type VARCHAR(15),
   person_injury VARCHAR(15),
   vehicle_id VARCHAR(50),
   person_age INT,
   ejection VARCHAR(15),
   emotional_status VARCHAR(25),
   bodily_injury VARCHAR(25),
   position_in_vehicle VARCHAR(100),
   safety_equipment VARCHAR(25),
   ped_location VARCHAR(100),
   ped_action VARCHAR(25),
   complaint VARCHAR(40),
   ped_role VARCHAR(20),
   contributing_factor_1 VARCHAR(25),
   contributing_factor_2 VARCHAR(25),
   person_sex CHAR(1) CHECK (person_sex='F' OR person_sex='M' OR person_sex='U' OR person_sex IS NULL)

);

CREATE TABLE IF NOT EXISTS fin.colision_vehiculo (
   unique_id VARCHAR(100),
   collision_id VARCHAR(100),
   crash_date DATE,
   crash_time TIME without time zone,
   vehicle_id VARCHAR(100),
   state_registration VARCHAR(2),
   vehicle_type VARCHAR(50),
   vehicle_make VARCHAR(15),
   vehicle_model VARCHAR(15),
   vehicle_year INT,
   travel_direction VARCHAR(15),
   vehicle_occupants INT,
   driver_sex CHAR(1) CHECK (driver_sex='F' OR driver_sex='M' OR driver_sex='U' OR driver_sex IS NULL),
   driver_license_status VARCHAR(20),
   driver_license_jurisdiction VARCHAR(2),
   pre_crash VARCHAR(50),
   point_of_impact VARCHAR(50),
   vehicle_damage VARCHAR(50),
   vehicle_damage_1 VARCHAR(50),
   vehicle_damage_2 VARCHAR(50),
   vehicle_damage_3 VARCHAR(25),
   public_property_damage CHAR(1) CHECK (public_property_damage='N' OR public_property_damage='U' OR public_property_damage='Y' OR public_property_damage IS NULL),
   public_property_damage_type VARCHAR(50),
   contributing_factor_1 VARCHAR(100),
   contributing_factor_2 VARCHAR(100)
   --CONSTRAINT Vehiculo_pk FOREIGN KEY (vehicle_id) REFERENCES fin.vehiculo (vehicle_id) MATCH FULL
      --ON DELETE SET DEFAULT ON UPDATE SET DEFAULT,                                                           -- debería de ser vehicle_id una clave extranjera, pero por errores en el fichero de datos esta clave extranjera no se puede implementar
   --CONSTRAINT Collision_pk FOREIGN KEY (collision_id) REFERENCES fin.accidentes (collision_id) MATCH FULL
      --ON DELETE SET DEFAULT ON UPDATE SET DEFAULT,
   --CONSTRAINT id_primary_vehiculo PRIMARY KEY (unique_id)
);


COPY temp.vehiculos FROM 'C:\Users\pilar\OneDrive\Escritorio\DatosPL2\Vehicles.csv'
DELIMITER ';' CSV HEADER NULL '';

COPY temp.personas FROM 'C:\Users\pilar\OneDrive\Escritorio\DatosPL2\personas2.csv'
DELIMITER ';' CSV HEADER NULL '';

COPY temp.accidentes FROM 'C:\Users\pilar\OneDrive\Escritorio\DatosPL2\Collisions_Crashes_20241020.csv'
DELIMITER ',' CSV HEADER NULL '';

COPY temp.colision_persona FROM 'C:\Users\pilar\OneDrive\Escritorio\DatosPL2\Collisions_Person_20241020.csv'
DELIMITER ',' CSV HEADER NULL '';


COPY temp.colision_vehiculo FROM 'C:\Users\pilar\OneDrive\Escritorio\DatosPL2\Collisions_Vehicles_20241020.csv'
DELIMITER ',' CSV HEADER NULL'';

--AJUSTES TABLAS
-- Asegurar que collision_id es VARCHAR(100) en todas las tablas
ALTER TABLE fin.accidentes ALTER COLUMN collision_id TYPE VARCHAR(100) USING collision_id::VARCHAR(100);
ALTER TABLE fin.colision_persona ALTER COLUMN collision_id TYPE VARCHAR(100) USING collision_id::VARCHAR(100);
--ALTER TABLE fin.colision_vehiculo ALTER COLUMN collision_id TYPE VARCHAR(100) USING collision_id::VARCHAR(100);

-- Asegurar que vehicle_id es VARCHAR(100) en todas las tablas
ALTER TABLE fin.vehiculo ALTER COLUMN vehicle_id TYPE VARCHAR(100) USING vehicle_id::VARCHAR(100);
ALTER TABLE fin.colision_persona ALTER COLUMN vehicle_id TYPE VARCHAR(100) USING vehicle_id::VARCHAR(100);
ALTER TABLE fin.colision_vehiculo ALTER COLUMN vehicle_id TYPE VARCHAR(100) USING vehicle_id::VARCHAR(100);

-- Asegurar que person_id es VARCHAR(50) en todas las tablas
ALTER TABLE fin.persona ALTER COLUMN person_id TYPE VARCHAR(50) USING person_id::VARCHAR(50);
ALTER TABLE fin.colision_persona ALTER COLUMN person_id TYPE VARCHAR(50) USING person_id::VARCHAR(50);

-- Asegurar que unique_id es VARCHAR(100) en todas las tablas relevantes
ALTER TABLE fin.colision_persona ALTER COLUMN unique_id TYPE VARCHAR(100) USING unique_id::VARCHAR(100);
--ALTER TABLE fin.colision_vehiculo ALTER COLUMN unique_id TYPE VARCHAR(100) USING unique_id::VARCHAR(100);

-- Otros ajustes según columnas comunes
-- state_registration es VARCHAR(2)
ALTER TABLE fin.vehiculo ALTER COLUMN state_registration TYPE VARCHAR(2) USING state_registration::VARCHAR(2);
ALTER TABLE fin.colision_vehiculo ALTER COLUMN state_registration TYPE VARCHAR(2) USING state_registration::VARCHAR(2);

-- Asegurar que person_sex es CHAR(1) en todas las tablas relevantes
ALTER TABLE fin.persona ALTER COLUMN person_sex TYPE CHAR(1) USING person_sex::CHAR(1);
ALTER TABLE fin.colision_persona ALTER COLUMN person_sex TYPE CHAR(1) USING person_sex::CHAR(1);

-- Asegurar que vehicle_year es INT en todas las tablas relevantes
ALTER TABLE fin.vehiculo ALTER COLUMN vehicle_year TYPE INT USING vehicle_year::INT;
ALTER TABLE fin.colision_vehiculo ALTER COLUMN vehicle_year TYPE INT USING vehicle_year::INT;

-- Asegurar que crash_date es DATE en todas las tablas relevantes
ALTER TABLE fin.accidentes ALTER COLUMN crash_date TYPE DATE USING crash_date::DATE;
ALTER TABLE fin.colision_persona ALTER COLUMN crash_date TYPE DATE USING crash_date::DATE;
ALTER TABLE fin.colision_vehiculo ALTER COLUMN crash_date TYPE DATE USING crash_date::DATE;

-- Asegurar que crash_time es TIME WITHOUT TIME ZONE en todas las tablas relevantes
ALTER TABLE fin.accidentes ALTER COLUMN crash_time TYPE TIME WITHOUT TIME ZONE USING crash_time::TIME WITHOUT TIME ZONE;
ALTER TABLE fin.colision_persona ALTER COLUMN crash_time TYPE TIME WITHOUT TIME ZONE USING crash_time::TIME WITHOUT TIME ZONE;
ALTER TABLE fin.colision_vehiculo ALTER COLUMN crash_time TYPE TIME WITHOUT TIME ZONE USING crash_time::TIME WITHOUT TIME ZONE;

-- Asegurar que person_age es INT en todas las tablas relevantes
ALTER TABLE fin.colision_persona ALTER COLUMN person_age TYPE INT USING person_age::INT;

--DROP TABLE IF EXISTS fin.accidentes CASCADE;
INSERT INTO fin.accidentes(crash_date, crash_time, borough, zip_code, latitude, longitude, location, on_street_name, cross_street_name, off_street_name, number_of_persons_injured, number_of_persons_killed, number_of_pedestrians_injured, number_of_pedestrians_killed, number_of_cyclist_injured, number_of_cyclist_killed, number_of_motorist_injured, number_of_motorist_killed, contributing_factor_vehicle_1, contributing_factor_vehicle_2, contributing_factor_vehicle_3, contributing_factor_vehicle_4, contributing_factor_vehicle_5, collision_id, vehicle_type_code_1, vehicle_type_code_2, vehicle_type_code_3, vehicle_type_code_4, vehicle_type_code_5)
SELECT
    TO_DATE(temp.accidentes.crash_date, 'MM/DD/YYYY'),  -- Convertir la fecha al formato adecuado
    cast(temp.accidentes.crash_time AS TIME without time zone),
    cast(temp.accidentes.borough AS VARCHAR(15)),
    cast(temp.accidentes.zip_code AS VARCHAR(5)),
    cast(temp.accidentes.latitude AS DOUBLE PRECISION),
    cast(temp.accidentes.longitude AS DOUBLE PRECISION),
    cast(temp.accidentes.location AS POINT),
    cast(temp.accidentes.on_street_name AS VARCHAR(35)),
    cast(temp.accidentes.cross_street_name AS VARCHAR(25)),
    cast(temp.accidentes.off_street_name AS VARCHAR(35)),
    cast(temp.accidentes.number_of_persons_injured AS INTEGER),
    cast(temp.accidentes.number_of_persons_killed AS INTEGER),
    cast(temp.accidentes.number_of_pedestrians_injured AS INTEGER),
    cast(temp.accidentes.number_of_pedestrians_killed AS INTEGER),
    cast(temp.accidentes.number_of_cyclist_injured AS INTEGER),
    cast(temp.accidentes.number_of_cyclist_killed AS INTEGER),
    cast(temp.accidentes.number_of_motorist_injured AS INTEGER),
    cast(temp.accidentes.number_of_motorist_killed AS INTEGER),
    cast(temp.accidentes.contributing_factor_vehicle_1 AS VARCHAR(100)),
    cast(temp.accidentes.contributing_factor_vehicle_2 AS VARCHAR(100)),
    cast(temp.accidentes.contributing_factor_vehicle_3 AS VARCHAR(100)),
    cast(temp.accidentes.contributing_factor_vehicle_4 AS VARCHAR(100)),
    cast(temp.accidentes.contributing_factor_vehicle_5 AS VARCHAR(100)),
    cast(temp.accidentes.collision_id AS INTEGER),
    cast(temp.accidentes.vehicle_type_code_1 AS VARCHAR(100)),
    cast(temp.accidentes.vehicle_type_code_2 AS VARCHAR(100)),
    cast(temp.accidentes.vehicle_type_code_3 AS VARCHAR(100)),
    cast(temp.accidentes.vehicle_type_code_4 AS VARCHAR(100)),
    cast(temp.accidentes.vehicle_type_code_5 AS VARCHAR(100))

FROM temp.accidentes;



--DROP TABLE IF EXISTS fin.persona CASCADE;

INSERT INTO fin.persona (
    person_id,
    person_sex,
    person_lastname,
    person_firstname,
    person_phone,
    person_address,
    person_city,
    person_state,
    person_zip,
    person_ssn,
    person_dob
)
SELECT
    CAST(temp.personas.person_id AS VARCHAR(50)),
    CAST(temp.personas.person_sex AS CHAR(1)),
    CAST(temp.personas.person_lastname AS VARCHAR(15)),
    CAST(temp.personas.person_firstname AS VARCHAR(15)),
    CAST(temp.personas.person_phone AS VARCHAR(20)),
    CAST(temp.personas.person_address AS VARCHAR(50)),
    CAST(temp.personas.person_city AS VARCHAR(25)),
    CAST(temp.personas.person_state AS VARCHAR(20)),
    CAST(temp.personas.person_zip AS CHAR(5)),
    CAST(temp.personas.person_ssn AS CHAR(11)),
    CAST(temp.personas.person_dob AS DATE)
FROM temp.personas
ON CONFLICT (person_id) DO NOTHING;



SELECT * FROM fin.persona LIMIT 10;


--DROP TABLE IF EXISTS fin.vehiculo CASCADE;
INSERT INTO fin.vehiculo(vehicle_id, vehicle_year, vehicle_type, vehicle_model, vehicle_make)
SELECT
    cast(temp.vehiculos.vehicle_id AS VARCHAR(50)),
    cast(temp.vehiculos.vehicle_year AS INT),
    cast(temp.vehiculos.vehicle_type AS VARCHAR(50)),
    cast(temp.vehiculos.vehicle_model AS VARCHAR(25)),
    cast(temp.vehiculos.vehicle_make AS VARCHAR(25))


FROM temp.vehiculos;




INSERT INTO fin.colision_persona(unique_id,collision_id,crash_date,crash_time,person_id,person_type,person_injury,vehicle_id,person_age,ejection,emotional_status,bodily_injury,position_in_vehicle,safety_equipment,ped_location,ped_action,complaint,ped_role,contributing_factor_1,contributing_factor_2,person_sex
)
SELECT DISTINCT ON (temp.colision_persona.unique_id)  -- Evitar duplicados por unique_id
    CAST(temp.colision_persona.unique_id AS VARCHAR(100)),  -- Convertir unique_id a texto
    temp.colision_persona.collision_id,  -- Mantener collision_id como texto
    TO_DATE(temp.colision_persona.crash_date, 'MM/DD/YYYY'),  -- Convertir la fecha al formato adecuado
    CAST(temp.colision_persona.crash_time AS TIME without time zone),
    CAST(temp.colision_persona.person_id AS VARCHAR(50)),  -- Mantener person_id como texto
    CAST(temp.colision_persona.person_type AS VARCHAR(15)),
    CAST(temp.colision_persona.person_injury AS VARCHAR(15)),
    CAST(temp.colision_persona.vehicle_id AS VARCHAR(50)),  -- Mantener vehicle_id como texto
    CASE
        WHEN temp.colision_persona.person_age ~ '^[0-9]+$' THEN CAST(temp.colision_persona.person_age AS INT)
        ELSE NULL
    END AS person_age,  -- Ignorar valores no numéricos
    CAST(temp.colision_persona.ejection AS VARCHAR(15)),
    CAST(temp.colision_persona.emotional_status AS VARCHAR(25)),
    CAST(temp.colision_persona.bodily_injury AS VARCHAR(25)),
    CAST(temp.colision_persona.position_in_vehicle AS VARCHAR(100)),
    CAST(temp.colision_persona.safety_equipment AS VARCHAR(25)),
    CAST(temp.colision_persona.ped_location AS VARCHAR(100)),
    CAST(temp.colision_persona.ped_action AS VARCHAR(25)),
    CAST(temp.colision_persona.complaint AS VARCHAR(40)),
    CAST(temp.colision_persona.ped_role AS VARCHAR(20)),
    CAST(temp.colision_persona.contributing_factor_1 AS VARCHAR(25)),
    CAST(temp.colision_persona.contributing_factor_2 AS VARCHAR(25)),
    CAST(temp.colision_persona.person_sex AS CHAR(1))
FROM temp.colision_persona;




INSERT INTO fin.colision_vehiculo(unique_id,collision_id,crash_date,crash_time,vehicle_id,state_registration,vehicle_type,vehicle_make,vehicle_model,vehicle_year,travel_direction,vehicle_occupants,driver_sex,driver_license_status,driver_license_jurisdiction,pre_crash,point_of_impact,vehicle_damage,vehicle_damage_1,vehicle_damage_2,vehicle_damage_3,public_property_damage,public_property_damage_type, contributing_factor_1,contributing_factor_2
)
SELECT DISTINCT ON (temp.colision_vehiculo.unique_id)  -- Evitar duplicados por unique_id
    CAST(temp.colision_vehiculo.unique_id AS INTEGER),  -- Usar como INTEGER
    CAST(temp.colision_vehiculo.collision_id AS INTEGER),  -- Convertir collision_id a INTEGER
    TO_DATE(temp.colision_vehiculo.crash_date, 'MM/DD/YYYY'),  -- Convertir la fecha al formato adecuado
    CAST(temp.colision_vehiculo.crash_time AS TIME without time zone),
    CAST(temp.colision_vehiculo.vehicle_id AS VARCHAR(50)),
    CAST(temp.colision_vehiculo.state_registration AS VARCHAR(2)),
    CAST(temp.colision_vehiculo.vehicle_type AS VARCHAR(50)),
    CAST(temp.colision_vehiculo.vehicle_make AS VARCHAR(15)),
    CAST(temp.colision_vehiculo.vehicle_model AS VARCHAR(15)),
    CASE
        WHEN temp.colision_vehiculo.vehicle_year ~ '^[0-9]+$' THEN CAST(temp.colision_vehiculo.vehicle_year AS INT)
        ELSE NULL
    END AS vehicle_year,
    CAST(temp.colision_vehiculo.travel_direction AS VARCHAR(15)),
    CASE
        WHEN temp.colision_vehiculo.vehicle_occupants ~ '^[0-9]+$' THEN CAST(temp.colision_vehiculo.vehicle_occupants AS INT)
        ELSE NULL
    END AS vehicle_occupants,
    CAST(temp.colision_vehiculo.driver_sex AS CHAR(1)),
    CAST(temp.colision_vehiculo.driver_license_status AS VARCHAR(20)),
    CAST(temp.colision_vehiculo.driver_license_jurisdiction AS VARCHAR(2)),
    CAST(temp.colision_vehiculo.pre_crash AS VARCHAR(50)),
    CAST(temp.colision_vehiculo.point_of_impact AS VARCHAR(50)),
    CAST(temp.colision_vehiculo.vehicle_damage AS VARCHAR(50)),
    CAST(temp.colision_vehiculo.vehicle_damage_1 AS VARCHAR(50)),
    CAST(temp.colision_vehiculo.vehicle_damage_2 AS VARCHAR(50)),
    CAST(temp.colision_vehiculo.vehicle_damage_3 AS VARCHAR(25)),
    CAST(temp.colision_vehiculo.public_property_damage AS CHAR(1)),
    CAST(temp.colision_vehiculo.public_property_damage_type AS VARCHAR(50)),
    CAST(temp.colision_vehiculo.contributing_factor_1 AS VARCHAR(100)),
    CAST(temp.colision_vehiculo.contributing_factor_2 AS VARCHAR(100))
FROM temp.colision_vehiculo;


--CONSULTAS
--1) Mostrar los vehículos que han tenido más de un accidente:
SELECT vehicle_id, COUNT(*) AS accident_count
FROM fin.colision_vehiculo
GROUP BY vehicle_id
HAVING COUNT(*) > 1;

--2)  Mostrar todos los vehículos con una antigüedad de al menos 35 años:
SELECT *
FROM fin.vehiculo
WHERE vehicle_year <= EXTRACT(YEAR FROM CURRENT_DATE) - 35;

--3) Mostrar el top 5 de las marcas de vehículos:
SELECT vehicle_make, COUNT(*) AS total
FROM fin.vehiculo
GROUP BY vehicle_make
ORDER BY total DESC
LIMIT 5;

--4) Mostrar los datos de aquellos conductores implicados en más de 1 accidente:
SELECT person_id, COUNT(*) AS num_accidentes
FROM fin.colision_persona
GROUP BY person_id
HAVING COUNT(*) > 1
ORDER BY num_accidentes DESC;

-- 5)  Mostrar los datos de los conductores con accidentes mayores de 65 años y menores de 26 ordenados ascendentemente:
SELECT *
FROM fin.colision_persona
WHERE person_age > 65 OR person_age < 26
ORDER BY person_age ASC ;

-- 6) Mostrar los datos de los conductores que tienen como vehículo un “Pickup”:
SELECT p.*
FROM fin.persona AS p
JOIN fin.colision_persona AS cp ON p.person_id = cp.person_id
JOIN fin.accidentes AS a ON cp.collision_id = a.collision_id
WHERE a.vehicle_type_code_3 LIKE '%Pickup%';


--7)Mostrar las 3 marcas de vehículos que sufren menos accidentes y los 3 tipos de vehículo que menos accidentes sufren:
--7.1)Marcas de vehículos:
SELECT vehicle_make, COUNT(*) AS accident_count
FROM fin.colision_vehiculo
GROUP BY vehicle_make
ORDER BY accident_count ASC
LIMIT 3;

--7.2)Tipos de vehículos:
SELECT vehicle_type, COUNT(*) AS accident_count
FROM fin.colision_vehiculo
GROUP BY vehicle_type
ORDER BY accident_count ASC
LIMIT 3;

--8) Mostrar el número de accidentes que ha sufrido cada marca:
SELECT vehicle_make, COUNT(*) AS accident_count
FROM fin.colision_vehiculo
GROUP BY vehicle_make
ORDER BY accident_count DESC;

--9) Mostrar la procedencia de los conductores que han sufrido accidentes:
SELECT p.person_id, p.person_city, p.person_state
FROM fin.persona AS p
WHERE p.person_id IN (
    SELECT DISTINCT person_id
    FROM fin.colision_persona
    WHERE ped_role = 'Driver'
);


--10 Mostrar el número de accidentes de los vehículos por estado de matriculación:
SELECT state_registration, COUNT(*) AS accident_count
FROM fin.colision_vehiculo
GROUP BY state_registration
ORDER BY accident_count DESC;

