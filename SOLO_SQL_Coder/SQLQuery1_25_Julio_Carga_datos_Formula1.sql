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


SELECT * FROM Constructors_results;









