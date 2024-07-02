/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Entity.Booking;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author CaoTung
 */
public class DAOBooking extends DBConnect {

    public List<Booking> getAllBooking() {
        List<Booking> list = new ArrayList();
        String sql = "select * from booking\n"
                + "join customer c \n"
                + "where booking.customer_Id = c.customer_Id";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Booking(rs.getInt("booking_Id"),
                        rs.getInt("customer_Id"),
                        rs.getDate("startDay"),
                        rs.getDate("endDay"),
                        rs.getDouble("expenses"),
                        rs.getDate("created_At"),
                        rs.getString("firstName"),
                        rs.getString("lastName")
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOBooking.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Booking> getBookingsWithPagin(int currentPage, int itemsPerPage) {
        List<Booking> list = new ArrayList();
        int startIndex = (currentPage - 1) * itemsPerPage;
        String sql = "SELECT *\n"
                + "FROM booking\n"
                + "JOIN customer c ON booking.customer_Id = c.customer_Id\n"
                + "ORDER BY booking.booking_Id\n"
                + "LIMIT ? OFFSET ?;";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);

            pre.setInt(1, itemsPerPage);
            pre.setInt(2, startIndex);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
              list.add(new Booking(rs.getInt("booking_Id"),
                        rs.getInt("customer_Id"),
                        rs.getDate("startDay"),
                        rs.getDate("endDay"),
                        rs.getDouble("expenses"),
                        rs.getDate("created_At"),
                        rs.getString("firstName"),
                        rs.getString("lastName")
                      ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOBooking.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getTotalBooking() {
        String sql = "select count(booking_Id) "
                + "from booking";
        int totalBookings = 0;
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                totalBookings = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOBooking.class.getName()).log(Level.SEVERE, null, ex);
        }
        return totalBookings;
    }
    public void deleteBooking(int id) {
        String sql = "delete from booking "
                + "where booking_Id= ? ";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, id);
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOBooking.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void deleteBookingDetail(int id) {
        String sql = "delete from bookingdetail "
                + "where booking_Id= ? ";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, id);
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOBooking.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
     public Booking getBookingById(int id) {
        Booking bo = new Booking();
        String sql = "select * from booking "
                + "where booking_Id = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                bo.setBookingId(rs.getInt(1));
                bo.setCustomerId(rs.getInt(2));
                bo.setStartDay(rs.getDate(3));
                bo.setEndDay(rs.getDate(4));
                bo.setExpenses(rs.getDouble(5));
                bo.setCreatedAt(rs.getDate(6));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOTypeItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bo;
    }
    public static void main(String[] args) {
        DAOBooking dao = new DAOBooking();
        List<Booking> list = dao.getBookingsWithPagin(1,1);
        int x = dao.getTotalBooking();
        System.out.println(x);
        for(Booking k : list){
            System.out.println(k);
        }
    }
}
