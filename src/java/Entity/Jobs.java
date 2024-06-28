/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

import java.util.Date;

/**
 *
 * @author PC QUANG MINH
 */
public class Jobs {
   private int job_Id; 
private String firstName ;
private String lastName ;
private Date dateOfBirth ; 
private String phone ;
private String emailPersonal ;
private String cv ;
private String status ;

    public Jobs() {
    }

    public Jobs(int job_Id, String firstName, String lastName, Date dateOfBirth, String phone, String emailPersonal, String cv, String status) {
        this.job_Id = job_Id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.dateOfBirth = dateOfBirth;
        this.phone = phone;
        this.emailPersonal = emailPersonal;
        this.cv = cv;
        this.status = status;
    }

    public int getJob_Id() {
        return job_Id;
    }

    public void setJob_Id(int job_Id) {
        this.job_Id = job_Id;
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

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmailPersonal() {
        return emailPersonal;
    }

    public void setEmailPersonal(String emailPersonal) {
        this.emailPersonal = emailPersonal;
    }

    public String getCv() {
        return cv;
    }

    public void setCv(String cv) {
        this.cv = cv;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Jobs{" + "job_Id=" + job_Id + ", firstName=" + firstName + ", lastName=" + lastName + ", dateOfBirth=" + dateOfBirth + ", phone=" + phone + ", emailPersonal=" + emailPersonal + ", cv=" + cv + ", status=" + status + '}';
    }

}
