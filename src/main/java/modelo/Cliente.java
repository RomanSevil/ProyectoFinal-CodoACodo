
package modelo;

import enums.Categoria;
import java.sql.Date;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;


public class Cliente {
    private int idCliente;
    private String nombre;
    private String apellido;
    private String email;
    @Enumerated(EnumType.STRING)
    private Categoria categoria;
    private Date fechaAlta;

    public Cliente() {
    }

    public Cliente(int idCliente, String nombre, String apellido, String email, Categoria categoria, Date fechaAlta) {
        this.idCliente = idCliente;
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
        this.categoria = categoria;      
        this.fechaAlta = fechaAlta;
    }

    

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    public Date getFechaAlta() {
        return fechaAlta;
    }

    public void setFechaAlta(Date fechaAlta) {
        this.fechaAlta = fechaAlta;
    }
    
    
    
}
