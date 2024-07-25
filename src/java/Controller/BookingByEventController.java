/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Entity.Event;
import Entity.FormatUtils;
import Entity.Room;
import Model.DAOEvent;
import Model.DAORoom;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author CaoTung
 */
public class BookingByEventController extends HttpServlet {

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
            out.println("<title>Servlet BookingByEventController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookingByEventController at " + request.getContextPath() + "</h1>");
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
        session.setMaxInactiveInterval(300);
        String checkIn = request.getParameter("checkIn");
        String checkOut = request.getParameter("checkOut");
        String person = request.getParameter("numberPerson");
        DAOEvent daoE = new DAOEvent();
        DAORoom dao = new DAORoom();
//        if (checkIn == null && checkOut == null) {
//            List<Integer> prices = new ArrayList<>();
//            List<Double> discounts = new ArrayList<>();
//            List<Event> listE = daoE.getImageEvent();
//            for (Event event : listE) {
//                Room room = dao.getMinPrice(event.getEvent_Id());
//                prices.add(room.getPrice());
//                discounts.add(room.getPrice() * room.getDiscount());
//            }
//            request.setAttribute("listE", listE);
//            request.setAttribute("priceRoom", prices);
//            request.setAttribute("priceDiscount", discounts);
//            session.setAttribute("checkInDay", checkIn);
//            session.setAttribute("checkOutDay", checkOut);
//            session.setAttribute("numberPerson", person);
//            request.getRequestDispatcher("Booking.jsp").forward(request, response);
//        }
//        if (checkIn != null && checkOut != null) {
            List<Integer> prices = new ArrayList<>();
            List<Double> discounts = new ArrayList<>();
            List<Event> listE = daoE.getImageEvent();
            for (Event event : listE) {
                Room room = dao.getMinPrice(event.getEvent_Id());
                prices.add(room.getPrice());
                discounts.add(room.getPrice() * room.getDiscount());
            }
            request.setAttribute("listE", listE);
            request.setAttribute("priceRoom", prices);
            request.setAttribute("priceDiscount", discounts);
            session.setAttribute("checkInDay", checkIn);
            session.setAttribute("checkOutDay", checkOut);
            session.setAttribute("numberPerson", person);
            request.getRequestDispatcher("Booking.jsp").forward(request, response);
//        }

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
