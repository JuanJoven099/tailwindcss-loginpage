-- =======================================================
-- Base de Datos: tienda_videojuegos
-- Proyecto: Sistema de Gestión de Tienda de Videojuegos
-- Script Completo: Creación de tablas e inserción de datos
-- =======================================================

CREATE DATABASE IF NOT EXISTS tienda_videojuegos
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE tienda_videojuegos;

-- =======================================================
-- 1. ELIMINACIÓN PREVIA (En orden inverso de dependencias)
-- =======================================================
DROP TABLE IF EXISTS detalle_venta;
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS videojuegos;
DROP TABLE IF EXISTS categorias;
DROP TABLE IF EXISTS plataformas;
DROP TABLE IF EXISTS metodos_pago;
DROP TABLE IF EXISTS clientes;

-- =======================================================
-- 2. TABLAS PRINCIPALES (Independientes)
-- =======================================================

-- Tabla: clientes
CREATE TABLE clientes (
    id_clientes INT PRIMARY KEY AUTO_INCREMENT,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    correo VARCHAR(150) NOT NULL,
    ciudad VARCHAR(100),
    fecha_registro DATE
);

-- Tabla: metodos_pago
CREATE TABLE metodos_pago (
    id_metodo_pago INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla: plataformas
CREATE TABLE plataformas (
    id_plataforma INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    fabricante VARCHAR(100) NOT NULL
);

-- Tabla: categorias
CREATE TABLE categorias (
    id_categorias INT PRIMARY KEY AUTO_INCREMENT,
    nombres VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255)
);

-- =======================================================
-- 3. TABLAS DEPENDIENTES (Con Claves Foráneas)
-- =======================================================

-- Tabla: videojuegos
CREATE TABLE videojuegos (
    id_videojuego INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    id_categoria INT,
    id_plataforma INT,
    precio BIGINT NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    fecha_lanzamiento DATE,
    clasificacion_edad VARCHAR(10),
    fk_id_categoria INT,
    fk_id_plataforma INT,
    CONSTRAINT fk_videojuegos_categoria FOREIGN KEY (fk_id_categoria)
        REFERENCES categorias(id_categorias) ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT fk_videojuegos_plataforma FOREIGN KEY (fk_id_plataforma)
        REFERENCES plataformas(id_plataforma) ON UPDATE CASCADE ON DELETE SET NULL
);

-- Tabla: ventas
CREATE TABLE ventas (
    id_venta INT PRIMARY KEY AUTO_INCREMENT,
    fk_id_cliente INT,
    fecha_venta DATE NOT NULL,
    fk_id_metodo_pago INT,
    estado VARCHAR(50) NOT NULL,
    CONSTRAINT fk_ventas_cliente FOREIGN KEY (fk_id_cliente)
        REFERENCES clientes(id_clientes) ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT fk_ventas_metodo_pago FOREIGN KEY (fk_id_metodo_pago)
        REFERENCES metodos_pago(id_metodo_pago) ON UPDATE CASCADE ON DELETE SET NULL
);

-- Tabla: detalle_venta
CREATE TABLE detalle_venta (
    id_detalle_venta INT PRIMARY KEY AUTO_INCREMENT,
    id_detalle INT,
    id_venta INT,
    id_videojuego INT,
    cantidad INT NOT NULL DEFAULT 1,
    precio_unitario BIGINT NOT NULL,
    fk_id_venta INT,
    fk_id_videojuego INT,
    CONSTRAINT fk_detalle_venta FOREIGN KEY (fk_id_venta)
        REFERENCES ventas(id_venta) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_detalle_videojuego FOREIGN KEY (fk_id_videojuego)
        REFERENCES videojuegos(id_videojuego) ON UPDATE CASCADE ON DELETE SET NULL
);

-- =======================================================
-- 4. INSERCIÓN DE DATOS INICIALES (Sin tildes para compatibilidad total)
-- =======================================================

-- Clientes (8 registros)
INSERT INTO clientes (id_clientes, nombres, apellidos, correo, ciudad, fecha_registro) VALUES
(1, 'Laura',     'Gomez',   'laura.gomez@example.com',    'Bogota',      '2025-01-15'),
(2, 'Andres',    'Rojas',   'andres.rojas@example.com',   'Medellin',    '2025-02-03'),
(3, 'Camila',    'Perez',   'camila.perez@example.com',   'Cali',        '2025-02-20'),
(4, 'Juan',      'Torres',  'juan.torres@example.com',    'Neiva',       '2025-03-01'),
(5, 'Valentina', 'Diaz',    'valentina.diaz@example.com', 'Pitalito',    '2025-03-17'),
(6, 'Mateo',     'Castro',  'mateo.castro@example.com',   'Garzon',      '2025-04-09'),
(7, 'Sofia',     'Morales', 'sofia.morales@example.com',  'Pasto',       '2025-05-11'),
(8, 'Daniel',    'Vargas',  'daniel.vargas@example.com',  'Bucaramanga', '2025-06-22');

-- Métodos de Pago (4 registros)
INSERT INTO metodos_pago (id_metodo_pago, nombre) VALUES
(1, 'Tarjeta debito'),
(2, 'Tarjeta credito'),
(3, 'Transferencia'),
(4, 'Efectivo');

-- Plataformas (4 registros)
INSERT INTO plataformas (id_plataforma, nombre, fabricante) VALUES
(1, 'PlayStation 5',  'Sony'),
(2, 'Xbox Series X',  'Microsoft'),
(3, 'Nintendo Switch', 'Nintendo'),
(4, 'PC',              'Varios');

-- Categorías (5 registros)
INSERT INTO categorias (id_categorias, nombres, descripcion) VALUES
(1, 'Accion',     'Juegos de accion y aventura'),
(2, 'Deportes',   'Simulacion deportiva'),
(3, 'Carreras',   'Conduccion y velocidad'),
(4, 'Rol',        'Juegos de rol y exploracion'),
(5, 'Estrategia', 'Tactica y gestion');

-- Videojuegos (12 registros)
INSERT INTO videojuegos (id_videojuego, titulo, id_categoria, id_plataforma, precio, stock, fecha_lanzamiento, clasificacion_edad, fk_id_categoria, fk_id_plataforma) VALUES
(1,  'Horizonte de Acero',    1, 1, 219900, 12, '2024-11-12', '16+', 1, 1),
(2,  'Liga Total 2025',       2, 2, 189900,  8, '2025-09-05', '3+',  2, 2),
(3,  'Turbo Urbano',          3, 3, 149900, 15, '2024-06-20', '7+',  3, 3),
(4,  'Reinos de Ceniza',      4, 4,  99900, 20, '2023-10-02', '16+', 4, 4),
(5,  'Comandantes del Norte', 5, 4, 129900,  6, '2025-01-18', '12+', 5, 4),
(6,  'Isla Pixel',            1, 3, 179900,  0, '2024-03-14', '7+',  1, 3),
(7,  'Cancha Estelar',        2, 1, 159900,  9, '2025-08-22', '3+',  2, 1),
(8,  'Velocidad Extrema',     3, 2, 199900,  4, '2025-07-10', '7+',  3, 2),
(9,  'Cronicas del Vacio',    4, 1, 239900,  3, '2025-02-28', '18+', 4, 1),
(10, 'Granjas Galacticas',    5, 3,  89900, 18, '2022-12-01', '3+',  5, 3),
(11, 'Pixel Fighters',        1, 2,  79900, 25, '2023-05-15', '12+', 1, 2),
(12, 'Misterio en Neon',      4, 4, 109900,  0, '2025-04-04', '12+', 4, 4);

-- Ventas (10 registros)
INSERT INTO ventas (id_venta, fk_id_cliente, fecha_venta, fk_id_metodo_pago, estado) VALUES
(1,  1, '2025-07-02', 2, 'Pagada'),
(2,  2, '2025-07-08', 3, 'Pagada'),
(3,  3, '2025-08-12', 1, 'Pagada'),
(4,  1, '2025-09-01', 4, 'Pagada'),
(5,  4, '2025-09-15', 2, 'Pendiente'),
(6,  5, '2025-10-03', 3, 'Pagada'),
(7,  6, '2025-10-17', 1, 'Pagada'),
(8,  7, '2025-11-04', 2, 'Cancelada'),
(9,  8, '2025-11-20', 3, 'Pagada'),
(10, 3, '2025-12-05', 1, 'Pagada');

-- Detalle de Ventas (17 registros)
INSERT INTO detalle_venta (id_detalle_venta, id_detalle, id_venta, id_videojuego, cantidad, precio_unitario, fk_id_venta, fk_id_videojuego) VALUES
(1,  1,  1,  1,  1, 219900, 1,  1),
(2,  2,  1,  4,  1,  99900, 1,  4),
(3,  3,  2,  2,  1, 189900, 2,  2),
(4,  4,  2,  5,  2, 129900, 2,  5),
(5,  5,  3,  3,  1, 149900, 3,  3),
(6,  6,  3,  7,  1, 159900, 3,  7),
(7,  7,  4,  11, 2,  79900, 4,  11),
(8,  8,  5,  9,  1, 239900, 5,  9),
(9,  9,  6,  10, 1,  89900, 6,  10),
(10, 10, 6,  3,  1, 149900, 6,  3),
(11, 11, 7,  8,  1, 199900, 7,  8),
(12, 12, 7,  6,  1, 179900, 7,  6),
(13, 13, 8,  12, 1, 109900, 8,  12),
(14, 14, 9,  1,  1, 219900, 9,  1),
(15, 15, 9,  11, 1,  79900, 9,  11),
(16, 16, 10, 2,  1, 189900, 10, 2),
(17, 17, 10, 10, 2,  89900, 10, 10);
