package gui;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Mochammad Enrique ft. IMAN
 */

public class koneksi {
    
    public static final Connection connect(){
        Connection con= null; // inisialisasi interface Connection
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/db_iman", "root", ""); 
            System.out.println("Database Connected!");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Database Not Connected!");
        }
        return con;
    }
}