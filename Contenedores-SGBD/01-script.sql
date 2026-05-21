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