CREATE DATABASE PECL2;

CREATE SCHEMA IF NOT EXISTS temp;

create schema fin;

-- Tablas iniciales en el esquema temporal, configuradas con todos los atributos como tipo TEXT y se han importado los datos completos correspondientes a cada tabla desde los archivos

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
    state_registration TEXT,
    vehicle_type    TEXT,
    vehicle_make    TEXT,
    vehicle_model   TEXT,
    vehicle_year    TEXT
);

CREATE TABLE IF NOT EXISTS temp.colision_persona (
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
   person_sex TEXT,
   unique_id TEXT,
   collision_id TEXT,
   crash_date TEXT,
   crash_time TEXT
);

CREATE TABLE IF NOT EXISTS temp.colision_vehiculo (
    vehicle_id TEXT,
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
    contributing_factor_2 TEXT,
    unique_id TEXT,
    collision_id TEXT,
    crash_date TEXT,
    crash_time TEXT,
    state_registration TEXT,
    vehicle_type TEXT,
    vehicle_make TEXT,
    vehicle_model TEXT,
    vehicle_year TEXT
);

-- Tablas finales con los tipos de datos correctos

CREATE TABLE IF NOT EXISTS fin.accidentes (
   collision_id UUID,
   vehicle_type_code_1 VARCHAR(100),
   vehicle_type_code_2 VARCHAR(100),
   vehicle_type_code_3 VARCHAR(100),
   vehicle_type_code_4 VARCHAR(100),
   vehicle_type_code_5 VARCHAR(100),
   crash_date DATE,
   crash_time TIME without time zone,
   longitude DOUBLE PRECISION,
   borough VARCHAR(15),
   latitude DOUBLE PRECISION,
   location POINT,
   zip_code VARCHAR(5),
   on_street_name VARCHAR(35),
   cross_street_name VARCHAR(25),
   off_street_name VARCHAR(35),
   number_of_persons_injured INTEGER,
   number_of_persons_killed INTEGER,
   number_of_pedestrians_injured INTEGER,
   number_of_pedestrians_killed INTEGER,
   number_of_cyclist_injured INTEGER,
   number_of_cyclist_killed INTEGER,
   number_of_motorist_injured INTEGER,
   number_of_motorist_killed INTEGER,
   contributing_factor_vehicle_1 VARCHAR(100),
   contributing_factor_vehicle_2 VARCHAR(100),
   contributing_factor_vehicle_3 VARCHAR(100),
   contributing_factor_vehicle_4 VARCHAR(100),
   contributing_factor_vehicle_5 VARCHAR(100),
    CONSTRAINT Collision_pk PRIMARY KEY (collision_id)
);

CREATE TABLE IF NOT EXISTS fin.persona (
   person_id UUID,
   person_sex CHAR(1),
   person_firstname VARCHAR(15),
   person_lastname VARCHAR(15),
   person_address VARCHAR(50),
   person_city VARCHAR(25),
   person_state VARCHAR(20),
   person_phone VARCHAR(20),
   person_zip CHAR(5),
   person_ssn CHAR(11),
   person_dob DATE,
   CONSTRAINT Persona_pk PRIMARY KEY (person_id)
);

CREATE TABLE IF NOT EXISTS fin.vehiculo (
   vehicle_id UUID,
   state_registration INT NULL,
   vehicle_type VARCHAR(50),
   vehicle_year INT,
   vehicle_model VARCHAR(25),
   vehicle_make VARCHAR(25),
   CONSTRAINT Vehiculo_pk PRIMARY KEY (vehicle_id)
);

CREATE TABLE IF NOT EXISTS fin.colision_persona (
   collision_id UUID,
   person_id UUID,
   vehicle_id UUID,
   unique_id UUID,
   crash_date DATE,
   crash_time TIME without time zone,
   person_type VARCHAR(15),
   person_age INT,
   person_sex CHAR(1),
   person_injury VARCHAR(15),
   ejection VARCHAR(15),
   emotional_status VARCHAR(25),
   bodily_injury VARCHAR(25),
   position_in_vehicle VARCHAR(100),
   safety_equipment VARCHAR(25),
   ped_location VARCHAR(100),
   ped_action VARCHAR(25),
   ped_role VARCHAR(20),
   complaint VARCHAR(40),
   contributing_factor_1 VARCHAR(25),
   contributing_factor_2 VARCHAR(25),
    CONSTRAINT Vehiculo_pk FOREIGN KEY (vehicle_id) REFERENCES fin.vehiculo (vehicle_id) MATCH FULL  --exige que ambas claves relacionadas sean válidas o ambas sean Null
       ON DELETE SET DEFAULT ON UPDATE SET DEFAULT, -- ON DELETE SET DEFAULT: si un vehículo relacionado se elimina, el valor de vehicle_id en esta tabla se establece como un valor predeterminado
                                                    -- ON UPDATE SET DEFAULT: Si el vehicle_id cambia, esta tabla ajusta el valor automáticamente al predeterminado
    CONSTRAINT Person_pk FOREIGN KEY (person_id) REFERENCES fin.persona (person_id) MATCH FULL  --exige que ambas claves relacionadas sean válidas o ambas sean Null
       ON DELETE SET DEFAULT ON UPDATE SET DEFAULT, -- ON DELETE SET DEFAULT: si una persona relacionada se elimina, el valor de person_id en esta tabla se establece como un valor predeterminado
                                                    -- ON UPDATE SET DEFAULT: Si el person_id cambia, esta tabla ajusta el valor automáticamente al predeterminado
    CONSTRAINT Unique_pk1 PRIMARY KEY (unique_id)    -- Puede ser necesario usar collision_id en lugar de unique_id
);

CREATE TABLE IF NOT EXISTS fin.colision_vehiculo (
   unique_id UUID,
   vehicle_id UUID,
   collision_id UUID,
   crash_date DATE,
   crash_time TIME without time zone,
   state_registration VARCHAR(2),
   vehicle_type VARCHAR(50),
   vehicle_year INT,
   vehicle_make VARCHAR(15),
   vehicle_model VARCHAR(15),
   travel_direction VARCHAR(15),
   vehicle_occupants INT,
   driver_sex CHAR(1),
   driver_license_status VARCHAR(20),
   driver_license_jurisdiction VARCHAR(2),
   pre_crash VARCHAR(50),
   point_of_impact VARCHAR(50),
   vehicle_damage VARCHAR(50),
   vehicle_damage_1 VARCHAR(50),
   vehicle_damage_2 VARCHAR(50),
   vehicle_damage_3 VARCHAR(25),
   public_property_damage CHAR(1),
   public_property_damage_type VARCHAR(50),
   contributing_factor_1 VARCHAR(100),
   contributing_factor_2 VARCHAR(100),
    CONSTRAINT Vehiculo_pk FOREIGN KEY (vehicle_id) REFERENCES fin.vehiculo (vehicle_id) MATCH FULL
       ON DELETE SET DEFAULT ON UPDATE SET DEFAULT,  -- ON DELETE SET DEFAULT: si un vehículo relacionado se elimina, el valor de vehicle_id en esta tabla se establece como un valor predeterminado
                                                     -- ON UPDATE SET DEFAULT: Si el vehicle_id cambia, esta tabla ajusta el valor automáticamente al predeterminado
    CONSTRAINT Collision_pk FOREIGN KEY (collision_id) REFERENCES fin.accidentes (collision_id) MATCH FULL
       ON DELETE SET DEFAULT ON UPDATE SET DEFAULT,      -- ON DELETE SET DEFAULT: si una colisión relacionada se elimina, el valor de collision_id en esta tabla se establece como un valor predeterminado
                                                         -- ON UPDATE SET DEFAULT: Si el collision_id cambia, esta tabla ajusta el valor automáticamente al predeterminado
    CONSTRAINT Unique_pk2 PRIMARY KEY (unique_id)        -- Puede ser necesario usar collision_id en lugar de unique_id
);





