package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionDB {
    
    //pertenece a la clase pero no es una instancia especifica
    private static final String URL= "jdbc:mysql://localhost:3306/vaporozonoapp";
    private static final String USER = "root";
    private static final String PASS = "root";
    
    static {
        try {
            // Carga dinámicamente la clase especificada y la inicializa, retornando su objeto Class.
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException("Error al cargar el controlador JDBC");
        }
    }
    
    public static Connection conectar() throws SQLException{
        return DriverManager.getConnection(URL, USER, PASS);
    }
    //metodo estatico: significa que pertenece a la clase conexion
    //No es una instancia especifica de la clase por lo tanto no se pone new
    //retorna un objeto del tipo Conecction
}
