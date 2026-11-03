document.addEventListener('DOMContentLoaded', () => {
    const loginForm = document.getElementById('formLogin');

    if (loginForm) {
        loginForm.addEventListener('submit', (e) => {
            e.preventDefault();

            const emailInput = document.getElementById('correo');
            const passwordInput = document.getElementById('password');

            const email = emailInput ? emailInput.value.trim() : '';
            const password = passwordInput ? passwordInput.value.trim() : '';

            if (!email || !password) {
                alert('Por favor, completa todos los campos.');
                return;
            }

            localStorage.setItem('usuarioActivo', email);
            alert('¡Inicio de sesión exitoso!');
            window.location.href = '../index.html';
        });
    }
});
