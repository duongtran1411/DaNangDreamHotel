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

    public void addFeedBack(int id, String text, String type) {
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

    public List<FeedBack> getFeedBackShow() {
        List<FeedBack> list = new ArrayList<>();
        String sql = "select f.feedback_Id, c.firstName, c.lastName, f.content from feedback f\n"
                + "join customer c on f.customer_Id = c.customer_Id\n"
                + "where f.status = 1";
        try {
            PreparedStatement pre = conn.prepareCall(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new FeedBack(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOFeedBack.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<FeedBack> getAllFeedBack() {
        List<FeedBack> list = new ArrayList<>();
        String sql = "select f.feedback_Id, c.firstName, c.lastName, f.content, f.status, f.type from feedback f\n"
                + "join customer c on f.customer_Id = c.customer_Id";
        try {
            PreparedStatement pre = conn.prepareCall(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new FeedBack(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOFeedBack.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void updateStatus(int id, int status ) {
        String sql = "update feedback\n"
                + "set status = ?\n"
                + "where feedback_Id = ?";
        try {
            PreparedStatement pre = conn.prepareCall(sql);
            pre.setInt(1, status);
            pre.setInt(2, id);
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOFeedBack.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static void main(String[] args) {
        DAOFeedBack dao = new DAOFeedBack();
        dao.updateStatus(2, 1);
        List<FeedBack> list = dao.getAllFeedBack();
        for (FeedBack feedBack : list) {
            System.out.println(feedBack);
        }
    }
}
