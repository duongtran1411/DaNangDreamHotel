/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Entity.RegistrationDTO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class RegistrationDAO extends DBConnect {

    public boolean checkLogin(String username, String password) {
        String sql = "SELECT * FROM ACCOUNT WHERE userName = ? AND password = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            st.setString(1, username);
            st.setString(2, password);
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    public RegistrationDTO getDataAccount(String account, String password) {
        String sql = "SELECT * FROM ACCOUNT WHERE account = ? AND password = ?";
        PreparedStatement pre = null;
        ResultSet rs = null;

        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1, account);
            pre.setString(2, password);
            rs = pre.executeQuery();

            if (rs.next()) {
                return new RegistrationDTO(
                        rs.getInt("account_Id"),
                        rs.getInt("job_Id"),
                        rs.getString("userName"),
                        rs.getString("firstName"),
                        rs.getString("lastName"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getInt("role_Id")
                );
            }
        } catch (SQLException ex) {
            Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pre != null) {
                    pre.close();
                }
            } catch (SQLException e) {
                Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        return null;
    }
    public  void addUser(String acc, String pass, String fname, String lname, String Phone, String add){
        String sql = "insert into ACCOUNT (account,[password],phone,fullname,[address])\n"
                        + "                    values (?,?,?,?,?,?,?) ";
        PreparedStatement pre = null;
        ResultSet rs = null;

        try {
            pre = conn.prepareStatement(sql);
            pre.setString(0, rs.getCursorName());
            

            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        
    }
}
                
    


