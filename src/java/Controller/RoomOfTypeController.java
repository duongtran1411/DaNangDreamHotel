/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Entity.FormatUtils;
import Entity.Room;
import Model.DAORoom;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author GIGABYTE
 */
@WebServlet(name = "RoomOfTypeController", urlPatterns = {"/roomOfTypeController"})
public class RoomOfTypeController extends HttpServlet {

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
            out.println("<title>Servlet RoomOfTypeController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RoomOfTypeController at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String type = request.getParameter("type");
        DAORoom dao = new DAORoom();
        int numberType = Integer.parseInt(type);
        int size = dao.countRoom();
        FormatUtils format = new FormatUtils();
        List<Room> list = dao.getRoomByType(size, numberType);
        for (Room o : list) {
            out.println("<div class=\"room col-lg-4 col-md-6\">\n"
                    + "                            <div class=\"room-item \" id=\"item\">\n"
                    + "                                <img src=\"" + o.getImage() + "\" alt=\"\" style=\"height: 240px\">\n"
                    + "                                <div class=\"ri-text\" style=\"height:450px\">\n"
                    + "                                    <h4>" + o.getName() + "</h4>\n"
                    + "                                    <h3>" + format.formatPRice(o.getPrice())+ " VND<span>/Pernight</span></h3>\n"
                    + "                                    <table>\n"
                    + "                                        <tbody>\n"
                    + "                                            <tr>\n"
                    + "                                                <td class=\"r-o\">Size:</td>\n"
                    + "                                                <td>" + o.getSize() + "</td>\n"
                    + "                                            </tr>\n"
                    + "                                            <tr>\n"
                    + "                                                <td class=\"r-o\">Capacity:</td>\n"
                    + "                                                <td>" + o.getPeople() + "</td>\n"
                    + "                                            </tr>\n"
                    + "                                            <tr>\n"
                    + "                                                <td class=\"r-o\">Bed:</td>\n"
                    + "                                                <td>" + o.getBed() + "</td>\n"
                    + "                                            </tr>\n"
                    + "                                            <tr>\n"
                    + "                                                <td class=\"r-o\">Bath:</td>\n"
                    + "                                                <td>" + o.getBath() + "</td>\n"
                    + "                                            </tr>\n"
                    + "                                            <tr>\n"
                    + "                                                <td class=\"r-o\">Services:</td>\n"
                    + "                                                <td>Wifi, Television, Bathroom,...</td>\n"
                    + "                                            </tr>\n"
                    + "                                        </tbody>\n"
                    + "                                    </table>\n"
                    + "                                    <a href=\"roomDetailsController?Id=" + o.getRoom_Id() + "\" class=\"primary-btn\">More Details</a>\n"
                    + "                                </div>\n"
                    + "                            </div>\n"
                    + "                        </div> ");
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
