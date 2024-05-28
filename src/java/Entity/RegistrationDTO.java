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
    
    
}
