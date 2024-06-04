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
            st.setString(1, email);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    public boolean CheckDataEmail(String email) {
        String sql="SELECT * FROM ACCOUNT WHERE email = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
           if (rs.next()){
               return true;
           }

        } catch (SQLException ex) {
            Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
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
                        rs.getString("account_Id"),
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

    public void addUser(String account_Id, String job_Id, String userName, String firstName, String lastName, String password, String email, String phone) {
        String sql = "INSERT INTO ACCOUNT (account_Id, job_Id, userName, firstName, lastName, password, email, phone) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement pre = null;

        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1, account_Id);
            pre.setString(2, job_Id);
            pre.setString(3, userName);
            pre.setString(4, firstName);
            pre.setString(5, lastName);
            pre.setString(6, password);
            pre.setString(7, email);
            pre.setString(8, phone);

            pre.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                if (pre != null) {
                    pre.close();
                }
            } catch (SQLException e) {
                Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }
    }

    public boolean CheckPassExist(String email,String pass){
        String sql = "SELECT * FROM ACCOUNT WHERE email=? and password = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, pass);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        }catch (SQLException e){
            Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }
    public void UpdatePassReset(String email, String password) {
        String sql = "UPDATE ACCOUNT SET password = ? WHERE email = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, password);
            st.setString(2, email);

            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


    public static void main(String[] args) {
        RegistrationDAO dao = new RegistrationDAO();
        dao.UpdatePassReset("lem29140@gmail.com","123456");
    }
}
                
    


