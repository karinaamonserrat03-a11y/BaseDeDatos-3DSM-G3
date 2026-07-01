# Ejercicios del Modelo E-R

## Ejericio 1.
Un hospital registro información de sus pacientes 
>De cada paciente se alamacena:
- Un valor que lo identifica
- Un nombre
- Una fecha de nacimiento
>De cada expediente medico alamacena
- Número de expedeinte
- Fecha de apertura
- Tipo de Sangre
>Reglas del negocio 
1. Cada paciente debe de tener un expediente médico 
2. Cada expediente médico pertenece a un unico paciente 
3. No puede existir un expediente sin un paciente 
4. No puede existir un paciente sin un expediente 
 
 ### Solución del Ejercicio 
[Ejercicio Eje1](/image/ER/Ejer1Hospital.jpg)

## Ejercicio 2.
Una universidad administra profesores y cursos 
>De cada profesor se almacena:
- Número de profesor 
- Nombre
- Especialidad,
>De cada curso se alamacena
- Número de curso
- Nombre del curso 
- Creditos
>Reglas del negocio 
1. Un profesor puede impartir varios cursos 
2. Un curso solamente puede ser impartido por un profesor 
3. Pueden existir una profesor que actualmente no imparta cursos
4. Todo curso debe de estar asignado a un profesor 

>Lo que se debe realizar:
- Identificar y dibujar las Entidades 
- Identificar y dibujar la Relación **IMPARTE**
- Determinar la razon de la cardinalidad 
- Determinar la participación 

### Solución del Ejercicio 
[Ejercicio Eje2](/image/ER/Ejer2Profesor.jpg)


## Ejercicio 3.
Una escuela administra alumnos y materias 
> De cada Alumno se alamacena:
- Matricula
- Nombre
- Semestre 
>De cada materia se alamecena :6
- Clave de la materia
- Nombre de la materia 
- Creditos 

>Reglas del negocio 
1. Un alumno puede inscribirse en varias materias
2. Una materia puede tener muchos alumnos inscritos 
3. Puede existir una materia sin alumnos 
4. Todo almuno debe estar inscrito en al menos una materia 
5. De cada inscripción se desea alamacenar: 
    - La fecha de inscripción 
    - Calificación final

NOTA: La relación se debe de llamar **INSCRIBE**    

### Solución del Ejercicio 
[Ejercicio Eje3](/image/ER/Ejer3Alumno.jpg)

## Ejercicio 4.
Una empresa se dedica a la venta de productos al por mayor, y necesita registrar lo siguiente 
>De los clientes se necesita almacenar 
- Identificador del cliente 
- Nombre del cliente, el cuaol es una persona moral

>De los pedidos de Venta:
- Número de pedido
- Fecha del pedido 

>De los productos:
- Número de producto
- Nombre del producto
- Precio del producto

>Reglas del negocio
1. Un cliente puede realizar muchos pedidos
2. Cada pedido pertenece a un solo cliente 
3. Un pedido contiene varios productos 
4. Un producto puede aparecer en muchos pedidos
5. Un pedido debe contener al menos un producto 
6. Un producto puede no haber sido vendido sw2q2q2 bn
7. El detalle del pedido no existe sin pedido 
8. El detalle del pedido no existe sin producto
9. El detalle del pedido alamacena cantidad vendida y precio de venta 

### Solución del Ejercicio 
[Ejercicio Eje4](/image/ER/Ejer4Cliente.jpg)

## Ejercicio 5 
1. The company is organizedd into departments. Each department has a unique name, a unique number, and a particular employee who manages the department.We keep track of the start date when that employee began managing the department. A department may have several locations. 
2. A department controls a number of projects, each of which has a unique name, a unique number, and a single location. 
3. We store each employee's name, Social Security number, address, salary, sex (gender), and birth date. An employee is assigned to one department, but may work on several 
projects, which are not necessarily controlled by the same department. We keep track of the current number of hours per week that an employee works on each project. We also 
keep track of the direct supervisor of each employee (who is another employee). 
4. We want to keep track of the dependents of each employee for insurance purposes.We keep each dependent's first name, sex, birth date, and relationship to the employee. 

### Solución del Ejercicio 
[Ejercicio Eje5](/image/ER/Ejer5Ingles.jpg)

