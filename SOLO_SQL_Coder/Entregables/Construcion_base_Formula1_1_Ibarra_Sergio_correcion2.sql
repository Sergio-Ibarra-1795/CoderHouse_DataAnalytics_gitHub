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
