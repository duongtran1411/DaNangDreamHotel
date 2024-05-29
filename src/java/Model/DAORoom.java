package Model;

import Entity.ImageRoom;
import Entity.Room;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAORoom extends DBConnect {

    public List<Room> getRoomByTypeRoomId(int typeRoomId) {
        List<Room> list = new ArrayList();
        String sql = "select r.*, i.image from room r\n"
                + "join typeroom t on t.type_Room_Id = r.type_Room_Id\n"
                + "join imageroom i on i.room_Id = r.room_Id\n"
                + "where t.type_Room_Id = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, typeRoomId);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Room(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getString(10)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void editTypeRoom(int id, String name, int eventId, String bed, String bath, String people, String image) {
        String sql = "UPDATE typeroom\n"
                + "   SET name = ?,\n"
                + "       event_Id = ?,\n"
                + "       bed = ?,\n"
                + "       bath = ?,\n"
                + "       people = ?,\n"
                + "       image = ?\n"
                + " WHERE type_Room_Id = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, name);
            pre.setInt(2, eventId);
            pre.setString(3, bed);
            pre.setString(4, bath);
            pre.setString(5, people);
            pre.setString(6, image);
            pre.setInt(7, id);
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOTypeRoom.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        DAORoom dao = new DAORoom();
        dao.editTypeRoom(1, "b", 2, "asdasd", "c", "e", "f");
    }
}
