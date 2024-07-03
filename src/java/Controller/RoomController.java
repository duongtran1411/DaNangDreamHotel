/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Entity.FormatUtils;
import Entity.Room;
import Entity.TypeRoom;
import Model.DAOImageRoom;
import Model.DAORoom;
import Model.DAOTypeRoom;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author Sơnnnn
 */
@WebServlet(name = "RoomController", urlPatterns = {"/roomURL"})
public class RoomController extends HttpServlet {

    private DAOTypeRoom daoTypeRoom = new DAOTypeRoom();
    private DAORoom daoRoom = new DAORoom();
    private DAOImageRoom daoImageRoom = new DAOImageRoom();
    private FormatUtils format = new FormatUtils();

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
        String action = request.getParameter("action");
        if (action == null || action.isEmpty()) {
            action = "listAllRoom";
        }
        switch (action) {
            case "detail":
                detailRoom(request, response);
                break;
            case "add":
                addRoom(request, response);
                break;
            case "delete":
                deleteRoom(request, response);
                break;
            case "loadEdit":
                loadEdit(request, response);
                break;
            case "edit":
                editRoom(request, response);
                break;
            case "sortnameasc":
                sortRoomByNameAsc(request, response);
                break;
            case "sortnamedesc":
                sortRoomByNameDesc(request, response);
                break;
            case "sortpriceup":
                sortRoomByPriceAsc(request, response);
                break;
            case "sortpricedown":
                sortRoomByPriceDesc(request, response);
                break;
            default:
                listAllRoom(request, response);
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
        doGet(request, response);
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

    private void listAllRoom(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Room> allRoom = daoRoom.getAllRoom();
        request.setAttribute("AllRoom", allRoom);
        List<TypeRoom> allTypeRoom = daoTypeRoom.getAllTypeRoom();
        request.setAttribute("AllTypeRoom", allTypeRoom);
        request.getRequestDispatcher("dashboard/jsp/ManageRoom.jsp").forward(request, response);
    }

    private void detailRoom(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int typeRoomId = Integer.parseInt(request.getParameter("trid"));
        List<Room> listRoom = daoRoom.getRoomByTypeRoomId(typeRoomId);
        request.setAttribute("ListRoomBID", listRoom);
        List<TypeRoom> allTypeRoom = daoTypeRoom.getAllTypeRoom();
        request.setAttribute("AllTypeRoom", allTypeRoom);
        request.getRequestDispatcher("dashboard/jsp/ManageRoom.jsp").forward(request, response);
    }

    private void addRoom(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        int floor = Integer.parseInt(request.getParameter("floor"));
        int price = Integer.parseInt(request.getParameter("price"));
        int size = Integer.parseInt(request.getParameter("size"));
        int trid = Integer.parseInt(request.getParameter("type_Room_Id"));

        daoRoom.addRoom(name, floor, price, size, trid);
        response.sendRedirect("roomURL?action=");
    }

    private void deleteRoom(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int roomId = Integer.parseInt(request.getParameter("rid"));
        daoRoom.deleteRoom(roomId);
        response.sendRedirect("roomURL?action=");
    }

    private void loadEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int roomId = Integer.parseInt(request.getParameter("rid"));
        Room room = daoRoom.getRoomByID(roomId);
        List<TypeRoom> allTypeRoom = daoTypeRoom.getAllTypeRoom();
        request.setAttribute("AllTypeRoom", allTypeRoom);
        request.setAttribute("RoomByID", room);
        request.getRequestDispatcher("dashboard/jsp/EditRoom.jsp").forward(request, response);
    }

    private void editRoom(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int roomId = Integer.parseInt(request.getParameter("rid"));
        String name = request.getParameter("name");
        int floor = Integer.parseInt(request.getParameter("floor"));
        double price = Double.parseDouble(request.getParameter("price"));
        int size = Integer.parseInt(request.getParameter("size"));
        int trid = Integer.parseInt(request.getParameter("trid"));
        daoRoom.editRoom(trid, floor, name, price, size, roomId);

        response.sendRedirect("roomURL?action=");
    }

    private void sortRoomByNameAsc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        List<Room> sortedRooms = daoRoom.sortRoomsByNameAsc();
        for (Room sort : sortedRooms) {
            out.print("<tr>\n"
                    + "                                                <td>\n"
                    + "                                                    <a href=\"imageRoomURL?action=view&rid=" + sort.getRoom_Id() + "\">View</a>\n"
                    + "                                                </td>\n"
                    + "\n"
                    + "                                                <td>" + sort.getFloor_Room_Id() + "</td>\n"
                    + "                                                <td>" + sort.getName() + "</td>\n"
                    + "                                                <td>" + format.formatPRice(sort.getPrice()) + " đ</td>\n"
                    + "                                                <td>" + sort.getSize() + "</td>\n"
                    + "                                                <td>\n"
                    + "                                                    <a href=\"roomURL?action=loadEdit&rid=" + sort.getRoom_Id() + "\" class=\"settings\" title=\"Settings\" data-toggle=\"tooltip\"><i class='far fa-edit'></i></a>\n"
                    + "                                                    <a href=\"roomURL?action=delete&rid=" + sort.getRoom_Id() + "\" class=\"delete\" title=\"Delete\" data-toggle=\"tooltip\"><i class='far fa-trash-alt' style=\"color: #c80000\"></i></a>\n"
                    + "                                                </td>\n"
                    + "                                            </tr>");
        }
    }

    private void sortRoomByNameDesc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        List<Room> sortedRooms = daoRoom.sortRoomsByNameDesc();
        for (Room sort : sortedRooms) {
            out.print("<tr>\n"
                    + "                                                <td>\n"
                    + "                                                    <a href=\"imageRoomURL?action=view&rid=" + sort.getRoom_Id() + "\">View</a>\n"
                    + "                                                </td>\n"
                    + "\n"
                    + "                                                <td>" + sort.getFloor_Room_Id() + "</td>\n"
                    + "                                                <td>" + sort.getName() + "</td>\n"
                    + "                                                <td>" + format.formatPRice(sort.getPrice()) + " đ</td>\n"
                    + "                                                <td>" + sort.getSize() + "</td>\n"
                    + "                                                <td>\n"
                    + "                                                    <a href=\"roomURL?action=loadEdit&rid=" + sort.getRoom_Id() + "\" class=\"settings\" title=\"Settings\" data-toggle=\"tooltip\"><i class='far fa-edit'></i></a>\n"
                    + "                                                    <a href=\"roomURL?action=delete&rid=" + sort.getRoom_Id() + "\" class=\"delete\" title=\"Delete\" data-toggle=\"tooltip\"><i class='far fa-trash-alt' style=\"color: #c80000\"></i></a>\n"
                    + "                                                </td>\n"
                    + "                                            </tr>");
        }
    }

    private void sortRoomByPriceDesc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        List<Room> sortedRooms = daoRoom.sortRoomsByPriceDesc();
        for (Room sort : sortedRooms) {
            out.print("<tr>\n"
                    + "                                                <td>\n"
                    + "                                                    <a href=\"imageRoomURL?action=view&rid=" + sort.getRoom_Id() + "\">View</a>\n"
                    + "                                                </td>\n"
                    + "\n"
                    + "                                                <td>" + sort.getFloor_Room_Id() + "</td>\n"
                    + "                                                <td>" + sort.getName() + "</td>\n"
                    + "                                                <td>" + format.formatPRice(sort.getPrice()) + " đ</td>\n"
                    + "                                                <td>" + sort.getSize() + "</td>\n"
                    + "                                                <td>\n"
                    + "                                                    <a href=\"roomURL?action=loadEdit&rid=" + sort.getRoom_Id() + "\" class=\"settings\" title=\"Settings\" data-toggle=\"tooltip\"><i class='far fa-edit'></i></a>\n"
                    + "                                                    <a href=\"roomURL?action=delete&rid=" + sort.getRoom_Id() + "\" class=\"delete\" title=\"Delete\" data-toggle=\"tooltip\"><i class='far fa-trash-alt' style=\"color: #c80000\"></i></a>\n"
                    + "                                                </td>\n"
                    + "                                            </tr>");
        }
    }

    private void sortRoomByPriceAsc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        List<Room> sortedRooms = daoRoom.sortRoomsByPriceAsc();
        for (Room sort : sortedRooms) {
            out.print("<tr>\n"
                    + "                                                <td>\n"
                    + "                                                    <a href=\"imageRoomURL?action=view&rid=" + sort.getRoom_Id() + "\">View</a>\n"
                    + "                                                </td>\n"
                    + "\n"
                    + "                                                <td>" + sort.getFloor_Room_Id() + "</td>\n"
                    + "                                                <td>" + sort.getName() + "</td>\n"
                    + "                                                <td>" + format.formatPRice(sort.getPrice()) + " đ</td>\n"
                    + "                                                <td>" + sort.getSize() + "</td>\n"
                    + "                                                <td>\n"
                    + "                                                    <a href=\"roomURL?action=loadEdit&rid=" + sort.getRoom_Id() + "\" class=\"settings\" title=\"Settings\" data-toggle=\"tooltip\"><i class='far fa-edit'></i></a>\n"
                    + "                                                    <a href=\"roomURL?action=delete&rid=" + sort.getRoom_Id() + "\" class=\"delete\" title=\"Delete\" data-toggle=\"tooltip\"><i class='far fa-trash-alt' style=\"color: #c80000\"></i></a>\n"
                    + "                                                </td>\n"
                    + "                                            </tr>");
        }
    }

}
