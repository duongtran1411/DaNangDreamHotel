/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import Entity.RegistrationDTO;
import java.sql.Timestamp;
import Entity.Comment;
import Model.DAOComment;

/**
 *
 * @author letua
 */
public class addComment extends HttpServlet {
   
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
            out.println("<title>Servlet addComment</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addComment at " + request.getContextPath () + "</h1>");
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
        request.getRequestDispatcher("UserComment.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        RegistrationDTO acc = (RegistrationDTO) session.getAttribute("acc");
        if(session.getAttribute("acc") == null) {
            response.sendRedirect("dashboard/jsp/authentication-login.jsp");
        } else {
            String username = request.getParameter("username");
            String content = request.getParameter("content");
            int likesCount = Integer.parseInt(request.getParameter("rating"));
            int roomId = Integer.parseInt(request.getParameter("roomId"));
            Timestamp currentTime = new Timestamp(System.currentTimeMillis());

            Comment comment = new Comment();
            comment.setUsername(username);
            comment.setContent(content);
            comment.setCreatedAt(currentTime);
            comment.setUpdatedAt(currentTime);
            comment.setLikesCount(likesCount);
            comment.setStatus(""); // hoặc trạng thái khác mà bạn muốn
            comment.setAccountId(1); // Giả sử accountId là 1, bạn có thể thay thế bằng giá trị thực tế
            comment.setRoomId(roomId);

            DAOComment daoComment = new DAOComment();
            boolean success = daoComment.addComment(comment);

            if (success) {
                response.sendRedirect("detail?id=" + roomId); // Điều hướng lại trang chi tiết
            } else {
                response.getWriter().write("Failed to add comment.");
            }
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
