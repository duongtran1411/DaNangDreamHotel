package Entity;

public class RegistrationDTO {

    private String account_Id;
    private int job_Id;
    private String userName;
    private String firstName;
    private String lastName;
    private String password;
    private String email;
    private String phone;
    private int role_Id;
    private String create_at;
    private String update_at;
    private String avatar;

    public RegistrationDTO() {
    }

    public RegistrationDTO(String account_Id, int job_Id, String userName, String firstName, String lastName, String password, String email, String phone, int role_Id, String create_at, String update_at) {
        this.account_Id = account_Id;
        this.job_Id = job_Id;
        this.userName = userName;
        this.firstName = firstName;
        this.lastName = lastName;
        this.password = password;
        this.email = email;
        this.phone = phone;
        this.role_Id = role_Id;
        this.create_at = create_at;
        this.update_at = update_at;
        this.avatar = avatar;
    }

    public RegistrationDTO(String string, int aInt, String string0, String string1, String string2, String string3, String string4, String string5, String string6, String string7, String string8) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getAccount_Id() {
        return account_Id;
    }

    public void setAccount_Id(String account_Id) {
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public String getCreate_at() {
        return create_at;
    }

    public void setCreate_at(String create_at) {
        this.create_at = create_at;
    }

    public String getUpdate_at() {
        return update_at;
    }

    public void setUpdate_at(String update_at) {
        this.update_at = update_at;
    }

    @Override
    public String toString() {
        return "RegistrationDTO{" + "account_Id=" + account_Id + ", job_Id=" + job_Id + ", userName=" + userName + ", firstName=" + firstName + ", lastName=" + lastName + ", password=" + password + ", email=" + email + ", phone=" + phone + ", role_Id=" + role_Id + ", create_at=" + create_at + ", update_at=" + update_at + ", avatar=" + avatar + '}';
    }

}
