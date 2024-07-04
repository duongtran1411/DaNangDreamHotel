/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Entity.Floor;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author GIGABYTE
 */
public class DAOFloor extends DBConnect {

    public List<Floor> getAllFloor() {
        List<Floor> list = new ArrayList<>();
        String sql = "select * from floor";
        try {
            PreparedStatement pre = conn.prepareCall(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Floor(rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOFloor.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public static void main(String[] args) {
        DAOFloor dao = new DAOFloor();
        List<Floor> list = dao.getAllFloor();
        for (Floor floor : list) {
            System.out.println(floor);
        }
    }
}
