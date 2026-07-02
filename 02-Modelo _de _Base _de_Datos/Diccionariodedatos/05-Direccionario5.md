# Diccionario de Datos de la Base de Datos Ingles V1

1. Información General

| Elemento |  Valor |
| :--- | :--- |
| Proyecto | Sistema de Empresa |
| Versión | 1.0 |
| Fecha | 28 de Junio 2026 |
| Elaboró  | Karina Monserrat Ruiz Ortega |
| SGBD | SQLServer |

2. Descripción del Sistema de Base de Datos

El sistema administra:
- Empleados
- Departamentos
- Proyectos
- Dependientes
- Ubicaciones

Permite controlar la estructura organizacional de la empresa, la asignación de empleados a departamentos, su participación en proyectos específicos, así como la gestión de dependientes y la jerarquía de supervisión

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

**Tabla:** Employee     

**Descripción:**__Almacena toda la información del personal, incluyendo su jerarquías__

| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Ssn | INT | - | PK, NN | Identificador unico del employee |
| Firstname | NVARCHAR| 50 | NN | Nombre del empleado |
| Lastname | VARCHAR| 50 | NN | Apellido paterno |
| Birthday | DATE| -| NN | Fecha de naciemiento |
| Salary | MONEY| -| NN CK(>0)| Salario que gana el empleado |
| Address | NVARCHAR| 50 | NN| Direccion del empleado |
| Sex | CHAR | -| NN|Sexo del empleado |
| Jef | INT | -| FK, NULL| ID del jefe |


-----


**Tabla:** Departament          

**Descripción:**__Define las unidades operativas y quién las dirige_

| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Number | INT | - | PK, NN | Identificador unico del departamento |
| Name | NVARCHAR  | 30| NN |  Nombre del departamento |
| Manager| INT  | - |FK, NN | Llave foranea del jefe |
| Stardate | DATE  | - |NN| Fecha de cuando inaguraron el departamento |
| Ssn | INT  | - | FK, NN | Identificador del empleado |

-----

**Tabla:** Proyect          

**Descripción:**__Catálogo de proyectos y el departamento que los gestiona__

| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumberProye | INT  | - | PK, NN | Numero del proyecto|
| NameProyec | NVARCHART |30|PK, NN | Nombre del proyecto |
| Location | NVARCHAR  |30| NN | Dirección del proyecto |
| NumberDep | INT  | - | FK, NN | Identificador del departamento |
| NameDep | NVARCHAR  | - | FK, NN | Nombre del departamento|

-----

**Tabla:** WorkOn          

**Descripción:**__Tabla asociativa que registra la participación del empleado en proyectos__

| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Ssn | INT | - |PK, FK, NN | Identificador unico del empleado|
| NameProy | NVARCHAR  | 30 | PK,FK, NN | Nombre del proyecto |
| NumberProy | INT  |- | PK,FK,NN |Número del proyecto |
| Hours | DECIMAL  | - | NN | Cantidad de horas trabajadas en el proyecto |

-----

**Tabla:** Dependet          

**Descripción:**__Descripción: Información sobre los beneficiarios o familiares del empleado__

| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Ssn | INT | - | PK, FK,  NN | Identificador unico del empleado |
| Name | NVARCHART  | 30 | PK, NN | Nombre del dependiente |
| Sex | CHAR  | 5 | NN | Sexo de la persona |
| Relationship | NVARCHAR  | 30 | NN|Relación que tiene con el empleado |
| Birthdate | DATE| -| NN | Fecha de naciemiento |



-----

**Tabla:** Location           

**Descripción:**__Detalla las ubicaciones físicas vinculadas a los departamentos__

| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumLocation | INT | - | PK, NN | Identificador unico de la localización |
| NumDep | INT  | - | FK,NN | Número del departamento|
| NameDep | NVARCHAR  | 30 | FK,NN| Nombre del departamento |
| Location | NVARCHAR  | - | NN | Localización del departamento |


5. Relaciones 

|  Relación | Cardinalidad | Descripción |
|:----------|:---------:|----------:|
| Employee <-> Employee    | 1:N  |Relación de supervisión (un jefe puede tener muchos subordinados).|
| Employee -> Departament    | 1:N  |Un departamento puede tener muchos empleados|
| Departament -> Proyect   | 1:N  | Un departamento puede controlar varios proyectos|
| Employee <-> Proyect   | N:N  |Resuelta por la tabla Work On (horas trabajadas)|
| Employee -> Dependet   | 1:N  |Un empleado puede tener varios dependientes|


6. Matriz de Claves Foráneas

  Tabla | Campo FK | Referencia |
|:----------|:---------:|----------:|
|Employee| Jef  | Employee (Ssn)  |
|Departament| Ssn | Employee (Ssn)  |
|Proyect|   NumberDep  | Departament (Number)  |
|WorkOn| Ssn | Employee (Ssn)  |
|Dependet| Ssn  | Employee (Ssn)  |


7. Integridad referencial 

    | Regla |  Descripción |
    | :--- | :--- |
    | IR-01 | Un empleado no puede ser su propio jefe (evitar ciclos infinitos en jerarquía)|
    | IR-02 |No se puede registrar un dependiente sin un empleado titular válido|
    | IR-03 |Al eliminar un empleado, se deben gestionar sus horas en Work On para evitar registros huérfanos|
    | IR-04 |Los cambios en el Ssn (ID del empleado) deben actualizarse en cascada en las tablas donde actúa como FK|

8. Regla del negocio

      | Código |  Regla |
    | :--- | :--- |
    | RN-01 |Un empleado pertenece a un solo departamento, pero puede trabajar en múltiples proyectos.|
    | RN-02 | Todo proyecto debe estar bajo el control de un único departamento |
    | RN-03 | La tabla Work On es obligatoria para registrar las horas dedicadas; sin este registro, no se considera participación en el proyecto|
  

9. Diagrama relacional    

![Eje5](/image/Relacional/EjercicioTab5.jpg)

 

