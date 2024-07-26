/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Entity.Item;
import Entity.TypeItem;
import Model.DAOItem;
import Model.DAOTypeItem;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author CaoTung
 */
public class TypeOfItemController extends HttpServlet {
    
    DAOTypeItem daoTypeItem = new DAOTypeItem();
    DAOItem daoItem = new DAOItem();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
    } 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       String action = request.getParameter("action");
        if (action == null || action.isEmpty()) {
            action = "listAllTypeOfItem";
        }
        switch (action) {
            case "add":
                addTypeOfItem(request, response);
                break;
            case "delete":
                deleteTypeOfItem(request, response);
                break;
            case "update":
                updateTypeOfItem(request, response);
                break;
            default:
                listAllTypeOfItem(request, response);
                break;
        }
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doGet(request, response);
    }
    private void listAllTypeOfItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //paging
        int currentPage = Integer.parseInt(request.getParameter("page") != null ? request.getParameter("page") : "1");
        int itemsPerPage = 5;
        int totalTypes = daoTypeItem.getTotalType();
        int totalPages = (int) Math.ceil((double) totalTypes / itemsPerPage);
        List<TypeItem> allType = daoTypeItem.getTypesWithPagin(currentPage, itemsPerPage);
        //List<TypeItem> allType = daoTypeItem.getAllTypeOfItem();
        request.setAttribute("allType", allType);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);
        request.getRequestDispatcher("dashboard/jsp/ManageTypeOfItem.jsp").forward(request, response);
    }
    private void addTypeOfItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        daoTypeItem.insertTypeItem(name);
          response.sendRedirect("ItemTypeController");
    }
    private void updateTypeOfItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("typeId"));
        String name = request.getParameter("name");
        daoTypeItem.updateTypeOfItem(id,name);
          response.sendRedirect("ItemTypeController");
    }
    private void deleteTypeOfItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        List<Item> listItem = daoItem.getItemByType(id);
        for (Item item : listItem) {
            daoItem.deleteItemInRoom(item.item_Id);
            daoItem.deleteItem(item.item_Id);
        }
        daoTypeItem.deleteTypeOfItem(id);
        response.sendRedirect("ItemTypeController");
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
