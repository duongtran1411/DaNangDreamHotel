package Model;

import Entity.JobDTO;
import Model.DBConnect;
import Entity.RegistrationDTO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class RegistrationDAO extends DBConnect {

    public boolean checkLogin(String username, String password) {
        String sql = "SELECT * FROM ACCOUNT WHERE username = ? AND password = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, username);
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

    public String GetRoleId(String username, String password) {
        String sql = "SELECT role_id FROM account WHERE username = ? AND password = ?";
        String role = null;
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                role = rs.getString("role_id");
                System.out.println(role);
            }
        } catch (SQLException e) {
            Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return role;
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
    public void AddJob(JobDTO jobDTO) {
        String sql="insert into jobs values(?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, jobDTO.getJob_Id());
            st.setString(2, jobDTO.getFirstName());
            st.setString(3, jobDTO.getLastName());
            st.setString(4, jobDTO.getDateOfBirth());
            st.setString(5, jobDTO.getPhone());
            st.setString(6, jobDTO.getEmailPersonal());
            st.setString(7, jobDTO.getStatus());

            int rowAffected = st.executeUpdate();

            if (rowAffected > 0) {
                System.out.println("Một bản ghi công việc mới đã được thêm thành công!");
            }
        }catch (SQLException e){
            Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null , e);
        }
    }
    public void AddAcc(RegistrationDTO registrationDTO) {
        String sql = "INSERT INTO account VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?,?,?)";
        try (
                PreparedStatement st = conn.prepareStatement(sql)) {

            st.setString(1, registrationDTO.getAccount_Id());
            st.setInt(2, registrationDTO.getJob_Id());
            st.setString(3, registrationDTO.getUserName());
            st.setString(4, registrationDTO.getFirstName());
            st.setString(5, registrationDTO.getLastName());
            st.setString(6, registrationDTO.getPassword());
            st.setString(7, registrationDTO.getEmail());
            st.setString(8, registrationDTO.getPhone());
            st.setString(9, registrationDTO.getRole_Id());
            st.setString(10, registrationDTO.getCreate_at());
            st.setString(11, registrationDTO.getUpdate_at());

            int rowAffected = st.executeUpdate();

            if (rowAffected > 0) {
                System.out.println("Một bản ghi công việc mới đã được thêm thành công!");
            }

        } catch (SQLException e) {
            Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null , e);
        }
    }
    public void deleteJob(int jobId) {
        String sql = "DELETE FROM jobs WHERE job_Id = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, jobId);

            int rowsDeleted = st.executeUpdate();
            if (rowsDeleted > 0) {
                System.out.println("Job with ID " + jobId + " deleted successfully.");
            } else {
                System.out.println("No job found with ID " + jobId + ". Nothing deleted.");
            }
        } catch (SQLException e) {
            Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public List<JobDTO> getAllJobs() {
        List<JobDTO> jobs = new ArrayList<>();
        String sql = "SELECT * FROM jobs";
        try (PreparedStatement st = conn.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                JobDTO job = new JobDTO(
                        rs.getInt("job_Id"),
                        rs.getString("firstName"),
                        rs.getString("lastName"),
                        rs.getString("dateOfBirth"),
                        rs.getString("phone"),
                        rs.getString("emailPersonal"),
                        rs.getString("status")
                );
                jobs.add(job);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return jobs;
    }

    public boolean StatusJob(String job_Id, String firstName, String lastName) {
        String sql = "SELECT * FROM jobs WHERE job_Id = ? AND firstName = ? AND lastName = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, job_Id);
            st.setString(2, firstName);
            st.setString(3, lastName);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String status = rs.getString("status");
                return true;
            }
        } catch (SQLException e) {
            Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }


    public static void main(String[] args) {
        RegistrationDAO dao = new RegistrationDAO();
       RegistrationDTO acc = new RegistrationDTO("2", 1, "lehai", "Le", "Hai", "1234", "lem29000@gmail.com", "0123456789", "1","1990-01-01","1990-01-01");
        dao.AddAcc(acc);
    }
}