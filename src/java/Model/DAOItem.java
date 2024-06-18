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
        String sql = "select * from item";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Item x = new Item();
                x.itemId = rs.getInt("item_Id");
                x.itemName = rs.getString("name");
                x.typeItemId = rs.getInt("typeItem_Id");
                x.price = rs.getDouble("price");
                list.add(x);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<RoomWithItem> getRoomWithItem(int id) {
        List<RoomWithItem> list = new ArrayList();
        String sql = "select i.item_Id, i.room_id, i.quantity, r.name as roomName,it.name as itemName, it.price from item_in_room i\n"
                + "join room r on i.room_id = r.room_Id\n"
                + "join items it on i.item_Id = it.item_Id\n"
                + "where i.room_id =?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                RoomWithItem x = new RoomWithItem();
                x.itemId = rs.getInt("item_Id");
                x.itemName = rs.getString("itemName");
                x.roomId = rs.getInt("room_id");
                x.roomName = rs.getString("roomName");
                x.itempPrice = rs.getDouble("price");
                x.quantity = rs.getInt("quantity");
                list.add(x);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
     public void updateItemQuantity(int itemId, int newQuantity) {
        String sql = "UPDATE Items SET quantity = ? WHERE itemId = ?";
        try {
                PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, newQuantity);
            pre.setInt(2, itemId);
            pre.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
 
    }
    
    public static void main(String[] args) {
        DAOItem dao = new DAOItem();
        List<RoomWithItem> list = dao.getRoomWithItem(1);
        for (RoomWithItem o : list) {
            System.out.println(o);
        }
    }
}
