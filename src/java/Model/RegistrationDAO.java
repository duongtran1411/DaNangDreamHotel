/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Entity.RegistrationDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class RegistrationDAO implements Serializable {

    private List<RegistrationDTO> Acc;

    public List<RegistrationDTO> getAcc() {
        return Acc;
    }

    public boolean checkLogin(String username, String password)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            
            //con = DBHelper.makeConnection();
            if (con != null) {
                
                String sql = "select account \n"
                        + "from [user] \n"
                        + " where account =? and password =?";
                
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                
                rs = stm.executeQuery();
                
                if (rs.next()) {
                    return true;
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public void addUser(String acc, String pass, String fullname, String Phone, String add) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {  
            //con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "insert into [User](account,[password],phone,fullname,[address])\n"
                        + "                    values (?,?,?,?,?) ";
                stm = con.prepareStatement(sql);
                stm.setString(1, acc);
                stm.setString(2, pass);
                stm.setString(3, fullname);
                stm.setString(4, Phone);
                stm.setString(5, add);
                //4. Excute Query
                int rows = stm.executeUpdate();

                if (rows > 0) {
                    System.out.println("Thêm account thành công.");
                } else {
                    System.out.println("Không có dữ liệu nào được thêm.");
                }

            }

        } catch (Exception e) {
            System.out.println("loi" + e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }

        }
    }
    public RegistrationDTO getDataAccount(String account, String password) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {

           // con = DBHelper.makeConnection();

            if (con != null) {
                String sql = " select * from  [User] \n"
                        + "   where account =?  and password =?";

                stm = con.prepareStatement(sql);
                stm.setString(1, account);
                stm.setString(2, password);
                rs = stm.executeQuery();
                while (rs.next()) {
                    // return new RegistrationDTO(
                       //     rs.getString(1),
                         //   rs.getString(2));

                }
            }

        } catch (Exception e) {
            System.out.println("loi" + e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }

        }
        return null;

    }

    
}
