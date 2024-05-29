/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Entity.RegistrationDTO;
import jakarta.servlet.http.HttpSession;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.annotation.WebServlet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class RegistrationDAO extends DBConnect {

    public boolean checkLogin(String email, String password) {
        String sql = "SELECT * FROM ACCOUNT WHERE username = ? AND password = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            st.setString(1, email);
            st.setString(2, password);
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    public RegistrationDTO getDataAccount(String username, String password) {
        String sql = "SELECT * FROM ACCOUNT WHERE username = ? AND password = ?";
        PreparedStatement pre = null;
        ResultSet rs = null;

        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1, username);
            pre.setString(2, password);
            rs = pre.executeQuery();

            if (rs.next()) {
                return new RegistrationDTO(
                        rs.getString("acoount_Id"),
                        rs.getString("job_Id"),
                        rs.getString("userName"),
                        rs.getString("firstName"),
                        rs.getString("lastName"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getString("role_Id")
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
    public  void addUser(String acoount_Id, String job_Id, String userName, String firstName, String lastName, String password, String email,String Phone){
        String sql = "insert Stringo ACCOUNT (account,[password],phone,fullname,[address])\n"
                        + "                    values (?,?,?,?,?,?,?,?) ";
        PreparedStatement pre = null;
        ResultSet rs = null;

        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1, acoount_Id);
            pre.setString(2, job_Id);
            pre.setString(3, userName);
            pre.setString(4, firstName);
            pre.setString(5, lastName);
            pre.setString(6,password);
            pre.setString(7, email);
            pre.setString(8, Phone);
            

            pre.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        
    }
}
                
    


