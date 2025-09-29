## Librería el mundo de Sofía

Diseñar una base de datos para una tienda de libros que gestione el inventario, ventas y clientes. La base de datos debe permitir el registro y gestión de libros, autores, clientes, pedidos y transacciones de compra. Debes crear un diagrama UML E-R que represente la estructura de la base de datos y entregar una documentación detallada que explique las decisiones de diseño, las relaciones entre las tablas y las restricciones impuestas.

## tablas
# Libros:
Esta fue la primera tabla que se creo y contiene su "titulo, fecha de publicacion, ISBN(unique key),precio, stock, id_editotial_fk( que va unido con la tabla editorial), id_categoria_fk".

# Autores:
Esta es la segunda tabla y contiene su "nombre, fecha de nacimiento y nacionalidad".

# Libro_autor:
Esta es una tabla intermedia que une a libros y autores.

# Editorial:
Esta tabla contiene nombre y va se une con la tabla libros.

# clientes:
Esta tabla contiene su "nombre, email(unique key), telefono y direccion" y se une con la tabla pedidos.

# Pedidos:
Esta tabla contiene su "fecha,estado del pedido (pendiente, procesado, completado), id_cliente_fk" eso quiere decir que esta tabla esta unida a clientes.

# Transacciones:
Esta tabla contiene su "el método de pago (tarjeta de crédito, PayPal, etc.),monto total, fecha transaccion, id_pedido_fk" eso quiere decir que esta tabla esta unida con pedidos

# Detalle_pedido:
Esta tabla contiene "cantidad, precio unitario, id_pedido_fk, id_libro_fk" eso quiere decir que esta tabla se une con libros y pedidos.