USE gamers;

SELECT* FROM CLASS;


INSERT INTO class (id_level, id_class, description)
VALUES (1, 998, 'Accion Latinoameriva')


INSERT INTO ´gamers.class´(id_level, id_class, description)
VALUES (1, 998, 'Accion Latinoameriva')


SELECT* FROM CLASS;


--Para crear una nueva tabla

CREATE TABLE pay (	id_pay INT NOT NULL AUTO_INCREMENT PRIMARY KEY,	amount DECIMAL(9, 2) NOT NULL,	currency VARCHAR(20) NOT NULL,	date_pay DATE NOT NULL,	pay_type VARCHAR(50),	id_system_user INT NOT NULL,	id_game INT NOT NULL);CREATE TABLE pay (
    id_pay INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
    amount DECIMAL(9, 2) NOT NULL,
    currency VARCHAR(20) NOT NULL,
    date_pay DATE NOT NULL,
    pay_type VARCHAR(50),
    id_system_user INT NOT NULL,
    id_game INT NOT NULL
);


--Para Insertar varios registros 

INSERT INTO pay VALUES
(Null, 250,'USD','2021-07-22', 'Paypal', 850, 77);

INSERT INTO pay  VALUES (250, 'USD', '2021-07-22', 'Paypal', 850, 77);

SELECT * FROM pay;


INSERT INTO pay (amount, currency, date_pay, pay_type, id_system_user, id_game)
VALUES (350, 'Peso', '2021-07-25', 'Paypal', 800, 770);

SELECT * FROM pay;


-- Actualización de Registros UPDATE nombre_tabla SET campon = daton

UPDATE pay 
SET date_pay = CURRENT_DATE -1 
WHERE date_pay = CURRENT_DATE ;


UPDATE pay
SET date_pay = DATEADD(DAY, -1, GETDATE())
WHERE date_pay = CONVERT(DATE, GETDATE());


-- Un ejemplo de como usar UPDATE en la tabla de class 

UPDATE class
SET id_level = 8 
WHERE id_class <= 20
AND id_level <13; 

SELECT * FROM CLASS;


--DELETE en base de datos 


-- PRIMERO SE CREARÁ UN BACK UP 

CREATE TABLE class_backup LIKE class;


SELECT *
INTO class_backup
FROM class
WHERE 1 = 0;

INSERT INTO class_backup
SELECT *
FROM class;



SELECT *
FROM class_backup;