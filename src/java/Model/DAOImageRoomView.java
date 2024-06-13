/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Entity.ImageRoomView;
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
public class DAOImageRoomView extends DBConnect {

    public List<ImageRoomView> getImageByRoomId(int id) {
        List<ImageRoomView> list = new ArrayList<>();
        String sql = "select image from ImageRoom\n"
                + "where room_Id = ?";
        try {
            PreparedStatement pre = conn.prepareCall(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {                
                list.add(new ImageRoomView(rs.getString(1)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOImageRoomView.class.getName()).log(Level.SEVERE, null, ex);
        }
       
        return list;
    }
    
    public static void main(String[] args) {
        DAOImageRoomView dao = new DAOImageRoomView();
        List<ImageRoomView> list = dao.getImageByRoomId(1);
        for (ImageRoomView imageRoom : list) {
            System.out.println(imageRoom);
        }
    }
    
}
