/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Entity.Booking;
import Model.DAOBooking;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author GIGABYTE
 */
@WebServlet(name = "BookingController", urlPatterns = {"/bookingController"})
public class BookingController extends HttpServlet {

    DAOBooking daoBooking = new DAOBooking();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
           String action = request.getParameter("action");
        if (action == null || action.isEmpty()) {
            action = "listBooking";
        }
        switch (action) {
            case "delete":
                deleteBooking(request, response);
                break;
            case "update":      
         
                break;
            default:
                listBooking(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
    private void listBooking(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          int currentPage = Integer.parseInt(request.getParameter("page") != null ? request.getParameter("page") : "1");
        int itemsPerPage = 6;
        int totalBooking = daoBooking.getTotalBooking();
        int totalPages = (int) Math.ceil((double) totalBooking / itemsPerPage);
        List<Booking> allBooking = daoBooking.getBookingsWithPagin(currentPage, itemsPerPage);
        request.setAttribute("allBooking", allBooking);
         request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);
        request.getRequestDispatcher("dashboard/jsp/ManageBooking.jsp").forward(request, response);
    }
    private void deleteBooking(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        daoBooking.deleteBookingDetail(id);
        daoBooking.deleteBooking(id);
        response.sendRedirect("bookingController");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
