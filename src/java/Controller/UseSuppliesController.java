/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Entity.Item;
import Entity.Room;
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
            case "calc":
                
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

    }
     private void listItemByType(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
        List<Item> list = daoItem.getFoodItem();
        request.setAttribute("list", list);
        request.getRequestDispatcher("dashboard/jsp/Supplies.jsp").forward(request, response);
    }
    private void listRoom(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String status = "live";
        List<Room> list = daoRoom.getRoomByStatus(status);
        request.setAttribute("list", list);
        request.getRequestDispatcher("dashboard/jsp/LiveRoom.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
