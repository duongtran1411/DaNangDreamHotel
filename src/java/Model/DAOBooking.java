package Model;

import Entity.Booking;
import Entity.Customer;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOBooking extends DBConnect {

    public List<Booking> getAllBooking() {
        List<Booking> list = new ArrayList();
        String sql = "SELECT \n"
                + "    b.booking_Id, \n"
                + "    DATE_FORMAT(b.checkIn, '%m/%d/%Y') AS formatted_checkIn, \n"
                + "    DATE_FORMAT(b.checkOut, '%m/%d/%Y') AS formatted_checkOut,\n"
                + "    b.expenses, \n"
                + "    b.created_at, \n"
                + "    c.idCard\n"
                + "FROM booking b\n"
                + "JOIN customer c ON c.customer_Id = b.customer_Id;";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Booking(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Customer> getCustomerSameBooking(String rCode) {
        List<Customer> list = new ArrayList();
        String sql = "select * from customer c\n"
                + "left join booking b on c.customer_Id = b.customer_Id\n"
                + "where c.reservationCode = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, rCode);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Customer(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Booking> searchBookingByCID(String txtSearch) {
        List<Booking> list = new ArrayList<>();
        String sql = "SELECT b.booking_Id,"
                + " DATE_FORMAT(b.checkIn, '%m/%d/%Y') AS formatted_checkIn,"
                + " DATE_FORMAT(b.checkOut, '%m/%d/%Y') AS formatted_checkOut,"
                + " b.expenses, b.created_at, c.idCard \n"
                + "FROM customer c\n"
                + "LEFT JOIN booking b ON c.customer_Id = b.customer_Id\n"
                + "WHERE c.idCard LIKE ?\n"
                + "AND b.booking_Id IS NOT NULL\n"
                + "AND b.checkIn IS NOT NULL\n"
                + "AND b.checkOut IS NOT NULL\n"
                + "AND b.expenses IS NOT NULL\n"
                + "AND b.created_at IS NOT NULL;";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, "%" + txtSearch + "%");
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Booking(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public static void main(String[] args) {
        DAOBooking dao = new DAOBooking();
        System.out.println(dao.searchBookingByCID("123123123123"));
    }
}
