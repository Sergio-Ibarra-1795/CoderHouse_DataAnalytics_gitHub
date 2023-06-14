--Class 21.March.2023_Ejercicios Join & union--

SELECT * FROM Asignaturas;
SELECT * FROM Staff;

--Ejercico 1--
SELECT 
A.Jornada,
COUNT(S.DocentesID) AS cantidad_docentes,
SUM(A.Costo) AS suma_total
FROM Asignaturas AS A
LEFT JOIN Staff AS S 
ON A.AsignaturasID= S.Asignatura
WHERE A.Nombre = 'Desarrollo web'
GROUP BY A.Jornada;




SELECT * FROM Encargado;
--Ejercico 2--
SELECT 
E.Encargado_ID,
E.Nombre,
E.Apellido,
COUNT(S.DocentesID) AS cantidad_docentes
FROM Encargado AS E
LEFT JOIN Staff AS S
ON E.Encargado_ID = S.Encargado
GROUP BY E.Encargado_ID,E.Nombre, E.Apellido
HAVING COUNT(S.DocentesID) >0 
ORDER BY cantidad_docentes ASC;



--Ejercico 3--
