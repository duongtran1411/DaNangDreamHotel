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
                list.add(new Room(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getDouble(5),
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

    public List<Room> getRoomByTypeRoomId(int typeRoomId) {
        List<Room> list = new ArrayList();
        String sql = "select distinct r.* from room r\n"
                + "join typeroom t on t.typeRoom_Id = r.type_Room_Id\n"
                + "where t.typeRoom_Id = ?";
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
                        rs.getInt(9)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void addRoom(String name, int floor, double price, int size, int typeRoom) {
        String sql = "INSERT INTO `managerhotel`.`room`\n"
                + "(`name`,\n"
                + "`floor_Room_Id`,\n"
                + "`price`,\n"
                + "`size`,\n"
                + "`typeRoom_Id`)\n"
                + "VALUES\n"
                + "(?,?,?,?,?);";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, name);
            pre.setInt(2, floor);
            pre.setDouble(3, price);
            pre.setInt(4, size);
            pre.setInt(5, typeRoom);
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Room getNameByRoomId(int roomId) {
        String sql = "select r.name from room r\n"
                + "where r.room_Id = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, roomId);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                return new Room(rs.getString(1));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void deleteRoom(int rid) {
        try {
            // Delete from item_in_room table
            String deleteItemInRoomSQL = "DELETE FROM item_in_room WHERE room_Id = ?";
            PreparedStatement deleteItemInRoomStmt = conn.prepareStatement(deleteItemInRoomSQL);
            deleteItemInRoomStmt.setInt(1, rid);
            deleteItemInRoomStmt.executeUpdate();

            // Delete from imageRoom table
            String deleteImageRoomSQL = "DELETE FROM imageRoom WHERE room_Id = ?";
            PreparedStatement deleteImageRoomStmt = conn.prepareStatement(deleteImageRoomSQL);
            deleteImageRoomStmt.setInt(1, rid);
            deleteImageRoomStmt.executeUpdate();

            // Delete from room table
            String deleteRoomSQL = "DELETE FROM room WHERE room_Id = ?";
            PreparedStatement deleteRoomStmt = conn.prepareStatement(deleteRoomSQL);
            deleteRoomStmt.setInt(1, rid);
            deleteRoomStmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editRoom(int trid, int floor, String name, double price, int size, int rid) {
        String sql = "UPDATE room\n"
                + "   SET type_Room_Id = ?,\n"
                + "       floor_Room_Id = ?,\n"
                + "       name = ?,\n"
                + "       price = ?,\n"
                + "       size = ?\n,"
                + "       updated_at = NOW()\n"
                + " WHERE room_Id = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, trid);
            pre.setInt(2, floor);
            pre.setString(3, name);
            pre.setDouble(4, price);
            pre.setInt(5, size);
            pre.setInt(6, rid);
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Room getRoomByID(int rid) {
        String sql = "select room_Id, type_Room_Id, floor_Room_Id, name, price, size from room\n"
                + "where room_Id = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, rid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                return new Room(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getDouble(5), rs.getInt(6));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOTypeRoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public List<Room> getNewRoom() {
        List<Room> list = new ArrayList<>();
        String sql = "with roomDetail as (\n"
                + "	select r.room_Id, r.name, r.price, r.size, t.bed, t.bath , t.person, i.image ,\n"
                + "    ROW_NUMBER() OVER (PARTITION BY r.room_Id ORDER BY r.room_Id desc) AS rn from room r\n"
                + "	join typeroom t on t.typeRoom_Id = r.type_Room_Id\n"
                + "	join imageroom i on i.room_Id = r.room_Id\n"
                + "\n"
                + ")\n"
                + "select room_Id, name, price, size, bed, bath, person, image from roomDetail \n"
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
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    

    public Room getRoomById(int id) {
        Room room = new Room();
        String sql = "select r.room_Id, r.name, r.price, r.size,t.bed, t.bath, t.person from room r\n"
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
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int countRoom() {
        String sql = "select count(*) from room";
        try {
            PreparedStatement pre = conn.prepareCall(sql);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<Room> searchRoomByText(String txt) {
        List<Room> list = new ArrayList<>();
        String sql = "with roomDetail as (\n"
                + "		select r.room_Id, r.name, r.price, r.size, t.bed, t.bath , t.person, i.image ,\n"
                + "		ROW_NUMBER() OVER (PARTITION BY r.room_Id ORDER BY r.room_Id desc) AS rn from room r\n"
                + "		join typeroom t on t.typeRoom_Id = r.type_Room_Id\n"
                + "		join imageroom i on i.room_Id = r.room_Id)\n"
                + "		select room_Id, name, price, size, bed, bath, person, image from roomDetail \n"
                + "		where name like ? and rn = 2";
        try {
            PreparedStatement pre = conn.prepareCall(sql);
            pre.setString(1, "%" + txt + "%");
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Room(rs.getInt(1),
                        rs.getString(2),
                       rs.getDouble(3), 
                       rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Room> getTop3Room(int numberRoom) {
        List<Room> list = new ArrayList<>();
        String sql = "with roomDetail as (\n"
                + "		select r.room_Id, r.name, r.price, r.size, t.bed, t.bath , t.person, i.image ,\n"
                + "		ROW_NUMBER() OVER (PARTITION BY r.room_Id ORDER BY r.room_Id desc) AS rn from room r\n"
                + "		join typeroom t on t.typeRoom_Id = r.type_Room_Id\n"
                + "		join imageroom i on i.room_Id = r.room_Id)\n"
                + "		select room_Id, name, price, size, bed, bath, person, image from roomDetail \n"
                + "		where rn = 2\n"
                + "        limit 6 offset ?";

        try {
            PreparedStatement pre = conn.prepareCall(sql);
            pre.setInt(1, numberRoom*6-6);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Room(rs.getInt(1),
                        rs.getString(2),
                       rs.getDouble(3), 
                       rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
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
                + "		select r.room_Id, r.name, r.price, r.size, t.bed, t.bath , t.person, i.image ,\n"
                + "		ROW_NUMBER() OVER (PARTITION BY r.room_Id ORDER BY r.room_Id desc) AS rn from room r\n"
                + "		join typeroom t on t.typeRoom_Id = r.type_Room_Id\n"
                + "		join imageroom i on i.room_Id = r.room_Id)\n"
                + "		select room_Id, name, price, size, bed, bath, person, image from roomDetail \n"
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
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Room> sortRoomByPrice(int sizeRoom, int numberRoom) {
        List<Room> list = new ArrayList<>();
        String sql = "with roomDetail as (\n"
                + "		select r.room_Id, r.name, r.price, r.size, t.bed, t.bath , t.person, i.image ,\n"
                + "		ROW_NUMBER() OVER (PARTITION BY r.room_Id ) AS rn from room r\n"
                + "		join typeroom t on t.typeRoom_Id = r.type_Room_Id\n"
                + "		join imageroom i on i.room_Id = r.room_Id)\n"
                + "		select room_Id, name, price, size, bed, bath, person, image from roomDetail \n"
                + "		where  rn = 2\n"
                + "        order by price asc\n"
                + "		 limit ? offset ? ";
        try {
            PreparedStatement pre = conn.prepareCall(sql);
            pre.setInt(1, sizeRoom);
            pre.setInt(2, numberRoom);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Room(rs.getInt(1),
                        rs.getString(2),
                       rs.getDouble(3), 
                       rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Room> sortRoomByPriceDown(int sizeRoom, int numberRoom) {
        List<Room> list = new ArrayList<>();
        String sql = "with roomDetail as (\n"
                + "		select r.room_Id, r.name, r.price, r.size, t.bed, t.bath , t.person, i.image ,\n"
                + "		ROW_NUMBER() OVER (PARTITION BY r.room_Id ) AS rn from room r\n"
                + "		join typeroom t on t.typeRoom_Id = r.type_Room_Id\n"
                + "		join imageroom i on i.room_Id = r.room_Id)\n"
                + "		select room_Id, name, price, size, bed, bath, person, image from roomDetail \n"
                + "		where  rn = 2\n"
                + "        order by price desc\n"
                + "		 limit ? offset ? ";
        try {
            PreparedStatement pre = conn.prepareCall(sql);
            pre.setInt(1, sizeRoom);
            pre.setInt(2, numberRoom);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Room(rs.getInt(1),
                        rs.getString(2),
                       rs.getDouble(3), 
                       rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Room> getRoomByType(int numberRoom, int idType) {
        List<Room> list = new ArrayList<>();
        String sql = "with roomDetail as (\n"
                + "		select r.room_Id, r.name, r.price, r.size, t.bed, t.bath , t.person, i.image , t.typeRoom_Id,\n"
                + "		ROW_NUMBER() OVER (PARTITION BY r.room_Id order by r.room_Id asc ) AS rn from room r\n"
                + "		join typeroom t on t.typeRoom_Id = r.type_Room_Id\n"
                + "		join imageroom i on i.room_Id = r.room_Id)\n"
                + "		select room_Id, name, price, size, bed, bath, person, image from roomDetail \n"
                + "		where typeroom_Id = ? and rn = 2 "
                + "order by name desc\n"
                + "        limit ? offset 0";
        try {
            PreparedStatement pre = conn.prepareCall(sql);
            pre.setInt(1, idType);
            pre.setInt(2, numberRoom);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Room(rs.getInt(1),
                        rs.getString(2),
                       rs.getDouble(3), 
                       rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public static void main(String[] args) {
       DAORoom dao = new DAORoom();
       List<Room> list = dao.getNewRoom();
        for (Room room : list) {
            System.out.println(room);
        }
    }
}
