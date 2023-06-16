select game.name
FROM game
WHERE game.name = 'Riders Republic';



/*SELECT * 
FROM game 
ORDER BY game.name DESC;
LIMIT 5; */



SELECT TOP 5 *
FROM game
ORDER BY game.name DESC
OFFSET 5 ROWS FETCH NEXT 25 ROWS ONLY;


--Para traer solo el comentario más viejo-- 
SELECT TOP 1 * 
FROM commentary
ORDER BY comment_date ASC; 


--ALIAS para renombrar un objeto- 
SELECT 
 commentary AS comentario
 , comment_date AS fecha_de_comentario
FROM COMMENTARY
WHERE comment_date > '2018-12-31'
ORDER BY commentary; 


--ALIAS para renombrar un objeto- 
SELECT 
 co.commentary AS comentario
 , co.comment_date AS fecha_de_comentario
FROM COMMENTARY as co
WHERE comment_date > '2018-12-31'
ORDER BY commentary DESC;


SELECT COUNT(*)
AS total_level
FROM LEVEL_GAME;

--FUNCIONES DE AGREGACIÓN-

--Ejemplo de uso de COUNT()--
SELECT COUNT(*)
AS total_level
FROM LEVEL_GAME;


--Ejemplo de uso de MIN()--
SELECT MIN(id_level)
AS min_level
FROM LEVEL_GAME;


--Ejemplo de uso de AVG()--
SELECT AVG(id_level)
AS avg_level
FROM LEVEL_GAME;



--Ejemplo de uso de SUM()--
SELECT SUM(id_level)
AS sum_level
FROM LEVEL_GAME;


--Ejemplo de uso de GROUP BY + FUNCIONES DE AGREGACIÓN-- 

SELECT 
  id_system_user AS usuario 
  , COUNT(*) AS juegos_terminados 
FROM play 
WHERE id_system_user =3 or id_system_user = 1
GROUP BY id_system_user;



-- SE DEBE AGRUPAR POR LAS COUMNAS QUE QUEREMOS VER Y QUE NO ESTÁN AGEGADAS!!

SELECT 
  id_system_user AS usuario
  , id_game
  , COUNT(*) AS juegos_terminados 
FROM play 
GROUP BY id_system_user, id_game;



-- HAVING PARA FILTRAR AGRUPACIONES-- 

SELECT 
  id_system_user AS usuario
  , COUNT(*) AS juegos_terminados 
FROM play 
GROUP BY id_system_user
HAVING COUNT(*)>1; --ES DECIR QUE HAYAN JUGADO AL MENOS 2 JUEGOS



--Introducción al uso de JOIN--

--INNER JOIN-- 
SELECT 
  p.id_system_user AS usuario, 
  g.id_game AS game, 
  g.name,
  g.id_level AS level 
FROM play AS p 
INNER JOIN game AS g ON p.id_game = g.id_game;


--LEFT JOIN-- 
SELECT  
  g.id_game AS game, 
  g.name,
  g.id_level AS level,
  p.id_system_user AS usuario
FROM game AS g 
LEFT JOIN play AS p ON p.id_game = g.id_game;
