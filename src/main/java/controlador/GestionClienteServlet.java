package controlador;

import dao.ClientesDAO;
import enums.Categoria;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Cliente;

@WebServlet("/vistas/GestionClienteServlet")
public class GestionClienteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        ClientesDAO clientesDAO = new ClientesDAO();

        // Inicializar idCliente antes del switch para que esté disponible en todos los casos
        int idCliente = Integer.parseInt(request.getParameter("id"));

        switch (accion) {
            case "actualizar":
                Cliente cliente = clientesDAO.obtenerPorId(idCliente);
                request.setAttribute("cliente", cliente); //Esto permite pasar datos del servlet a una vista (como un archivo JSP) o a otro servlet al que se redirige o se reenvía la solicitud
                request.getRequestDispatcher("actualizar.jsp").forward(request, response);
                break;
            case "confirmarActualizacion":
                Cliente clienteActualizado = new Cliente();
                clienteActualizado.setIdCliente(idCliente);
                clienteActualizado.setNombre(request.getParameter("nombre"));
                clienteActualizado.setApellido(request.getParameter("apellido"));
                clienteActualizado.setEmail(request.getParameter("email"));
                
                String categoriaStr = request.getParameter("categoria");
                Categoria categoria = Categoria.valueOf(categoriaStr);
                clienteActualizado.setCategoria(categoria);
                
                

                // Asume que el método setFechaAlta acepta un java.sql.Date
                clienteActualizado.setFechaAlta(java.sql.Date.valueOf(request.getParameter("fechaAlta")));

                clientesDAO.actualizarCliente(clienteActualizado);
                response.sendRedirect("gestionClientes.jsp");
                break;
            case "eliminar":
                clientesDAO.eliminarCliente(idCliente);
                response.sendRedirect("gestionClientes.jsp");
                break;
            default:
                response.sendRedirect("gestionClientes.jsp");
                break;
        }
    }
}
