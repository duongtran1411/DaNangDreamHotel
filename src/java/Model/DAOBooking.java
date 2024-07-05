package Model;

import Entity.Booking;
import Entity.Customer;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOBooking extends DBConnect {

    public List<Booking> getAllBooking() {
        List<Booking> list = new ArrayList<>();
        String sql = "SELECT "
                + "   b.booking_Id, "
                + "   b.checkIn, "
                + "   b.checkOut, "
                + "   b.expenses, "
                + "   b.created_at, "
                + "   c.idCard, "
                + "   c.customer_Id "
                + "FROM booking b "
                + "JOIN customer c ON c.customer_Id = b.customer_Id";

        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                // Parse dates directly from ResultSet
                Date checkIn = rs.getTimestamp("checkIn");
                Date checkOut = rs.getTimestamp("checkOut");

                list.add(new Booking(rs.getInt("booking_Id"),
                        new java.sql.Date(checkIn.getTime()),
                        new java.sql.Date(checkOut.getTime()),
                        rs.getInt("expenses"),
                        rs.getString("created_at"),
                        rs.getString("idCard"),
                        rs.getInt("customer_Id")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void addCustomerAndBooking(String firstName, String lastName, String phoneNumber, String email, String idCard,
            String checkIn, String checkOut, int expenses) {
        String insertCustomerSql = "INSERT INTO customer (firstName, lastName, phone, email, idCard) VALUES (?, ?, ?, ?, ?)";
        String insertBookingSql = "INSERT INTO booking (customer_Id, checkIn, checkOut, expenses, created_at) VALUES (?, ?, ?, ?, NOW())";
        String updateCustomerSql = "UPDATE customer SET reservationCode = ? WHERE customer_Id = ?";

        try {
            // Bắt đầu một transaction
            conn.setAutoCommit(false);

            // Thực hiện insert customer
            PreparedStatement insertCustomerStmt = conn.prepareStatement(insertCustomerSql, Statement.RETURN_GENERATED_KEYS);
            insertCustomerStmt.setString(1, firstName);
            insertCustomerStmt.setString(2, lastName);
            insertCustomerStmt.setString(3, phoneNumber);
            insertCustomerStmt.setString(4, email);
            insertCustomerStmt.setString(5, idCard);
            insertCustomerStmt.executeUpdate();

            // Lấy giá trị customer_Id tự tăng vừa chèn
            ResultSet rs = insertCustomerStmt.getGeneratedKeys();
            int customerId = -1;
            if (rs.next()) {
                customerId = rs.getInt(1);
            }

            // Thực hiện insert booking với customerId
            PreparedStatement insertBookingStmt = conn.prepareStatement(insertBookingSql);
            insertBookingStmt.setInt(1, customerId);
            insertBookingStmt.setString(2, checkIn);
            insertBookingStmt.setString(3, checkOut);
            insertBookingStmt.setInt(4, expenses);
            insertBookingStmt.executeUpdate();

            // Cập nhật reservationCode cho customer
            PreparedStatement updateCustomerStmt = conn.prepareStatement(updateCustomerSql);
            updateCustomerStmt.setInt(1, customerId);
            updateCustomerStmt.setInt(2, customerId);
            updateCustomerStmt.executeUpdate();

            // Commit transaction
            conn.commit();

        } catch (SQLException e) {
            try {
                // Rollback nếu có lỗi
                conn.rollback();
            } catch (SQLException rollbackEx) {
                System.out.println("Rollback failed! " + rollbackEx.getMessage());
            }
            System.out.println(e.getMessage());
        } finally {
            try {
                // Đặt lại auto commit về true sau khi hoàn thành
                conn.setAutoCommit(true);
            } catch (SQLException setAutoCommitEx) {
                System.out.println("Setting auto commit failed! " + setAutoCommitEx.getMessage());
            }
        }
    }

    public List<Customer> getCustomerSameBooking(int rCode) {
        List<Customer> list = new ArrayList();
        String sql = "select * from customer c\n"
                + "left join booking b on c.customer_Id = b.customer_Id\n"
                + "where c.reservationCode = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, rCode);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Customer(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void updateBooking(int id, String checkIn, String checkOut) {
        String sql = "UPDATE booking "
                + "SET checkIn=STR_TO_DATE(?, '%Y-%m-%d'), checkOut=STR_TO_DATE(?, '%Y-%m-%d') "
                + "WHERE booking_Id=?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, checkIn);
            pre.setString(2, checkOut);
            pre.setInt(3, id);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error updating booking: " + e.getMessage());
        }
    }

    public Booking getBookingById(int id) {
        Booking booking = new Booking();
        String sql = "select * from Booking "
                + "where booking_Id = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                booking.setBooking_Id(rs.getInt(1));
                booking.setCustomer_Id(rs.getInt(2));
                booking.setCheckIn(rs.getDate(3));
                booking.setCheckOut(rs.getDate(4));
                booking.setExpenses(rs.getInt(5));
                booking.setCreated_at(rs.getString(6));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return booking;
    }

    public static void main(String[] args) {
        DAOBooking dao = new DAOBooking();
    }
}
