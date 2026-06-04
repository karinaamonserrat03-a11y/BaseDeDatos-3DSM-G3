CREATE DATABASE pruebadb;

CREATE TABLE tabl1 (
id INT,
nombre VARCHAR(30)
);

INSERT INTO tabl1
VALUE (1, 'Pepito'),
	  (2, 'Luis'),
	  (3, 'Luar');
	  
SELECT *
from tabl1;

#Crea una base de datos
CREATE DATABASE prueba_atributos;

# Utiliza la base de datos
USE prueba_atributos;

# Creacion de tabla
CREATE TABLE empleado(
	id int not null PRIMARY KEY,
    nombre varchar(50) NOT NULL,
    apellido1 varchar(15) NOT NULL,
    apellido2 varchar (15) NULL,
    fecha_ingreso DATE NOT NULL
);

insert into empleado
VALUES (1,'Roberiano','Robles','DE LA Torre','1983-04-03');

SELECT 
	*,year(fecha_ingreso), MONTH(fecha_ingreso), DAY(fecha_ingreso)
FROM empleado;

ALTER TABLE empleado
ADD COLUMN fecha_naci DATE NOT NULL;

UPDATE empleado
SET fecha_naci = '1983-04-06'
WHERE id = 1;

select 
		nombre, 
		apellido1, 
		apellido2, 
        fecha_ingreso, 
        fecha_naci,
        timestampdiff(YEAR, fecha_naci, CURDATE()) AS Edad
FROM empleado;

## UNIDAD 2_02_06_26

CREATE TABLE ALUMNO(
	id_alumno INT NOT NULL PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL, 
	apellido_1 VARCHAR(15) NOT NULL,
	apellido_2 VARCHAR(15) NULL,
	telefono VARCHAR(13),
	calle VARCHAR(50) NOT NULL,
	numero INT,
	numero_interior INT,
	numero_exterior INT,
	fecha_naci DATE NOT NULL, 

);
INSERT INTO ALUMNO
VALUES (1, 'Karina', 'Ruiz', 'Ortega', 'POPOCATEPETL',777,'2007-04-03');

INSERT INTO ALUMNO (id_alumno, nombre, apellido_1, calle, fecha_naci)
VALUES (3,'Jose Luis','Gallardo','Angel','1983-04-06');

INSERT INTO ALUMNO (id_alumno, nombre, apellido_1, apellido_2, calle, fecha_naci)
VALUES (2,'Jimena','VALDEZ','DELGADILLO','FLOR DE MAYO','2007-06-12');

SELECT *, DATEDIFF(YEAR,fecha_naci, GETDATE()) AS edad
FROM ALUMNO

CREATE TABLE categoria2(
	categoria_id INT NOT NULL PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL,

);

CREATE TABLE producto2(
	producto_id INT NOT NULL PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL,
	precio MONEY NOT NULL, 
	existencia INT NOT NULL,
	categoria_id INT NULL,
	CONSTRAINT fk_producto2_categoria2
	FOREIGN KEY(categoria_id)
	REFERENCES categoria2(categoria_id)
	);
SELECT * FROM categoria2;

SELECT *
FROM categoria;

SELECT *
FROM producto
WHERE categoria_id = 1;