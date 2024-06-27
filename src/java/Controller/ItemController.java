/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Entity.Item;
import Entity.ItemInRoom;
import Entity.Room;
import Entity.TypeRoom;
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
public class ItemController extends HttpServlet {

    DAOItem daoItem = new DAOItem();
    DAORoom daoRoom = new DAORoom();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.isEmpty()) {
            action = "listAllItem";
        }
        switch (action) {
            case "add":
                addItem(request, response);
                break;
            case "delete":
                deleteItem(request, response);
                break;
            case "update":
                updateItem(request, response);
                break;
            default:
                listAllItem(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private void listAllItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int currentPage = Integer.parseInt(request.getParameter("page") != null ? request.getParameter("page") : "1");
        int itemsPerPage = 7;
        int totalTypes = daoItem.getTotalItem();
        int totalPages = (int) Math.ceil((double) totalTypes / itemsPerPage);
        List<Item> allItem = daoItem.getItemsWithPagin(currentPage, itemsPerPage);
        request.setAttribute("allItem", allItem);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);
        request.getRequestDispatcher("dashboard/jsp/ItemManage.jsp").forward(request, response);
    }

    private void deleteItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        daoItem.deleteItemInRoom(id);
        daoItem.deleteItem(id);
        response.sendRedirect("ItemController");
    }
    private void updateItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int typeId = Integer.parseInt(request.getParameter("type"));
        Double price = Double.parseDouble(request.getParameter("price"));
        daoItem.updateItem(id, name, typeId, price);
        response.sendRedirect("ItemController");
    }
    private void addItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        int type = Integer.parseInt(request.getParameter("type"));
        double price = Double.parseDouble(request.getParameter("price"));
        daoItem.insertItem(name, type, price);
        List<Room> listRoomId = daoRoom.getAllRoomId();
        Item it = daoItem.getItemByName(name);
        for(Room x : listRoomId){
            daoItem.InsertItemInRoom(it.getItem_Id(), x.getRoom_Id());
        }
        response.sendRedirect("ItemController");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
