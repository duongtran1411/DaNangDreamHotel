package Model;

import Entity.Booking;
import Entity.Customer;
import Entity.Room;

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
                + "   c.customer_Id,"
                + "   b.status "
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
                        rs.getInt("customer_Id"),
                        rs.getString("status")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void addCustomerAndBooking(String firstName, String lastName, String phoneNumber, String email, String idCard,
            String checkIn, String checkOut, int expenses, List<Integer> roomIds) {
        String insertCustomerSql = "INSERT INTO customer (firstName, lastName, phone, email, idCard) VALUES (?, ?, ?, ?, ?)";
        String insertBookingSql = "INSERT INTO booking (customer_Id, checkIn, checkOut, expenses, created_at) VALUES (?, ?, ?, ?, NOW())";
        String updateCustomerSql = "UPDATE customer SET reservationCode = ? WHERE customer_Id = ?";
        String insertBookingDetailSql = "INSERT INTO bookingdetail (room_Id, booking_Id) VALUES (?, ?)";

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
            PreparedStatement insertBookingStmt = conn.prepareStatement(insertBookingSql, Statement.RETURN_GENERATED_KEYS);
            insertBookingStmt.setInt(1, customerId);
            insertBookingStmt.setString(2, checkIn);
            insertBookingStmt.setString(3, checkOut);
            insertBookingStmt.setInt(4, expenses);
            insertBookingStmt.executeUpdate();

            // Lấy giá trị booking_Id tự tăng vừa chèn
            ResultSet bookingKeys = insertBookingStmt.getGeneratedKeys();
            int bookingId = -1;
            if (bookingKeys.next()) {
                bookingId = bookingKeys.getInt(1);
            }

            // Thực hiện cập nhật reservationCode cho customer
            PreparedStatement updateCustomerStmt = conn.prepareStatement(updateCustomerSql);
            updateCustomerStmt.setInt(1, bookingId); // Đặt reservationCode bằng bookingId
            updateCustomerStmt.setInt(2, customerId);
            updateCustomerStmt.executeUpdate();

            // Thêm vào bookingdetail
            PreparedStatement insertBookingDetailStmt = conn.prepareStatement(insertBookingDetailSql);
            for (int roomId : roomIds) {
                insertBookingDetailStmt.setInt(1, roomId);
                insertBookingDetailStmt.setInt(2, bookingId);
                insertBookingDetailStmt.executeUpdate();
            }

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

    public void updateBooking(int id, String checkIn, String checkOut, double dailyRate) {
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date checkInDate = dateFormat.parse(checkIn);
            Date checkOutDate = dateFormat.parse(checkOut);

            long timeDifference = checkOutDate.getTime() - checkInDate.getTime();
            long daysDifference = timeDifference / (1000 * 3600 * 24);

            double newExpenses = daysDifference * dailyRate;

            String sql = "UPDATE booking "
                    + "SET checkIn=STR_TO_DATE(?, '%Y-%m-%d'), checkOut=STR_TO_DATE(?, '%Y-%m-%d'), expenses=? "
                    + "WHERE booking_Id=?;";

            try ( PreparedStatement pre = conn.prepareStatement(sql)) {
                pre.setString(1, checkIn);
                pre.setString(2, checkOut);
                pre.setDouble(3, newExpenses);
                pre.setInt(4, id);
                pre.executeUpdate();
            } catch (SQLException e) {
                System.out.println("Error updating booking: " + e.getMessage());
            }
        } catch (ParseException e) {
            System.out.println("Error parsing dates: " + e.getMessage());
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

    public void updateBookingStatus(int bookingId, String status) {
        String sql = "UPDATE booking SET status = ? WHERE booking_Id = ?";

        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, status);
            pre.setInt(2, bookingId);
            pre.execute();
        } catch (SQLException e) {
            System.out.println("Error at Update Status Booking " + e.getMessage());
        }
    }

    public List<Room> getRoomsByBookingId(int id) {
        List<Room> list = new ArrayList();
        String sql = "SELECT r.room_Id, r.type_Room_Id, r.floor_Room_Id, r.name, r.price, r.status, r.created_at, r.updated_at, r.size\n"
                + "FROM managerhotel.room r\n"
                + "JOIN managerhotel.bookingdetail bd ON r.room_Id = bd.room_Id\n"
                + "WHERE bd.booking_Id = ?;";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Room(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getLiveBookingDetailId(int roomId) {
        int bookingDetailId = 0;
        String sql = "SELECT bd.bookingDetail_Id\n"
                + "FROM bookingdetail bd\n"
                + "JOIN booking b ON bd.booking_Id = b.booking_Id\n"
                + "WHERE bd.room_Id = ?\n"
                + "AND CURDATE() BETWEEN b.checkIn AND b.checkOut";

        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, roomId);
            ResultSet rs = pre.executeQuery();

            if (rs.next()) {
                bookingDetailId = rs.getInt("bookingDetail_Id");
            }

            rs.close();
            pre.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }

        return bookingDetailId;
    }

    public void insert(int ex, int id) {
        String sql = "INSERT INTO servicepayment (extramoney, bookingDetail_Id) VALUES (?, ?)";

        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, ex);   
            pre.setInt(2, id);         

            pre.executeUpdate();     

            pre.close();
        } catch (SQLException e) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public static void main(String[] args) {
        DAOBooking dao = new DAOBooking();
        //Room r = dao.getLiveBookingDetailId()
    }
}
