/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Entity.ImageRoom;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author GIGABYTE
 */
public class DAOImageRoom extends DBConnect {

    public List<ImageRoom> getImageByRoomId(int id) {
        List<ImageRoom> list = new ArrayList<>();
        String sql = "select image from ImageRoom\n"
                + "where room_Id = ?";
        try {
            PreparedStatement pre = conn.prepareCall(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {                
                list.add(new ImageRoom(rs.getString(1)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOImageRoom.class.getName()).log(Level.SEVERE, null, ex);
        }
       
        return list;
    }
    
    public static void main(String[] args) {
        DAOImageRoom dao = new DAOImageRoom();
        List<ImageRoom> list = dao.getImageByRoomId(1);
        for (ImageRoom imageRoom : list) {
            System.out.println(imageRoom);
        }
    }
    
}
