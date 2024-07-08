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
        String sql = "with roomDetail as (\n"
                + "                    	select r.room_Id, r.name, r.price, r.size, t.bed, t.bath , t.person, i.image , r.type_Room_Id,r.floor_Room_Id, r.maintenance_status,\n"
                + "                               	ROW_NUMBER() OVER (PARTITION BY r.room_Id ORDER BY r.room_Id desc) AS rn from room r\n"
                + "                             	join typeroom t on t.typeRoom_Id = r.type_Room_Id\n"
                + "                                join floor l on l.floor_Id = r.floor_Room_Id\n"
                + "                              	join imageroom i on i.room_Id = r.room_Id)\n"
                + "                               	select room_Id, name, price, size, bed, bath, person, image, type_Room_Id, floor_Room_Id,maintenance_status  from roomDetail \n"
                + "                                	where rn = 2";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Room(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        (rs.getString(11))));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public List<Room> listAllRoom() {
        List<Room> list = new ArrayList<>();
        String sql = "select * from room";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
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

    public List<Room> getAllRoomId() {
        String sql = "select room_Id from room";
        List<Room> list = new ArrayList();
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Room(rs.getInt(1)
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
 public Room getNameById(int id) {
        String sql = "SELECT \n"
                + "    r.room_Id, r.name, r.price, r.size, t.bed, t.bath, t.person, MAX(i.image) AS image, r.type_Room_Id, r.floor_Room_Id, r.maintenance_status\n"
                + "FROM \n"
                + "    room r\n"
                + "    JOIN typeroom t ON t.typeRoom_Id = r.type_Room_Id\n"
                + "    JOIN floor l ON l.floor_Id = r.floor_Room_Id\n"
                + "    JOIN imageroom i ON i.room_Id = r.room_Id\n"
                + "WHERE \n"
                + "    r.room_Id = ?\n"
                + "GROUP BY \n"
                + "    r.room_Id, r.name, r.price, r.size, t.bed, t.bath, t.person, r.type_Room_Id, r.floor_Room_Id, r.maintenance_status";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                return new Room(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        (rs.getString(11)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public void addRoom(String name, int floor, int price, int size, int typeRoom) {
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
            pre.setInt(3, price);
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
                return new Room(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getInt(5), rs.getInt(6));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOTypeRoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Room> getNewRoom() {
        List<Room> list = new ArrayList<>();
        String sql = "with roomDetail as (\n"
                + "	select r.room_Id, r.name, r.price, r.size, t.bed, t.bath , t.person, i.image ,  r.type_Room_Id,\n"
                + "    ROW_NUMBER() OVER (PARTITION BY r.room_Id ORDER BY r.room_Id desc) AS rn from room r\n"
                + "	join typeroom t on t.typeRoom_Id = r.type_Room_Id\n"
                + "	join imageroom i on i.room_Id = r.room_Id)\n"
                + "select room_Id, name, price, size, bed, bath, person, image,type_Room_Id from roomDetail \n"
                + "where rn = 2\n"
                + "order by room_Id desc\n"
                + "limit 4";
        try {
            PreparedStatement pre = conn.prepareCall(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Room(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getInt(9)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Room getRoomById(int id) {
        Room room = new Room();
        String sql = "select r.room_Id, r.name, r.price, r.size,t.bed, t.bath, t.person, e.discount from room r\n"
                + "                join typeroom t on t.typeRoom_Id = r.type_Room_Id\n"
                + "                join event e on e.event_Id = t.event_Id\n"
                + "                where r.room_Id = ?";
        try {
            PreparedStatement pre = conn.prepareCall(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                return new Room(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getDouble(8));
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
                + "		select r.room_Id, r.name, r.price, r.size, t.bed, t.bath , t.person, i.image ,r.type_Room_Id,\n"
                + "		ROW_NUMBER() OVER (PARTITION BY r.room_Id ORDER BY r.room_Id desc) AS rn from room r\n"
                + "		join typeroom t on t.typeRoom_Id = r.type_Room_Id\n"
                + "		join imageroom i on i.room_Id = r.room_Id)\n"
                + "		select room_Id, name, price, size, bed, bath, person, image, type_Room_Id from roomDetail \n"
                + "		where name like ? and rn = 2";
        try {
            PreparedStatement pre = conn.prepareCall(sql);
            pre.setString(1, "%" + txt + "%");
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Room(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getInt(9)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }


    public List<Room> get6Room(int numberRoom) {
        List<Room> list = new ArrayList<>();
        String sql = "with roomDetail as (\n"
                + "		select r.room_Id, r.name, r.price, r.size, t.bed, t.bath , t.person, i.image , r.type_Room_Id,\n"
                + "		ROW_NUMBER() OVER (PARTITION BY r.room_Id ORDER BY r.room_Id desc) AS rn from room r\n"
                + "		join typeroom t on t.typeRoom_Id = r.type_Room_Id\n"
                + "		join imageroom i on i.room_Id = r.room_Id)\n"
                + "		select room_Id, name, price, size, bed, bath, person, image, type_Room_Id from roomDetail \n"
                + "		where rn = 2\n"
                + "        limit 6 offset ?";

        try {
            PreparedStatement pre = conn.prepareCall(sql);
            pre.setInt(1, numberRoom * 6 - 6);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Room(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getInt(9)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Room> getTop3Room(int numberRoom) {
        List<Room> list = new ArrayList<>();
        String sql = "with roomDetail as (\n"
                + "		select r.room_Id, r.name, r.price, r.size, t.bed, t.bath , t.person, i.image , r.type_Room_Id,\n"
                + "		ROW_NUMBER() OVER (PARTITION BY r.room_Id ORDER BY r.room_Id desc) AS rn from room r\n"
                + "		join typeroom t on t.typeRoom_Id = r.type_Room_Id\n"
                + "		join imageroom i on i.room_Id = r.room_Id)\n"
                + "		select room_Id, name, price, size, bed, bath, person, image, type_Room_Id from roomDetail \n"
                + "		where rn = 2\n"
                + "        limit 6 offset ?";

        try {
            PreparedStatement pre = conn.prepareCall(sql);
            pre.setInt(1, numberRoom * 6 - 6);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Room(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getInt(9)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Room> getNext3Room(int numberRoom) {
        List<Room> list = new ArrayList<>();
        String sql = "with roomDetail as (\n"
                + "		select r.room_Id, r.name, r.price, r.size, t.bed, t.bath , t.person, i.image , r.type_Room_Id,\n"
                + "		ROW_NUMBER() OVER (PARTITION BY r.room_Id ORDER BY r.room_Id desc) AS rn from room r\n"
                + "		join typeroom t on t.typeRoom_Id = r.type_Room_Id\n"
                + "		join imageroom i on i.room_Id = r.room_Id)\n"
                + "		select room_Id, name, price, size, bed, bath, person, image, type_Room_Id from roomDetail \n"
                + "		where rn = 2\n"
                + "        limit 3 offset ?";

        try {
            PreparedStatement pre = conn.prepareCall(sql);
            pre.setInt(1, numberRoom);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Room(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getInt(9)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Room> sortRoomByPrice(int sizeRoom, int numberRoom) {
        List<Room> list = new ArrayList<>();
        String sql = "with roomDetail as (\n"
                + "		select r.room_Id, r.name, r.price, r.size, t.bed, t.bath , t.person, i.image ,r.type_Room_Id\n"
                + "		ROW_NUMBER() OVER (PARTITION BY r.room_Id ) AS rn from room r\n"
                + "		join typeroom t on t.typeRoom_Id = r.type_Room_Id\n"
                + "		join imageroom i on i.room_Id = r.room_Id)\n"
                + "		select room_Id, name, price, size, bed, bath, person, image, type_Room_Id from roomDetail \n"
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
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getInt(9)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Room> sortRoomByPriceDown(int sizeRoom, int numberRoom) {
        List<Room> list = new ArrayList<>();
        String sql = "with roomDetail as (\n"
                + "		select r.room_Id, r.name, r.price, r.size, t.bed, t.bath , t.person, i.image , r.type_Room_Id\n"
                + "		ROW_NUMBER() OVER (PARTITION BY r.room_Id ) AS rn from room r\n"
                + "		join typeroom t on t.typeRoom_Id = r.type_Room_Id\n"
                + "		join imageroom i on i.room_Id = r.room_Id)\n"
                + "		select room_Id, name, price, size, bed, bath, person, image, type_Room_Id from roomDetail \n"
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
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getInt(9)));
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
                + "		select room_Id, name, price, size, bed, bath, person, image,typeRoom_Id from roomDetail \n"
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
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getInt(9)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public List<Room> getRoomByTypeRoom(int numberRoom) {
        List<Room> list = new ArrayList<>();
        String sql = "with roomDetail as (\n"
                + "                    	select r.room_Id, r.name, r.price, r.size, t.bed, t.bath , t.person, i.image , r.type_Room_Id,r.floor_Room_Id, r.maintenance_status,\n"
                + "                               	ROW_NUMBER() OVER (PARTITION BY r.room_Id ORDER BY r.room_Id desc) AS rn from room r\n"
                + "                             	join typeroom t on t.typeRoom_Id = r.type_Room_Id\n"
                + "                                join floor l on l.floor_Id = r.floor_Room_Id\n"
                + "                              	join imageroom i on i.room_Id = r.room_Id)\n"
                + "                               	select room_Id, name, price, size, bed, bath, person, image, type_Room_Id, floor_Room_Id,maintenance_status  from roomDetail \n"
                + "                                	where rn = 2 and type_Room_Id = ?";
        try {
            PreparedStatement pre = conn.prepareCall(sql);
            pre.setInt(1, numberRoom);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Room(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        (rs.getString(11))));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public Room getRoomToCart(int id) {
        String sql = "with roomDetail as (\n"
                + "                	select r.room_Id, r.name, r.price, r.size, t.bed, t.bath , t.person, i.image , e.discount, t.typeRoom_Id,\n"
                + "                	ROW_NUMBER() OVER (PARTITION BY r.room_Id ORDER BY r.room_Id desc) AS rn from room r\n"
                + "                	join typeroom t on t.typeRoom_Id = r.type_Room_Id\n"
                + "                	join imageroom i on i.room_Id = r.room_Id\n"
                + "                    join event e on e.event_Id = t.event_Id)\n"
                + "                	select room_Id, name, price, size, bed, bath, person, image, discount,typeRoom_Id from roomDetail \n"
                + "                		where rn = 2 and room_Id = ?";

        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                return new Room(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getDouble(9),
                        rs.getInt(10));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public List<Room> getRoomByEvent(int id) {
        List<Room> list = new ArrayList<>();
        String sql = "with roomDetail as (\n"
                + "				select r.room_Id, r.name, r.price, r.size, t.bed, t.bath , t.person, i.image , e.discount, e.event_Id, t.typeRoom_Id,\n"
                + "                ROW_NUMBER() OVER (PARTITION BY r.room_Id ORDER BY r.room_Id desc) AS rn from room r\n"
                + "                	join typeroom t on t.typeRoom_Id = r.type_Room_Id\n"
                + "                	join imageroom i on i.room_Id = r.room_Id\n"
                + "                    join event e on e.event_Id = t.event_Id)\n"
                + "                	select room_Id, name, price, size, bed, bath, person, image, discount, typeRoom_Id from roomDetail \n"
                + "                	where rn = 2 and event_Id = ?";

        try {
            PreparedStatement pre = conn.prepareCall(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Room(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getDouble(9),
                        rs.getInt(10)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Room> SortRoomEventByPrice(int id) {
        List<Room> list = new ArrayList<>();
        String sql = "with roomDetail as (\n"
                + "                	select r.room_Id, r.name, r.price, r.size, t.bed, t.bath , t.person, i.image , e.discount, e.event_Id, t.typeRoom_Id,\n"
                + "                             ROW_NUMBER() OVER (PARTITION BY r.room_Id ORDER BY r.room_Id desc) AS rn from room r\n"
                + "                              	join typeroom t on t.typeRoom_Id = r.type_Room_Id\n"
                + "                              	join imageroom i on i.room_Id = r.room_Id\n"
                + "                                  join event e on e.event_Id = t.event_Id)\n"
                + "                              	select room_Id, name, price, size, bed, bath, person, image, discount, typeRoom_Id from roomDetail \n"
                + "                             	where rn = 2 and event_Id = ?\n"
                + "								order by price desc ";

        try {
            PreparedStatement pre = conn.prepareCall(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Room(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getDouble(9),
                        rs.getInt(10)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;

    }

    public List<Room> sortRoomsByNameAsc() {
        List<Room> list = new ArrayList<>();
        String sql = "SELECT * FROM managerhotel\n"
                + "    .room order by name asc ; ";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
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

    public List<Room> sortRoomsByNameDesc() {
        List<Room> list = new ArrayList<>();
        String sql = "SELECT * FROM managerhotel\n"
                + "    .room order by name desc ; ";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
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

    public List<Room> sortRoomsByPriceAsc() {
        List<Room> list = new ArrayList<>();
        String sql = "SELECT * FROM managerhotel\n"
                + "    .room order by price asc ; ";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
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

    public List<Room> sortRoomsByPriceDesc() {
        List<Room> list = new ArrayList<>();
        String sql = "SELECT * FROM managerhotel\n"
                + "    .room order by price desc ; ";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
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

    public List<Room> checkRoom(String checkIn, String checkOut, int event_Id) {
        List<Room> list = new ArrayList<>();
        String sql = "WITH roomDetail AS (\n"
                + "    SELECT r.room_Id, r.name, r.price, r.size, t.bed, t.bath, t.person, i.image, e.discount, e.event_Id, t.typeRoom_Id,\n"
                + "           ROW_NUMBER() OVER (PARTITION BY r.room_Id ORDER BY r.room_Id DESC) AS rn\n"
                + "    FROM room r\n"
                + "    JOIN typeroom t ON t.typeRoom_Id = r.type_Room_Id\n"
                + "    JOIN imageroom i ON i.room_Id = r.room_Id\n"
                + "    JOIN event e ON e.event_Id = t.event_Id\n"
                + "),\n"
                + "bookedRooms AS (\n"
                + "    SELECT bt.room_Id\n"
                + "    FROM booking b\n"
                + "    JOIN bookingdetail bt ON bt.booking_Id = b.booking_Id\n"
                + "    WHERE (? BETWEEN b.checkIn AND b.checkOut)\n"
                + "       OR (? BETWEEN b.checkIn AND b.checkOut)\n"
                + "       OR (b.checkIn >= ? AND b.checkOut <= ?)\n"
                + ")\n"
                + "SELECT room_Id, name, price, size, bed, bath, person, image, discount, typeRoom_Id\n"
                + "FROM roomDetail\n"
                + "WHERE rn = 2\n"
                + "   AND event_Id = ?\n"
                + "  AND room_Id NOT IN (SELECT room_Id FROM bookedRooms);";
        try {
            PreparedStatement pre = conn.prepareCall(sql);
            pre.setString(1, checkIn);
            pre.setString(2, checkOut);
            pre.setString(3, checkIn);
            pre.setString(4, checkOut);
            pre.setInt(5, event_Id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Room(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getDouble(9),
                        rs.getInt(10)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Room> getRoomByFloor(int id) {
        List<Room> list = new ArrayList<>();
        String sql = "with roomDetail as (\n"
                + "                    	select r.room_Id, r.name, r.price, r.size, t.bed, t.bath , t.person, i.image , r.type_Room_Id,r.floor_Room_Id, r.maintenance_status,\n"
                + "                               	ROW_NUMBER() OVER (PARTITION BY r.room_Id ORDER BY r.room_Id desc) AS rn from room r\n"
                + "                             	join typeroom t on t.typeRoom_Id = r.type_Room_Id\n"
                + "                                join floor l on l.floor_Id = r.floor_Room_Id\n"
                + "                              	join imageroom i on i.room_Id = r.room_Id)\n"
                + "                               	select room_Id, name, price, size, bed, bath, person, image, type_Room_Id, floor_Room_Id,maintenance_status  from roomDetail \n"
                + "                                	where rn = 2 and floor_Room_Id = ?";
        try {
            PreparedStatement pre = conn.prepareCall(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Room(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        (rs.getString(11))));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Room> getRoomStatus(String status) {
        List<Room> list = new ArrayList<>();
        String sql = "with roomDetail as (\n"
                + "                    	select r.room_Id, r.name, r.price, r.size, t.bed, t.bath , t.person, i.image , r.type_Room_Id,r.floor_Room_Id, r.maintenance_status,\n"
                + "                               	ROW_NUMBER() OVER (PARTITION BY r.room_Id ORDER BY r.room_Id desc) AS rn from room r\n"
                + "                             	join typeroom t on t.typeRoom_Id = r.type_Room_Id\n"
                + "                                join floor l on l.floor_Id = r.floor_Room_Id\n"
                + "                              	join imageroom i on i.room_Id = r.room_Id)\n"
                + "                               	select room_Id, name, price, size, bed, bath, person, image, type_Room_Id, floor_Room_Id,maintenance_status  from roomDetail \n"
                + "                                	where rn = 2 and maintenance_status = ?";
        try {
            PreparedStatement pre = conn.prepareCall(sql);
            pre.setString(1, status);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Room(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        (rs.getString(11))));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Room> getRoomCheckIn(String checkIn) {
        List<Room> list = new ArrayList<>();
        String sql = "SELECT \n"
                + "    r.room_Id, r.name, r.price, r.size, t.bed, t.bath, t.person, MAX(i.image) AS image, r.type_Room_Id, r.floor_Room_Id, r.maintenance_status, MAX(b.checkIn) AS checkIn\n"
                + "FROM \n"
                + "    room r\n"
                + "    JOIN typeroom t ON t.typeRoom_Id = r.type_Room_Id\n"
                + "    JOIN floor l ON l.floor_Id = r.floor_Room_Id\n"
                + "    JOIN imageroom i ON i.room_Id = r.room_Id\n"
                + "    JOIN bookingdetail bt ON bt.room_Id = r.room_Id\n"
                + "    JOIN booking b ON b.booking_Id = bt.booking_Id\n"
                + "WHERE \n"
                + "    DATE(b.checkIn) = ? + INTERVAL 1 DAY\n"
                + "GROUP BY \n"
                + "    r.room_Id, r.name, r.price, r.size, t.bed, t.bath, t.person, r.type_Room_Id, r.floor_Room_Id, r.maintenance_status";
        try {
            PreparedStatement pre = conn.prepareCall(sql);
            pre.setString(1, checkIn);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Room(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        (rs.getString(11))));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Room> getRoomCheckOut(String CheckOut) {
        List<Room> list = new ArrayList<>();
        String sql = "                                   SELECT \n"
                + "    r.room_Id, r.name, r.price, r.size, t.bed, t.bath, t.person, MAX(i.image) AS image, r.type_Room_Id, r.floor_Room_Id, r.maintenance_status, MAX(b.checkIn) AS checkIn\n"
                + "FROM \n"
                + "    room r\n"
                + "    JOIN typeroom t ON t.typeRoom_Id = r.type_Room_Id\n"
                + "    JOIN floor l ON l.floor_Id = r.floor_Room_Id\n"
                + "    JOIN imageroom i ON i.room_Id = r.room_Id\n"
                + "    JOIN bookingdetail bt ON bt.room_Id = r.room_Id\n"
                + "    JOIN booking b ON b.booking_Id = bt.booking_Id\n"
                + "WHERE \n"
                + "    DATE(b.checkOut) = DATE_SUB(?, INTERVAL -1 DAY)\n"
                + "GROUP BY \n"
                + "    r.room_Id, r.name, r.price, r.size, t.bed, t.bath, t.person, r.type_Room_Id, r.floor_Room_Id, r.maintenance_status;";
        try {
            PreparedStatement pre = conn.prepareCall(sql);
            pre.setString(1, CheckOut);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Room(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        (rs.getString(11))));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void updateStatus(String status, int id) {

        String sql = "update room\n"
                + " set maintenance_status =?,\n"
                + " updated_at = NOW()\n"
                + " where room_Id = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, status);
            pre.setInt(2, id);
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public List<Room> getRoomAvailable(String date) {
        List<Room> list = new ArrayList<>();
        String sql = "WITH roomDetail AS (\n"
                + "                    SELECT r.room_Id, r.name, r.price, r.size, t.bed, t.bath, t.person, i.image, t.typeRoom_Id, r.status, r.maintenance_status,\n"
                + "                          ROW_NUMBER() OVER (PARTITION BY r.room_Id ORDER BY r.room_Id DESC) AS rn\n"
                + "                  FROM room r\n"
                + "                   JOIN typeroom t ON t.typeRoom_Id = r.type_Room_Id\n"
                + "                   JOIN imageroom i ON i.room_Id = r.room_Id\n"
                + "	\n"
                + "                ),\n"
                + "                bookedRooms AS (\n"
                + "                   SELECT bt.room_Id\n"
                + "                    FROM booking b\n"
                + "                   JOIN bookingdetail bt ON bt.booking_Id = b.booking_Id\n"
                + "                   WHERE (? BETWEEN b.checkIn AND b.checkOut)\n"
                + "                   \n"
                + "                )\n"
                + "                SELECT room_Id, name, price, size, bed, bath, person, image, typeRoom_Id,status,maintenance_status\n"
                + "                FROM roomDetail\n"
                + "                WHERE rn = 2 and status = 'Available'\n"
                + "                 AND room_Id NOT IN (SELECT room_Id FROM bookedRooms);";
        try {
            PreparedStatement pre = conn.prepareCall(sql);
            pre.setString(1, date);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {                
                list.add(new Room(rs.getInt(1),
                        rs.getString(2),
                       rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getString(10),
                        rs.getString(11)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Room> getRoomUnavai(String date) {
        List<Room> list = new ArrayList<>();
        String sql = "WITH roomDetail AS (\n"
                + "                    SELECT r.room_Id, r.name, r.price, r.size, t.bed, t.bath, t.person, i.image, t.typeRoom_Id, r.status, r.maintenance_status,\n"
                + "                          ROW_NUMBER() OVER (PARTITION BY r.room_Id ORDER BY r.room_Id DESC) AS rn\n"
                + "                  FROM room r\n"
                + "                   JOIN typeroom t ON t.typeRoom_Id = r.type_Room_Id\n"
                + "                   JOIN imageroom i ON i.room_Id = r.room_Id\n"
                + "	\n"
                + "                ),\n"
                + "                bookedRooms AS (\n"
                + "                   SELECT bt.room_Id\n"
                + "                    FROM booking b\n"
                + "                   JOIN bookingdetail bt ON bt.booking_Id = b.booking_Id\n"
                + "                   WHERE (? BETWEEN b.checkIn AND b.checkOut)\n"
                + "                   \n"
                + "                )\n"
                + "                SELECT room_Id, name, price, size, bed, bath, person, image, typeRoom_Id,status,maintenance_status\n"
                + "                FROM roomDetail\n"
                + "                WHERE rn = 2 and status = 'Available'\n"
                + "                 AND room_Id IN (SELECT room_Id FROM bookedRooms);";
        try {
            PreparedStatement pre = conn.prepareCall(sql);
            pre.setString(1, date);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {                
                list.add(new Room(rs.getInt(1),
                        rs.getString(2),
                       rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getString(10),
                        rs.getString(11)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public static void main(String[] args) {
        DAORoom dao = new DAORoom();
        List<Room> list = dao.checkRoom("2024-07-08","2024-07-10",1);
        for (Room room : list) {
            System.out.println(room);
        }
    }

}
