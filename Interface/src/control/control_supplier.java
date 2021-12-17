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
public class control_supplier extends koneksi {
    public control_supplier(){        
    super.setKoneksi();
}
    public DefaultTableModel model = new DefaultTableModel();
    
    public void simpan(String id_MDistributor, String nama_Distributor, String alamat, String no_telp)throws SQLException{
        String sql = "INSERT INTO tbl_mdistributor VALUES ('"+id_MDistributor+"','"+nama_Distributor+"','"+alamat+"','"+no_telp+"')";
        st.executeUpdate(sql);
    }
    
    public void hapus(String id_MDistributor)throws SQLException{
        String sql = "DELETE FROM tbl_mdistributor WHERE id_MDistributor = '"+id_MDistributor+"'";
        st.executeUpdate(sql);
    }
    
    public void edit(String id_MDistributor, String nama_Distributor, String alamat, String no_telp)throws SQLException{
        String sql = "UPDATE tbl_mdistributor SET nama = '"+nama_Distributor+", alamat = '"+alamat+
                "', no_telp = '"+no_telp+"' WHERE id_MDistributor = '"+id_MDistributor+"'";
        st.executeUpdate(sql);
    }
    
    public void tampil(){
        try{
        String sql = "SELECT * FROM tbl_mdistributor";
        String[] kolom = {"ID Supplier", "Nama Supplier", "Alamat Supplier", "Nomor Telepon Supplier"};
        model.setColumnIdentifiers(kolom);
        rs = st.executeQuery(sql);
        while(rs.next()){
            Object[] data = new Object[4];
            data[0] = rs.getString("id_MDistributor");
            data[1] = rs.getString("nama_Distributor");
            data[2] = rs.getString("alamat");
            data[3] = rs.getString("no_telp");
            
            model.addRow(data);
        }
        }catch (SQLException ex){
            Logger.getLogger(control_supplier.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
