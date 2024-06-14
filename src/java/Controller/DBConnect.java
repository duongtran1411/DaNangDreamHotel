package Controller;

import Model.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {

    public Connection conn;

    public DBConnect() {
        String url = "jdbc:mysql://localhost:3306/managerhotel";

        String userName = "root";
        String password = "duong1411";

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the connection
            conn = DriverManager.getConnection(url, userName, password);

            // If connection is successful
            System.out.println("Connection successful!");

            // Perform database operations
            // Close the connection
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("Driver not found!");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Connection failed!");
        }
    }

    public static void main(String[] args) {
        new DBConnect();
    }

}
