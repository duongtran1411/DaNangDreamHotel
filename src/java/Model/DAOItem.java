/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Entity.Item;
import Entity.ItemInRoom;
import Entity.RoomWithItem;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author CaoTung
 */
public class DAOItem extends DBConnect {

    public List<Item> searchItems(String query) {
        List<Item> items = new ArrayList<>();
        String sql = "SELECT * FROM items WHERE name LIKE ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, query + "%");
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Item item = new Item();
                item.setItem_Id(rs.getInt("item_Id"));
                item.setName(rs.getString("name"));
                item.setTypeItem_Id(rs.getInt("typeItem_Id"));
                item.setPrice(rs.getDouble("price"));
                items.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return items;
    }
    public int getTotalItem() {
        String sql = "select count(item_Id) "
                + "from items";
        int totalItems = 0;
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                totalItems = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return totalItems;
    }

    public List<Item> getItemsWithPagin(int currentPage, int itemsPerPage) {
        List<Item> list = new ArrayList();
        int startIndex = (currentPage - 1) * itemsPerPage;
        String sql = "select * from items LIMIT ? OFFSET ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);

            pre.setInt(1, itemsPerPage);
            pre.setInt(2, startIndex);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Item x = new Item();
                x.item_Id = rs.getInt("item_Id");
                x.name = rs.getString("name");
                x.typeItem_Id = rs.getInt("typeItem_Id");
                x.price = rs.getDouble("price");
                list.add(x);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<ItemInRoom> getAllItemInRoom() {
        List<ItemInRoom> list = new ArrayList();
        String sql = "select * from item_in_room";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                ItemInRoom x = new ItemInRoom();
               int id = rs.getInt("item_In_Room_Id");
               int item_Id= rs.getInt("item_Id");
               int room_Id = rs.getInt("room_Id");
               int quantity = rs.getInt("quantity");
                list.add(x);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Item> getAllItem() {
        List<Item> list = new ArrayList();
        String sql = "select * from items";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Item(
                        rs.getInt("item_Id"),
                        rs.getString("name"),
                        rs.getInt("typeItem_Id"),
                        rs.getDouble("price")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

//    public List<RoomWithItem> getRoomWithItem(int id,int currentPage, int itemsPerPage) {
//        List<RoomWithItem> list = new ArrayList();
//        int startIndex = (currentPage - 1) * itemsPerPage;
//        String sql = "select i.item_in_Room_Id, i.item_Id, i.room_id, i.quantity, r.name as roomName,it.name as itemName, it.price from item_in_room i\n"
//                + "join room r on i.room_id = r.room_Id\n"
//                + "join items it on i.item_Id = it.item_Id\n"
//                + "where i.room_id =?\n"
//                + "LIMIT ? OFFSET ?";
//        try {
//            PreparedStatement pre = conn.prepareStatement(sql);
//            pre.setInt(1, id);
//            pre.setInt(2, itemsPerPage);
//            pre.setInt(3, startIndex);
//            ResultSet rs = pre.executeQuery();
//            while (rs.next()) {
//                list.add(new RoomWithItem(rs.getInt("item_in_Room_Id"),
//                        rs.getInt("item_Id"),
//                        rs.getInt("room_Id"),
//                        rs.getString("roomName"),
//                        rs.getString("itemName"),
//                        rs.getInt("quantity"),
//                        rs.getDouble("price")));
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(DAOItem.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return list;
//    }
    public List<RoomWithItem> getRoomWithItem(int id) {
        List<RoomWithItem> list = new ArrayList();
        String sql = "select i.item_in_Room_Id, i.item_Id, i.room_id, i.quantity, r.name as roomName,it.name as itemName, it.price from item_in_room i\n"
                + "join room r on i.room_id = r.room_Id\n"
                + "join items it on i.item_Id = it.item_Id\n"
                + "where i.room_id =?\n";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new RoomWithItem(rs.getInt("item_in_Room_Id"),
                        rs.getInt("item_Id"),
                        rs.getInt("room_Id"),
                        rs.getString("roomName"),
                        rs.getString("itemName"),
                        rs.getInt("quantity"),
                        rs.getDouble("price")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void updateItemQuantity(int itemInRoomId, int newQuantity) {
        String sql = "UPDATE item_in_room SET quantity = ? WHERE item_in_room_Id =?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, newQuantity);
            pre.setInt(2, itemInRoomId);
            pre.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(DAOItem.class.getName()).log(Level.SEVERE, null, e);
        }

    }

    public void deleteItemInRoom(int id) {
        String sql = "delete from item_in_room "
                + "where item_Id= ? ";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, id);
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOItem.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteItem(int id) {
        String sql = "delete from items "
                + "where item_Id= ? ";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, id);
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOItem.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void deleteItemByType(int id) {
        String sql = "delete from items "
                + "where typeItem_Id= ? ";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, id);
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOItem.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void insertItem(String name, int type, double price) {
        String sql = "insert into items(name, typeItem_Id, price)"
                + " values(?,?,?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, name);
            pre.setInt(2, type);
            pre.setDouble(3, price);
            pre.execute();
        } catch (SQLException e) {
            Logger.getLogger(DAOItem.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public Item getItemByName(String name) {
        String sql = "select * from items where name=?";
        Item it = new Item();
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, name);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                it.setItem_Id(rs.getInt(1));
                it.setName(rs.getString(2));
                it.setTypeItem_Id(rs.getInt(3));
                it.setPrice(rs.getDouble(4));
            }
        } catch (SQLException e) {
            Logger.getLogger(DAOItem.class.getName()).log(Level.SEVERE, null, e);
        }
        return it;
    }

    public void updateItem(int id, String name, int typeId, double price) {
        String sql = "update items "
                + "set name=?, typeItem_Id=?, price=? "
                + "where item_Id=?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(4, id);
            pre.setString(1, name);
            pre.setInt(2, typeId);
            pre.setDouble(3, price);

            pre.execute();
        } catch (SQLException e) {
            Logger.getLogger(DAOItem.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public Item getItemById(int id) {
        Item it = new Item();
        String sql = "select * from items "
                + "where item_Id = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                it.setItem_Id(rs.getInt(1));
                it.setName(rs.getString(2));
                it.setTypeItem_Id(rs.getInt(3));
                it.setPrice(rs.getDouble(4));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOTypeItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return it;
    }

    public List<ItemInRoom> getItemInRoom(int id) {
        List<ItemInRoom> list = new ArrayList<>();
        String sql = "select r.room_id, i.name from item_in_room r\n"
                + "join items i on i.item_Id = r.item_Id\n"
                + "where r.room_id = ?";
        try {
            PreparedStatement pre = conn.prepareCall(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new ItemInRoom(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

   

    public void InsertItemInRoom(int itemId, int roomId) {
        String sql = "insert into item_in_room(item_Id,room_id, quantity) "
                + "values(?,?,?)";
        try{
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, itemId);
            pre.setInt(2, roomId);
            pre.setInt(3, 0);
            pre.executeUpdate();
        }catch (SQLException ex) {
            Logger.getLogger(DAOItem.class.getName()).log(Level.SEVERE, null, ex);
    }
    }

    public List<Item> getFoodItem() {
         List<Item> list = new ArrayList();
        String sql = "select * from items where typeItem_Id between 1 and 2";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Item(
                        rs.getInt("item_Id"),
                        rs.getString("name"),
                        rs.getInt("typeItem_Id"),
                        rs.getDouble("price")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public List<Item> getItemByType(int typeId){
         List<Item> list = new ArrayList();
        String sql = "select * from items where typeItem_Id =?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, typeId);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Item(
                        rs.getInt("item_Id"),
                        rs.getString("name"),
                        rs.getInt("typeItem_Id"),
                        rs.getDouble("price")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
public List<RoomWithItem> getAllItemsInRoom(int offset, int limit) {
    List<RoomWithItem> list = new ArrayList<>();
    String sql = "SELECT i.item_in_Room_Id, i.item_Id, i.room_id, i.quantity, r.name AS roomName, it.name AS itemName, it.price " +
                 "FROM item_in_room i " +
                 "JOIN room r ON i.room_id = r.room_Id " +
                 "JOIN items it ON i.item_Id = it.item_Id " +
                 "LIMIT ? OFFSET ?";
    try {
        PreparedStatement pre = conn.prepareStatement(sql);
        pre.setInt(1, limit);
        pre.setInt(2, offset);
        ResultSet rs = pre.executeQuery();
        while (rs.next()) {
            list.add(new RoomWithItem(rs.getInt("item_in_Room_Id"),
                    rs.getInt("item_Id"),
                    rs.getInt("room_Id"),
                    rs.getString("roomName"),
                    rs.getString("itemName"),
                    rs.getInt("quantity"),
                    rs.getDouble("price")));
        }
    } catch (SQLException ex) {
        Logger.getLogger(DAOItem.class.getName()).log(Level.SEVERE, null, ex);
    }
    return list;
}


public List<RoomWithItem> getAllItemsInRooms() {
    List<RoomWithItem> list = new ArrayList<>();
    String sql = "SELECT i.item_in_Room_Id, i.item_Id, i.room_id, i.quantity, r.name AS roomName, it.name AS itemName, it.price " +
                 "FROM item_in_room i " +
                 "JOIN room r ON i.room_id = r.room_Id " +
                 "JOIN items it ON i.item_Id = it.item_Id; ";
    try {
        PreparedStatement pre = conn.prepareStatement(sql);
        ResultSet rs = pre.executeQuery();
        while (rs.next()) {
            list.add(new RoomWithItem(rs.getInt("item_in_Room_Id"),
                    rs.getInt("item_Id"),
                    rs.getInt("room_Id"),
                    rs.getString("roomName"),
                    rs.getString("itemName"),
                    rs.getInt("quantity"),
                    rs.getDouble("price")));
        }
    } catch (SQLException ex) {
        Logger.getLogger(DAOItem.class.getName()).log(Level.SEVERE, null, ex);
    }
    return list;
}

public int getNoOfItemRecordsByName(String roomName) {
    int noOfRecords = 0;
    String sql = "SELECT COUNT(*) FROM item_in_room i "
               + "JOIN room r ON i.room_id = r.room_Id "
               + "JOIN items it ON i.item_Id = it.item_Id "
               + "WHERE r.name = ?";
    try {
        PreparedStatement pre = conn.prepareStatement(sql);
        pre.setString(1, roomName);
        ResultSet rs = pre.executeQuery();
        if (rs.next()) {
            noOfRecords = rs.getInt(1);
        }
    } catch (SQLException ex) {
        Logger.getLogger(DAOItem.class.getName()).log(Level.SEVERE, null, ex);
    }
    return noOfRecords;
}

public int getNoOfItemRecords() {
    int noOfRecords = 0;
    String sql = "SELECT COUNT(*) FROM item_in_room";
    try {
        PreparedStatement pre = conn.prepareStatement(sql);
        ResultSet rs = pre.executeQuery();
        if (rs.next()) {
            noOfRecords = rs.getInt(1);
        }
    } catch (SQLException ex) {
        Logger.getLogger(DAOItem.class.getName()).log(Level.SEVERE, null, ex);
    }
    return noOfRecords;
}


    
    

  public List<RoomWithItem> getAllItemsInRoomByName(String roomName, int offset, int limit) {
    List<RoomWithItem> list = new ArrayList<>();
    String sql = "SELECT i.item_in_Room_Id, i.item_Id, i.room_id, i.quantity, r.name AS roomName, it.name AS itemName, it.price " +
                 "FROM item_in_room i " +
                 "JOIN room r ON i.room_id = r.room_Id " +
                 "JOIN items it ON i.item_Id = it.item_Id " +
                 "WHERE r.name = ? " +
                 "LIMIT ? OFFSET ?";
    try {
        PreparedStatement pre = conn.prepareStatement(sql);
        pre.setString(1, roomName);
        pre.setInt(2, limit);
        pre.setInt(3, offset);
        ResultSet rs = pre.executeQuery();
        while (rs.next()) {
            list.add(new RoomWithItem(rs.getInt("item_in_Room_Id"),
                    rs.getInt("item_Id"),
                    rs.getInt("room_Id"),
                    rs.getString("roomName"),
                    rs.getString("itemName"),
                    rs.getInt("quantity"),
                    rs.getDouble("price")));
        }
    } catch (SQLException ex) {
        Logger.getLogger(DAOItem.class.getName()).log(Level.SEVERE, null, ex);
    }
    return list;
}




    public static void main(String[] args) {
        DAOItem dao = new DAOItem();
        List<RoomWithItem>list=dao.getAllItemsInRooms();
        for (RoomWithItem roomWithItem : list) {
            System.out.println(list);
        }
    }
}
