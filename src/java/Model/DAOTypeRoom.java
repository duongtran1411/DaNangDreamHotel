package Model;

import Entity.TypeRoom;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Pattern;

public class DAOTypeRoom extends DBConnect {

    public List<TypeRoom> getAllTypeRoom() {
        List<TypeRoom> list = new ArrayList<>();
        String sql = "select * "
                + "from typeroom";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new TypeRoom(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOTypeRoom.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public void addTypeRoom(String name, int bed, int bath, int person, String img) {
        String sql = "INSERT INTO `managerhotel`.`typeroom`\n"
                + "(`name`,\n"
                + "`bed`,\n"
                + "`bath`,\n"
                + "`person`,\n"
                + "`image`)\n"
                + "VALUES\n"
                + "(?,?,?,?,?);";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, name);
            pre.setInt(2, bed);
            pre.setInt(3, bath);
            pre.setInt(4, person);
            pre.setString(5, img);
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOTypeRoom.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public TypeRoom getTypeRoomByID(int trid) {
        String sql = "SELECT * FROM typeroom WHERE typeRoom_Id = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, trid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                return new TypeRoom(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOTypeRoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void editTypeRoom(int id, String name, int eventId, int bed, int bath, int person, String image) {
        String sql = "UPDATE typeroom\n"
                + "   SET name = ?,\n"
                + "       event_Id = ?,\n"
                + "       bed = ?,\n"
                + "       bath = ?,\n"
                + "       person = ?,\n"
                + "       image = ?\n"
                + " WHERE typeRoom_Id = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, name);
            pre.setInt(2, eventId);
            pre.setInt(3, bed);
            pre.setInt(4, bath);
            pre.setInt(5, person);
            pre.setString(6, image);
            pre.setInt(7, id);
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOTypeRoom.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean deleteTypeRoom(int trid) {
        String sql = "DELETE FROM typeroom WHERE typeRoom_Id = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, trid);
            int affectedRows = pre.executeUpdate();
            return affectedRows > 0; // Return true if one or more rows were deleted
        }catch (Exception e) {
            Logger.getLogger(DAOTypeRoom.class.getName()).log(Level.SEVERE, "Cannot delete type room due to foreign key constraint", e);
            return false; // Return false if there is a foreign key constraint violation
        }        
    }

    public boolean isValidName(String name) {
        if (name == null || name.isEmpty()) {
            return false;
        }

        // Kiểm tra xem tên không chứa số
        if (name.matches(".*\\d.*")) {
            return false;
        }

        // Kiểm tra xem tên không chứa ký tự đặc biệt
        if (!Pattern.matches("[a-zA-Z\\s]+", name)) {
            return false;
        }

        // Kiểm tra xem ký tự đầu tiên có viết hoa không
        if (!Character.isUpperCase(name.charAt(0))) {
            return false;
        }

        // Kiểm tra khoảng trắng ở đầu và cuối tên
        if (name.trim().length() != name.length()) {
            return false;
        }

        return true;
    }

    public List<TypeRoom> getNameTypeRoom() {
        List<TypeRoom> list = new ArrayList<>();
        String sql = "select * from typeroom";
        try {
            PreparedStatement pre = conn.prepareCall(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new TypeRoom(rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOTypeRoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public TypeRoom getTypeRoomById(int trid) {
        String sql = "SELECT * FROM typeroom WHERE typeRoom_Id = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, trid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                return new TypeRoom(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOTypeRoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static void main(String[] args) {
        DAOTypeRoom dao = new DAOTypeRoom();
        dao.deleteTypeRoom(4);
    }
}
