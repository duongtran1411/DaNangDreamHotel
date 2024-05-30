/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Entity.TypeRoom;
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
public class DAOTypeRoom extends DBConnect{
    public List<TypeRoom> getAllTypeRoom(){
        List<TypeRoom> list = new ArrayList<>();
        String sql = "select * from typeroom";
        try {
            PreparedStatement pre = conn.prepareCall(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {                
                list.add(new TypeRoom(rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOTypeRoom.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return list;
    }
    
    public static void main(String[] args) {
        DAOTypeRoom dao = new DAOTypeRoom();
        List<TypeRoom> list = dao.getAllTypeRoom();
        for (TypeRoom typeRoom : list) {
            System.out.println(typeRoom);
        }
    }
}
