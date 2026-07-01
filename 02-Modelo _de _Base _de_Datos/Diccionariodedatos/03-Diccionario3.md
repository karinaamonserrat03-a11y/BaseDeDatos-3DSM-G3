# Diccionario de Datos de la Base de Datos Escuela

1. Información General

| Elemento |  Valor |
| :--- | :--- |
| Proyecto | Sistema de Control Escolar |
| Versión | 1.0 |
| Fecha | 28 de Junio 2026 |
| Elaboró  | Karina Monserrat Ruiz Ortega |
| SGBD | SQLServer |

2. Descripción del Sistema de Base de Datos

El sistema administra:
- Alumno
- Materia
- Inscripciones

Permite gestionar el proceso de inscripción escolar y el historial académico, garantizando la vinculación correcta entre los alumnos y las materias que cursan, así como el registro histórico de sus calificaciones.

3. Catálogo de Restricciones 

    | Código |  Significado |
    | :--- | :--- |
    | PK | Primary Key |
    | FK | Foreign Key |
    | NN | Not Null |
    | UQ | Unique |
    | AI | Auto Increment |
    | CK | Check |
    | DF | Default |

4. Dirección de Datos

**Tabla:** Alumno

**Descripción:**__Almacena la información personal y académica de los estudiantes registrados en la institución.__

| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| id_alumno| INT | - | NN, AI, PK |Identificador del alumno|
| matricula |VARCHAR| 10 | NN |Clave de control del alumno |
| nombre | NVARCHAR |  30|  NN| Nombre del estudiante |
| apellido_1| NVARCHAR| 20 | NN | Apellido paterno |
| apellido_2| NVARCHAR| 20 | NULL | Apellido materno |
| semestre| INT| - | NN, CK(>0) | Semestre que cursa el alumno |

-----

**Tabla:** Materia

**Descripción:**__Almacena las asignaturas disponibles que pueden ser cursadas por los alumnos__

| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| id_materia| INT | - | NN, AI, PK |Identificador único de la materia|
| nombre |VARCHAR| 20| NN, UQ| Nombre de la asignatura |
| creditos |INT| -| NN, CK(>0)| Nombre de la asignatura |

-----

**Tabla:** Inscribe

**Descripción:**__Almacena la relación muchos a muchos, registrando qué alumnos están inscritos en qué materias, incluyendo su fecha y calificación final__

| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| id_materia| INT | - | NN, FK|Referencia a la materia cursada|
| fecha_inscripcion |DATE| -| NN| Fecha en la que se realizó la inscripción |
| cali_final |DECIMAL| -| NN, CK(>0)|Nota obtenida por el alumno|



5. Relaciones 

|  Relación | Cardinalidad | Descripción |
|:----------|:---------:|----------:|
| Alumno -> Inscribe    | 1:N |Un alumno puede tener varias inscripciones en distintas materias|
| Materia -> Inscribe    | 1:N | Una materia puede estar presente en muchas inscripciones de alumnos|



6. Matriz de Claves Foráneas

  Tabla | Campo FK | Referencia |
|:----------|:---------:|----------:|
|Inscribe| id_alumno  | Alumno (id_alumno)  |
|Inscribe| id_materia  | Materia (id_materia)  |


7. Integridad referencial 

    | Regla |  Descripción |
    | :---  | :---         |
    | IR-01 |No se puede registrar una inscripción en la tabla Inscribe sin que el idAlumno y el idMateria existan previamente en sus tablas maestras|
    | IR-02 | No se puede eliminar a un alumno del sistema si este cuenta con inscripciones activas vinculadas|
    | IR-03 |No se puede eliminar una materia del catálogo si existen alumnos inscritos en ellas|
    | IR-04 |La actualización del identificador de un alumno (id_alumno) o de una materia (id_materia) debe replicarse automáticamente en la tabla Inscribe|

8. Regla del negocio

      | Código |  Regla |
    | :--- | :--- |
    | RN-01 |Un alumno puede inscribirse en varias materias|
    | RN-02 |Una materia puede tener muchos alumnos inscritos |
    | RN-03 |Puede existir una materia sin alumnos|
    | RN-04 |Todo almuno debe estar inscrito en al menos una materia|
    | RN-05 | De cada inscripción se desea alamacenar: 
    - La fecha de inscripción 
    - Calificación final|

9. Diagrama relacional    

[Eje3](/image/Relacional/TabE3.jpg)


