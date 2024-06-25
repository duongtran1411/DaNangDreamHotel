/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Entity.Item;
import Entity.ItemInRoom;
import Entity.TypeRoom;
import Model.DAOItem;
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

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ItemController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ItemController at " + request.getContextPath() + "</h1>");
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
        List<Item> allItem = daoItem.getAllItem();
        request.setAttribute("allItem", allItem);
        request.getRequestDispatcher("dashboard/jsp/ItemManage.jsp").forward(request, response);
    }

    private void deleteItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        daoItem.deleteItemInRoom(id);
        daoItem.deleteItem(id);

        response.sendRedirect("ItemController");
    }
    private void addItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        int type = Integer.parseInt(request.getParameter("type"));
        double price = Double.parseDouble(request.getParameter("price"));
        daoItem.insertItem(name, type, price);
        response.sendRedirect("ItemController");
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
