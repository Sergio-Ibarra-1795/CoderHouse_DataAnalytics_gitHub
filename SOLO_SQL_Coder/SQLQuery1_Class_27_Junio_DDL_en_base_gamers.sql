USE gamers;

-- Para crear una tabla en SQL 
CREATE TABLE friend (
id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
first_name VARCHAR(30),
last_name VARCHAR(30),
email VARCHAR(30)
);

SELECT * FROM friend;


-- Para eliminar una tabla en SQL 
--DROP TABLE friend; 


--Para agregar una nueva columna a una tabla 
ALTER TABLE friend
ADD age INT;



--Create a new table with the desired column order
CREATE TABLE new_friend (
id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
first_name VARCHAR(30),
ages INT,
last_name VARCHAR(30),
email VARCHAR(30)
);

-- Copy data from the old table to the new table
INSERT INTO new_friend (id, first_name, last_name, email)
SELECT id, first_name, last_name, email
FROM friend;


--Insertando datos en la tabla friend 
INSERT INTO friend (first_name, last_name, email)
VALUES ('Fanny', 'Badillo','fani.badi@yahoo.com'),
('Martha', 'Iba','martha.iba@yahoo.com')



SELECT * FROM friend;


--PARA HACERUNA ESPECIE DE BACKUP 
-- AS copia datos Y estructura 
 CREATE TABLE friend_backup2 AS (
 SELECT * 
 FROM friend);


 --DROP TABLE friend_backup2; 

 -- Create a new table friend_backup2 with the same data and structure as friend
SELECT *
INTO friend_backup2
FROM friend;

SELECT * FROM friend_backup2;


 -- Like solo copia la estrcutura y o los datos
 --CREATE TABLE friend_backup
 --LIKE friend; 

 -- Create an empty backup table with the same structure as friend
SELECT *
INTO friend_backup
FROM friend
WHERE 1 = 0;


SELECT * FROM friend_backup;




-- FUNCIONES ESCALARES

-- Funciones de cadena 

--concat
USE gamers; 

SELECT concat(first_name, ' ', last_name)
AS complete_name
FROM SYSTEM_USER_



-- Upper and Lower case 
--SELECT UCASE(description) FROM CLASS

SELECT UPPER(description) FROM CLASS;

SELECT LOWER(description) FROM CLASS;


--Ejemplo de uso de hora y fecha 


-- Creemos una tabla 
CREATE TABLE ejemplo (
 id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
 fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP); 


 -- Create a table
CREATE TABLE ejemplo2 (
    id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    fecha_hora DATETIME DEFAULT CURRENT_TIMESTAMP
);


SELECT * FROM ejemplo2;  