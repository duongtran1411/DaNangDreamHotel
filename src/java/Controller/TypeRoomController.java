/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Entity.Room;
import Entity.TypeRoom;
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
@WebServlet(name = "TypeRoomController", urlPatterns = {"/typeRoomURL"})
public class TypeRoomController extends HttpServlet {

    private DAOTypeRoom daoTypeRoom = new DAOTypeRoom();
    private DAORoom daoRoom = new DAORoom();

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
        /* TODO output your page here. You may use following sample code. */

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
        if (action == null || action.isEmpty() || action.isBlank()) {
            action = "listTypeRoom";
        }
        switch (action) {
            case "detail":
                detailRoomByTypeId(request, response);
                break;
            case "loadEdit":
                loadEdit(request, response);
                break;
            case "edit":
                editTypeRoom(request, response);
                break;
            case "add":
                addTypeRoom(request, response);
                break;
            case "delete":
                deleteTypeRoom(request, response);
                break;
            default:
                listTypeRoom(request, response);
                break;
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

    private void listTypeRoom(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<TypeRoom> allTypeRoom = daoTypeRoom.getAllTypeRoom();
        request.setAttribute("AllTypeRoom", allTypeRoom);
        request.getRequestDispatcher("dashboard/jsp/ManageTypeRoom.jsp").forward(request, response);
    }

    private void detailRoomByTypeId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int typeRoomId = Integer.parseInt(request.getParameter("id"));
        List<Room> listRoom = daoRoom.getRoomByTypeRoomId(typeRoomId);
        request.setAttribute("ListRoomBID", listRoom);
        request.getRequestDispatcher("dashboard/jsp/ManageRoom.jsp").forward(request, response);
    }

    private void loadEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int typeRoomId = Integer.parseInt(request.getParameter("id"));
        TypeRoom typeRoom = daoTypeRoom.getTypeRoomByID(typeRoomId);
        request.setAttribute("TypeRoomBID", typeRoom);
        request.getRequestDispatcher("dashboard/jsp/EditTypeRoom.jsp").forward(request, response);
    }

    private void editTypeRoom(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("type_Room_Id"));
        String name = request.getParameter("name");
        int eventId = Integer.parseInt(request.getParameter("event_Id"));
        String bed = request.getParameter("bed");
        String bath = request.getParameter("bath");
        String people = request.getParameter("people");
        String image = request.getParameter("image");

        daoTypeRoom.editTypeRoom(id, name, eventId, bed, bath, people, image);
        response.sendRedirect("typeRoomURL?action=listTypeRoom");
    }

    private void addTypeRoom(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String bed = request.getParameter("bed");
        String bath = request.getParameter("bath");
        String people = request.getParameter("people");

    }

    private void deleteTypeRoom(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("type_Room_Id"));
        daoTypeRoom.deleteTypeRoom(id);
        response.sendRedirect("typeRoomURL?action=listTypeRoom");
    }

}
