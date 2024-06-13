
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Entity.TypeRoomView;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;




/**
 *
 * @author GIGABYTE
 */
public class DAOTypeRoomView extends DBConnect{
    public List<TypeRoomView> getAllTypeRoom(){
        List<TypeRoomView> list = new ArrayList<>();
        String sql = "select * from typeroom";
        try {
            PreparedStatement pre = conn.prepareCall(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {                
                list.add(new TypeRoomView(rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOTypeRoomView.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }    


    public List<TypeRoomView> getAllTypeRoomS() {
        List<TypeRoomView> list = new ArrayList<>();
        String sql = "select * "
                + "from typeroom";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new TypeRoomView(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)));

            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOTypeRoomView.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void addTypeRoom(String name, String bed, String bath, String people, String img) {
        String sql = "INSERT INTO `managerhotel`.`typeroom`\n"
                + "(`name`,\n"
                + "`bed`,\n"
                + "`bath`,\n"
                + "`people`,\n"
                + "`image`)\n"
                + "VALUES\n"
                + "(?,?,?,?,?);";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, name);
            pre.setString(2, bed);
            pre.setString(3, bath);
            pre.setString(4, people);
            pre.setString(5, img);
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOTypeRoomView.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public TypeRoomView getTypeRoomByID(int trid) {
        String sql = "SELECT * FROM typeroom WHERE typeRoom_Id = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, trid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                return new TypeRoomView(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOTypeRoomView.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void editTypeRoom(int id, String name, int eventId, String bed, String bath, String people, String image) {
        String sql = "UPDATE typeroom\n"
                + "   SET name = ?,\n"
                + "       event_Id = ?,\n"
                + "       bed = ?,\n"
                + "       bath = ?,\n"
                + "       people = ?,\n"
                + "       image = ?\n"
                + " WHERE typeRoom_Id = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, name);
            pre.setInt(2, eventId);
            pre.setString(3, bed);
            pre.setString(4, bath);
            pre.setString(5, people);
            pre.setString(6, image);
            pre.setInt(7, id);
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOTypeRoomView.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteTypeRoom(int trid) {
        String sql = "delete from typeroom\n"
                + "where typeRoom_Id = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, trid);
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOTypeRoomView.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        DAOTypeRoomView dao = new DAOTypeRoomView();
        dao.editTypeRoom(1, "z", 1, "z", "Z", "Z", "954a5535---copy-2_rs_1654161451.jpg");
    }
}
