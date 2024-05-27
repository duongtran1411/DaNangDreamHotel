/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Entity.RegistrationDTO;
import Model.RegistrationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.regex.Pattern;

/**
 *
 * @author letua
 */
public class authentication_login extends HttpServlet {
   
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
            out.println("<title>Servlet authentication_login</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet authentication_login at " + request.getContextPath () + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            // String url = Login_Page;
            String button = request.getParameter("btAction");
            String username = request.getParameter("txtUsername");
            String password = request.getParameter("txtPassword");

            String r = request.getParameter("remember");

            String emailPattern = "^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}$";
            boolean isEmailValid = Pattern.matches(emailPattern, username);

            // tao 3 cookie  cookieU  , cookieP  , cookieR
            Cookie cookieU = new Cookie("cUser", username);
            Cookie cookieP = new Cookie("cPass", password);
            Cookie cookieR = new Cookie("cRem", r);
            if (r != null) {
                cookieU.setMaxAge(60 * 60 * 24);  // 1 day  
                cookieP.setMaxAge(60 * 60 * 24);
                cookieR.setMaxAge(60 * 60 * 24);

            } else {
                cookieU.setMaxAge(0);
                cookieP.setMaxAge(0);
                cookieR.setMaxAge(0);

            }
            response.addCookie(cookieU);
            response.addCookie(cookieP);
            response.addCookie(cookieR);
            // save browser 

            try {

                RegistrationDAO dao = new RegistrationDAO();
                boolean result = dao.checkLogin(username, password);

                RegistrationDTO a = dao.getDataAccount(username, password);
                if (!isEmailValid) {
                    request.setAttribute("mess1", "Invalid email format !! Ex : example@example.com ");
                    request.getRequestDispatcher("dashboard/jsp/authentication-login.jsp").forward(request, response);
                } else if (result) {
                    HttpSession session = request.getSession();
                    session.setAttribute("acc", a);
                    request.getRequestDispatcher("index.jsp").forward(request, response);

                }// End if username and password matched
                else {
                    request.setAttribute("mess1", " Sai Account hoặc Password ");
                    request.getRequestDispatcher("dashboard/jsp/authentication-login.jspp").forward(request, response);
                }

            } catch (SQLException ex) {
                ex.printStackTrace();
            } catch (ClassNotFoundException ex) {
                ex.printStackTrace();
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
