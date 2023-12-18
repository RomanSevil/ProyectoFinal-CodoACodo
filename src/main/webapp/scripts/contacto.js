const formularioContacto = document.getElementById("contactForm")
console.log(formularioContacto)
const nombreContacto = document.getElementById("contactNombre")
const email = document.getElementById("contactEmail")
const telefonoContacto = document.getElementById("contactTelefono")
const msg = document.getElementById("contactMsg")
const botonContacto=document.getElementById("contactBtn")

botonContacto.addEventListener('click', (e) => {
    e.preventDefault()
    if (nombreContacto.value === '' || telefonoContacto.value === '' || msg.value === '') {
        alert('Por favor, completa todos los campos obligatorios.');
    } else if (email.value === '' || !validarEmail(email.value)) {
        alert('Ingresa un correo electrónico válido.');
    } else {
        setTimeout(() => {
            window.location.reload();
        }, 3500);
    }
})

function validarEmail(email) {
    const re = /\S+@\S+\.\S+/;
    return re.test(email);
}