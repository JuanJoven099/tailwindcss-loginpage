// Gestión del Menú Móvil y Sesión de Usuario
document.addEventListener("DOMContentLoaded", () => {
    const menuBtn = document.getElementById("menuBtn");
    const mobileMenu = document.getElementById("mobileMenu");

    if (menuBtn && mobileMenu) {
        // Función para abrir o cerrar menú
        const toggleMenu = (open) => {
            const shouldOpen = open !== undefined ? open : mobileMenu.classList.contains("hidden");
            if (shouldOpen) {
                mobileMenu.classList.remove("hidden");
                menuBtn.textContent = "✕";
                menuBtn.setAttribute("aria-label", "Cerrar menú");
            } else {
                mobileMenu.classList.add("hidden");
                menuBtn.textContent = "☰";
                menuBtn.setAttribute("aria-label", "Abrir menú");
            }
        };

        // Al hacer clic en el botón hamburguesa
        menuBtn.addEventListener("click", (e) => {
            e.stopPropagation();
            toggleMenu();
        });

        // Cerrar menú al hacer clic en cualquier enlace dentro del menú
        mobileMenu.querySelectorAll("a").forEach(link => {
            link.addEventListener("click", () => {
                toggleMenu(false);
            });
        });

        // Cerrar menú al hacer clic fuera del header o menú
        document.addEventListener("click", (e) => {
            if (!mobileMenu.contains(e.target) && !menuBtn.contains(e.target)) {
                toggleMenu(false);
            }
        });

        // Si se cambia el tamaño a escritorio, cerrar menú
        window.addEventListener("resize", () => {
            if (window.innerWidth >= 768) {
                toggleMenu(false);
            }
        });
    }

    // Comprobar si hay una sesión activa en el sistema
    const usuarioActivo = localStorage.getItem("usuarioActivo");
    const navLoginBtn = document.getElementById("navLoginBtn");
    const mobileLoginBtn = document.getElementById("mobileLoginBtn");

    if (usuarioActivo) {
        const nombreMostrar = usuarioActivo.split('@')[0];

        if (navLoginBtn) {
            navLoginBtn.textContent = `Salir (${nombreMostrar})`;
            navLoginBtn.href = "#";
            navLoginBtn.title = "Haz clic para cerrar sesión";
            navLoginBtn.classList.remove("bg-blue-600", "hover:bg-blue-700");
            navLoginBtn.classList.add("bg-gray-700", "hover:bg-red-600");
            navLoginBtn.addEventListener("click", (e) => {
                e.preventDefault();
                localStorage.removeItem("usuarioActivo");
                alert("Has cerrado sesión exitosamente.");
                window.location.reload();
            });
        }

        if (mobileLoginBtn) {
            mobileLoginBtn.textContent = `Cerrar sesión (${nombreMostrar})`;
            mobileLoginBtn.href = "#";
            mobileLoginBtn.classList.remove("bg-blue-600", "hover:bg-blue-700");
            mobileLoginBtn.classList.add("bg-red-600", "hover:bg-red-700");
            mobileLoginBtn.addEventListener("click", (e) => {
                e.preventDefault();
                localStorage.removeItem("usuarioActivo");
                alert("Has cerrado sesión exitosamente.");
                window.location.reload();
            });
        }
    }
});
