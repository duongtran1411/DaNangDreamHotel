/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Entity.Jobs;
import Model.DAOJobs;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.File;
import java.util.List;

/**
 *
 * @author PC QUANG MINH
 */
@WebServlet(name="ManagerJobsController", urlPatterns={"/ManagerJobsControllerURL"})
public class ManagerJobsController extends HttpServlet {
   
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
            out.println("<title>Servlet ManagerJobsController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManagerJobsController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

/*
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
     DAOJobs dao=new DAOJobs();
    List<Jobs>listC  = dao.getAllJobs();
    request.setAttribute("listC", listC);
    request.getRequestDispatcher("dashboard/jsp/ManageJobs.jsp").forward(request, response);
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
    String action = request.getParameter("action");
    if (action != null) {
        if (action.equals("accept")) {
            int jobId = Integer.parseInt(request.getParameter("id"));
            // Gọi phương thức trong DAO để xử lý việc accept công việc có jobId
            DAOJobs dao = new DAOJobs();
            dao.acceptJob(jobId);
        } else if (action.equals("reject")) {
            int jobId = Integer.parseInt(request.getParameter("id"));
            // Gọi phương thức trong DAO để xử lý việc reject công việc có jobId
            DAOJobs dao = new DAOJobs();
            dao.rejectJob(jobId);
        }else {
              int jobId = Integer.parseInt(request.getParameter("id"));
            // Gọi phương thức trong DAO để xử lý việc reject công việc có jobId
            DAOJobs dao = new DAOJobs();
          dao.waitJob(jobId);
        }
    }
    // Sau khi xử lý xong, chuyển hướng lại đến trang ManageJobs.jsp hoặc trang khác
    response.sendRedirect("ManagerJobsControllerURL");
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
