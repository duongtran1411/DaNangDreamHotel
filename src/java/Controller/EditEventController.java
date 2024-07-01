/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Entity.Event;
import Model.DAOEvent;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author PC QUANG MINH
 */
@WebServlet(name="EditEventController", urlPatterns={"/EditEventControllerURL"})
public class EditEventController extends HttpServlet {
   
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
            out.println("<title>Servlet EditEventController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditEventController at " + request.getContextPath () + "</h1>");
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
        DAOEvent dao=new DAOEvent();
        String id_raw=request.getParameter("id");
        int id;
        try {
            id=Integer.parseInt(id_raw);
             Event e=dao.getEventById(id);
             if(e!=null){
                     request.setAttribute("event", e);
        request.getRequestDispatcher("EditEvent.jsp").forward(request, response);
             }
        } catch (Exception e) {
        }
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
        String name = request.getParameter("name");
        String image = request.getParameter("image");
        String description = request.getParameter("description");
        String discount_raw = request.getParameter("discount");
        String voucher = request.getParameter("voucher");
        String id_raw = request.getParameter("event_Id");
        DAOEvent dao = new DAOEvent();

        try {
            int id = Integer.parseInt(id_raw);
            double discount = Double.parseDouble(discount_raw);
            String createAtString = request.getParameter("start");
            String updateAtString = request.getParameter("end");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

            Date createDate = sdf.parse(createAtString);
            Date updateDate = sdf.parse(updateAtString);
            java.sql.Date create_at = new java.sql.Date(createDate.getTime());
            java.sql.Date update_at = new java.sql.Date(updateDate.getTime());

            // Log details

            dao.editEvent(name, image, create_at, update_at, description, discount, voucher, id);
            response.sendRedirect("ManageEventControllerURL");

        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid format for numeric fields");
        } catch (ParseException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid date format");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Server error");
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
