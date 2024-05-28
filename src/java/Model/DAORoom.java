package Model;

import Entity.Room;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAORoom extends DBConnect {

    public List<Room> getAllRoom() {
        List<Room> list = new ArrayList<>();
        String sql = "select * "
                + "from room";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Room(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4) , rs.getString(5), rs.getString(6), rs.getString(7), rs.getDouble(8), rs.getString(9), rs.getString(10), rs.getString(11)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public List<Room> getAllTypeRoom() {
        List<Room> list = new ArrayList<>();
        String sql = "select distinct people, bed, bath from room \n"
                + "join typeRoom  on typeRoom_Id = type_Room_Id";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Room(rs.getString(1), rs.getString(2), rs.getString(3)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public static void main(String[] args) {
        DAORoom dao = new DAORoom();
        List<Room> list = dao.getAllTypeRoom();
        for (Room room : list) {
            System.out.println(room);
        }
    }
}
