/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Entity.BookingCart;
import Entity.CartItem;
import Entity.Room;
import Model.DAORoom;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author CaoTung
 */
public class CartController extends HttpServlet {

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
            out.println("<title>Servlet CartController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartController at " + request.getContextPath() + "</h1>");
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
        BookingCart bookingCart = new BookingCart();
        HttpSession session = request.getSession();
        bookingCart = (BookingCart) session.getAttribute("cart");
        if (bookingCart == null) {
            bookingCart = new BookingCart();
        }
        session.setAttribute("cart", bookingCart);
        doPost(request, response);
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
        HttpSession session = request.getSession();
        session.setMaxInactiveInterval(300);
        BookingCart bookingCart = (BookingCart) session.getAttribute("cart");
        String action = request.getParameter("action");
        switch (action) {
            case "get":
                response.sendRedirect("viewCart");
                break;
            case "delete":
                doDelete(request, response);
                break;
            case "post":
                String id = request.getParameter("id");
                int roomId = Integer.parseInt(id);
                DAORoom dao = new DAORoom();
                List<CartItem> list = bookingCart.getListCartItem();

                boolean roomFound = false;
                for (CartItem cartItem : list) {
                    if (cartItem.getRoom().getRoom_Id() == roomId) {
                        roomFound = true;
                        response.sendRedirect("viewCartController");
                        break;
                    }
                }
                if (!roomFound) {
                    Room room = dao.getRoomToCart(roomId);
                    CartItem cartItem = new CartItem(room);
                    bookingCart.addRoom(cartItem);
                    session.setAttribute("cart", bookingCart);
                    response.sendRedirect("viewRoomController");
                }
                break;
        }

    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        BookingCart bookingCart = (BookingCart) session.getAttribute("cart");
        String id = req.getParameter("Id");
        int roomId = Integer.parseInt(id);
        bookingCart.remove(roomId);
        session.setAttribute("cart", bookingCart);
        resp.sendRedirect("viewCartController");
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
