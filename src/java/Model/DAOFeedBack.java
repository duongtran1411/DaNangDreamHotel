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

    public void addFeedBack(String text) {
        String sql = "INSERT INTO `managerhotel`.`feedback`\n"
                + "(`content`)\n"
                + "VALUES\n"
                + "(?)";
        try {
            PreparedStatement pre = conn.prepareCall(sql);
            pre.setString(1, text);
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
        List<FeedBack> list = dao.getAllFeedBack();
        for (FeedBack feedBack : list) {
            System.out.println(feedBack);
        }
    }
}
