/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Entity.BookingCart;
import Entity.CartItem;
import Entity.TypeRoom;
import Model.DAOTypeRoom;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.time.temporal.ChronoUnit;
import java.util.List;

/**
 *
 * @author CaoTung
 */
public class ViewCart extends HttpServlet {

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
            out.println("<title>Servlet ViewCart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewCart at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        BookingCart bookingCart = (BookingCart) session.getAttribute("cart");
        if (bookingCart == null) {
            bookingCart = new BookingCart();
        }
        int total = bookingCart.getTotalMoney();
        DAOTypeRoom dao = new DAOTypeRoom();
        List<TypeRoom> listT = dao.getAllTypeRoom();
        String checkIn = (String) session.getAttribute("checkInDay");
        String checkOut = (String) session.getAttribute("checkOutDay");
        if(checkIn == null && checkOut == null){
            response.sendRedirect("homeController");
        }
        LocalDate dateIn = LocalDate.parse(checkIn);
        LocalDate dateOut = LocalDate.parse(checkOut);
        if(dateIn == null && dateOut == null){
            response.sendRedirect("homeController");
        }
        long daysBetween = ChronoUnit.DAYS.between(dateIn, dateOut);
        session.setAttribute("listT", listT);
        session.setAttribute("total", total * daysBetween);
        session.setAttribute("numberDay", daysBetween);
        session.setAttribute("list", bookingCart.getListCartItem());
        request.getRequestDispatcher("BookingCart.jsp").forward(request, response);
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
