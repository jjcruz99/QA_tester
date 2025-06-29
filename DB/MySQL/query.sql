-- crear base de datos
CREATE DATABASE tienda;

-- Eliminar base de datos
DROP DATABASE tienda;

-- seleccionar la base de datos
USE tienda;

-- crear tabla 
CREATE TABLE empleados(
	id_empleado INT  AUTO_INCREMENT  PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	apellido VARCHAR(50) NOT NULL,
	identificacion BIGINT NOT NULL,
	edad TINYINT NOT NULL,
	salario  DECIMAL NOT NULL,
	fecha_ingreso DATE NOT NULL,
	observacion VARCHAR(100) 
);

-- insertar 
INSERT INTO empleados (nombre, apellido, identificacion, edad, salario, fecha_ingreso, observacion) 
VALUES ('María', 'Gómez', 2030405060, 25, 2800000.00, '2021-08-01', 'Excelente en servicio al cliente.'),
       ('Carlos', 'Rodríguez', 3040506070, 45, 3500000.00, '2019-03-20', 'Con amplia experiencia en el sector.'),
       ('Ana', 'López', 4050607080, 32, 2600000.00, '2023-05-10', 'Recién incorporada, con gran potencial.');

SELECT * FROM empleados;

SELECT nombre,salario AS sueldo FROM empleados;



-- Actualizar datos

UPDATE empleados SET salario = 4000000,edad = 28 WHERE id_empleado = 2;

UPDATE empleados SET salario = 3000000 WHERE nombre='Natalia';
-- eliminar un empleado

DELETE FROM empleados WHERE id_empleado=1;


-- filtrar datos

SELECT * FROM empleados WHERE fecha_ingreso > "2022-01-01"

	-- OPERADORES Y FUNCIONES

	SELECT (edad + 100) AS cienMas FROM empleados;

	SELECT * FROM empleados WHERE salario > 3000000 AND edad < 50;

	SELECT * FROM empleados WHERE salario BETWEEN 2600000 AND 4000000; -- between = entre un rango

	SELECT * FROM empleados WHERE nombre LIKE '%C'; -- empleados que su nombre empiezan con C

	SELECT * FROM empleados WHERE nombre LIKE '%r%';

	SELECT * FROM empleados WHERE edad IN(32,45); -- busca la edad=32=45

	SELECT * FROM empleados WHERE observacion IS NULL
	
	
	
-- funciones de agregacion 


SELECT COUNT(nombre) AS total_empleados FROM empleados;

SELECT AVG(salario) AS salario_promedio FROM empleados;

SELECT MIN(salario) AS salario_min FROM empleados;

-- funciones de fecha y hora

SELECT nombre , fecha_ingreso, DATE_FORMAT(fecha_ingreso,'%d-%m-%Y') AS fecha_formateada FROM empleados;

SELECT nombre , fecha_ingreso, NOW() AS fecha_actual FROM empleados;


-- funciones de texto

SELECT CONCAT(nombre, " tiene ",edad,' años') AS info FROM empleados;

SELECT SUBSTRING(nombre,1,6) AS info FROM empleados;

SELECT nombre,LENGTH(nombre) AS info FROM empleados;

SELECT nombre,UPPER(nombre) AS info FROM empleados;

SELECT nombre,LOWER(nombre) AS info FROM empleados;

-- CONSULTAS AVANZADAS

-- Uso del group by y having

SELECT edad, COUNT(*) AS cantidad FROM empleados GROUP BY edad;

SELECT edad, COUNT(*) AS cantidad FROM empleados GROUP BY edad;

SELECT edad, COUNT(*) AS cantidad FROM empleados GROUP BY edad HAVING COUNT(*)>1;

SELECT edad FROM empleados ORDER BY edad ASC;

-- uso de limit y offset
SELECT nombre,salario FROM empleados ORDER BY salario DESC LIMIT 2;

SELECT nombre,salario FROM empleados ORDER BY salario DESC LIMIT 3 OFFSET 1;


-- Subconsultas

SELECT * FROM empleados WHERE salario = (SELECT MAX(salario) FROM empleados);

SELECT nombre, salario FROM empleados WHERE salario > (SELECT AVG(salario) FROM empleados);



-- Uniniones entre tablas

-- modificar la DB

CREATE TABLE departamentos(
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR (50) NOT NULL
);

INSERT INTO departamentos (nombre)
	VALUES  ('Gerencia'),
		('TI'),
		('Ventas'),
		('Marketing'),
		('RRHH');
		
		
ALTER TABLE empleados 
ADD COLUMN id_departamento INT,
ADD FOREIGN KEY (id_departamento) 
REFERENCES departamentos(id);

SELECT * FROM departamentos;


-- INNER JOIN

SELECT e.nombre,d.nombre AS Departamento FROM empleados AS e
INNER JOIN departamentos  AS d
ON d.id = e.id_departamento;

SELECT e.nombre,d.nombre AS Departamento FROM empleados AS e
RIGHT JOIN departamentos  AS d
ON d.id = e.id_departamento;

SELECT e.nombre,d.nombre AS Departamento FROM empleados AS e
LEFT JOIN departamentos  AS d
ON d.id = e.id_departamento;

-- indices IDEX
-- Los indices aceleran y optimizan las consultas 

ALTER TABLE empleados ADD INDEX idx_edad(edad);

SELECT * FROM empleados WHERE edad IN(25,32);

ALTER TABLE empleados ADD UNIQUE INDEX idx_email (email);

-- indice compuesto
ALTER TABLE empleados ADD INDEX idx_edad_salario (edad,salario);

-- eliminar indice
DROP INDEX idx_edad ON empleados;


-- ******  optimizacion de consultas

EXPLAIN SELECT nombre FROM empleados WHERE edad = 25;

ANALYZE TABLE empleados;


-- ****CREACION DE VISTAS Y SP

CREATE VIEW vista_empleados AS
SELECT nombre, salario FROM empleados WHERE salario > 2800000;

SELECT * FROM vista_empleados;

ALTER VIEW vista_empleados AS
SELECT nombre, salario FROM empleados WHERE salario > 3000000;

DROP VIEW vista_empleados;

-- procedimiento almacenado

DELIMITER $$
	CREATE PROCEDURE obtener_empleados_por_salario(IN salario_min DECIMAL(10,2))
		BEGIN
		  SELECT * FROM empleados WHERE salario >= salario_min;
		END$$
DELIMITER;

-- llamar sp

CALL obtener_empleados_por_salario (2800001);

-- SP con out

DELIMITER$$
	CREATE PROCEDURE contar_empleados(OUT total INT)
		BEGIN 
		 SELECT COUNT(*) INTO total FROM empleados;
		END$$
DELIMITER;

CALL contar_empleados(@resultado);
SELECT @resultado AS total_empleados;


-- FUNCIONES Y TRIGGERS 

-- Funciones

DELIMITER$$
CREATE FUNCTION calcular_bono(salario DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
DECLARE bono DECIMAL(10,2);
SET bono = salario * 0.10;
RETURN bono;
END$$
DELIMITER ;

-- usar la funcion
SELECT nombre, salario, calcular_bono(salario) AS Bono FROM empleados;

SELECT calcular_bono(5000.00);

SELECT nombre, salario
FROM empleados
WHERE calcular_bono(salario) > 300000; -- Mostrar empleados cuyo bono sea mayor a 300.000

-- Triggers : El la ejecucion de codigo cuano ocurre un evento

-- BEFORE INSERT antes de insertar un dato

DELIMITER$$

CREATE TRIGGER  before_insert_empleado
BEFORE INSERT ON empleados
FOR EACH ROW
	BEGIN
	 IF new.salario IS NULL OR new.salario < 3000000 THEN 
	   SET new.salario = 3000000;
	 END IF;
	END$$
	
DELIMITER ;

INSERT INTO empleados (nombre,apellido,identificacion,edad,salario,fecha_ingreso,id_departamento) 
  VALUES('Feliphe','Peña',125356588,22,NULL,'2020-05-01',2),
	('Julieta','Venegas',125000585,28,1000000,'2021-05-01',1);
	
SELECT * FROM empleados;

-- AFTER insert

CREATE TABLE tabla_logs (
id_log INT AUTO_INCREMENT PRIMARY KEY,
mensaje TEXT,
fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER$$

CREATE TRIGGER after_insert_empleado
AFTER INSERT ON empleados
FOR EACH ROW
	BEGIN
	   INSERT INTO tabla_logs (mensaje)
	   VALUES(CONCAT('Nuevo empleado: ', NEW.nombre, ' con salario ', NEW.salario));
	END$$
DELIMITER ;

-- probar trigger
INSERT INTO empleados (nombre,apellido,identificacion,edad,salario,fecha_ingreso,id_departamento) 
  VALUES('Ana','Torres',12535588,35,4200000,'2018-02-01',1),
	('Julia','Silva',1200025,58,4000000,'2018-05-01',4);
	
SELECT * FROM empleados;
SELECT * FROM `tabla_logs`;

-- transaccion 

CREATE TABLE IF NOT EXISTS cuentas(
id_cuenta INT AUTO_INCREMENT PRIMARY KEY,
titular VARCHAR(100) NOT NULL,
saldo DECIMAL(10,2) NOT NULL DEFAULT 0
);

INSERT INTO cuentas (titular, saldo) VALUES
('Juan Perez', 1500.50),
('Maria Lopez', 2300.75),
('Carlos Garcia', 800.00),
('Ana Ramirez', 5000.20),
('Pedro Gomez', 120.30);

CREATE TABLE IF NOT EXISTS transacciones(
id_transaccion INT AUTO_INCREMENT PRIMARY KEY,
id_cuenta_fk INT,
tipo ENUM('DEPOSITO', 'RETIRO', 'TRANSFERENCIA') NOT NULL,
fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY(id_cuenta_fk) REFERENCES cuentas(id_cuenta)
);

ALTER TABLE transacciones ADD COLUMN monto DECIMAL(10,2) NOT NULL;

-- realizar transaccion

START TRANSACTION;
UPDATE cuentas SET saldo=saldo - 100 WHERE id_cuenta = 1;
UPDATE cuentas SET saldo= saldo + 100 WHERE id_cuenta = 2;

INSERT INTO transacciones (id_cuenta_fk,tipo,monto)
	VALUES (1, 'RETIRO',100),
		(2,'DEPOSITO',100);
		
COMMIT ;

-- rollback

-- Definición del Stored Procedure para realizar retiros de forma segura
DELIMITER $$

CREATE PROCEDURE realizar_retiro_seguro(
    IN p_id_cuenta INT,            -- Parámetro de entrada: ID de la cuenta
    IN p_monto DECIMAL(10,2)       -- Parámetro de entrada: Monto a retirar
)
BEGIN
    DECLARE v_saldo_actual DECIMAL(10,2); -- Variable para almacenar el saldo actual de la cuenta
    DECLARE EXIT HANDLER FOR SQLEXCEPTION -- Manejador de errores para revertir la transacción si algo falla
    BEGIN
        ROLLBACK;
        -- Mensaje de error general si ocurre una excepción SQL
        SELECT 'Error inesperado. Transacción revertida.' AS mensaje_estado;
    END;

    -- Inicia la transacción. Esto asegura que todas las operaciones (SELECT, UPDATE, INSERT)
    -- se completen con éxito o se reviertan si algo falla.
    START TRANSACTION;

    -- Obtiene el saldo actual de la cuenta.
    -- 'FOR UPDATE' bloquea la fila seleccionada, previniendo que otras transacciones
    -- la modifiquen hasta que esta transacción se complete (COMMIT o ROLLBACK).
    SELECT saldo INTO v_saldo_actual
    FROM cuentas
    WHERE id_cuenta = p_id_cuenta
    FOR UPDATE;

    -- Verifica si el saldo actual es suficiente para el retiro
    IF v_saldo_actual >= p_monto THEN
        -- Actualiza el saldo de la cuenta restando el monto del retiro
        UPDATE cuentas
        SET saldo = saldo - p_monto
        WHERE id_cuenta = p_id_cuenta;

        -- Inserta un registro en la tabla de transacciones para el retiro
        INSERT INTO transacciones (id_cuenta_fk, tipo, monto)
        VALUES (p_id_cuenta, 'RETIRO', p_monto);

        -- Confirma la transacción, haciendo permanentes todos los cambios
        COMMIT;
        SELECT 'Retiro exitoso.' AS mensaje_estado;
    ELSE
        -- Si el saldo es insuficiente, revierte todos los cambios de la transacción
        ROLLBACK;
        SELECT 'Saldo insuficiente para el retiro.' AS mensaje_estado;
    END IF;

END$$

DELIMITER ;

CALL realizar_retiro_seguro(1, 500.00); -- Retira 500 de la cuenta 1
SELECT * FROM cuentas WHERE id_cuenta = 1;
SELECT * FROM transacciones WHERE id_cuenta_fk = 1;

CALL realizar_retiro_seguro(3, 1000.00); -- Intenta retirar 1000 
SELECT * FROM cuentas WHERE id_cuenta = 3; 
SELECT * FROM transacciones WHERE id_cuenta_fk = 3; 

-- Niveles de aislamiento

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
START TRANSACTION;
SELECT * FROM cuentas WHERE id_cuenta=1 FOR UPDATE; -- FOR UPDATE bloquea esta fila
UPDATE cuentas SET saldo = saldo - 500 WHERE id_cuenta = 1;
COMMIT;
END;

-- manejo de bloqueos para tablas
LOCK TABLES cuentas WRITE;
UPDATE cuentas SET saldo= saldo - 500 WHERE id_cuenta=3;
UPDATE cuentas SET saldo= saldo + 1500 WHERE id_cuenta=3;
UNLOCK TABLES;

SELECT * FROM cuentas;



-- Creacion de usuarios en mysql

CREATE USER 'usuariox'@'localhost' IDENTIFIED BY 'password';

SELECT USER,HOST FROM mysql.user; -- consultar los usuarios en la Bd

-- dar permisos con grant y revoke

GRANT ALL PRIVILEGES ON tienda.* TO 'usuariox'@'localhost'; -- Otro ejem: tienda.cuentas solo otorga permisos para tabla cuentas.

-- permisos especificos

GRANT INSERT , UPDATE ON tienda.* TO 'usuariox'@'localhost';

-- quitar permisos

REVOKE SELECT ON tienda.* FROM 'usuariox'@'localhost';

-- eliminar 
DROP USER 'usuariox'@'localhost';


-- Camabio de contraseña para usuarios

ALTER USER 'usuariox'@'localhost' IDENTIFIED BY 'newpassword';


-- forzar el cambio de contraseña

ALTER USER 'usuariox'@'localhost' PASSWORD EXPIRE;



--  ******** Copias de seguridad

CREATE DATABASE tienda
USE tienda
SOURCE 'E:\Programacion\QA\DB\MySQL\BackUP\copia_tienda.sql';


-- MONITOREO Y LOGs

SHOW PROCESSLIST;

-- Consultas lentas 

SHOW GLOBAL STATUS LIKE 'Slow_queries';

SET GLOBAL slow_query_log = 'ON';
SET GLOBAL log_query_time = 2; -- define 2 segundos como tiempo de una consulta lenta











