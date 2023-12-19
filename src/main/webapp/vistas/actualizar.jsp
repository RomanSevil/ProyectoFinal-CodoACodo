<%@page import="modelo.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar cliente</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>

    <body>
        <div class="container mt-5">
            <h2>Actualizar Cliente</h2>
            <form action="GestionClienteServlet" method="post">
                <input type="hidden" name="accion" value="confirmarActualizacion">
                <input type="hidden" name="id" value="${cliente.idCliente}">

                <div class="form-group">
                    <label for="nombre">Nombre:</label>
                    <input type="text" class="form-control" id="nombre" name="nombre" value="${cliente.nombre}"
                        required>
                </div>

                <div class="form-group">
                    <label for="apellido">Apellido:</label>
                    <input type="text" class="form-control" id="apellido" name="apellido" value="${cliente.apellido}"
                        required>
                </div>

                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" class="form-control" id="email" name="email" value="${cliente.email}" required>
                </div>

                <div class="form-group">
                    <label for="categoria">Categoria:</label>
                    <select id="categoria" name="categoria" class="form-select border border-dark rounded-0">
                        <option value="SIN_CATEGORIA" ${cliente.categoria.name() == 'SIN_CATEGORIA' ? 'selected' : ''}>Sin categoria</option>
                        <option value="ESTUDIANTE" ${cliente.categoria.name() == 'ESTUDIANTE' ? 'selected' : ''}>Estudiante</option>
                        <option value="JUBILADO" ${cliente.categoria.name() == 'JUBILADO' ? 'selected' : ''}>Jubilado</option>
                        <option value="EMPRESA" ${cliente.categoria.name() == 'EMPRESA' ? 'selected' : ''}>Empresa</option>
                    </select>
                </div>
                

                <div class="form-group">
                    <label for="fechaAlta">Fecha Alta:</label>
                    <input type="date" class="form-control" id="fechaAlta" name="fechaAlta" value="${cliente.fechaAlta}"
                        required>
                </div>

                <button type="submit" class="btn btn-primary">Actualizar</button>
                <a href="gestionClientes.jsp" class="btn btn-success">Volver</a>

            </form>
        </div>
    </body>

    </html>