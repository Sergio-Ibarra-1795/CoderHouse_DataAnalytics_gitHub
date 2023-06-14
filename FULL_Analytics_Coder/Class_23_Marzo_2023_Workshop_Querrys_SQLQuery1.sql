--Class of 23.March.2023 -Workshop de bases de datos --


----EJERCICIO 1---/*Análisis de docentes por camada: Número de documento, nombre de docente y camada para identificar la camada mayor y la menor según el numero de la  camada. Número de documento, nombre de docente y camada para identificar la camada con fecha de ingreso Mayo 2021. Agregar un campo indicador que informe cuales son los registros ”mayor o menor” ylos que son “Mayo 2021” y ordenar el listado de menor a mayor por camada*/-- 

SELECT * FROM Staff;

Select s.Documento, s.Nombre, s.Camada 
from Staff AS s 
ORDER BY s.Camada DESC ; 

Select TOP (2) s.Documento, s.Nombre, s.Camada 
from Staff AS s 
ORDER BY s.Camada DESC ; 

--Subquerry usando max camada-- 
SELECT MAX(Camada)
from Staff;

--Query completa max camada----Los profes asignados a la camada con el número más grande--SELECT Documento, Nombre, Camada --camada número max--FROM StaffWHERE Camada =(SELECT MAX(Camada)FROM Staff);--Los profes asignados a la camada con el número más pequeño--SELECT Documento, Nombre, Camada --camada número min--FROM StaffWHERE Camada =(SELECT MIN(Camada)FROM Staff);--Camadas cuyos profes ingresaron en mayo 2021--SELECT Documento, Nombre, CamadaFROM StaffWHERE YEAR([Fecha Ingreso]) = 2021 AND MONTH([Fecha Ingreso]) =05;--Resultados de las tres tablas anteriores unidos meidante UNION-- SELECT Documento, Nombre, Camada, 'Camada Max' as MarcaFROM StaffWHERE Camada =(SELECT MAX(Camada)FROM Staff)UNIONSELECT Documento, Nombre, Camada, 'Camada Max' as MarcaFROM StaffWHERE Camada =(SELECT MIN(Camada)FROM Staff)UNIONSELECT Documento, Nombre, Camada, 'Mayo 2021' as MarcaFROM StaffWHERE YEAR([Fecha Ingreso]) = 2021 AND MONTH([Fecha Ingreso]) =05;--Resultados de las tres tablas anteriores unidos meidante UNION y USANDO ORDER by al final-- SELECT Documento, Nombre, Camada, 'Camada Max' AS Marca --camada número max--FROM StaffWHERE Camada =(SELECT MAX(Camada)FROM Staff)UNIONSELECT Documento, Nombre, Camada, 'Camada Min' AS Marca --camada número min--FROM StaffWHERE Camada =(SELECT MIN(Camada)FROM Staff)UNIONSELECT Documento, Nombre, Camada, 'Mayo 2021' AS Marca-- mayo 2021--FROM StaffWHERE YEAR([Fecha Ingreso]) = 2021 AND MONTH([Fecha Ingreso]) =05ORDER BY Camada DESC;--EJERCICIO 2---/*Análisis de profesiones con mas estudiantes: Identificar la profesión y la cantidad de estudiantes que ejercen, mostrar el listado solo de las profesiones que tienen mas de 5 estudiantes.Ordenar de mayor a menor por la profesión que tenga mas estudiantes.*/SELECT * FROM Estudiantes;SELECT * FROM Profesiones;SELECTP.Profesiones,COUNT(E.EstudiantesID) AS cant_estudiantesFROM Profesiones AS PINNER JOIN Estudiantes AS E ON P.ProfesionesID = E.ProfesionGROUP BY P.Profesiones;SELECTP.Profesiones,COUNT(E.EstudiantesID) AS cant_estudiantesFROM Profesiones AS PINNER JOIN Estudiantes AS EON P.ProfesionesID = E.ProfesionGROUP BY P.ProfesionesHAVING COUNT(E.EstudiantesID)>5ORDER BY cant_estudiantes DESC;----------------- NIVEL TACTICO------------------------EJERCICIO 1---/*Análisis mensual de estudiantes por área: Identificar para cada área: el año y el mes (concatenados en formato YYYY-M), cantidad de estudiantes y monto total de las asignaturas. Ordenar por cantidad de clientes de mayor a menor.*/SELECT * FROM Estudiantes;SELECT * FROM Staff;SELECT * FROM Asignaturas;SELECT * FROM Area;SELECTAR.Nombre AS Nombre_area,CONCAT(YEAR(E.[Fecha Ingreso]), '-', MONTH(E.[Fecha Ingreso])) AS Fecha_ingreso,COUNT(E.EstudiantesID) AS Cantidad_clientes,SUM(A.Costo) AS Suma_TotalFROM Estudiantes AS EINNER JOIN Staff AS SON E.Docente = S.DocentesIDINNER JOIN Asignaturas AS A ON S.Asignatura = A.AsignaturasIDINNER JOIN Area AS ARON A.Area= AR.AreaIDGROUP BY AR.Nombre,CONCAT(YEAR(E.[Fecha Ingreso]), '-', MONTH(E.[Fecha Ingreso]))ORDER BY Cantidad_clientes DESC;SELECT E.Nombre,E.Documento,RIGHT(S.Camada, 5) AS Camada,S.[Fecha Ingreso]FROM Encargado AS EINNER JOIN Staff AS SON E.Encargado_ID = S.EncargadoINNER JOIN Asignaturas AS AON S.Asignatura = A.AsignaturasIDWHERE E.Tipo LIKE '%Tutores%' AND A.Jornada = 'Noche';--EJERCICIO 4---
/*Análisis asignaturas mayor al promedio:
Identificar el nombre de la asignatura, el costo de la asignatura y
el promedio del costo de las
asignaturas por área.
Una vez obtenido el dato, del promedio se debe visualizar solo
las carreras que se encuentran por encima del promedio.*/SELECTArea,AVG(Costo) AS avgcostoFROM AsignaturasGROUP BY Area;--Todas las carreras que se encuentran por encima del promedio de su área--SELECTA.Nombre,A.Costo,B.avgcostoFROM Asignaturas AS ALEFT JOIN (SELECTArea,AVG(Costo) AS avgcostoFROM AsignaturasGROUP BY Area) AS BON A.Area = B.AreaWHERE A.Costo > B.avgcosto AND Tipo = 'Carrera';