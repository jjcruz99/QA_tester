/*
SQLyog Community v13.3.0 (64 bit)
MySQL - 8.0.42 : Database - tienda
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tienda` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `tienda`;

/*Table structure for table `cuentas` */

DROP TABLE IF EXISTS `cuentas`;

CREATE TABLE `cuentas` (
  `id_cuenta` int NOT NULL AUTO_INCREMENT,
  `titular` varchar(100) NOT NULL,
  `saldo` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id_cuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `cuentas` */

insert  into `cuentas`(`id_cuenta`,`titular`,`saldo`) values 
(1,'Juan Perez',300.50),
(2,'Maria Lopez',2500.75),
(3,'Carlos Garcia',1800.00),
(4,'Ana Ramirez',5000.20),
(5,'Pedro Gomez',120.30);

/*Table structure for table `departamentos` */

DROP TABLE IF EXISTS `departamentos`;

CREATE TABLE `departamentos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `departamentos` */

insert  into `departamentos`(`id`,`nombre`) values 
(1,'Gerencia'),
(2,'TI'),
(3,'Ventas'),
(4,'Marketing'),
(5,'RRHH'),
(6,'Logistica');

/*Table structure for table `empleados` */

DROP TABLE IF EXISTS `empleados`;

CREATE TABLE `empleados` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `identificacion` bigint NOT NULL,
  `edad` tinyint NOT NULL,
  `salario` decimal(10,0) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `observacion` varchar(100) DEFAULT NULL,
  `id_departamento` int DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `id_departamento` (`id_departamento`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `departamentos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `empleados` */

insert  into `empleados`(`id_empleado`,`nombre`,`apellido`,`identificacion`,`edad`,`salario`,`fecha_ingreso`,`observacion`,`id_departamento`) values 
(2,'María','Gómez',2030405060,25,2800000,'2021-08-01','Excelente en servicio al cliente.',3),
(3,'Carlos','Rodríguez',3040506070,45,3500000,'2019-03-20','Con amplia experiencia en el sector.',2),
(4,'Ana','López',4050607080,32,2600000,'2023-05-10','Recién incorporada, con gran potencial.',5),
(5,'Jaime','Cruz',526685454,52,1800000,'2021-08-10',NULL,3),
(6,'Natalia','Ruiz',102256529,25,3000000,'2025-06-19',NULL,4),
(7,'Pedro','Perez',52569855,55,3500000,'2010-06-23',NULL,1),
(8,'Feliphe','Peña',125356588,22,3000000,'2020-05-01',NULL,2),
(9,'Julieta','Venegas',125000585,28,3000000,'2021-05-01',NULL,1),
(10,'Ana','Torres',12535588,35,4200000,'2018-02-01',NULL,1),
(11,'Julia','Silva',1200025,58,4000000,'2018-05-01',NULL,4);

/*Table structure for table `tabla_logs` */

DROP TABLE IF EXISTS `tabla_logs`;

CREATE TABLE `tabla_logs` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `mensaje` text,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tabla_logs` */

insert  into `tabla_logs`(`id_log`,`mensaje`,`fecha`) values 
(1,'Nuevo empleado: Anacon salario 4200000','2025-06-28 15:19:29'),
(2,'Nuevo empleado: Juliacon salario 4000000','2025-06-28 15:19:29');

/*Table structure for table `transacciones` */

DROP TABLE IF EXISTS `transacciones`;

CREATE TABLE `transacciones` (
  `id_transaccion` int NOT NULL AUTO_INCREMENT,
  `id_cuenta_fk` int DEFAULT NULL,
  `tipo` enum('DEPOSITO','RETIRO','TRANSFERENCIA') NOT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `monto` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_transaccion`),
  KEY `id_cuenta_fk` (`id_cuenta_fk`),
  CONSTRAINT `transacciones_ibfk_1` FOREIGN KEY (`id_cuenta_fk`) REFERENCES `cuentas` (`id_cuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `transacciones` */

insert  into `transacciones`(`id_transaccion`,`id_cuenta_fk`,`tipo`,`fecha`,`monto`) values 
(1,1,'RETIRO','2025-06-28 16:18:38',100.00),
(2,2,'DEPOSITO','2025-06-28 16:18:38',100.00),
(3,1,'RETIRO','2025-06-28 16:28:45',10000.00),
(4,1,'RETIRO','2025-06-28 16:29:38',10000.00),
(5,1,'RETIRO','2025-06-28 16:34:30',500.00);

/* Trigger structure for table `empleados` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `before_insert_empleado` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `before_insert_empleado` BEFORE INSERT ON `empleados` FOR EACH ROW begin
	 if new.salario is null or new.salario < 3000000 then 
	   set new.salario = 3000000;
	 end if;
	end */$$


DELIMITER ;

/* Trigger structure for table `empleados` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `after_insert_empleado` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `after_insert_empleado` AFTER INSERT ON `empleados` FOR EACH ROW begin
	   insert into tabla_logs (mensaje)
	   values(concat('Nuevo empleado: ', NEW.nombre, 'con salario ', NEW.salario));
	end */$$


DELIMITER ;

/* Function  structure for function  `calcular_bono` */

/*!50003 DROP FUNCTION IF EXISTS `calcular_bono` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `calcular_bono`(salario decimal(10,2)) RETURNS decimal(10,2)
    DETERMINISTIC
begin
declare bono Decimal(10,2);
set bono = salario * 0.10;
return bono;
end */$$
DELIMITER ;

/* Procedure structure for procedure `contar_empleados` */

/*!50003 DROP PROCEDURE IF EXISTS  `contar_empleados` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `contar_empleados`(out total int)
begin 
		 select count(*) into total from empleados;
		end */$$
DELIMITER ;

/* Procedure structure for procedure `obtener_empleados_por_salario` */

/*!50003 DROP PROCEDURE IF EXISTS  `obtener_empleados_por_salario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `obtener_empleados_por_salario`(in salario_min decimal(10,2))
begin
		  select * from empleados where salario >= salario_min;
		end */$$
DELIMITER ;

/* Procedure structure for procedure `realizar_retiro_seguro` */

/*!50003 DROP PROCEDURE IF EXISTS  `realizar_retiro_seguro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `realizar_retiro_seguro`(
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

END */$$
DELIMITER ;

/*Table structure for table `vista_empleados` */

DROP TABLE IF EXISTS `vista_empleados`;

/*!50001 DROP VIEW IF EXISTS `vista_empleados` */;
/*!50001 DROP TABLE IF EXISTS `vista_empleados` */;

/*!50001 CREATE TABLE  `vista_empleados`(
 `nombre` varchar(50) ,
 `salario` decimal(10,0) 
)*/;

/*View structure for view vista_empleados */

/*!50001 DROP TABLE IF EXISTS `vista_empleados` */;
/*!50001 DROP VIEW IF EXISTS `vista_empleados` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_empleados` AS select `empleados`.`nombre` AS `nombre`,`empleados`.`salario` AS `salario` from `empleados` where (`empleados`.`salario` > 3000000) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
