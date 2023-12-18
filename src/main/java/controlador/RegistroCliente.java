
package controlador;

import dao.ClientesDAO;
import enums.Categoria;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Cliente;

@WebServlet("/registroCliente")
public class RegistroCliente extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String nombre= request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        String categoriaStr = request.getParameter("categoria");
        System.out.println("Valor de categoriaStr: " + categoriaStr);

        Categoria categoria = Categoria.valueOf(categoriaStr);      
        
        Cliente cliente= new Cliente();
        cliente.setNombre(nombre);
        cliente.setApellido(apellido);
        cliente.setEmail(email);
        cliente.setCategoria(categoria);
        
        
        java.util.Date fechaActual = new java.util.Date(); //es una forma de utilizar la clase sin necesitar una declaracion 'import'
        cliente.setFechaAlta(new Date(fechaActual.getTime()));
        
        ClientesDAO clientesDAO= new ClientesDAO();
        try {
            clientesDAO.agregarCliente(cliente);
        } catch (SQLException ex) {
            Logger.getLogger(RegistroCliente.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        response.sendRedirect(request.getContextPath() + "/vistas/verClientes.jsp");
         
    }
}
