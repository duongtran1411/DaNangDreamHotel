/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;
import Entity.FeedBack;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author GIGABYTE
 */
public class DAOFeedBack extends DBConnect {

    public void addFeedBack(int id,String text,String type) {
        String sql = "INSERT INTO feedback (customer_Id, content, type) VALUES (?, ?, ?)";
        try {
            PreparedStatement pre = conn.prepareCall(sql);
            pre.setInt(1, id);
            pre.setString(2, text);
            pre.setString(3, type);
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOFeedBack.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public List<FeedBack> getAllFeedBack(){
        List<FeedBack> list = new ArrayList<>();
        String sql = "select content from feedback";
        try {
            PreparedStatement pre = conn.prepareCall(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {                
                list.add(new FeedBack(rs.getString(1)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOFeedBack.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public static void main(String[] args) {
        DAOFeedBack dao = new DAOFeedBack();
        dao.addFeedBack(2, "ok", "Comments");
    }
}
