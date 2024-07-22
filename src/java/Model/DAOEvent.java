/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Entity.Event;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author GIGABYTE
 */
public class DAOEvent extends DBConnect {

    public List<Event> getAllEvents() {
        List<Event> list = new ArrayList<>();
        String sql = "select * from event where is_deleted=false;";

        try {
            PreparedStatement pre = conn.prepareCall(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Event(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDate(4),
                        rs.getDate(5),
                        rs.getString(6),
                        rs.getDouble(7),
                        rs.getString(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOEvent.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }
    
    public List<Event> getAllEvent() {
        List<Event> list = new ArrayList<>();
        String sql = "select * from event";

        try {
            PreparedStatement pre = conn.prepareCall(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Event(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDate(4),
                        rs.getDate(5),
                        rs.getString(6),
                        rs.getDouble(7),
                        rs.getString(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOEvent.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public Event getEventById(int Id) {
        Event event = new Event();
        String sql = "select * from event where event_Id = ?";
        try {
            PreparedStatement pre = conn.prepareCall(sql);
            pre.setInt(1, Id);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                return new Event(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDate(4),
                        rs.getDate(5),
                        rs.getString(6),
                        rs.getDouble(7),
                        rs.getString(8));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOEvent.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Event> getTop3Event() {
        List<Event> list = new ArrayList<>();
        String sql = "select * from event limit 3";

        try {
            PreparedStatement pre = conn.prepareCall(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Event(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDate(4),
                        rs.getDate(5),
                        rs.getString(6),
                        rs.getDouble(7),
                        rs.getString(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOEvent.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public List<Event> getImageEvent() {
        List<Event> list = new ArrayList<>();
        String sql = "select e.name, e.image, e.event_Id from Event e \n"
                + "join typeroom t on t.event_Id = e.event_Id ";
        PreparedStatement pre;
        try {
            pre = conn.prepareCall(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Event(rs.getString(1),
                rs.getString(2),
                rs.getInt(3)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOEvent.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public Event getImageByEvent(int id) {
        
        String sql = "select name, image from Event e \n"
                + "where event_Id = ? ";
        PreparedStatement pre;
        try {
            pre = conn.prepareCall(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
              return new Event(rs.getString(1),
                rs.getString(2));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOEvent.class.getName()).log(Level.SEVERE, null, ex);
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
      public void markEventAsDeleted(int id) {
        String sql = "UPDATE Event SET is_deleted = ? WHERE event_Id = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setBoolean(1, true);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
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
        Event list = dao.getImageByEvent(1);
        System.out.println(list);
    }
}
