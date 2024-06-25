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

    public List<ItemInRoom> getAllItemInRoom() {
        List<ItemInRoom> list = new ArrayList();
        String sql = "select * from item_in_room";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                ItemInRoom x = new ItemInRoom();
                x.id = rs.getInt("item_In_Room_Id");
                x.itemId = rs.getInt("item_Id");
                x.roomId = rs.getInt("room_Id");
                x.quantity = rs.getInt("quantity");
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

    public List<RoomWithItem> getRoomWithItem(int id) {
        List<RoomWithItem> list = new ArrayList();
        String sql = "select i.item_in_Room_Id, i.item_Id, i.room_id, i.quantity, r.name as roomName,it.name as itemName, it.price from item_in_room i\n"
                + "join room r on i.room_id = r.room_Id\n"
                + "join items it on i.item_Id = it.item_Id\n"
                + "where i.room_id =?";
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
     public void deleteItemInRoom(int id){
         String sql = "delete from item_in_room "
                + "where item_Id= ? ";
        try{
            PreparedStatement pre= conn.prepareStatement(sql);
            pre.setInt(1, id);
            pre.executeUpdate();
        }catch (SQLException ex) {
           Logger.getLogger(DAOItem.class.getName()).log(Level.SEVERE, null, ex);
        }
     }
    public void deleteItem(int id) {
        String sql = "delete from items "
                + "where item_Id= ? ";
        try{
            PreparedStatement pre= conn.prepareStatement(sql);
            pre.setInt(1, id);
            pre.executeUpdate();
        }catch (SQLException ex) {
           Logger.getLogger(DAOItem.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
   public static void main(String[] args) {
        DAOItem dao = new DAOItem();
      dao.deleteItem(2);
       //List<ItemInRoom> list = dao.getItemInRoomWithRoomId(1);
    
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
            System.out.println("Error at inserption e) {\n" +
"            System.out.ptCustomer " + e.getMessage());
        }
    }

    
}
