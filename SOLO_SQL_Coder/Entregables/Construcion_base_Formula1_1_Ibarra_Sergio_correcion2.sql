USE Formula1_1; 

--Corrigiendo la tabla Races

ALTER TABLE Races 
ALTER COLUMN date_race DATE;


SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Races';

ALTER TABLE Races 
ADD tmp_date DATE NULL;

UPDATE Races
SET tmp_date = DATEFROMPARTS(year(GETDATE()), date_race, 1);

ALTER TABLE Races
DROP COLUMN date_race;

EXEC sp_rename 'Races.tmp_date', 'date_race', 'COLUMN';


SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Races';




--Corrigiendo la tabla PIT_stops

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'PIT_stops';


EXEC sp_rename 'PIT_stops.lap', 'lapID', 'COLUMN';


--Corrigiendo la tabla Drivers
EXEC sp_rename 'PIT_stops.lap', 'lapID', 'COLUMN';

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Drivers';







--Corrigiendo la tabla qualifying
EXEC sp_rename 'qualifying.qualifyId', 'qualifyingId', 'COLUMN';

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'qualifying';



--Corrigiendo la tabla sprint_results
EXEC sp_rename 'sprint_results.resultId', 'sprint_resultId', 'COLUMN';

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sprint_results';




--Corrigiendo la tabla results
ALTER TABLE results 
ADD points INT NULL;

ALTER TABLE results
ADD laps INT NULL;


SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'results';




--Corrigiendo la tabla sprint_results
ALTER TABLE sprint_results 
ADD points INT NULL;

ALTER TABLE sprint_results
ADD laps INT NULL;


SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sprint_results';



SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Circuits';






--Corrigiendo la tabla Circuits

ALTER TABLE Circuits
ALTER COLUMN url VARCHAR(150) NULL;

SELECT * FROM Circuits;
