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
public class Masterbarang extends koneksi{
    public Masterbarang(){
        super.setKoneksi();
    }
    public DefaultTableModel modelbarang = new DefaultTableModel();
    
    public void simpan(String id_barang, String nama_barang,int stok_barang, int harga_jual) throws SQLException{
        String sql = "INSERT INTO tbl_masterbarang VALUES('"+nama_barang+"')";
        String sqll = "INSERT INTO tbl_barang VALUES ('"+id_barang+"','"+stok_barang+"','"+harga_jual+"')";
        st.executeUpdate(sql);
        st.executeUpdate(sqll);
    }
    
    public void edit(String id_Mbarang,String id_barang, String nama_barang, int stok_barang, int harga_jual) throws SQLException{
        String sql = "UPDATE tbl_masterbarang SET nama_barang = '"+nama_barang+"' WHERE id_Mbarang = '"+id_Mbarang+"'";
        String sqll = "UPDATE tbl_barang SET stok_barang = '"+stok_barang+"',harga_jual='"+harga_jual+"' WHERE id_barang = '"+id_barang+"'";
        st.executeUpdate(sql);
        st.executeUpdate(sqll);
    }
 
    public void hapus(String id_barang, String id_Mbarang) throws SQLException{
        String sql = "DELETE FROM tbl_masterbarang WHERE id_Mbarang = '"+id_Mbarang+"'";
        String sqll = "DELETE FROM tbl_barang WHERE id_barang = '"+id_barang+"'";
        st.executeUpdate(sql);
        st.executeUpdate(sqll);
    }
    
    public void tampil() {
        try{
    String sqli = "SELECT * FROM tbl_masterbarang JOIN tbl_barang ON tbl_masterbarang.id_Mbarang = tbl_barang.id_Mbarang";
    String [] kolom = {"Kode Barang", "Nama Barang", "Stok", "Harga"};
    modelbarang.setColumnIdentifiers(kolom);
    rs = st.executeQuery(sqli);
    while(rs.next()){
        Object[]data = new Object[4];
        data[0] = rs.getString("id_barang");
        data[1] = rs.getString("nama_barang");
        data[2] = rs.getString("stok_barang");
        data[3] = rs.getString("harga_jual");
        
        modelbarang.addRow(data);
    }
}catch (SQLException ex) {
    Logger.getLogger(Masterbarang.class.getName()).log(Level.SEVERE, null, ex);
}
}
}