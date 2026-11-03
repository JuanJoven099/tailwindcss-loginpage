# Proyecto Web & Base de Datos: AdminMarket + Tienda Videojuegos

Este repositorio contiene tanto la aplicación web frontend de **AdminMarket** (Landing Page, Registro e Inicio de Sesión) como los scripts y consultas SQL de la base de datos relacional **tienda_videojuegos**.

---

## 📂 Estructura del Repositorio

```text
├── AdminMarket/                  # Aplicación Frontend
│   ├── index.html                # Landing Page interactiva
│   ├── index.js                  # Menú responsive
│   ├── README.md                 # Documentación específica de AdminMarket
│   ├── iniciodesesion/           # Módulo de Inicio de Sesión
│   │   ├── index.html
│   │   └── index.js
│   ├── registrar/                # Módulo de Creación de Cuenta
│   │   ├── index.html
│   │   └── index.js
│   └── img/                      # Recursos y logos
│
├── base_de_datos.sql             # Script SQL maestro (Creación + Datos)
├── insertar_datos.sql            # Script modular: Clientes, Categorías, Plataformas
├── insertar_ventas.sql           # Script modular: Ventas y Detalle de ventas
├── quitar_tildes.sql             # Script de normalización de caracteres
└── README.md                     # Documentación principal
```

---

## 💻 1. Módulo Web (AdminMarket)

### Características
- **Tecnologías:** HTML5 semántico, Tailwind CSS (vía CDN), JavaScript (ES6+).
- **Diseño Responsive:** Adaptable a dispositivos móviles, tablets y pantallas de escritorio.
- **Autenticación en Frontend:** Validación de formularios y persistencia de usuarios mediante `localStorage`.

### Cómo visualizarlo
- Abre la carpeta `AdminMarket/` en **Visual Studio Code**.
- Usa la extensión **Live Server** en `index.html` o abre el archivo directamente con tu navegador web.

---

## 🗄️ 2. Módulo de Base de Datos (MySQL)

### Modelo de Datos
La base de datos `tienda_videojuegos` consta de 7 tablas relacionadas con claves primarias (`PRIMARY KEY`) y foráneas (`FOREIGN KEY`):
1. **`clientes`**: Información personal y de registro.
2. **`metodos_pago`**: Formas de pago disponibles.
3. **`plataformas`**: Consolas y plataformas (PlayStation 5, Xbox Series X, Nintendo Switch, PC).
4. **`categorias`**: Géneros de juegos (Accion, Deportes, Carreras, Rol, Estrategia).
5. **`videojuegos`**: Catálogo con stock, precio, plataforma y categoría.
6. **`ventas`**: Registro de transacciones con cliente y estado (Pagada, Pendiente, Cancelada).
7. **`detalle_venta`**: Ítems, cantidades y subtotales por venta.

### Cómo ejecutar la base de datos
1. Abre tu terminal de **MySQL** o **MySQL Workbench**.
2. Ejecuta el archivo maestro:
   ```sql
   SOURCE base_de_datos.sql;
   ```
   *(O abre el archivo `base_de_datos.sql` en MySQL Workbench y presiona el ícono del rayo ⚡).*

---

## 👤 Autor

- **Juan Fernando Joven**
