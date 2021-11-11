package koneksi;

import com.mysql.jdbc.Driver;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;

public class connect {
    private static Connection koneksi;
    
    public static Connection GetConnection()throws SQLException{
        if (koneksi==null){
            Driver driver = new Driver();
            
            koneksi=DriverManager.getConnection("jdbc:mysql://localhost:3307/db_iman","root","");
        }
        try {
            String url="\"jdbc:mysql://localhost:3307/db_iman";
            String user="root";
            String pass="";
            
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            koneksi = DriverManager.getConnection(username, password)
        }
        catch (SQLException e) {
            System.out.println("Koneksi gagal ke database" + e.getMessage());
        }
        return koneksi;
    }
}
