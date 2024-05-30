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

    public List<Room> getNewRoom() {
        List<Room> list = new ArrayList<>();
        String sql = "with roomDetail as (\n"
                + "	select r.room_Id, r.name, r.price, r.size, t.bed, t.bath , t.people, i.image ,\n"
                + "    ROW_NUMBER() OVER (PARTITION BY r.room_Id ORDER BY r.room_Id desc) AS rn from room r\n"
                + "	join typeroom t on t.typeRoom_Id = r.type_Room_Id\n"
                + "	join imageroom i on i.room_Id = r.room_Id\n"
                + "\n"
                + ")\n"
                + "select room_Id, name, price, size, bed, bath, people, image from roomDetail \n"
                + "where rn = 2\n"
                + "order by room_Id desc\n"
                + "limit 4;";
        try {
            PreparedStatement pre = conn.prepareCall(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Room(rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Room getRoomById(int id) {
        Room room = new Room();
        String sql = "select r.room_Id, r.name, r.price, r.size,t.bed, t.bath, t.people from room r\n"
                + "join typeroom t on t.typeRoom_Id = r.type_Room_Id\n"
                + "where r.room_Id = ?";
        try {
            PreparedStatement pre = conn.prepareCall(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                return new Room(rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public List<Room> searchRoomByText(String txt){
        List<Room> list = new ArrayList<>();
        String sql = "with roomDetail as (\n" +
"		select r.room_Id, r.name, r.price, r.size, t.bed, t.bath , t.people, i.image ,\n" +
"		ROW_NUMBER() OVER (PARTITION BY r.room_Id ORDER BY r.room_Id desc) AS rn from room r\n" +
"		join typeroom t on t.typeRoom_Id = r.type_Room_Id\n" +
"		join imageroom i on i.room_Id = r.room_Id)\n" +
"		select room_Id, name, price, size, bed, bath, people, image from roomDetail \n" +
"		where name like ? and rn = 2" ;
        try {
            PreparedStatement pre = conn.prepareCall(sql);
            pre.setString(1, "%"+txt+"%");
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {                
                list.add(new Room(rs.getInt(1), 
                        rs.getString(2), 
                       rs.getDouble(3),
                       rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public List<Room> getTop3Room() {
        List<Room> list = new ArrayList<>();
        String sql = "with roomDetail as (\n"
                + "		select r.room_Id, r.name, r.price, r.size, t.bed, t.bath , t.people, i.image ,\n"
                + "		ROW_NUMBER() OVER (PARTITION BY r.room_Id ORDER BY r.room_Id desc) AS rn from room r\n"
                + "		join typeroom t on t.typeRoom_Id = r.type_Room_Id\n"
                + "		join imageroom i on i.room_Id = r.room_Id)\n"
                + "		select room_Id, name, price, size, bed, bath, people, image from roomDetail \n"
                + "		where rn = 2\n"
                + "        limit 3";

        try {
            PreparedStatement pre = conn.prepareCall(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Room(rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    
    public List<Room> getNext3Room(int numberRoom) {
        List<Room> list = new ArrayList<>();
        String sql = "with roomDetail as (\n"
                + "		select r.room_Id, r.name, r.price, r.size, t.bed, t.bath , t.people, i.image ,\n"
                + "		ROW_NUMBER() OVER (PARTITION BY r.room_Id ORDER BY r.room_Id desc) AS rn from room r\n"
                + "		join typeroom t on t.typeRoom_Id = r.type_Room_Id\n"
                + "		join imageroom i on i.room_Id = r.room_Id)\n"
                + "		select room_Id, name, price, size, bed, bath, people, image from roomDetail \n"
                + "		where rn = 2\n"
                + "        limit 3 offset ?";

        try {
            PreparedStatement pre = conn.prepareCall(sql);
            pre.setInt(1, numberRoom);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Room(rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }


    public static void main(String[] args) {
        DAORoom dao = new DAORoom();
        List<Room> list = dao.searchRoomByText("F");
        for (Room room : list) {
            System.out.println(room);
        }

//        Room room = dao.getRoomById(18);
//        System.out.println(room);
    }

}
