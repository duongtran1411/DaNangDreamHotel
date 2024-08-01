/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;
import Entity.ServicePayment;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author GIGABYTE
 */
public class DAOPayment extends DBConnect{
    public List<ServicePayment> getAllPayment (){
        List<ServicePayment> list = new ArrayList<>();
        String sql = "select * from servicepayment";
        try {
            PreparedStatement pre = conn.prepareCall(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {                
                list.add(new ServicePayment(rs.getInt(1), 
                        rs.getInt(2), 
                       rs.getInt(3)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOPayment.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public int getExtraMoney (int id){
        int total = 0;
        String sql = "select extramoney from servicepayment where bookingDetail_Id = ?";
        try {
            PreparedStatement pre = conn.prepareCall(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {                
                total = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOPayment.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }
    
    public static void main(String[] args) {
        DAOPayment dao = new DAOPayment();
        dao.getExtraMoney(19);
        System.out.println(dao.getExtraMoney(19));
    }
}
