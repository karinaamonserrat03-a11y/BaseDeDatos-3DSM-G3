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

CREATE DATABASE bdconstraints;
GO

USE bdconstraints;


-- RAZON DE CARDINALIDAD 1:1
CREATE TABLE paciente (
	Numpaciente INT NOT NULL,
	Nombre VARCHAR(30) NOT NULL,
	Apellido1 VARCHAR(20) NOT NULL,
	Apellido2 VARCHAR(20) NULL,
	Fechanaci DATE NOT NULL,
	CONSTRAINT pk_paciente
	PRIMARY KEY(Numpaciente)
);

GO

CREATE TABLE expediente(
	Numexpediente INT NOT NULL, 
	Fechaapertura DATE NOT NULL,
	Tipodesangre CHAR(3) NOT NULL, 
	paciente INT NOT NULL, 
	CONSTRAINT pk_expediente
	PRIMARY KEY (Numexpediente), 
	CONSTRAINT unique_numpaciente
	UNIQUE(paciente),
	CONSTRAINT fk_expediente_paciente
	FOREIGN KEY (paciente)
	REFERENCES paciente(Numpaciente)
);
GO

INSERT INTO paciente
VALUES (1, 'Kevin', 'Kosner', 'López', '2007-02-18');

INSERT INTO paciente
VALUES (2, 'Daniel', 'Martinez' , 'Mendoza', '2005-01-30');

INSERT INTO paciente
VALUES (3, 'Luis Fernando', 'Nieto', null, '2007-07-04');

SELECT *
FROM paciente

INSERT INTO expediente
VALUES (1, GETDATE(), '+O', 1);	

INSERT INTO expediente
VALUES (2, GETDATE(), '+A', 2);	

INSERT INTO expediente
VALUES (3, GETDATE(), '+B', 3);	

SELECT 
		e.Numexpediente, 
		e.Fechaapertura, 
		e.Tipodesangre,
		CONCAT(	p.Nombre, ' ', p.Apellido1, ' ', p.Apellido2) 
		AS [Nombre_completo]
FROM expediente AS e
INNER JOIN paciente AS p
ON e.paciente = p.Numpaciente

GO
CREATE TABLE profesor(
	Numprof INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Nombre VARCHAR(50) NOT NULL, 
	Apellido1 VARCHAR(30) NOT NULL, 
	Apellido2 VARCHAR(30)
);
GO 

-- RAZON DE CARDINALIDAD
CREATE TABLE curso(
	Numcurso INT NOT NULL, 
	Nombre VARCHAR(20) NOT NULL, 
	Creditos INT NOT NULL,
	Numprof INT NOT NULL,
	CONSTRAINT pk_curso
	PRIMARY KEY (Numcurso),
	CONSTRAINT unique_nombre
	UNIQUE (Nombre),
	CONSTRAINT check_credito
	CHECK (Creditos>0), 
	CONSTRAINT fk_curso_profesor
	FOREIGN KEY (Numprof)
	REFERENCES profesor(Numprof)
);
GO 

CREATE TABLE especialidad(
	Numesp INT NOT NULL, 
	Numprof INT NOT NULL,
	NombreEsp VARCHAR(30) NOT NULL, 
	CONSTRAINT pk_especialidad
	PRIMARY KEY (Numesp, Numprof),
	CONSTRAINT unique_nombreesp
	UNIQUE (NombreEsp), 
	CONSTRAINT fk_especialidad_profesor
	FOREIGN KEY (Numprof)
	REFERENCES profesor(Numprof)
);
GO