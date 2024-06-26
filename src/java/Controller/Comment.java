/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author letua
 */
public class Comment extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Comment</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Comment at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        // Lấy các tham số từ request
        String username = request.getParameter("username");
        String content = request.getParameter("content");
        int accountId = Integer.parseInt(request.getParameter("accountId"));
        int roomId = Integer.parseInt(request.getParameter("roomId"));

        // Kết nối đến cơ sở dữ liệu
        String url = "jdbc:mysql://localhost:3306/your_database_name";
        String user = "your_database_user";
        String password = "your_database_password";

        try {
            // Tải driver JDBC
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Tạo kết nối đến cơ sở dữ liệu
            Connection connection = DriverManager.getConnection(url, user, password);

            // Câu lệnh SQL để chèn bình luận vào cơ sở dữ liệu
            String sql = "INSERT INTO user_comments (username, content, account_Id, room_Id) VALUES (?, ?, ?, ?)";

            // Sử dụng PreparedStatement để thực thi câu lệnh SQL
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, content);
            stmt.setInt(3, accountId);
            stmt.setInt(4, roomId);

            // Thực thi câu lệnh SQL
            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                response.getWriter().println("A new comment was inserted successfully!");
            }

            // Đóng kết nối
            stmt.close();
            connection.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.getWriter().println("An error occurred: " + e.getMessage());
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
