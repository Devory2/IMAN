/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import gui.MenuUtama;
import java.sql.SQLException;
import java.util.logging.Logger;
import java.util.logging.Level;

/**
 *
 * @author leova
 */
public class menuut extends koneksi{
    public menuut(){
        super.setKoneksi();
    }
    
    public void tampilcounttrx(){
        try{
           String sql = "SELECT COUNT(id_transaksi) FROM `tbl_transaksi`";
            rs = st.executeQuery(sql);
           while(rs.next()){
               MenuUtama.totaltrx.setText(rs.getString(1));
            }
        } catch (SQLException ex){
            Logger.getLogger(menuut.class.getName()).log(Level.SEVERE, null, ex);
       }
    }
    
    public void tampilkeuntungan(){
        try{
            String sql = "SELECT SUM(laba) FROM tbl_keuangan";
            rs = st.executeQuery(sql);
            while(rs.next()){
                MenuUtama.totalkeuntungan.setText(rs.getString(1));
            }
        } catch (SQLException ex){
            Logger.getLogger(menuut.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
