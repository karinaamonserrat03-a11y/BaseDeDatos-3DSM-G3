# Diccionario de Datos de la Base de Datos Ingles V2

## 1. Información General

| Elemento | Valor |
| :--- | :--- |
| Proyecto | Sistema de Control Empresarial |
| Versión | 1.0 |
| Fecha | 28 de Junio 2026 |
| Elaboró | Karina Monserrat Ruiz Ortega |
| SGBD | SQLServer |

## 2. Descripción del Sistema de Base de Datos

El sistema administra:
- Empleados
- Departamentos
- Proyectos
- Dependientes
- Ubicaciones

El sistema administra la estructura organizacional de la empresa, incluyendo empleados, departamentos, proyectos, ubicaciones y dependientes. Permite controlar la jerarquía de supervisión, la asignación de empleados a departamentos y su participación en proyectos mediante una estructura relacional optimizada con identificadores únicos.

## 3. Catálogo de Restricciones 

| Código | Significado |
| :--- | :--- |
| PK | Primary Key |
| FK | Foreign Key |
| NN | Not Null |
| UQ | Unique |
| AI | Auto Increment |
| CK | Check |
| DF | Default |

## 4. Dirección de Datos

**Tabla**: Employee
**Descripción:** Almacena toda la información del personal, incluyendo sus jerarquías.

| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Ssn | INT | - | PK, AI, NN | Identificador único del employee |
| Firstname | NVARCHAR | 50 | NN | Nombre del empleado |
| Lastname | VARCHAR | 50 | NN | Apellido paterno |
| Birthday | DATE | - | NN | Fecha de nacimiento |
| Salary | MONEY | - | NN, CK(>0) | Salario que gana el empleado |
| Address | NVARCHAR | 50 | NN | Dirección del empleado |
| Sex | CHAR | - | NN | Sexo del empleado |
| Jef | INT | - | FK | ID del jefe |

**Tabla**: Departament
**Descripción:** Define las unidades operativas y quién las dirige.

| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumberDep | INT | - | PK, NN | Identificador único del departamento |
| Name | NVARCHAR | 30 | NN | Nombre del departamento |
| Manages | INT | - | NN | Llave foránea del jefe |
| Stardate | DATE | - | NN | Fecha de inauguración del departamento |


**Tabla**: Project
**Descripción:** Catálogo de proyectos y el departamento que los gestiona.

| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Number | INT | - | PK, NN | Número del proyecto |
| Name | NVARCHAR | 30 | NN | Nombre del proyecto |
| Location | NVARCHAR | 30 | NN | Dirección del proyecto |
| NumberDep | INT | - | FK, NN | Identificador del departamento |
|

**Tabla**: Work_On
**Descripción:** Tabla asociativa que registra la participación del empleado en proyectos.

| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Id_work | INT | - |FK, NN | Identificador único del empleado |
| Ssn | VARCHAR | 20 |  FK,NN| Nombre del proyecto |
| NumberProy| INT | - | NN | Número del proyecto |
| Hours | DECIMAL | - | NN | Cantidad de horas trabajadas |

**Tabla**: Dependet
**Descripción:** Información sobre los beneficiarios o familiares del empleado.

| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| id_dependet | INT | - | PK, NN | Identificador único del empleado |
| Name | NVARCHAR | 30 | NN | Nombre del dependiente |
| Sex | CHAR | 5 | NN | Sexo de la persona |
| RelationShip| NVARCHAR | 30 | NN | Relación con el empleado |
| Birthday | DATE | - | NN | Fecha de nacimiento |
| Ssn | VARCHAR | 50 | FK,NN | ID del empelado|

**Tabla**: Location
**Descripción:** Detalla las ubicaciones físicas vinculadas a los departamentos.

| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| id_location | INT | - | PK, NN | Identificador único de la localización |
| NumberDep | INT | - | NN, FK | Número del departamento |
| Location | NVARCHAR | - | NN | Localización del departamento |

## 5. Relaciones 

| Relación | Cardinalidad | Descripción |
| :--- | :---: | :--- |
| Employee <-> Employee | 1:N | Relación de supervisión (un jefe puede tener muchos subordinados). |
| Employee -> Departament | 1:N | Un departamento puede tener muchos empleados. |
| Departament -> Proyect | 1:N | Un departamento puede controlar varios proyectos. |
| Employee <-> Proyect | N:N | Resuelta por la tabla Work on (horas trabajadas). |
| Employee -> Dependet | 1:N | Un empleado puede tener varios dependientes. |

## 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Employee | Jef | Employee (Ssn) |
| Departament | Manages | Employee (Ssn) |
| Project | NumberDep | Departament (NumberDep) |
| Work On | Ssn | Employee (Ssn) |
| Work On | NumberProy | Proyect (Number) |
| Dependet | Ssn | Employee (Ssn) |
| Location | NumbeDep | Departament(NumbeDep) |

## 7. Integridad referencial 

| Regla | Descripción |
| :--- | :--- |
| IR-01 | Un empleado no puede ser su propio jefe (evitar ciclos infinitos). |
| IR-02 | No se puede registrar un dependiente sin un empleado titular válido. |
| IR-03 | Al eliminar un empleado, se deben gestionar sus horas en Work On. |
| IR-04 | Los cambios en el Ssn deben actualizarse en cascada. |

## 8. Reglas del negocio

| Código | Regla |
| :--- | :--- |
| RN-01 | Un empleado pertenece a un solo departamento, pero puede trabajar en múltiples proyectos. |
| RN-02 | Todo proyecto debe estar bajo el control de un único departamento. |
| RN-03 | La tabla Work On es obligatoria para registrar las horas dedicadas. |

9. Diagrama relacional    

[Eje6](/image/Relacional/EjecicioTab6.jpg)