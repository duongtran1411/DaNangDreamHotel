/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Entity.Customer;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author CaoTung
 */
public class DAOCustomer extends DBConnect{
    public List<Customer> getAllCustomer() {
        List<Customer> list = new ArrayList();
        String sql = "select * from customer";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Customer customer = new Customer();
                customer.customerId = rs.getInt("customer_Id");
                customer.firstName = rs.getString("firstName");
                customer.lastName = rs.getString("lastName");
                customer.phoneNumber = rs.getString("phone");
                customer.email = rs.getString("email");
                customer.idCard = rs.getString("idCard");
                list.add(customer);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public Customer getCustomerById(int id) {
        Customer cus = new Customer();
        String sql = "select * from customer "
                + "where customer_Id = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while(rs.next()){
                cus.setCustomerId(rs.getInt(1));
                cus.setFirstName(rs.getString(2));
                cus.setLastName(rs.getString(3));
                cus.setPhoneNumber(rs.getString(4));
                cus.setEmail(rs.getString(5));
                cus.setIdCard(rs.getString(6));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cus;
}
    
    public void insertCustomer(String firstName, String lastName, String phoneNumber, String email, String idCard) {
        String sql = "insert into customer(firstName, lastName, phone,email,idCard) values(\n"
                + "	?,?,?,?,?\n"
                + ")";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, firstName);
            pre.setString(2, lastName);
            pre.setString(3, phoneNumber);
            pre.setString(4, email);
            pre.setString(5, idCard);
            pre.execute();
        } catch (SQLException e) {
            System.out.println("Error at inserption e) {\n" +
"            System.out.ptCustomer " + e.getMessage());
        }
    }
    public void updateCustomer(int id,String firstName, String lastName, String phoneNumber, String email, String idCard){
        String sql = "update customer "
                + "set firstName=?, lastName=?, phone=?, email=?, idCard=? "
                + "where customer_Id=?";
        try{
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(6, id);
            pre.setString(1, firstName);
            pre.setString(2, lastName);
            pre.setString(3, phoneNumber);
            pre.setString(4, email);
            pre.setString(5, idCard);
            pre.execute();
        }catch (SQLException e) {
            System.out.println("Error at updateCustomer " + e.getMessage());
        }
    }

    public void deleteCustomer(int id){
        String sql = "delete from customer "
                + "where customer_Id=?";
        try{
            PreparedStatement pre= conn.prepareStatement(sql);
            pre.setInt(1, id);
            pre.execute();
        }catch (SQLException e) {
            System.out.println("Error at deleteCustomer " + e.getMessage());
        }
    }
    public static void main(String[] args) {
        DAOCustomer dao = new DAOCustomer();
        List<Customer> list = dao.getAllCustomer();
        System.out.println(list);
    }
}