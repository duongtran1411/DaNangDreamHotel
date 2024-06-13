package Model;

import Entity.ImageRoomView;
import Entity.RoomView;
import Entity.TypeRoomView;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAORoomView extends DBConnect {

    public List<RoomView> getNewRoom() {
        List<RoomView> list = new ArrayList<>();
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
                list.add(new RoomView(rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoomView.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<RoomView> getAllRoom() {
        List<RoomView> list = new ArrayList<>();
        String sql = "select * "
                + "from room";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new RoomView(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getString(6),
                        rs.getDate(7),
                        rs.getDate(8),
                        rs.getInt(9)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoomView.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public RoomView getRoomById(int id) {
        RoomView room = new RoomView();
        String sql = "select r.room_Id, r.name, r.price, r.size,t.bed, t.bath, t.person from room r\n"
                + "join typeroom t on t.typeRoom_Id = r.type_Room_Id\n"
                + "where r.room_Id = ?";
        try {
            PreparedStatement pre = conn.prepareCall(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                return new RoomView(rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoomView.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(DAORoomView.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<RoomView> searchRoomByText(String txt) {
        List<RoomView> list = new ArrayList<>();
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
                list.add(new RoomView(rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoomView.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<RoomView> getRoomByTypeRoomId(int typeRoomId) {
        List<RoomView> list = new ArrayList();
        String sql = "select distinct r.* from room r\n"
                + "join typeroom t on t.typeRoom_Id = r.type_Room_Id\n"
                + "where t.typeRoom_Id = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, typeRoomId);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new RoomView(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getString(6),
                        rs.getDate(7),
                        rs.getDate(8),
                        rs.getInt(9)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoomView.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<RoomView> getTop3Room(int numberRoom) {
        List<RoomView> list = new ArrayList<>();
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
                list.add(new RoomView(rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoomView.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<RoomView> getNext3Room(int numberRoom) {
        List<RoomView> list = new ArrayList<>();
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
                list.add(new RoomView(rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoomView.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<RoomView> sortRoomByPrice(int sizeRoom, int numberRoom) {
        List<RoomView> list = new ArrayList<>();
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
                list.add(new RoomView(rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoomView.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<RoomView> sortRoomByPriceDown(int sizeRoom, int numberRoom) {
        List<RoomView> list = new ArrayList<>();
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
                list.add(new RoomView(rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoomView.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<RoomView> getRoomByType(int numberRoom, int idType) {
        List<RoomView> list = new ArrayList<>();
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
                list.add(new RoomView(rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoomView.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public static void main(String[] args) {
        DAORoomView dao = new DAORoomView();
        int a = dao.countRoom();

//        RoomView room = dao.getRoomById(18);
//        System.out.println(room);
    }


}
