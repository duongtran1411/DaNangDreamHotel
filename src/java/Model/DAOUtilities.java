/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Entity.Utilities;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC QUANG MINH
 */
public class DAOUtilities extends DBConnect {
    
    public List<Utilities> getAllUtilities() {
        List<Utilities> list = new ArrayList<>();
        String sql = "select * from Utilities where is_deleted=false ;";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Utilities u = new Utilities();
                u.setUtilities_Id(rs.getInt("utilities_Id"));
                u.setImage(rs.getString("image"));
                u.setName(rs.getString("name"));
                u.setDescription(rs.getString("description"));
                u.setTime(rs.getString("time"));
                u.setLocation(rs.getString("location"));
                list.add(u);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOAccount.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return list;
    }
    
    public Utilities getUtilitiesById(int id) {
        String sql = "select * from Utilities where utilities_Id=?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Utilities u = new Utilities();
                u.setUtilities_Id(rs.getInt("utilities_Id"));
                u.setImage(rs.getString("image"));
                u.setName(rs.getString("name"));
                u.setDescription(rs.getString("description"));
                u.setTime(rs.getString("time"));
                u.setLocation(rs.getString("location"));
                return u;
            }
        } catch (SQLException e) {
            e.getStackTrace();
        }
        return null;
        
    }
    
    public void editUtilities(String name, String description, String time, String location, int utilities_Id) {
        String sql = "update utilities\n"
                + "                               set name=?,\n"
                + "                              description=?,\n"
                + "                              time=?,\n"
                + "                              location=?\n"
                + "                                where utilities_Id=?;";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, description);
            st.setString(3, time);
            st.setString(4, location);
            st.setInt(5, utilities_Id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.getStackTrace();
        }
    }
    
    public void deleteUtilitiesById(int id) {
        String sql = "UPDATE Utilities SET is_deleted = ? WHERE Utilities_Id = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setBoolean(1, true);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void insertUtilities(String name, String image, String description, String time, String location, int utilities_Id) {
        String sql = "INSERT INTO utilities (utilities_Id,name,image,description,time,location) "
                + "VALUES (?, ?, ?, ?,?,?)";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, utilities_Id);
            st.setString(2, name);
            st.setString(3, image);
            st.setString(4, description);
            st.setString(5, time);
            st.setString(6 ,location);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public Utilities getLastUtilities() {
        String sql = "select * from utilities\n"
                + "order by utilities_Id desc\n"
                + "limit 1;";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {  // Use if instead of while since we expect only one result
                return new Utilities(rs.getInt("utilities_Id"), rs.getString("name"), rs.getString("image"), rs.getString("description"), rs.getString("time"), rs.getString("location"));
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Print stack trace for better error understanding
        }
        return null;  // Return null if no account is found
    }
    
    public List<Utilities> getTop3Utilities() {
        List<Utilities> list = new ArrayList<>();
        String sql = "select * from Utilities";

        try {
            PreparedStatement pre = conn.prepareCall(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                   Utilities u = new Utilities();
                u.setUtilities_Id(rs.getInt("utilities_Id"));
                u.setImage(rs.getString("image"));
                u.setName(rs.getString("name"));
                u.setDescription(rs.getString("description"));
                u.setTime(rs.getString("time"));
                u.setLocation(rs.getString("location"));
                list.add(u);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOEvent.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }
    
    public static void main(String[] args) {
        DAOUtilities dao = new DAOUtilities();
        List<Utilities> list = dao.getTop3Utilities();
        for (Utilities o : list) {
            System.out.println(o);
        }
    }
}
