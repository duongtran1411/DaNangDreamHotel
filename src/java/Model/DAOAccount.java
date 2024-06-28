package Model;

import Entity.Account;
import Entity.Jobs;
import Entity.Role;
import Entity.Room;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOAccount extends DBConnect {

    public List<Account> getAllAccount() {
        List<Account> list = new ArrayList<>();
        String sql = "select a.account_Id,a.userName,a.firstName,a.lastName,a.email,a.password,a.phone,a.create_at,a.update_at,r.role_Id,r.name from Account a\n"
                + "            join role r on a.role_Id=r.role_Id ;";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setAccount_Id(rs.getInt("account_Id"));
                a.setUserName(rs.getString("userName"));
                a.setFirstName(rs.getString("firstName"));
                a.setLastName(rs.getString("lastName"));
                a.setEmail(rs.getString("email"));
                a.setPassword(rs.getString("password"));
                a.setPhone(rs.getString("phone"));
                a.setCreate_at(rs.getDate("create_at"));
                a.setUpdate_at(rs.getDate("update_at"));
                a.setRoleId(new Role(rs.getInt("role_Id"), rs.getString("name")));
                list.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOAccount.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public Account getAccountbyID(int id) {
        String sql = "select a.account_Id,a.userName,a.firstName,a.lastName,a.email,a.password,a.phone from Account a\n"
                + "                join role r on a.role_Id=r.role_Id join jobs j on a.job_Id=j.job_Id\n"
                + "                where a.account_Id=?;";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setAccount_Id(rs.getInt("account_Id"));
                a.setUserName(rs.getString("userName"));
                a.setFirstName(rs.getString("firstName"));
                a.setLastName(rs.getString("lastName"));
                a.setPhone(rs.getString("phone"));
                a.setEmail(rs.getString("email"));
                a.setPassword(rs.getString("password"));
                return a;
            }
        } catch (SQLException e) {
            e.getStackTrace();
        }
        return null;
    }

    public void editAccount(String userName, String firstName, String lastName, String phone, String email, String password, int account_Id) {
        String sql = "update account\n"
                + "                set userName=?,\n"
                + "                firstName=?,\n"
                + "                lastName=?,\n"
                + "                phone=?,\n"
                + "                email=?,\n"
                + "                password=?\n"
                + "                where account_Id=?;";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, userName);
            st.setString(2, firstName);
            st.setString(3, lastName);
            st.setString(4, phone);
            st.setString(5, email);
            st.setString(6, password);
            st.setInt(7, account_Id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.getStackTrace();
        }
    }

    public void deleteAccountByID(int id) {
        String sql = "delete from Account where account_Id=?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.getStackTrace();
        }
    }

    public void insertAccount(int job_Id, String userName, String firstName, String lastName,
            String password, String email, String phone, int role_Id,
            java.sql.Date create_at, java.sql.Date update_at, int account_Id) {
        String sql = "INSERT INTO account (job_Id, userName, firstName, lastName, "
                + "password, email, phone, role_Id, create_at, update_at, account_Id) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, job_Id);
            st.setString(2, userName);
            st.setString(3, firstName);
            st.setString(4, lastName);
            st.setString(5, password);
            st.setString(6, email);
            st.setString(7, phone);
            st.setInt(8, role_Id);
            st.setDate(9, create_at);
            st.setDate(10, update_at);
            st.setInt(11, account_Id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Account getLastAccount() {
        String sql = "SELECT a.account_Id,a.userName, a.lastName, a.firstName, a.email, a.password, a.phone, a.create_at, a.update_at, ar.role_Id, ar.name, j.job_Id,j.dateOfBirth,j.emailPersonal,j.status,j.cv\n"
                + "FROM Account a \n"
                + "JOIN Role ar ON a.role_Id = ar.role_Id \n"
                + "JOIN Jobs j ON j.job_Id = a.job_Id\n"
                + "ORDER BY a.account_id DESC\n"
                + "LIMIT 1";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {  // Use if instead of while since we expect only one result
                return new Account(rs.getInt("account_Id"),
                        new Jobs(rs.getInt("job_Id"), rs.getString("firstName"), rs.getString("lastName"),
                                rs.getDate("dateOfBirth"), rs.getString("phone"), rs.getString("emailPersonal"),
                                rs.getString("cv"), rs.getString("status")),
                        rs.getString("userName"),
                        rs.getString("firstName"), rs.getString("lastName"), rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("phone"), new Role(rs.getInt("role_Id"), rs.getString("name")),
                        rs.getDate("create_at"), rs.getDate("update_at"));
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Print stack trace for better error understanding
        }
        return null;  // Return null if no account is found
    }

    public static void main(String[] args) {
        DAOAccount dao=new DAOAccount();
       Account a= dao.getLastAccount();
        String userName = "testuser";
        String firstName = "Test";
        String lastName = "User";
        String password = "password123";
        String email = "testuser@example.com";
        String phone = "1234567890";
        int roleId = 2;

      String createAtString ="2024-06-05";
    String updateAtString = "2024-06-05";

    // Define the date format
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    // Parse the date strings
    java.sql.Date create_at = null;
    java.sql.Date update_at = null;
    try {
        java.util.Date createDate = sdf.parse(createAtString);
        create_at = new java.sql.Date(createDate.getTime());

        java.util.Date updateDate = sdf.parse(updateAtString);
        update_at = new java.sql.Date(updateDate.getTime());
    } catch (ParseException e) {
        e.printStackTrace();
        return;
    }
        int accountId = 4;
        int jobId = a.getJobId().getJob_Id()+1;

        dao.insertAccount(jobId, userName, firstName, lastName, password, email, phone, roleId, create_at, update_at, accountId);
    }
}
