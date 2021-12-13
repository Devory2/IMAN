/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import gui.Kasir;
import java.sql.SQLException;
import java.util.logging.Logger;
import java.util.logging.Level;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author leova
 */
public class control_transaksi extends koneksi{
    public control_transaksi(){
        super.setKoneksi();
    }
    
    public DefaultTableModel model = new DefaultTableModel();
    public void tampilPengeluaran(String kodebarang, String namabarang, int harga, int jumlah, int total){
        String sql = "SELECT * FROM tbl_transaksi JOIN tbl_barang ON tbl_transaksi.id_barang=tbl_barang.id_barang";
        String[] kolom = {"kode barang", "nama barang","harga","jumlah","total"};
        model.setColumnIdentifiers(kolom);
        if(!(kodebarang.equals(""))){
            Object[] data = new Object[5];
                    data[0]=kodebarang;
                    data[1]=namabarang;
                    data[2]=harga;
                    data[3]=jumlah;
                    data[4]=total;
                    model.addRow(data);
        }
    }
    
    public void insertbarang(String id_transaksi,String id_barang,int harga_jual,int jml_barang,int total)throws SQLException{
        String sql = "INSERT INTO tbl_transaksi VALUES('"+id_transaksi+"','"+id_barang+"','"+jml_barang+"','"+total+"')";
        String sqll = "INSERT INTO tbl_barang VALUES ('"+id_barang+"','"+harga_jual+"')";
        st.executeUpdate(sql);
        st.executeUpdate(sqll);
    }
    
    public void updatestok(int stok_barang, String id_barang)throws SQLException{
        String sql = "UPDATE tbl_barang SET stok_barang = '"+stok_barang+"'WHERE id_barang = '"+id_barang+"'";
        st.executeUpdate(sql);
    }
}
