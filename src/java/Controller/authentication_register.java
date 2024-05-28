/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Entity.RegistrationDTO;
import Model.RegistrationDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Pattern;

/**
 *
 * @author letua
 */
public class authentication_register extends HttpServlet {
   
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
            out.println("<title>Servlet authentication_register</title>");  
            out.println("</head>");
            out.println("<body>");
            response.setContentType("text/html;charset=UTF-8");

        String account = request.getParameter("acc");
        String password = request.getParameter("pass");
        String rePass = request.getParameter("repass");
        String fullname = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
            RegistrationDTO user = new RegistrationDTO();

        String emailPattern = "^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}$";
        boolean isEmailValid = Pattern.matches(emailPattern, account);

        if (!isEmailValid) {
            request.setAttribute("mess", "Invalid email format !! Ex : example@example.com ");
            request.getRequestDispatcher("signUP.jsp").forward(request, response);
        } else if (!password.equals(rePass)) {
            request.setAttribute("mess", "Nhập lại mật khẩu không giống nhau");
            request.getRequestDispatcher("signUP.jsp").forward(request, response);
        } else if (password.length() < 3) {
            request.setAttribute("mess", "Password must be at least 3 characters long");
            request.getRequestDispatcher("signUP.jsp").forward(request, response);
        } else if (!phone.matches("[0-9]*")) {
            request.setAttribute("mess", "Your Mobile Invalid");
            request.getRequestDispatcher("signUP.jsp").forward(request, response);
        }
        RegistrationDAO dao = new RegistrationDAO();
        request.setAttribute("mess", "Tạo Tài khoản thành công   !! ");
        RequestDispatcher rd = request.getRequestDispatcher("signUP.jsp");
        rd.forward(request, response);
            out.println("<h1>Servlet authentication_register at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
            try {
            dao.addUser(account, rePass, fullname, fullname, phone, address);
        } catch (Exception ex) {
                System.out.println(ex);   
        }
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
        processRequest(request, response);
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
