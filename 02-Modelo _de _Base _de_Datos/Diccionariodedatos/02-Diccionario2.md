# Diccionario de Datos de la Base de Datos Universidad

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
- Profesor
- Curso
- Especialidad

Permite controlar la carga académica de los docentes y la asignación eficiente de los cursos, garantizando la trazabilidad de la especialidad académica de cada profesor dentro de la institución.

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

**Tabla:** Profesor

**Descripción:**__Almacena la información académica y personal de los docentes__

| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumProfesor | INT | - | PK, AI, NN | Identificador unico del profesor |
| Nombre | NVARCHAR| 100 |  NN | Nombre del profesor |
| Apellido1 | NVARCHAR| 20 | NN | Apellido paterno |
| Apellido2 | NVARCHAR| 20 | NULL | Apellido materno |



-----

**Tabla:**  Curso
**Descripción:**__Almacena los cursos impartidos por los docentes__

| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Numcurso | INT | - | PK, AI, NN | Identificador unico del curso |
| NombreCurso | NVARCHAR  | 20 | UQ, NN | Nombre de l curso |
| Creditos | INT  | -| NN, CK(>0)| Creditos del curso |
| NumProfesor | INT  | - | FK, NN | Profesor que imparte el curso |

-----

**Tabla:**  Especialidad
**Descripción:**__Catálogo maestro de todas las áreas de especialidad disponibles__

| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumEspecialidad | INT | -| PK, AI, NN | Identificador unico de la especialidad |
| NumProfesor| INT  | - | NN, FK| Profesor al que pertenece esta especialidad|
|NombreEspecialidad| NVARCHAR  | 30 | UQ, NN | Nombre de la especialidad |



5. Relaciones 

|  Relación | Cardinalidad | Descripción |
|:----------|:---------:|----------:|
| Profesor -> Curso    | 1:N |  Un profesor puede impartir varios cursos. Cada curso es impartido por un único profesor|
| Profesor -> Especialidad    | 1:N |Un profesor puede tener varias especialidades. Cada especialidad está asociada a un único profesor.|


6. Matriz de Claves Foráneas

  Tabla | Campo FK | Referencia |
|:----------|:---------:|----------:|
|Curso| Numprofesor | Profesor (NumProfesor)  |
|Especialidad| NumProfesor  | Profesor (Numprofesor)  |


7. Integridad referencial 

    | Regla |  Descripción |
    | :---  | :---         |
    | IR-01 | No se puede registrar un Curso sin estar asociado a un profesor válido existente |
    | IR-02 | No se puede registrar una Especialidad sin estar asociada a un profesor válido existente|
    | IR-03 |No se puede eliminar a un profesor del sistema si este tiene cursos o especialidades vinculadas|
    | IR-04 |La actualización del identificador de un profesor (num_prof) debe replicarse automáticamente en las tablas Curso y Especialidad|

8. Regla del negocio

      | Código |  Regla |
    | :--- | :--- |
    | RN-01 |Un profesor puede impartir varios cursos |
    | RN-02 |Un curso solamente puede ser impartido por un profesor|
    | RN-03 |Pueden existir una profesor que actualmente no imparta cursos |
    | RN-04 |Todo curso debe de estar asignado a un profesor  |
     | RN-05 |Cada especialidad está ligada directamente al registro de un profesor|

9. Diagrama relacional    

![Eje2](/image/Relacional/EjercicioTab2.jpg)

 

