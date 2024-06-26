/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Entity.Room;
import Model.DAORoom;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author GIGABYTE
 */
public class LoadRoomEvent extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
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
            out.println("<title>Servlet LoadRoomEvent</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoadRoomEvent at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String event_Id = request.getParameter("eventId");
        int id = Integer.parseInt(event_Id);
        DAORoom dao = new DAORoom();
        List<Room> list = dao.getRoomByEvent(id);
        for (Room o : list) {
            out.print("<div class=\"room col-lg-12 \" id=\"element\" style=\"display: flex; margin-bottom: 10px; margin-top: 20px\">\n"
                    + "                                                                                            <div class=\"col-lg-4\">\n"
                    + "                                                                                                <img src=\""+o.getImage()+"\" alt=\"alt\"/>\n"
                    + "                                                                                            </div>\n"
                    + "                                                                                            <div class=\"col-lg-3\">"+o.getName()+"</div>\n"
                    + "                                                                                            <div class=\"col-lg-3\">"+o.getPrice()+"đ</div>\n"
                    + "                                                                                            <div class=\"col-lg-2\"><button class=\"btn btn\" style=\"background-color: #C59B24; color: white; margin-left: 10px\"><a style=\"color: white\" href=\"cartController?action=post&id=\">Select Room</a></button></div>\n"
                    + "                                                                                        </div>\n"
                    + "                                                                                        <hr>");
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
