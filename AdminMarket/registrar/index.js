document.addEventListener('DOMContentLoaded', () => {
    const registerForm = document.getElementById('formRegistro');

    if (registerForm) {
        registerForm.addEventListener('submit', (e) => {
            e.preventDefault();

            const nombre = document.getElementById('nombre').value.trim();
            const email = document.getElementById('correo').value.trim();
            const pass1 = document.getElementById('password')?.value || '';
            const pass2 = document.getElementById('confirmar-password')?.value || '';

            if (!nombre || !email || !pass1 || !pass2) {
                alert('Todos los campos son obligatorios.');
                return;
            }

            if (pass1.length < 6) {
                alert('La contraseña debe tener al menos 6 caracteres.');
                return;
            }

            if (pass1 !== pass2) {
                alert('Las contraseñas no coinciden. Inténtalo de nuevo.');
                return;
            }

            alert('¡Registro exitoso! Ahora puedes iniciar sesión.');
            window.location.href = '../iniciodesesion/index.html';
        });
    }
});
