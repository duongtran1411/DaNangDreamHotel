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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author GIGABYTE
 */
public class ServiceStatusController extends HttpServlet {

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
            out.println("<title>Servlet ServiceStatusController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServiceStatusController at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");
        DAORoom dao = new DAORoom();
        List<Room> list = new ArrayList<>();
        if (action.equals("type")) {
            String type = request.getParameter("typeId");
            int typeId = Integer.parseInt(type);
            list = dao.getRoomByTypeRoom(typeId);
            for (Room o : list) {
                out.print("<div class=\"col-lg-3 col-md-6  justify-content-center\" style=\"padding: 10px 0px;display: flex; width: 100px;height: 300px\">\n"
                        + "                            <div class=\"room-item\" style=\"border: 1.5px solid gainsboro; border-radius: 15px; overflow: hidden; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.4); position: relative;\">\n"
                        + "                                <div class=\"ri-text\" style=\"padding: 10px; text-align: left; width: 100%;\">\n"
                        + "                                    <img src=\"" + o.getImage() + "\" style=\"width:300px; height: 202px; border-radius: 15px 15px 0 0;\" alt=\"\">\n"
                        + "                                    <h4 class=\"text-center\" style=\"margin-bottom: 3px\">" + o.getName() + "</h4>\n"
                        + "                                    <div class=\"content-icon d-flex align-items-between justify-content-between\" style=\"font-size: 0.95rem;\">\n"
                        + "                                        <div style=\"display: flex; align-items: center; justify-content: center; margin-top: 10px;\">\n"
                        + "                                            <i class=\"fa fa-users\" aria-hidden=\"true\" style=\"margin-right: 8px; font-size: 1.2em;\"></i>\n"
                        + "                                            <c:if test=\"${" + o.getPeople() + " == 1}\">\n"
                        + "                                                <span>" + o.getPeople() + " Person</span>\n"
                        + "                                            </c:if>\n"
                        + "                                            <c:if test=\"${" + o.getPeople() + " > 1}\">\n"
                        + "                                                <span>" + o.getPeople() + " People</span>\n"
                        + "                                            </c:if>\n"
                        + "                                        </div>\n"
                        + "                                        <div style=\"display: flex; align-items: center; justify-content: center; margin-top: 10px;\">\n"
                        + "                                            <i class=\"fa fa-bed\" aria-hidden=\"true\" style=\"margin-right: 8px; font-size: 1.2em;\"></i>\n"
                        + "                                            <c:if test=\"${" + o.getPeople() + " == 1}\">\n"
                        + "                                                <span>" + o.getBed() + " Bed</span>\n"
                        + "                                            </c:if>\n"
                        + "                                            <c:if test=\"${" + o.getBed() + " > 1}\">\n"
                        + "                                                <span>" + o.getBed() + " Beds</span>\n"
                        + "                                            </c:if>\n"
                        + "                                        </div>\n"
                        + "                                        <div style=\"display: flex; align-items: center; justify-content: center; margin-top: 10px;\">\n"
                        + "                                            <i class=\"fa fa-bath\" aria-hidden=\"true\" style=\"margin-right: 8px; font-size: 1.2em;\"></i>\n"
                        + "                                            <c:if test=\"${" + o.getBath() + " == 1}\">\n"
                        + "                                                <span>" + o.getBath() + " Bath</span>\n"
                        + "                                            </c:if>\n"
                        + "                                            <c:if test=\"${" + o.getBath() + " > 1}\">\n"
                        + "                                                <span>" + o.getBath() + " Baths</span>\n"
                        + "                                            </c:if>             \n"
                        + "                                        </div>\n"
                        + "                                    </div>\n"
                        + "                                </div>\n"
                        + "                            </div>\n"
                        + "                        </div>");
            }
        }

        if (action.equals("floor")) {
            int floorId = Integer.parseInt(request.getParameter("floorId"));
            list = dao.getRoomByFloor(floorId);
            for (Room o : list) {
                out.print("<div class=\"col-lg-3 col-md-6  justify-content-center\" style=\"padding: 10px 0px;display: flex; width: 100px;height: 300px\">\n"
                        + "                            <div class=\"room-item\" style=\"border: 1.5px solid gainsboro; border-radius: 15px; overflow: hidden; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.4); position: relative;\">\n"
                        + "                                <div class=\"ri-text\" style=\"padding: 10px; text-align: left; width: 100%;\">\n"
                        + "                                    <img src=\"" + o.getImage() + "\" style=\"width:300px; height: 202px; border-radius: 15px 15px 0 0;\" alt=\"\">\n"
                        + "                                    <h4 class=\"text-center\" style=\"margin-bottom: 3px\">" + o.getName() + "</h4>\n"
                        + "                                    <div class=\"content-icon d-flex align-items-between justify-content-between\" style=\"font-size: 0.95rem;\">\n"
                        + "                                        <div style=\"display: flex; align-items: center; justify-content: center; margin-top: 10px;\">\n"
                        + "                                            <i class=\"fa fa-users\" aria-hidden=\"true\" style=\"margin-right: 8px; font-size: 1.2em;\"></i>\n"
                        + "                                            <c:if test=\"${" + o.getPeople() + " == 1}\">\n"
                        + "                                                <span>" + o.getPeople() + " Person</span>\n"
                        + "                                            </c:if>\n"
                        + "                                            <c:if test=\"${" + o.getPeople() + " > 1}\">\n"
                        + "                                                <span>" + o.getPeople() + " People</span>\n"
                        + "                                            </c:if>\n"
                        + "                                        </div>\n"
                        + "                                        <div style=\"display: flex; align-items: center; justify-content: center; margin-top: 10px;\">\n"
                        + "                                            <i class=\"fa fa-bed\" aria-hidden=\"true\" style=\"margin-right: 8px; font-size: 1.2em;\"></i>\n"
                        + "                                            <c:if test=\"${" + o.getPeople() + " == 1}\">\n"
                        + "                                                <span>" + o.getBed() + " Bed</span>\n"
                        + "                                            </c:if>\n"
                        + "                                            <c:if test=\"${" + o.getBed() + " > 1}\">\n"
                        + "                                                <span>" + o.getBed() + " Beds</span>\n"
                        + "                                            </c:if>\n"
                        + "                                        </div>\n"
                        + "                                        <div style=\"display: flex; align-items: center; justify-content: center; margin-top: 10px;\">\n"
                        + "                                            <i class=\"fa fa-bath\" aria-hidden=\"true\" style=\"margin-right: 8px; font-size: 1.2em;\"></i>\n"
                        + "                                            <c:if test=\"${" + o.getBath() + " == 1}\">\n"
                        + "                                                <span>" + o.getBath() + " Bath</span>\n"
                        + "                                            </c:if>\n"
                        + "                                            <c:if test=\"${" + o.getBath() + " > 1}\">\n"
                        + "                                                <span>" + o.getBath() + " Baths</span>\n"
                        + "                                            </c:if>             \n"
                        + "                                        </div>\n"
                        + "                                    </div>\n"
                        + "                                </div>\n"
                        + "                            </div>\n"
                        + "                        </div>");
            }
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
