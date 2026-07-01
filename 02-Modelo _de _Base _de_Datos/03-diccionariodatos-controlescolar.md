# Diccionario de Datos de la Base de Datos Control Escolar

1. Información General


Tarea. revisar investigar tipos de datos de msq, mariadb, postgres, Sqlserver

| Elemento |  Valor |
| :--- | :--- |
| Proyecto | Sistema de Control Escolar |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Elaboró  | Karina Monserrat Ruiz Ortega |
| SGBD | SQLServer |

2. Descripción del Sistema de Base de Datos

El sistema administra:
- Carrera
- Alumnos
- Profesores
- Materias
- Grupos
- Inscripciones 

Permite controlar la oferta educativa y la inscripción de los estudiantes 

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

**Tabla:** Carrera           SNAKE id_nma campos

**Descripción:**__Almacena las carreras ofertadas por la universidad__

| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| id_carrera | INT | - | PK, AI, NN | Identificador unico de la carrera |
| nombre | VARCHAR| 100 | UQ, NN | Nombre de la carrera |
| duracion_cuatrimestre | INT| -| NN, CK (>0) | Duración del cuatrimestre |


-----


**Tabla:** Alumno          

**Descripción:**__Almacena la información de los estudiantes__

| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| id_alumno | INT | - | PK, AI, NN | Identificador unico del alumno |
| matricula | VARCHAR | 10 | UQ, NN| IMatricula Institucional |
| nombre | VARCHAR| 50 | NN | Nombre del estudiante |
| apellido_paterno | VARCHAR| 50| NN| Apellido paterno |
| apellido_materno | VARCHAR| 100 | UQ, NN| Correo Institucional |
| fecha_nacimiento | DATE| -| NN| Fecha de nacimiento |
| id_carrera | INT| -| FK,NN|  Carrera a la que pertenece|

5. Relaciones 

|  Relación | Cardinalidad | Descripción |
|:----------|:---------:|----------:|
| Carrera -> Alumno    | 1:N    | Una carrera tienen muchos alumnos    |
| Carrera -> Materia   | 1:N  |  Una carrera tiene muchas materias   |
| Profesor -> Grupo  | 1:N  | Un profesor puede impartir a varios grupos   |
| Materia -> Grupo  | 1:N  | Una materia puede abrirse en varios grupos   |
| Alumno -> Inscripcion  | 1:N | Un alumno puede tener varias inscripciones  |
| Grupo -> Inscripcion  | 1:N | Un  grupo puede tener muchos alumnos  |

6. Matriz de Claves Foráneas

  Tabla | Campo FK | Referencia |
|:----------|:---------:|----------:|
|Alumno| id_carrera  | Carrera (id_carrera)  |
|Materia| id_carrera  | Carrera (id_carrera)  |
|Grupo| id_profesor | Profesor (id_profesor)  |
|Grupo| id_materia | Materia (id_materia)     |
|Inscripción| id_alumno | Alumno (id_alumno)  |
|Inscripción| id_grupo | Grupo (id_grupo)  |

7. Integridad referencial 

    | Regla |  Descripción |
    | :--- | :--- |
    | IR-01 | No se puede registrar un alumno con una carrera inexistencia |
    | IR-02 | No se puede crear un grupo para una materia inexistente  |
    | IR-03 | No se puede crear un grupo para un profesor inexistenete |

8. Regla del negocio

      | Código |  Regla |
    | :--- | :--- |
    | RN-01 | Un alumno pertence solo a una sola carrera|
    | RN-02 | NUna carrera puede tener muchos alumnos |
    | RN-03 | NUna carrera puede tener muchas materias |

9. Diagrama relacional    

[Eje7](../image/Relacional/Tab7Credenciales.jpg)
