CREATE DATABASE Clace4; 

--CREAR TABLA CLIENTES--
CREATE TABLE Clientes (IDCliente int NOT NULL IDENTITY PRIMARY KEY, 
NombreCliente varchar(50) NOT NULL, 
Direccion varchar(50) NOT NULL,
Ciudad varchar(50) NOT NULL, 
CP varchar(50) NOT NULL, 
Pais text NOT NULL);

--CREAR TABLA Empleados--
CREATE TABLE Empleados (IDEmpleado int NOT NULL IDENTITY PRIMARY KEY, 
Apellido varchar(50) NOT NULL, 
Nombre varchar(50) NOT NULL,
Nacimiento datetime NOT NULL, 
Notas varchar(50)NOT NULL);


--CREAR TABLA ORDENES--

CREATE TABLE Ordenes (IDOrden int NOT NULL IDENTITY PRIMARY KEY,
FechaOrden datetime NOT NULL,
IDCliente int NOT NULL FOREIGN KEY REFERENCES Clientes(IDCliente),
IDEmpleado int NOT NULL FOREIGN KEY REFERENCES Empleados(IDEmpleado));


--EJEMPLOS ALTER--

--Agregando columna/campo a una tabla--
ALTER TABLE Ordenes
ADD Cantidad int;


--MODIFICAR TIPO DE DATOS DE COLUMNA--
ALTER TABLE Ordenes
ALTER COLUMN Cantidad varchar(10);


--EJEMPLO DROP eliminar columna/campo de una tabla--
ALTER TABLE Ordenes
DROP COLUMN Cantidad;