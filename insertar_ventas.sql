-- ============================================
-- Insertar datos: ventas y detalle_venta
-- ============================================

USE tienda_videojuegos;

-- Ajustar fecha_venta de INT a DATE
ALTER TABLE ventas MODIFY fecha_venta DATE;

-- VENTAS
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

-- DETALLE_VENTA
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
