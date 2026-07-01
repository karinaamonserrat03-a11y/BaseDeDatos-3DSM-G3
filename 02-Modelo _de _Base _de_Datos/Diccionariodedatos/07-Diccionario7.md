# Diccionario de Datos de la Base de Datos Credenciales

1. Información General

| Elemento | Valor |
| :--- | :--- |
| Proyecto | Sistema Integral Escolar y Administrativo |
| Versión | 1.0 |
| Fecha | 28 de Junio 2026 |
| Elaboró | Karina Monserrat Ruiz Ortega |
| SGBD | SQLServer |

2. Descripción del Sistema de Base de Datos

El sistema administra:
- Alumnos
- Teléfonos 
- Credenciales
- Materias
- Profesores 
- Departamentos
- Dependientes
- Proyectos 
- Participaciones

El sistema gestiona de manera integral la información académica y administrativa de una institución educativa, vinculando el historial académico de los alumnos, la gestión laboral de los profesores y la ejecución de proyectos institucionales bajo una estructura relacional.

3. Catálogo de Restricciones 

| Código | Significado |
| :--- | :--- |
| PK | Primary Key |
| FK | Foreign Key |
| NN | Not Null |
| UQ | Unique |
| AI | Auto Increment |
| CK | Check |

4. Dirección de Datos

**Tabla**: Alumno
**Descripción:** Datos personales y de contacto del estudiante.
| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Matricula | VARCHAR | 20 | PK, NN | Identificador único del alumno |
| Nombre | NVARCHAR | 50 | NN | Nombre del alumno |
| Apellido1 | NVARCHAR | 50 | NN | Apellido paterno |
| Apellido2 | NVARCHAR | 50 | - | Apellido materno |
| Correo | NVARCHAR | 50 | - | Correo electrónico |
| Fechanaci | DATE | - | - | Fecha de nacimiento |

----

**Tabla**: Materia
**Descripción:** Catálogo de asignaturas disponibles.
| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| ClaveMateria | INT | - | PK, NN | Clave de la asignatura |
| NombreMateria| NVARCHAR | 50 | NN | Nombre de la materia |
| Creditos | INT | - | NN | Créditos otorgados |
| NumProf | INT | - | FK | Profesor responsable |

----

 **Tabla**: Cursa
**Descripción:** Tabla asociativa que vincula alumnos con materias.
| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Matricula | VARCHAR | 20 | FK, PK | Referencia al alumno |
| ClaveMateria | INT | - | FK, PK | Referencia a la materia |
| Fechainscrip | DATE | - | NN | Fecha de inscripción |
| Calificacionfinal| DECIMAL| - | - | Nota final del curso |

----

**Tabla**: Profesor
**Descripción:** Información laboral y departamental docente.
| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Numprof | INT | - | PK, NN | Identificador del profesor |
| Nombre | NVARCHAR | 50 | NN | Nombre del profesor |
| Apellido1 | NVARCHAR | 50 | NN | Apellido paterno |
| Apellido2 | NVARCHAR | 50 | - | Apellido materno |
| NumDepFK | INT | - | FK | Departamento asociado |

----

**Tabla**: Proyecto
**Descripción:** Proyectos institucionales activos.
| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumProyecto | INT | - | PK, NN | Identificador del proyecto |
| Nombre | NVARCHAR | 50 | NN | Nombre del proyecto |
| Presupuesto | MONEY | - | - | Recursos asignados |

----

**Tabla**: Participa
**Descripción:** Registro de participación de profesores en proyectos.
| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumprofFK | INT | - | FK, PK | ID del profesor |
| NumproyFK | INT | - | FK, PK | ID del proyecto |
| Rol | NVARCHAR | 30 | NN | Función en el proyecto |

----

**Tabla**: Telefono
**Descripción:** Registro de número de telefonos del alumno
| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Clavetel | INT | - | PK, NN| ID del número de Teléfono |
| Telefono | INT | - |NN | Número de teléfono del alumno |
| Matricula | NVARCHAR | 20 | FK, NN | Número de matricula del alumno |

----

**Tabla**: Credencial
**Descripción:** Registro de participación de profesores en proyectos.
| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumCred | INT | - | PK, NN| ID del número de la credencial del alumno |
| Fechadeexp | DATE | - |NN | Fecha de la expedición de la credencial |
| Vigencia | DATE | - |NN | Fecha de la vigencia de la credencial|
| Matricula | NVARCHAR | 20 | FK, NN, UQ | Número de matricula del alumno |

----

**Tabla**: Departamento
**Descripción:** Registro de participación de profesores en proyectos.
| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumDep| INT | - | PK, NN| Número del departamento |
| NombreDep | NVARCHAR | 30 |NN | Nombre del departamento |
| Edificio |NVARCHAR| - |NN |Nombre del edicicio deonde se encuentra|

----

**Tabla**: Dependiente 
**Descripción:** Información de la persona que depende del profesor
| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NombreDepend| NVARCHAR | 30 | PK, NN| Nombre del dependiente|
| NumProfesor | INT | - |NN | ID del Profesor |
| Fechanaci | DATE | - | - | Fecha de nacimiento |
| Parentezco | NVARCHAR | 30 | - | El parentezco que tiene con el profesor |


5. Relaciones 

| Relación | Cardinalidad | Descripción |
| :--- | :---: | :--- |
| Alumno <-> Curso | 1:N | Un alumno inscrito en varios cursos. |
| Materia -> Curso | 1:N | Una materia presente en varios cursos. |
| Profesor -> Departamento | N:1 | Un profesor pertenece a un departamento. |
| Profesor <-> Proyecto | N:N | Resuelta por la tabla Participa. |

6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Curso | Matricula | Alumno(Matricula) |
| Curso | ClaveMateria | Materia(ClaveMateria) |
| Materia | NumProf | Profesor(Numprof) |
| Participa | NumprofFK | Profesor(Numprof) |
| Participa | NumproyFK | Proyecto(NumProyecto) |

7. Integridad referencial 

| Regla | Descripción |
| :--- | :--- |
| IR-01 | No se puede inscribir un alumno inexistente en un curso. |
| IR-02 | Un profesor no puede ser eliminado si es responsable de una materia activa. |
| IR-03 | Las tablas asociativas (Curso, Participa) no deben permitir valores nulos en sus FK. |
| IR-04 | Los cambios en llaves primarias deben replicarse en cascada. |

8. Reglas del negocio

| Código | Regla |
| :--- | :--- |
| RN-01 | Todo profesor debe pertenecer a un departamento. |
| RN-02 | Un alumno puede cursar muchas materias, pero cada registro de curso almacena su calificación única. |
| RN-03 | La tabla Participa es indispensable para auditar el rol de un profesor en un proyecto. |

9. Diagrama relacional    

[Eje7](/image/Relacional/Tab7Credenciales.jpg)