

<%@page import="java.util.List"%>
<%@page import="modelo.Cliente"%>
<%@page import="dao.ClientesDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de clientes</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    </head>
    <body>
         <div class="container mt-5">
            <h2>Lista de Clientes</h2>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Email</th>
                        <th>Categoria</th>
                        <th>Fecha Alta</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // Crear una instancia de ClientesDAO para acceder a la base de datos
                        ClientesDAO clientesDAO = new ClientesDAO();

                        // Obtener la lista de clientes desde la base de datos
                        List<Cliente> clientes = clientesDAO.obtenerTodos();

                        if (clientes != null && !clientes.isEmpty()) {
                            // Iterar sobre la lista de Clientes y mostrar sus datos en la tabla
                            for (Cliente cliente : clientes) {
                    %>
                    <tr>
                        <td><%= cliente.getIdCliente()%></td>
                        <td><%= cliente.getNombre()%></td>
                        <td><%= cliente.getApellido()%></td>
                        <td><%= cliente.getEmail()%></td>
                        <td><%= cliente.getCategoria()%></td>
                        <td><%= cliente.getFechaAlta()%></td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="5">No hay clientes registrados.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <!-- Botón para volver al índice -->
            <a href="../" class="btn btn-success">Volver</a>   
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
          crossorigin="anonymous"></script>
    </body>
    
</html>
