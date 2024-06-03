/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Entity.ItemInRoom;
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
public class DAOItem extends DBConnect{
    public List<ItemInRoom> getAllItemInRoom(){
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
                x.itemName = rs.getString("nameItem");
                x.quantity = rs.getInt("quantity");
                list.add(x);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
}
