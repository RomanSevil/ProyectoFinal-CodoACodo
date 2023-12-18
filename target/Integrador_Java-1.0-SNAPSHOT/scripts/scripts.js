

    const ticket = 200;

    let descEstudiante = 0.80
    let descJubilado = 0.50
    let descEmpresa = 0.15

    const formulario = document.getElementById("formulario")
    const categoria = document.getElementById("categoria")
    const cantidad = document.getElementById("cantidad")
    const totalPagar = document.getElementById("totalAPagar")
    const btnResumen = document.getElementById("resumen")
    const nombre = document.getElementById("nombre")
    const apellido = document.getElementById("apellido")
    const correo = document.getElementById("correo")
    const enviar = document.getElementById("enviar")

    function calcularPago() {
        let total = cantidad.value * ticket;

        switch (categoria.value) {
            case "estudiante":
                total = total - (total * descEstudiante)
                break
            case "jubilado":
                total = total - (total * descJubilado)
                break
            case "empresa":
                total = total - (total * descEmpresa)
                break
            default:
                break
        }

        totalPagar.textContent = `Total a pagar: $ ${total}`

    }

    btnResumen.addEventListener('click', (e) => {
        e.preventDefault()
        calcularPago()
    })



    function validar() {
        console.log(nombre.value.trim())
        if (nombre.value === '' || apellido.value === '' || categoria.value === '' || cantidad.value === '') {
            alert('Por favor, completa todos los campos obligatorios.');

        } else if (correo.value === '' || !validarCorreo(correo.value)) {
            alert('Por favor, ingresa un correo electrónico válido.');
        } else {
            calcularPago();
            setTimeout(() => {
                window.location.reload();
            }, 4000);
        }
    }

    function validarCorreo(correo) {
        const re = /\S+@\S+\.\S+/;
        return re.test(correo);
    }

    enviar.addEventListener('click', (e) => {
        e.preventDefault()
        validar()
    })
