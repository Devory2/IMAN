/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author leova
 */
public class control_login extends koneksi{
    public control_login(){
        super.setKoneksi();
    }
    
    public ResultSet login(String username, String password) throws SQLException{
        String sql= "SELECT * FROM tbl_user WHERE username = '"+username+"' AND password = '"+password+"'";
        rs = st.executeQuery(sql);
        return rs;
    }
}
