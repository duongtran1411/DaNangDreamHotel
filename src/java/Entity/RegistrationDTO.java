/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

/**
 *
 * @author letua
 */
public class RegistrationDTO {
    private int account_Id;
    private int job_Id;
    private String userName;
    private String firstName;
    private String lastName;
    private String email;
    private String phone;
    private int role_Id;

    public RegistrationDTO() {
    }

    public RegistrationDTO(int account_Id, int job_Id, String userName, String firstName, String lastName, String email, String phone, int role_Id) {
        this.account_Id = account_Id;
        this.job_Id = job_Id;
        this.userName = userName;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
        this.role_Id = role_Id;
    }

    public int getAccount_Id() {
        return account_Id;
    }

    public void setAccount_Id(int account_Id) {
        this.account_Id = account_Id;
    }

    public int getJob_Id() {
        return job_Id;
    }

    public void setJob_Id(int job_Id) {
        this.job_Id = job_Id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getRole_Id() {
        return role_Id;
    }

    public void setRole_Id(int role_Id) {
        this.role_Id = role_Id;
    }
    
    
}
