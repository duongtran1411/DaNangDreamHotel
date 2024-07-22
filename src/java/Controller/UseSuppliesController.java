/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Entity.Item;
import Entity.Room;
import Model.DAOBooking;
import Model.DAOItem;
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
 * @author CaoTung
 */
public class UseSuppliesController extends HttpServlet {

    DAORoom daoRoom = new DAORoom();
    DAOItem daoItem = new DAOItem();
    DAOBooking daoBooking = new DAOBooking();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.isEmpty()) {
            action = "list";
        }
        switch (action) {
            case "view":
                listRoom(request, response);
                break;
            case "update":
                    updatePayment(request, response);
                break;
            case "edit":             
                listItemByType(request, response);
                break;
            default:
                listRoom(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
     private void listItemByType(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int roomId = Integer.parseInt(request.getParameter("id"));
        int bookingDetailId = daoBooking.getLiveBookingDetailId(roomId);
        List<Item> list = daoItem.getFoodItem();
        request.setAttribute("list", list);
        request.setAttribute("bookingDetailId", bookingDetailId);
        request.getRequestDispatcher("dashboard/jsp/Supplies.jsp").forward(request, response);
    }
    private void listRoom(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Room> list = daoRoom.getProcessingRooms();
        request.setAttribute("list", list);
        request.getRequestDispatcher("dashboard/jsp/Checkout.jsp").forward(request, response);
    }
    private void updatePayment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String expenses = request.getParameter("total");
        String id = request.getParameter("id");
        
           int total = Integer.parseInt(expenses);
           int detailId = Integer.parseInt(id);
          System.out.println(id);
            daoBooking.insert(total, detailId);
        
        
       
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
