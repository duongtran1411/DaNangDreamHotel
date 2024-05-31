/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Entity.Event;
import Entity.Room;
import Model.DBConnect;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOEvent extends DBConnect {
    
    public List<Event> getAllEvent() {
        List<Event> list = new ArrayList<>();
        String sql = "select * "
                + "from event";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Event(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getDate(4), rs.getDate(5),
                        rs.getString(6), rs.getDouble(7), rs.getString(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return list;
    }
    
    public Event getEventbyID(int id) {
        String sql = "select * from event\n"
                + "where event_Id=?;";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Event e = new Event();
                e.setEvent_Id(rs.getInt("event_Id"));
                e.setName(rs.getString("name"));
                e.setImage(rs.getString("image"));
                e.setStartDay(rs.getDate("startDay"));
                e.setEndDay(rs.getDate("endDay"));
                e.setDescription(rs.getString("description"));
                e.setDiscount(rs.getDouble("discount"));
                e.setVoucher(rs.getString("voucher"));
                return e;
            }
        } catch (SQLException e) {
            e.getStackTrace();
        }
        return null;
    }
    
    public void editEvent(String name, String image, Date start, Date end, String description, double discount, String voucher, int event_Id) {
        String sql = "update event\n"
                + "set\n"
                + "name =?,\n"
                + "image =?,\n"
                + "startDay=?, \n"
                + "endDay =?,\n"
                + "description=?,  \n"
                + "discount =?,\n"
                + "voucher =?\n"
                + "where event_Id=?;";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, image);
            st.setDate(3, (java.sql.Date) start);
            st.setDate(4, (java.sql.Date) end);
            st.setString(5, description);
            st.setDouble(6, discount);
            st.setString(7, voucher);
            st.setInt(8, event_Id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.getStackTrace();
        }
    }
    
    public void deleteEventByID(int id) {
        String sql = "delete from Event where event_Id=?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.getStackTrace();
        }
    }
    
    public void insertEvent(int event_Id, String name, String image, Date start, Date end, String description, double discount, String voucher) {
        String sql = "insert into Event(event_Id ,\n"
                + "name ,\n"
                + "image , \n"
                + "startDay ,\n"
                + "endDay ,\n"
                + "description ,\n"
                + "discount ,\n"
                + "voucher)\n"
                + "values(?,?,?,?,?,?,?,?);";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, event_Id);
            st.setString(2, name);
            st.setString(3, image);
            st.setDate(4, (java.sql.Date) start);
            st.setDate(5, (java.sql.Date) end);
            st.setString(6, description);
            st.setDouble(7, discount);
            st.setString(8, voucher);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public Event getLastEvent() {
        String sql = "SELECT *\n"
                + "                FROM Event e\n"
                + "                ORDER BY event_Id DESC\n"
                + "                LIMIT 1";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {  // Use if instead of while since we expect only one result
                return new Event(rs.getInt("event_Id"),
                        rs.getString("name"),
                        rs.getString("image"), rs.getDate("startDay"), rs.getDate("endDay"),
                        rs.getString("description"),
                        rs.getDouble("discount"), rs.getString("voucher")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Print stack trace for better error understanding
        }
        return null;  // Return null if no account is found
    }
    
    public static void main(String[] args) {
        DAOEvent dao = new DAOEvent();
       Event e=dao.getLastEvent();
        System.out.println(e);
    }
}
