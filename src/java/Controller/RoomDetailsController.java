/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Entity.ImageRoom;
import Entity.ItemInRoom;
import Entity.Room;
import Model.DAOImageRoom;
import Model.DAOItem;
import Model.DAORoom;
import jakarta.servlet.annotation.WebServlet;
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
@WebServlet(name = "RoomDetailsController", urlPatterns = {"/roomDetailsController"})
public class RoomDetailsController extends HttpServlet {

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
            out.println("<title>Servlet RoomDetailsController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RoomDetailsController at " + request.getContextPath() + "</h1>");
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
        int room_Id = Integer.parseInt(request.getParameter("Id"));
        int typeRoom_Id = Integer.parseInt(request.getParameter("typeRoom"));
        DAORoom daoR = new DAORoom();
        DAOItem daoItem = new DAOItem();
        DAOImageRoom daoI = new DAOImageRoom();
        Room room = daoR.getRoomById(room_Id);
        List<ImageRoom> list = daoI.getImageByRoomId(room_Id);
        List<ItemInRoom> listI = daoItem.getItemInRoom(room_Id);
        List<Room> listR = daoR.getRoomByTypeRoom(typeRoom_Id);
        request.setAttribute("listR", listR);
        request.setAttribute("room", room);
        request.setAttribute("listImage", list);
        request.setAttribute("listI", listI);
        request.getRequestDispatcher("Room_Details.jsp").forward(request, response);
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
