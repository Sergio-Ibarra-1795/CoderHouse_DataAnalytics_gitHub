USE gamers;

--INSERT + SUBCONSULTA 

-- Paso 1 Creamos las nuevas tablas
CREATE TABLE new_class (	id_level INT NOT NULL,	id_class INT NOT NULL,	description VARCHAR(200) NOT NULL,	PRIMARY KEY (id_class, id_level));SELECT * FROM new_class;CREATE TABLE new_level_game (	id_level INT NOT NULL,	description VARCHAR(200) NOT NULL,	PRIMARY KEY (id_level));SELECT * FROM new_level_game;--Paso 2 Insertamos valores nuevos en una de las tablas creadasINSERT INTO new_class (id_level, id_class, description)VALUES(17, 10, 'Adventure Other'),(15, 1, 'Spy Other'),(17, 20, 'British Comedy'),(17, 30, 'Adventure'),(14, 1, ''),(18, 1, '');SELECT * FROM new_class;--Paso 3. Se inserta datos en l a otra tabla como subcosnultaINSERT INTO new_level_game (id_level, description)(	SELECT DISTINCT id_level, 'New level'	FROM new_class	WHERE id_level NOT IN (		SELECT id_level		FROM level_game	));--Esto es una lista SELECT id_levelFROM level_game;SELECT * FROM new_level_game;--Para verificar lo que había en la 'tabla original' de nombre level_gameSELECT * FROM level_game;--Ejemplo de CREATE TABLE + SUBCOSNULTACREATE TABLE juegos_incompletos( SELECT * FROM playWHERE completed =FALSE); SELECT *
INTO juegos_incompletos
FROM play
WHERE completed = FALSE;

SELECT * FROM play;


SELECT *
INTO juegos_incompletos
FROM play
WHERE completed = 0;


SELECT * FROM juegos_incompletos;



--UPDATE + SUBCONSULTAS

UPDATE new_class SET id_level = 20WHERE id_level IN (	SELECT id_level	FROM new_level_game);SELECT * FROM new_class;





--DELETE + SUBCONSULTAS

DELETE FROM new_classWHERE id_level NOT IN (	SELECT id_level 	FROM new_level_game);SELECT * FROM new_class;-- SOLO PARA volver a 'alimentar' la tabla new_classINSERT INTO new_class (id_level, id_class, description)VALUES(17, 10, 'Adventure Other'),(15, 1, 'Spy Other'),(17, 20, 'British Comedy'),(17, 30, 'Adventure'),(14, 1, ''),(18, 1, '');SELECT * FROM new_class;