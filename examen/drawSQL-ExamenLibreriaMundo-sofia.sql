CREATE TABLE `Libros`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `titulo` VARCHAR(150) NOT NULL,
    `fecha_publicación` DATE NOT NULL,
    `ISBN` VARCHAR(20) NOT NULL,
    `precio` DECIMAL(10, 2) NOT NULL,
    `stock` INT NOT NULL,
    `id_editorial_fk` BIGINT NOT NULL,
    `id_categoria_fk` BIGINT NOT NULL
);
ALTER TABLE
    `Libros` ADD UNIQUE `libros_isbn_unique`(`ISBN`);
CREATE TABLE `Autores`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(100) NOT NULL,
    `fecha_nacimiento` DATE NOT NULL,
    `nacionalidad` VARCHAR(50) NOT NULL
);
CREATE TABLE `Clientes`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `telefono` VARCHAR(20) NOT NULL,
    `direccion` VARCHAR(150) NOT NULL
);
ALTER TABLE
    `Clientes` ADD UNIQUE `clientes_email_unique`(`email`);
CREATE TABLE `Pedidos`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `fecha` DATETIME NOT NULL,
    `estado` ENUM(
        '(' pendiente ')',
        '(' procesado ')',
        '(' completado ')'
    ) NOT NULL DEFAULT 'estado',
    `id_cliente_fk` BIGINT NOT NULL
);
CREATE TABLE `Transacciones`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `metodo_pago` ENUM('(' tarjeta crédito ')', '(' PayPal ')') NOT NULL DEFAULT 'pago',
    `monto_total` DECIMAL(10, 2) NOT NULL,
    `fecha_transacción` DATE NOT NULL,
    `id_pedido_fk` BIGINT NOT NULL
);
CREATE TABLE `libro_autor`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_libro_fk` BIGINT NOT NULL,
    `id_autor_fk` BIGINT NOT NULL
);
CREATE TABLE `Editorial`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(50) NOT NULL
);
CREATE TABLE `detalle_pedido`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `cantidad` INT NOT NULL,
    `precio_unitario` DECIMAL(10, 2) NOT NULL,
    `id_pedido_fk` BIGINT NOT NULL,
    `id_libro_fk` BIGINT NOT NULL
);
ALTER TABLE
    `Transacciones` ADD CONSTRAINT `transacciones_id_pedido_fk_foreign` FOREIGN KEY(`id_pedido_fk`) REFERENCES `Pedidos`(`id`);
ALTER TABLE
    `libro_autor` ADD CONSTRAINT `libro_autor_id_libro_fk_foreign` FOREIGN KEY(`id_libro_fk`) REFERENCES `Libros`(`id`);
ALTER TABLE
    `Pedidos` ADD CONSTRAINT `pedidos_id_cliente_fk_foreign` FOREIGN KEY(`id_cliente_fk`) REFERENCES `Clientes`(`id`);
ALTER TABLE
    `libro_autor` ADD CONSTRAINT `libro_autor_id_autor_fk_foreign` FOREIGN KEY(`id_autor_fk`) REFERENCES `Autores`(`id`);
ALTER TABLE
    `detalle_pedido` ADD CONSTRAINT `detalle_pedido_id_pedido_fk_foreign` FOREIGN KEY(`id_pedido_fk`) REFERENCES `Pedidos`(`id`);
ALTER TABLE
    `Libros` ADD CONSTRAINT `libros_id_editorial_fk_foreign` FOREIGN KEY(`id_editorial_fk`) REFERENCES `Editorial`(`id`);
ALTER TABLE
    `detalle_pedido` ADD CONSTRAINT `detalle_pedido_id_libro_fk_foreign` FOREIGN KEY(`id_libro_fk`) REFERENCES `Libros`(`id`);