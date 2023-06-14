--Clase 16 De Marzo de funciones escalares y subconsultas

CREATE DATABASE Clsee7; 

CREATE TABLE Estados (IDEstado int NOT NULL IDENTITY PRIMARY KEY,
Nombre varchar (50) NOT NULL);


--Insertar datos en la tabla estados-- 
INSERT INTO Estados
VALUES ('Ingresado en Planta'),
('En camino'),
('Espera en sucursarl'),
('Entregado');

--Visualizar contenido de tabla estados-- 
SELECT * FROM Estados; 



--CREAR TABLA ENVIOS DENDE VENDRÁ EL FK IDEstado-- 
CREATE TABLE Envios (IDEnvio varchar(20) NOT NULL PRIMARY KEY,
IDEstado int FOREIGN KEY REFERENCES Estados(IDEstado),
Descripcion varchar (50) NOT NULL,
FechaEnvio datetime NOT  NULL);



--INSERTAR DATOS TABLA ENVIOS SISTEMA INGLÉS (PRIMERO EL MES - DESPUÉS DÍA)--INSERT INTO  Envios (IDEnvio, IDEstado,Descripcion, FechaEnvio)VALUES ('EN-283450-AR',1,'Paquete fragil','02-25-2021'),('EX-394899-CO',1,' No colocarlo en lugares humedos', '02-25-2021'),('EN-485970-CL',2,' Presenta golpes','04-21-2021'),('EX-298895-UY',3,' Caja Vacia tiene poco peso', '05-17-2021'), ('EX-308498-MX',4,' Presenta abolladura', GETDATE());SELECT * FROM Envios;--Uso de funciones escalares en SQL (CARACTERES)--Envios Normales--SELECT * FROM Envios where LEFT(IDEnvio,2) = 'EN'; --Envios Express--SELECT * FROM Envios where LEFT(IDEnvio,2) = 'EX'; --Para obtener los envíos de Mexico--SELECT * FROM EnviosWhere RIGHT (IDEnvio, 2) = 'MX';--Para obtener los envíos Express hacia URUGUAY --SELECT * FROM EnviosWhere LEFT(IDEnvio,2) = 'EX' AND RIGHT (IDEnvio, 2) = 'UY';--Uso de concat--SELECT CONCAT(IDEnvio, '/', IDEstado) AS NewNicknameFROM Envios;SELECT CONCAT(LEFT(IDEnvio,2), '-', RIGHT(IDEnvio,2)) AS EjemploFROM Envios SELECT *FROM Envios;--Ejemplo REPLACE--SELECT REPLACE(IDEnvio, '-' ,' ') AS Ejemplo_reemplazarFROM Envios;--EJEMPLO REPLACE ANIDADO--SELECT REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(IDEnvio,'AR', ' Argentina'), 'CL', ' Chile'), 'UY', 'Uruguay'), 'CO', 'Colombia'), 'MX', 'Mexico') AS Nueva_columnaFROM Envios;--Funciones fecha y tiempo-- --Año del campo fecha de envío-- SELECT YEAR(FechaEnvio) AS AñoFROM Envios;SELECT IDEnvio, YEAR(FechaEnvio) AS Año,MONTH(FechaEnvio) AS Mes,DAY(FechaEnvio) AS Dia FROM Envios;--EJEMPLO DATEADD--SELECT IDEnvio, DATEADD(MONTH,1,FechaEnvio) AS Mes_agregado, FechaEnvioFROM Envios;--Ejemplo datediff--SELECT IDEnvio, DATEDIFF(MONTH,FechaEnvio,GETDATE()) AS  Diferencia, FechaEnvioFROM Envios;SELECT IDEnvio, DATEDIFF(DAY,FechaEnvio,GETDATE()) AS  Diferencia, FechaEnvioFROM Envios;--Ejemplo de funciones matemáticas----PARA TRAER SOLO LA PARTE ENTERASELECT FLOOR (22.65) AS Ejemplo;--Lo redondea entero siguienteSELECT CEILING (22.65) AS Ejemplo;--Lo redondea con el numero de decimales definidos despues de la comaSELECT ROUND(22.65,1) AS Ejemplo;--Transforma tipo de dato en la consulta temporal--SELECT CAST(FechaEnvio AS varchar(50)) AS Nueva_fechaFROM Envios;SELECT * FROM Envios;SELECT * FROM Estados;--SUBCONSULTAS SQL--SELECT *FROM Envios Where IDEstado = 4--subquery--SELECT IDEstadoFROM EstadosWHERE Nombre = 'Entregado'--Query + subquery--SELECT *FROM EnviosWHERE IDEstado =(SELECT IDEstadoFROM EstadosWHERE Nombre = 'Entregado');