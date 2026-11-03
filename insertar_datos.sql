-- ============================================
-- Script para insertar datos en tienda_videojuegos
-- ============================================

USE tienda_videojuegos;

-- ===========================================
-- Ajustes de estructura (para coincidir con los datos reales)
-- ===========================================

-- clientes: ciudad es texto, fecha_registro es fecha
ALTER TABLE clientes MODIFY ciudad VARCHAR(100);
ALTER TABLE clientes MODIFY fecha_registro DATE;

-- videojuegos: clasificacion_edad es texto ("16+", "3+"), fecha se llama fecha_lanzamiento
ALTER TABLE videojuegos CHANGE fecha_nacimiento fecha_lanzamiento DATE;
ALTER TABLE videojuegos MODIFY clasificacion_edad VARCHAR(10);

-- ===========================================
-- INSERTAR DATOS
-- ===========================================

-- 1. CLIENTES
INSERT INTO clientes (id_clientes, nombres, apellidos, correo, ciudad, fecha_registro) VALUES
(1, 'Laura',     'Gómez',   'laura.gomez@example.com',     'Bogotá',       '2025-01-15'),
(2, 'Andrés',    'Rojas',   'andres.rojas@example.com',    'Medellín',     '2025-02-03'),
(3, 'Camila',    'Pérez',   'camila.perez@example.com',    'Cali',         '2025-02-20'),
(4, 'Juan',      'Torres',  'juan.torres@example.com',     'Neiva',        '2025-03-01'),
(5, 'Valentina', 'Díaz',    'valentina.diaz@example.com',  'Pitalito',     '2025-03-17'),
(6, 'Mateo',     'Castro',  'mateo.castro@example.com',    'Garzón',       '2025-04-09'),
(7, 'Sofía',     'Morales', 'sofia.morales@example.com',   'Pasto',        '2025-05-11'),
(8, 'Daniel',    'Vargas',  'daniel.vargas@example.com',   'Bucaramanga',  '2025-06-22');

-- 2. CATEGORÍAS
INSERT INTO categorias (id_categorias, nombres, descripcion) VALUES
(1, 'Acción',      'Juegos de acción y aventura'),
(2, 'Deportes',    'Simulación deportiva'),
(3, 'Carreras',    'Conducción y velocidad'),
(4, 'Rol',         'Juegos de rol y exploración'),
(5, 'Estrategia',  'Táctica y gestión');

-- 3. PLATAFORMAS
INSERT INTO plataformas (id_plataforma, nombre, fabricante) VALUES
(1, 'PlayStation 5',   'Sony'),
(2, 'Xbox Series X',   'Microsoft'),
(3, 'Nintendo Switch',  'Nintendo'),
(4, 'PC',               'Varios');

-- 4. MÉTODOS DE PAGO
INSERT INTO metodos_pago (id_metodo_pago, nombre) VALUES
(1, 'Tarjeta débito'),
(2, 'Tarjeta crédito'),
(3, 'Transferencia'),
(4, 'Efectivo');

-- 5. VIDEOJUEGOS
INSERT INTO videojuegos (id_videojuego, titulo, id_categoria, id_plataforma, precio, stock, fecha_lanzamiento, clasificacion_edad, fk_id_categoria, fk_id_plataforma) VALUES
(1,  'Horizonte de Acero',     1, 1, 219900, 12, '2024-11-12', '16+', 1, 1),
(2,  'Liga Total 2025',        2, 2, 189900,  8, '2025-09-05', '3+',  2, 2),
(3,  'Turbo Urbano',           3, 3, 149900, 15, '2024-06-20', '7+',  3, 3),
(4,  'Reinos de Ceniza',       4, 4,  99900, 20, '2023-10-02', '16+', 4, 4),
(5,  'Comandantes del Norte',  5, 4, 129900,  6, '2025-01-18', '12+', 5, 4),
(6,  'Isla Pixel',             1, 3, 179900,  0, '2024-03-14', '7+',  1, 3),
(7,  'Cancha Estelar',         2, 1, 159900,  9, '2025-08-22', '3+',  2, 1),
(8,  'Velocidad Extrema',      3, 2, 199900,  4, '2025-07-10', '7+',  3, 2),
(9,  'Crónicas del Vacío',     4, 1, 239900,  3, '2025-02-28', '18+', 4, 1),
(10, 'Granjas Galácticas',     5, 3,  89900, 18, '2022-12-01', '3+',  5, 3),
(11, 'Pixel Fighters',         1, 2,  79900, 25, '2023-05-15', '12+', 1, 2),
(12, 'Misterio en Neón',       4, 4, 109900,  0, '2025-04-04', '12+', 4, 4);
