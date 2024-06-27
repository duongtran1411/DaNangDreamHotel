package Model;

import Model.DBConnect;
import org.example.Model.RegistrationDTO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

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
        String sql = "SELECT * FROM ACCOUNT WHERE email = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
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
                        rs.getInt("job_Id"),
                        rs.getString("userName"),
                        rs.getString("firstName"),
                        rs.getString("lastName"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getString("role_Id"),
                        rs.getString("create_at"),
                        rs.getString("update_at")
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

    public boolean CheckPassExist(String email, String pass) {
        String sql = "SELECT * FROM ACCOUNT WHERE email=? and password = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, pass);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
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
        if(dao.checkLogin("TungNC", "123")){
            System.out.println("true");
        }else{
            System.out.println("false");
        }
    }
}
