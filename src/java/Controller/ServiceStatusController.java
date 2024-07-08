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
import jakarta.servlet.http.HttpSession;
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
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        DAORoom dao = new DAORoom();
        List<Room> list = new ArrayList<>();
        if (action.equals("type")) {
            String type = request.getParameter("typeId");
            int typeId = Integer.parseInt(type);
            list = dao.getRoomByTypeRoom(typeId);
            for (Room o : list) {
                out.print("<div class=\"col-lg-3 col-md-6  justify-content-center element\">\n"
                        + "    <input value=\"" + o.getRoom_Id() + "\" type=\"hidden\" id=\"room-id\" class=\"RID\"/>\n");

                String maintenanceStatus = o.getMaintenance_status();

                if ("clean room".equals(maintenanceStatus)) {
                    out.print("<div class=\"room-item item-room clean-room\" style=\"background-color: #E7FAF5\">\n");
                    System.out.println("ok cleanroom");
                } else if ("fix room".equals(maintenanceStatus)) {
                    System.out.println(maintenanceStatus);
                    out.print("<div class=\"room-item item-room fix-room\" style=\"background-color: #FFEFF2\">\n");
                } else if ("dirty room".equals(maintenanceStatus)) {
                    System.out.println(maintenanceStatus);
                    out.print("<div class=\"room-item item-room dirty-room\" style=\"background-color: #FFF9EF\">\n");
                } else {
                    out.print("<div class=\"room-item item-room\">\n");
                    System.out.println("null case");
                }

                out.print("<div class=\"ri-text\">\n"
                        + "    <img src=\"" + o.getImage() + "\" alt=\"\" class=\"image-room\" id=\"unique-image\">\n"
                        + "    <h4 class=\"text-center name-room\" id=\"room-name\">\n"
                        + "        " + o.getName() + "\n"
                        + "    </h4>\n"
                        + "    <div class=\"content-icon d-flex align-items-between justify-content-between main-content\">\n"
                        + "        <div class=\"content-room\">\n"
                        + "            <i class=\"fa fa-users icon-room\" aria-hidden=\"true\"></i>\n");

                if (o.getPeople() == 1) {
                    out.print("            <span>" + o.getPeople() + " Person</span>\n");
                } else {
                    out.print("            <span>" + o.getPeople() + " People</span>\n");
                }

                out.print("        </div>\n"
                        + "        <div class=\"content-room\">\n"
                        + "            <i class=\"fa fa-bed icon-room\" aria-hidden=\"true\"></i>\n");

                if (o.getBed() == 1) {
                    out.print("            <span>" + o.getBed() + " Bed</span>\n");
                } else {
                    out.print("            <span>" + o.getBed() + " Beds</span>\n");
                }

                out.print("        </div>\n"
                        + "        <div class=\"content-room\">\n"
                        + "            <i class=\"fa fa-bath icon-room\" aria-hidden=\"true\"></i>\n");

                if (o.getBath() == 1) {
                    out.print("            <span>" + o.getBath() + " Bath</span>\n");
                } else {
                    out.print("            <span>" + o.getBath() + " Baths</span>\n");
                }

                out.print("        </div>\n"
                        + "    </div>\n"
                        + "</div>\n"
                        + "</div>\n"
                        + "</div>");
            }
        }

        if (action.equals("floor")) {
            int floorId = Integer.parseInt(request.getParameter("floorId"));
            list = dao.getRoomByFloor(floorId);
            for (Room o : list) {
                out.print("<div class=\"col-lg-3 col-md-6  justify-content-center element\">\n"
                        + "    <input value=\"" + o.getRoom_Id() + "\" type=\"hidden\" id=\"room-id\" class=\"RID\"/>\n");

                String maintenanceStatus = o.getMaintenance_status();

                if ("clean room".equals(maintenanceStatus)) {
                    out.print("<div class=\"room-item item-room clean-room\" style=\"background-color: #E7FAF5\">\n");
                    System.out.println("ok cleanroom");
                } else if ("fix room".equals(maintenanceStatus)) {
                    System.out.println(maintenanceStatus);
                    out.print("<div class=\"room-item item-room fix-room\" style=\"background-color: #FFEFF2\">\n");
                } else if ("dirty room".equals(maintenanceStatus)) {
                    System.out.println(maintenanceStatus);
                    out.print("<div class=\"room-item item-room dirty-room\" style=\"background-color: #FFF9EF\">\n");
                } else {
                    out.print("<div class=\"room-item item-room\">\n");
                    System.out.println("null case");
                }

                out.print("<div class=\"ri-text\">\n"
                        + "    <img src=\"" + o.getImage() + "\" alt=\"\" class=\"image-room\" id=\"unique-image\">\n"
                        + "    <h4 class=\"text-center name-room\" id=\"room-name\">\n"
                        + "        " + o.getName() + "\n"
                        + "    </h4>\n"
                        + "    <div class=\"content-icon d-flex align-items-between justify-content-between main-content\">\n"
                        + "        <div class=\"content-room\">\n"
                        + "            <i class=\"fa fa-users icon-room\" aria-hidden=\"true\"></i>\n");

                if (o.getPeople() == 1) {
                    out.print("            <span>" + o.getPeople() + " Person</span>\n");
                } else {
                    out.print("            <span>" + o.getPeople() + " People</span>\n");
                }

                out.print("        </div>\n"
                        + "        <div class=\"content-room\">\n"
                        + "            <i class=\"fa fa-bed icon-room\" aria-hidden=\"true\"></i>\n");

                if (o.getBed() == 1) {
                    out.print("            <span>" + o.getBed() + " Bed</span>\n");
                } else {
                    out.print("            <span>" + o.getBed() + " Beds</span>\n");
                }

                out.print("        </div>\n"
                        + "        <div class=\"content-room\">\n"
                        + "            <i class=\"fa fa-bath icon-room\" aria-hidden=\"true\"></i>\n");

                if (o.getBath() == 1) {
                    out.print("            <span>" + o.getBath() + " Bath</span>\n");
                } else {
                    out.print("            <span>" + o.getBath() + " Baths</span>\n");
                }

                out.print("        </div>\n"
                        + "    </div>\n"
                        + "</div>\n"
                        + "</div>\n"
                        + "</div>");
            }
        }

        if (action.equals("arrive")) {
            String date = request.getParameter("date");
            list = dao.getRoomCheckIn(date);
            session.setAttribute("listArrive", list.size());
            for (Room o : list) {
                out.print("<div class=\"col-lg-3 col-md-6  justify-content-center element\">\n"
                        + "    <input value=\"" + o.getRoom_Id() + "\" type=\"hidden\" id=\"room-id\" class=\"RID\"/>\n");

                String maintenanceStatus = o.getMaintenance_status();

                if ("clean room".equals(maintenanceStatus)) {
                    out.print("<div class=\"room-item item-room clean-room\" style=\"background-color: #E7FAF5\">\n");
                    System.out.println("ok cleanroom");
                } else if ("fix room".equals(maintenanceStatus)) {
                    System.out.println(maintenanceStatus);
                    out.print("<div class=\"room-item item-room fix-room\" style=\"background-color: #FFEFF2\">\n");
                } else if ("dirty room".equals(maintenanceStatus)) {
                    System.out.println(maintenanceStatus);
                    out.print("<div class=\"room-item item-room dirty-room\" style=\"background-color: #FFF9EF\">\n");
                } else {
                    out.print("<div class=\"room-item item-room\">\n");
                    System.out.println("null case");
                }

                out.print("<div class=\"ri-text\">\n"
                        + "    <img src=\"" + o.getImage() + "\" alt=\"\" class=\"image-room\" id=\"unique-image\">\n"
                        + "    <h4 class=\"text-center name-room\" id=\"room-name\">\n"
                        + "        " + o.getName() + "\n"
                        + "    </h4>\n"
                        + "    <div class=\"content-icon d-flex align-items-between justify-content-between main-content\">\n"
                        + "        <div class=\"content-room\">\n"
                        + "            <i class=\"fa fa-users icon-room\" aria-hidden=\"true\"></i>\n");

                if (o.getPeople() == 1) {
                    out.print("            <span>" + o.getPeople() + " Person</span>\n");
                } else {
                    out.print("            <span>" + o.getPeople() + " People</span>\n");
                }

                out.print("        </div>\n"
                        + "        <div class=\"content-room\">\n"
                        + "            <i class=\"fa fa-bed icon-room\" aria-hidden=\"true\"></i>\n");

                if (o.getBed() == 1) {
                    out.print("            <span>" + o.getBed() + " Bed</span>\n");
                } else {
                    out.print("            <span>" + o.getBed() + " Beds</span>\n");
                }

                out.print("        </div>\n"
                        + "        <div class=\"content-room\">\n"
                        + "            <i class=\"fa fa-bath icon-room\" aria-hidden=\"true\"></i>\n");

                if (o.getBath() == 1) {
                    out.print("            <span>" + o.getBath() + " Bath</span>\n");
                } else {
                    out.print("            <span>" + o.getBath() + " Baths</span>\n");
                }

                out.print("        </div>\n"
                        + "    </div>\n"
                        + "</div>\n"
                        + "</div>\n"
                        + "</div>");
            }
        }

        if (action.equals("leave")) {
            String date = request.getParameter("date");
            list = dao.getRoomCheckOut(date);

            for (Room o : list) {
                out.print("<div class=\"col-lg-3 col-md-6  justify-content-center element\">\n"
                        + "    <input value=\"" + o.getRoom_Id() + "\" type=\"hidden\" id=\"room-id\" class=\"RID\"/>\n");

                String maintenanceStatus = o.getMaintenance_status();

                if ("clean room".equals(maintenanceStatus)) {
                    out.print("<div class=\"room-item item-room clean-room\" style=\"background-color: #E7FAF5\">\n");
                    System.out.println("ok cleanroom");
                } else if ("fix room".equals(maintenanceStatus)) {
                    System.out.println(maintenanceStatus);
                    out.print("<div class=\"room-item item-room fix-room\" style=\"background-color: #FFEFF2\">\n");
                } else if ("dirty room".equals(maintenanceStatus)) {
                    System.out.println(maintenanceStatus);
                    out.print("<div class=\"room-item item-room dirty-room\" style=\"background-color: #FFF9EF\">\n");
                } else {
                    out.print("<div class=\"room-item item-room\">\n");
                    System.out.println("null case");
                }

                out.print("<div class=\"ri-text\">\n"
                        + "    <img src=\"" + o.getImage() + "\" alt=\"\" class=\"image-room\" id=\"unique-image\">\n"
                        + "    <h4 class=\"text-center name-room\" id=\"room-name\">\n"
                        + "        " + o.getName() + "\n"
                        + "    </h4>\n"
                        + "    <div class=\"content-icon d-flex align-items-between justify-content-between main-content\">\n"
                        + "        <div class=\"content-room\">\n"
                        + "            <i class=\"fa fa-users icon-room\" aria-hidden=\"true\"></i>\n");

                if (o.getPeople() == 1) {
                    out.print("            <span>" + o.getPeople() + " Person</span>\n");
                } else {
                    out.print("            <span>" + o.getPeople() + " People</span>\n");
                }

                out.print("        </div>\n"
                        + "        <div class=\"content-room\">\n"
                        + "            <i class=\"fa fa-bed icon-room\" aria-hidden=\"true\"></i>\n");

                if (o.getBed() == 1) {
                    out.print("            <span>" + o.getBed() + " Bed</span>\n");
                } else {
                    out.print("            <span>" + o.getBed() + " Beds</span>\n");
                }

                out.print("        </div>\n"
                        + "        <div class=\"content-room\">\n"
                        + "            <i class=\"fa fa-bath icon-room\" aria-hidden=\"true\"></i>\n");

                if (o.getBath() == 1) {
                    out.print("            <span>" + o.getBath() + " Bath</span>\n");
                } else {
                    out.print("            <span>" + o.getBath() + " Baths</span>\n");
                }

                out.print("        </div>\n"
                        + "    </div>\n"
                        + "</div>\n"
                        + "</div>\n"
                        + "</div>");
            }
        }
        if (action.equals("getRoom")) {
            int id = Integer.parseInt(request.getParameter("roomId"));
            Room room = dao.getNameById(id);
            out.print("Room: " + room.getName() + "");
//            out.print("<input type=\"hidden\" id=\"currentRoomId\" value="+id+"\"\" />");

        }

        if (action.equals("checkAvailable")) {
            String dateNow = request.getParameter("date");
            list = dao.getRoomAvailable(dateNow);
            for (Room o : list) {
                out.print("<div class=\"col-lg-3 col-md-6  justify-content-center element\">\n"
                        + "    <input value=\"" + o.getRoom_Id() + "\" type=\"hidden\" id=\"room-id\" class=\"RID\"/>\n");

                String maintenanceStatus = o.getMaintenance_status();

                if ("clean room".equals(maintenanceStatus)) {
                    out.print("<div class=\"room-item item-room clean-room\" >\n");
                    System.out.println("ok cleanroom");
                } else if ("fix room".equals(maintenanceStatus)) {
                    System.out.println(maintenanceStatus);
                    out.print("<div class=\"room-item item-room fix-room\" style=\"background-color: #FFEFF2\">\n");
                } else if ("dirty room".equals(maintenanceStatus)) {
                    System.out.println(maintenanceStatus);
                    out.print("<div class=\"room-item item-room dirty-room\" style=\"background-color: #FFF9EF\">\n");
                } else {
                    out.print("<div class=\"room-item item-room\">\n");
                    System.out.println("null case");
                }

                out.print("<div class=\"ri-text\">\n"
                        + "    <img src=\"" + o.getImage() + "\" alt=\"\" class=\"image-room\" id=\"unique-image\">\n"
                        + "    <h4 class=\"text-center name-room\" id=\"room-name\">\n"
                        + "        " + o.getName() + "\n"
                        + "    </h4>\n"
                        + "    <div class=\"content-icon d-flex align-items-between justify-content-between main-content\">\n"
                        + "        <div class=\"content-room\">\n"
                        + "            <i class=\"fa fa-users icon-room\" aria-hidden=\"true\"></i>\n");

                if (o.getPeople() == 1) {
                    out.print("            <span>" + o.getPeople() + " Person</span>\n");
                } else {
                    out.print("            <span>" + o.getPeople() + " People</span>\n");
                }

                out.print("        </div>\n"
                        + "        <div class=\"content-room\">\n"
                        + "            <i class=\"fa fa-bed icon-room\" aria-hidden=\"true\"></i>\n");

                if (o.getBed() == 1) {
                    out.print("            <span>" + o.getBed() + " Bed</span>\n");
                } else {
                    out.print("            <span>" + o.getBed() + " Beds</span>\n");
                }

                out.print("        </div>\n"
                        + "        <div class=\"content-room\">\n"
                        + "            <i class=\"fa fa-bath icon-room\" aria-hidden=\"true\"></i>\n");

                if (o.getBath() == 1) {
                    out.print("            <span>" + o.getBath() + " Bath</span>\n");
                } else {
                    out.print("            <span>" + o.getBath() + " Baths</span>\n");
                }

                out.print("        </div>\n"
                        + "    </div>\n"
                        + "</div>\n"
                        + "</div>\n"
                        + "</div>");
            }
        }
        if(action.equals("checkUnavai")){
            String dateNow = request.getParameter("date");
            list = dao.getRoomUnavai(dateNow);
            for (Room o : list) {
                out.print("<div class=\"col-lg-3 col-md-6  justify-content-center element\">\n"
                        + "    <input value=\"" + o.getRoom_Id() + "\" type=\"hidden\" id=\"room-id\" class=\"RID\"/>\n");

                String maintenanceStatus = o.getMaintenance_status();

                if ("clean room".equals(maintenanceStatus)) {
                    out.print("<div class=\"room-item item-room clean-room\" >\n");
                    System.out.println("ok cleanroom");
                } else if ("fix room".equals(maintenanceStatus)) {
                    System.out.println(maintenanceStatus);
                    out.print("<div class=\"room-item item-room fix-room\" style=\"background-color: #FFEFF2\">\n");
                } else if ("dirty room".equals(maintenanceStatus)) {
                    System.out.println(maintenanceStatus);
                    out.print("<div class=\"room-item item-room dirty-room\" style=\"background-color: #FFF9EF\">\n");
                } else {
                    out.print("<div class=\"room-item item-room\">\n");
                    System.out.println("null case");
                }

                out.print("<div class=\"ri-text\">\n"
                        + "    <img src=\"" + o.getImage() + "\" alt=\"\" class=\"image-room\" id=\"unique-image\">\n"
                        + "    <h4 class=\"text-center name-room\" id=\"room-name\">\n"
                        + "        " + o.getName() + "\n"
                        + "    </h4>\n"
                        + "    <div class=\"content-icon d-flex align-items-between justify-content-between main-content\">\n"
                        + "        <div class=\"content-room\">\n"
                        + "            <i class=\"fa fa-users icon-room\" aria-hidden=\"true\"></i>\n");

                if (o.getPeople() == 1) {
                    out.print("            <span>" + o.getPeople() + " Person</span>\n");
                } else {
                    out.print("            <span>" + o.getPeople() + " People</span>\n");
                }

                out.print("        </div>\n"
                        + "        <div class=\"content-room\">\n"
                        + "            <i class=\"fa fa-bed icon-room\" aria-hidden=\"true\"></i>\n");

                if (o.getBed() == 1) {
                    out.print("            <span>" + o.getBed() + " Bed</span>\n");
                } else {
                    out.print("            <span>" + o.getBed() + " Beds</span>\n");
                }

                out.print("        </div>\n"
                        + "        <div class=\"content-room\">\n"
                        + "            <i class=\"fa fa-bath icon-room\" aria-hidden=\"true\"></i>\n");

                if (o.getBath() == 1) {
                    out.print("            <span>" + o.getBath() + " Bath</span>\n");
                } else {
                    out.print("            <span>" + o.getBath() + " Baths</span>\n");
                }

                out.print("        </div>\n"
                        + "    </div>\n"
                        + "</div>\n"
                        + "</div>\n"
                        + "</div>");
            }
        }

        if (action.equals("updateRoom")) {
            String status = request.getParameter("status");
            int id = Integer.parseInt(request.getParameter("roomId"));
            System.out.println(status);
            System.out.println(id);
            dao.updateStatus(status, id);
            response.sendRedirect("statusRoomController");
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
