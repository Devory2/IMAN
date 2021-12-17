/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author leova
 */
public class control_user extends koneksi {
    public control_user(){
        super.setKoneksi();
    }
    public DefaultTableModel model = new DefaultTableModel();
    
    public void simpan(String id_user, String id_muser, String level, String nama, String username, String password) throws SQLException{
        String sql = "INSERT INTO tbl_user VALUES ('"+id_user+"','"+id_muser+"','"+nama+"','"+username+"','"+password+"')";
        String sqll = "INSERT INTO tbl_muser VALUES ('"+id_muser+"','"+level+"')";
        st.executeUpdate(sql);
        st.executeUpdate(sqll);
    }
    
    public void hapus(String id_user, String id_muser)throws SQLException{
        String sql = "DELETE FROM tbl_user WHERE id_user = '"+id_user+"'";
        String sqll = "DELETE FROM tbl_muser WHERE id_muser = '"+id_muser+"'";
        st.executeUpdate(sql);
        st.executeUpdate(sqll);
    }
    
    public void edit(String id_user, String id_muser, String level, String nama, String username, String password)throws SQLException{
        String sql = "UPDATE tbl_user SET nama = '"+nama+"', username = '"+username+", password = '"+password+"' WHERE id_user = '"+id_user+"'";
        String sqll = "UPDATE tbl_muser SET level = '"+level+"', WHERE id_muser = '"+id_muser+"'";
        st.executeUpdate(sql);
        st.executeUpdate(sqll);
    }
    
    public void tampil(){
        String sql = "SELECT * FROM tbl_muser INNER JOIN tbl_user ON tbl_muser.id_muser = tbl_user.id_muser";
        String[] kolom = {"ID", "Level Pengguna", "Nama Pengguna", "Username", "Password"};
        
        try{
            rs = st.executeQuery(sql);
            model.setColumnIdentifiers(kolom);
            while(rs.next()){
                Object[] data = new Object[5];
                data[0] = rs.getString("id_user");
                data[1] = rs.getString("level");
                data[2] = rs.getString("nama");
                data[3] = rs.getString("username");
                data[4] = rs.getString("password");
                
                model.addRow(data);
            }
        }catch (SQLException ex){
            Logger.getLogger(control_user.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
