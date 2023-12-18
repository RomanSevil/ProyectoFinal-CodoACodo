

<%@page import="java.util.List"%>
<%@page import="modelo.Cliente"%>
<%@page import="dao.ClientesDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestion de clientes</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container mt-5">
            <h2>Gestión de clientes</h2>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Email</th>
                        <th>Categoría</th>
                        <th>Fecha Alta</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ClientesDAO clientesDAO = new ClientesDAO();
                        List<Cliente> clientes = clientesDAO.obtenerTodos();

                        if (clientes != null && !clientes.isEmpty()) {
                            for (Cliente cliente : clientes) {
                    %>
                    <tr>
                        <td><%= cliente.getIdCliente()%></td>
                        <td><%= cliente.getNombre()%></td>
                        <td><%= cliente.getApellido()%></td>
                        <td><%= cliente.getEmail()%></td>
                        <td><%= cliente.getCategoria()%></td>
                        <td><%= cliente.getFechaAlta()%></td>
                        <td>
                            <div class="d-flex">
                                <!-- Formulario para actualizar -->
                                <form action="GestionClienteServlet" method="post" class="mr-2">
                                    <input type="hidden" name="accion" value="actualizar">
                                    <input type="hidden" name="id" value="<%= cliente.getIdCliente()%>">
                                    <button type="submit" class="btn btn-warning btn-block">Actualizar</button>
                                </form>

                                <!-- Formulario para eliminar -->
                                <form action="GestionClienteServlet" method="post">
                                    <input type="hidden" name="accion" value="eliminar">
                                    <input type="hidden" name="id" value="<%= cliente.getIdCliente()%>">
                                    <button type="submit" class="btn btn-danger btn-block">Eliminar</button>
                                </form>
                            </div>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="6">No hay clientes registrados.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <a href="../" class="btn btn-success">Volver</a>   
        </div>

    </body>
</html>
