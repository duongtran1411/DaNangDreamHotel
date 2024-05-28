package Model;

import Entity.ImageRoom;
import Entity.Room;
import Entity.TypeRoom;
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
        String sql = "with roomDetail as (\n"
                + "	select r.room_Id, r.name, r.price, r.size, t.bed, t.bath , t.people, i.image ,\n"
                + "    ROW_NUMBER() OVER (PARTITION BY r.room_Id ORDER BY r.room_Id DESC) AS rn from room r\n"
                + "	join typeroom t on t.typeRoom_Id = r.type_Room_Id\n"
                + "	join imageroom i on i.room_Id = r.room_Id\n"
                + "\n"
                + ")\n"
                + "select room_Id, name, price, size, bed, bath, people, image from roomDetail \n"
                + "where rn = 1\n"
                + "order by room_Id desc\n"
                + "limit 4;";
        try {
            PreparedStatement pre = conn.prepareCall(sql);
            ResultSet rs = pre.executeQuery();
            while(rs.next()){
                list.add(new Room(rs.getInt(1),
                       rs.getString(2),
                       rs.getDouble(3),
                       rs.getInt(4),
                       new TypeRoom(rs.getString(5),
                              rs.getString(6),
                              rs.getString(7)),
                       new ImageRoom(rs.getString(8))));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public static void main(String[] args) {
        DAORoom dao = new DAORoom();
        List<Room> list = dao.getAllRoom();
        for (Room room : list) {
            System.out.println(room);
        }
    }

}
