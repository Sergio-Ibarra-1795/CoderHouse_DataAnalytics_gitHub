USE Formula1_1;
-- Hasta el momento se a importado las tablas de 1. Circuits & 2. Races

SELECT * FROM Circuits;
SELECT * FROM Races;

-- Se prueba hacer left Join de ambas tablas

-- La tabla LEFT es Races
Select Races.year_race, Races.round_race, Races.name_race, Races.date_race , Circuits.circuitID, Circuits.circuitRef, Circuits.name 
FROM Races
LEFT JOIN Circuits 
ON Races.circuitID = Circuits.circuitID;


-- La tabla LEFT es Circuits
Select Races.year_race, Races.round_race, Races.name_race, Races.date_race , Circuits.circuitID, Circuits.circuitRef, Circuits.name 
FROM Circuits
LEFT JOIN Races
ON Races.circuitID = Circuits.circuitID;

-- Ahora vamos a cargar la tabla Constructors 
ALTER TABLE Constructors
ALTER COLUMN url VARCHAR(150) NULL;

ALTER TABLE Constructors
ALTER COLUMN constructorRef VARCHAR(50) NULL;


SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Constructors';

SELECT * FROM Constructors;





-- Ahora vamos a cargar la tabla Constructors_results (Depende de ConstrutorId & RaceId) 

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Constructors_results';

ALTER TABLE Constructors_results
ALTER COLUMN Status_constructor VARCHAR(50) NULL;


-- Se tuvo que volver a cargar la información de Races
SELECT * FROM Races;

SELECT MAX(RaceId) FROM Races;


-- Step 1: Create a temporary table to store the existing data
SELECT * INTO TempRaces FROM Races;
SELECT * FROM TempRaces;

-- Step 2: Truncate the original "Races" table
TRUNCATE TABLE Races;

DELETE FROM Races;


DBCC CHECKIDENT ('Races', RESEED, 0);




-- Para poblar la tabla Constructors_results

SELECT * FROM Constructors_results;

-- Tuve que borrar los datos y resetear el Id para que empezara en 1 
DELETE FROM Constructors_results;

DBCC CHECKIDENT ('Constructors_results', RESEED, 0);




-- Para poblar la tabla Drivers

SELECT * FROM Drivers;


-- Check for constraints
SELECT *
FROM sys.default_constraints
WHERE parent_object_id = OBJECT_ID('Drivers') 
  AND parent_column_id = COLUMNPROPERTY(OBJECT_ID('Drivers'), 'DOB', 'ColumnId')

-- Check for defaults  
SELECT *
FROM sys.columns c
INNER JOIN sys.default_constraints d 
  ON d.parent_object_id = c.default_object_id
WHERE object_name(c.object_id) = 'Drivers'
  AND c.name = 'DOB'

-- Check for triggers
SELECT * 
FROM sys.triggers
WHERE parent_id = OBJECT_ID('Drivers')



SELECT *
FROM sys.columns 
WHERE object_id = OBJECT_ID('Drivers')
  AND name = 'DOB';

ALTER TABLE Drivers
ALTER COLUMN DOB DATE;


-- 1. Drop and recreate the column with a higher length:
ALTER TABLE Drivers  
DROP COLUMN DOB;

ALTER TABLE Drivers
ADD DOB DATE;

SELECT * FROM Drivers;

ALTER TABLE Drivers 
ALTER COLUMN DOB DATE;

SELECT max_length 
FROM sys.columns
WHERE name = 'DOB';


--Para revisar las Keys (Primary Key and Foreing Key) de una tabla
SELECT *
FROM sys.key_constraints
WHERE parent_object_id = OBJECT_ID('Drivers');


--Para revisar las Keys (Foreing Key) y las tablas que dependen de una tabla que no permite borrar
SELECT * 
FROM sys.foreign_keys
WHERE referenced_object_id = OBJECT_ID('Drivers');


-- Para intentar otro formato de fecha 
ALTER TABLE Drivers
ALTER COLUMN DOB DATETIME;




-- Aunue en realidad con tener el formato correcto en Excel era suficinte
ALTER TABLE Drivers
ALTER COLUMN DOB DATE;



DELETE FROM Drivers;

DBCC CHECKIDENT ('Drivers', RESEED, 0);

SELECT * FROM Drivers;




-- Ahora vamos a importar datos de la tabla contructors_standings

SELECT * FROM Races;

SELECT * FROM Constructors;


ALTER TABLE Constructors_standings
ALTER COLUMN PositionText INT;


SELECT * FROM Constructors_standings;




-- Ahora vamos a importar datos de la tabla Drivers_standings

ALTER TABLE Drivers_standings
ALTER COLUMN PositionText INT;



SELECT * FROM Drivers_standings;

SELECT COUNT(driverStandingsId) FROM Drivers_standings;




-- Ahora vamos a importar datos Lap_times
SELECT * FROM Lap_times;

--Para revisar las Keys (Primary Key and Foreing Key) de una tabla
SELECT *
FROM sys.key_constraints
WHERE parent_object_id = OBJECT_ID('Lap_times');


--a) Make lapID not a primary key and non-identity column

--To do this: Drop the primary key constraint:


SELECT name 
FROM sys.key_constraints
WHERE type = 'PK' 
  AND parent_object_id = OBJECT_ID('Lap_times');



ALTER TABLE PIT_stops
DROP CONSTRAINT FK__PIT_stops__lap__71D1E811;



ALTER TABLE Lap_times 
DROP CONSTRAINT PK__Lap_time__5CACEC791939377F;



-- 2. Alter lapID to not be identity:

ALTER TABLE Lap_times
ALTER COLUMN lapID INT NOT NULL;


-- b) Add new lapID_and_driverId column

ALTER TABLE Lap_times
ADD lapID_and_driverId VARCHAR(10) NULL;

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Lap_times';


ALTER TABLE Lap_times
DROP COLUMN Miliseconds;

ALTER TABLE Lap_times
ADD Miliseconds INT NULL;


SELECT * FROM Lap_times;

--DROP BORRA CONTENIDO + ESTRUCTURA
DROP TABLE Lap_times;

-- RECREARTING THE TABLE Lap_times

CREATE TABLE Lap_times (
    lap_timesId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	lapId_and_driverId VARCHAR(10) NOT NULL,
	lapId INT NOT NULL,
    raceId INT NOT NULL,
    driverId INT NOT NULL,
    Position INT NOT NULL,
    Time_lap TIME NOT NULL,
    Miliseconds INT NULL,
    FOREIGN KEY (raceId) REFERENCES Races(raceId),
    FOREIGN KEY (driverId) REFERENCES Drivers(driverId)
);


-- Ahora vamos a importar la tabla qualifying 




SELECT * FROM qualifying;

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'qualifying';

ALTER TABLE qualifying
ALTER COLUMN q1 DATETIME NULL;

ALTER TABLE qualifying
ALTER COLUMN q2 DATETIME NULL;

ALTER TABLE qualifying
ALTER COLUMN q3 DATETIME NULL;


SELECT * FROM Constructors;



-- Ahora vamos a cargar datos de la tabla PIT_stops 


-- Truncate elimina datos y reinicia el ID

TRUNCATE TABLE qualifying;




-- Ahora vamos a cargar datos de la tabla PIT_stops 


--DROP BORRA CONTENIDO + ESTRUCTURA
DROP TABLE PIT_stops;


CREATE TABLE PIT_stops (
 PIT_StopsID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    StopsID INT NOT NULL,
    raceId INT NOT NULL,
    driverId INT NOT NULL,
    lapId INT NOT NULL,
    Time_stops DATETIME NOT NULL,
    duration INT NOT NULL,
    Miliseconds INT NOT NULL,
    FOREIGN KEY (raceId) REFERENCES Races(raceId),
    FOREIGN KEY (driverId) REFERENCES Drivers(driverId)
);


SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'PIT_stops';


ALTER TABLE PIT_stops
ALTER COLUMN Miliseconds INT NULL; 

USE Formula1_1;

TRUNCATE TABLE PIT_stops;

SELECT * FROM PIT_stops;
