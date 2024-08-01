/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Entity.Event;
import Entity.Jobs;
import Entity.Room;
import Model.DBConnect;
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

public class DAOJobs extends DBConnect {

    public List<Jobs> getAllJobs() {
        List<Jobs> list = new ArrayList<>();
        String sql = "SELECT * FROM Jobs WHERE is_deleted = false ";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Jobs(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getDate(4),rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getString(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOJobs.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

 
    public void insertJobs( String firstname, String lastname, Date dob, String phone, String email,String cv) {
        String sql = "insert into Jobs(\n"
                + "firstName ,\n"
                + "lastName , \n"
                + "dateOfBirth ,\n"
                + "phone ,\n"
                + "emailPersonal ,\n"
                + "cv )\n"
                + "values(?,?,?,?,?,?)";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, firstname);
            st.setString(2, lastname);
            st.setDate(3, (java.sql.Date) dob);
            st.setString(4, phone);
            st.setString(5, email);
            st.setString(6, cv);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public Jobs getEmailByID(int id ){
        String email = null;
        String sql ="select emailPersonal, firstName, lastName,dateOfBirth, phone, cv from jobs\n" +
"where job_Id = ?";
        PreparedStatement pre;
        try {
            pre = conn.prepareCall(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            if(rs.next()){
                return new  Jobs(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDate(2),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOJobs.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Jobs getLastJobs() {
        String sql = "SELECT *\n"
                + "                FROM Jobs e\n"
                + "                ORDER BY job_Id DESC\n"
                + "                LIMIT 1";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {  // Use if instead of while since we expect only one result
                return new Jobs(rs.getInt("job_Id"),
                        rs.getString("firstName"),
                        rs.getString("lastName"), rs.getDate("dateOfBirth"), rs.getString("phone"),
                        rs.getString("emailPersonal"),
                        rs.getString("cv"), rs.getString("status")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Print stack trace for better error understanding
        }
        return null;  // Return null if no account is found
    }
 public void acceptJob(int jobId) {
        try {
            String query = "UPDATE jobs SET status = 'Accepted' WHERE job_id = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, jobId);
            ps.executeUpdate();
            // Đóng các tài nguyên (Connection, PreparedStatement, ...)
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
 public void waitJob(int jobId) {
        try {
            String query = "UPDATE jobs SET status = 'Wait' WHERE job_id = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, jobId);
            ps.executeUpdate();
            // Đóng các tài nguyên (Connection, PreparedStatement, ...)
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
 public void rejectJob(int id) {
    String sql = "UPDATE Jobs SET is_deleted = ? WHERE job_Id = ?";
    try {
        PreparedStatement st = conn.prepareStatement(sql);
        st.setBoolean(1, true);
        st.setInt(2, id);
        st.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
    public static void main(String[] args) {
        String createAtString ="2024-06-05";

    // Define the date format
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    // Parse the date strings
    java.sql.Date create_at = null;
    try {
       java.util.Date createDate = sdf.parse(createAtString);
        create_at = new java.sql.Date(createDate.getTime());
   } catch (ParseException e) {
        e.printStackTrace();
        return;
    }
        DAOJobs dao = new DAOJobs();
     dao.insertJobs("duong","tran", create_at, "0330222390", "trandaiduong14112000@gmail.com", "assdasdasdasd");
    
    }

    
}

