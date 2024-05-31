package Model;

import Entity.ImageRoom;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOImageRoom extends DBConnect {

    public List<ImageRoom> getImageByRoomId(int roomId) {
        List<ImageRoom> list = new ArrayList();
        String sql = "select r.name, i.image from imageroom i\n"
                + "join room r on r.room_Id = i.room_Id\n"
                + "where r.room_Id = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, roomId);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new ImageRoom(rs.getString(1), rs.getString(2)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOImageRoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public static void main(String[] args) {
        DAOImageRoom dao = new DAOImageRoom();
        List<ImageRoom> list = dao.getImageByRoomId(1);
        System.out.println(list);
    }
}
