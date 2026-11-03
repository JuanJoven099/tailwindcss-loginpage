USE tienda_videojuegos;

-- 1. Actualizar CLIENTES (quitar tildes en nombres, apellidos y ciudad)
UPDATE clientes SET 
    nombres = CASE id_clientes
        WHEN 2 THEN 'Andres'
        WHEN 7 THEN 'Sofia'
        ELSE nombres
    END,
    apellidos = CASE id_clientes
        WHEN 1 THEN 'Gomez'
        WHEN 3 THEN 'Perez'
        WHEN 5 THEN 'Diaz'
        ELSE apellidos
    END,
    ciudad = CASE id_clientes
        WHEN 1 THEN 'Bogota'
        WHEN 2 THEN 'Medellin'
        WHEN 6 THEN 'Garzon'
        ELSE ciudad
    END;

-- 2. Actualizar CATEGORIAS (quitar tildes en nombres y descripcion)
UPDATE categorias SET 
    nombres = CASE id_categorias
        WHEN 1 THEN 'Accion'
        ELSE nombres
    END,
    descripcion = CASE id_categorias
        WHEN 1 THEN 'Juegos de accion y aventura'
        WHEN 2 THEN 'Simulacion deportiva'
        WHEN 3 THEN 'Conduccion y velocidad'
        WHEN 4 THEN 'Juegos de rol y exploracion'
        WHEN 5 THEN 'Tactica y gestion'
        ELSE descripcion
    END;

-- 3. Actualizar METODOS_PAGO
UPDATE metodos_pago SET 
    nombre = CASE id_metodo_pago
        WHEN 1 THEN 'Tarjeta debito'
        WHEN 2 THEN 'Tarjeta credito'
        ELSE nombre
    END;

-- 4. Actualizar VIDEOJUEGOS
UPDATE videojuegos SET 
    titulo = CASE id_videojuego
        WHEN 9 THEN 'Cronicas del Vacio'
        WHEN 10 THEN 'Granjas Galacticas'
        WHEN 12 THEN 'Misterio en Neon'
        ELSE titulo
    END;
