# Diccionario de Datos de la Base de Datos Empresa

1. Información General

| Elemento |  Valor |
| :--- | :--- |
| Proyecto | Sistema de Control de Ventas |
| Versión | 1.0 |
| Fecha | 28 de Junio 2026 |
| Elaboró  | Karina Monserrat Ruiz Ortega |
| SGBD | SQLServer |

2. Descripción del Sistema de Base de Datos

El sistema administra:
- Cliente
- Pedidos de venta
- Detalle del pedido
- Producto

Permite gestionar el ciclo de ventas al por mayor, garantizando la trazabilidad entre el cliente que realiza la compra y los productos adquiridos en cada pedido, manteniendo el histórico de precios y cantidades.

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

**Tabla:** Cliente

**Descripción:**__Almacena la información institucional de los clientes de la empresa. Al ser personas morales, esta tabla sirve como el catálogo maestro para identificar a quién se le están facturando los pedidos__

| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| IdCliente| INT | - |PK,NN |Identificador del cliente|
| Nombre | NVARCHAR | 50 |  NN| Nombre del cliente|
| Apellido1| NVARCHAR| 30 | NN | Apellido paterno |
| Apellido2| NVARCHAR| 20 | NULL | Apellido materno |
| FechaNaci| DATE| - | NN |  Fecha de nacimiento |

-----

**Tabla:** Pedido

**Descripción:**__Almacena cada operación comercial. Registra la fecha en la que se efectuó la transacción y mantiene el vínculo obligatorio con el cliente que realizó la compra__

| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumPedido| INT | - | PK,NN |Identificador único del pedido|
| FechaPedido |DATE| -| NN| Fecha del pedido|
| IdCliente |INT| -| FK, NN| Cliente que realiza el pedido |

-----

**Tabla:** Producto

**Descripción:**__Almacena todos los artículos que la empresa tiene disponibles para la venta. Contiene el precio base actual, el cual sirve como referencia para nuevas operaciones__

| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumProducto| INT | - | PK, NN| Identidficador del producto|
| NombreProducto |NVARCHAR| 30 | NN| Nombre del producto |
| PrecioProducto |MONEY| -| NN, CK(>0)|Precio del producto|

-----

**Tabla:** DetallePedido

**Descripción:**__Almacena la cantidad exacta vendida y congelar el precio de venta al momento de la transacción, asegurando que el histórico de ventas no se vea afectado por futuros cambios en los precios del catálogo__

| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumPedido| INT | - |PK, FK, NN| Relación con el pedido|
| NumeroProducto |INT| - | PK, FK, NN| Relación con el producto |
| CantVenta |INT| -| NN, CK(>0)|Unidades vendidad|
| PrecioVenta |MONEY| -| NN, CK(>0)|Precio de venta en el momento|


5. Relaciones 

|  Relación | Cardinalidad | Descripción |
|:----------|:---------:|----------:|
| Cliente -> Pedido    | 1:N |Un cliente puede realizar muchos pedidos|
| Pedido -> DetallePedido   | 1:N | Un pedido puede tener varios detalles|
| Producto -> DetallePedido   | 1:N |Un producto puede estar en muchos detalles de pedido|



6. Matriz de Claves Foráneas

  Tabla | Campo FK | Referencia |
|:----------|:---------:|----------:|
|Pedido | IdCliente | Cliente (IdCliente)  |
|DetallePedido | NumPedido | Pedido (NumPedido)  |
|DetallePedido | NumProducto  | Producto (NumProducto)  |


7. Integridad referencial 

    | Regla |  Descripción |
    | :---  | :---         |
    | IR-01 |No se puede registrar un pedido sin un cliente válido|
    | IR-02 | El detalle de un pedido no existe sin un pedido padre y sin un producto válido|
    | IR-03 |NNo se pueden eliminar productos o pedidos si tienen registros en la tabla Detalle_del_Pedido|
    | IR-04 |No se pueden eliminar productos o pedidos si tienen registros en la tabla Detalle_del_Pedido|

8. Regla del negocio

      | Código |  Regla |
    | :--- | :--- |
    | RN-01 |Un cliente puede realizar muchos pedidos|
    | RN-02 |Cada pedido pertenece a un solo cliente |
    | RN-03 |Un pedido contiene varios productos |
    | RN-04 |Un producto puede aparecer en muchos pedidos|
    | RN-05 |Un pedido debe contener al menos un producto |
    | RN-06|Un producto puede no haber sido vendido|
    | RN-07|El detalle del pedido no existe sin pedido |
    | RN-08|El detalle del pedido no existe sin producto|
    | RN-09|El detalle del pedido alamacena cantidad vendida y precio de venta|
   
9. Diagrama relacional    

![Eje4](/image/Relacional/EjercicioTab4.jpg)

