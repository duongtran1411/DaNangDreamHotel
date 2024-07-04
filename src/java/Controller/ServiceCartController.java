/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Entity.BookingCart;
import Entity.CartItem;
import Entity.FormatUtils;
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
 * @author GIGABYTE
 */
public class ServiceCartController extends HttpServlet {

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
            out.println("<title>Servlet ServiceCartController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServiceCartController at " + request.getContextPath() + "</h1>");
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
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        session.setMaxInactiveInterval(300);
        BookingCart booking = (BookingCart) session.getAttribute("cart");
        if (booking == null) {
            booking = new BookingCart();
        }
        String action = request.getParameter("action");
        String checkIn = (String) session.getAttribute("checkInDay");
        String checkOut = (String) session.getAttribute("checkOutDay");
        List<CartItem> list = new ArrayList<>();
        switch (action) {
            case "filter":
                String type = request.getParameter("type");
                int id = Integer.parseInt(type);
                list = booking.getListByType(id);
                for (CartItem o : list) {
                    if (o.getRoom().getType_Room_Id() == id) {
                        out.print("<div class=\"col-lg-12\">\n"
                                + "\n"
                                + "                                                <div class=\"card mb-3\">\n"
                                + "                                                    <div class=\"card-body\" >\n"
                                + "                                                        <div class=\"d-flex \">\n"
                                + "\n"
                                + "                                                            <div class=\"col-lg-3\">\n"
                                + "\n"
                                + "                                                                <img\n"
                                + "                                                                    src=\"" + o.getRoom().getImage() + "\"\n"
                                + "                                                                    class=\"img-fluid rounded-3\" width=\"150px\" height=\"100%\">\n"
                                + "                                                            </div>\n"
                                + "                                                            <div class=\"col-lg-3\">\n"
                                + "                                                                <strong>Da Nang Dream Hotel</strong>\n"
                                + "                                                                <p>"+checkIn+" - "+checkOut+"</p>\n"
                                + "                                                            </div>\n"
                                + "                                                            <div class=\"align-items-center col-lg-3\">\n"
                                + "                                                                <strong>Information Room</strong>\n"
                                + "                                                                <h5>" + o.getRoom().getName() + "</h5>\n"
                                + "                                                                <div style=\"display: flex\">\n"
                                + "                                                                    <p class=\"small mb-0\" style=\"margin-right: 5px\">" + o.getRoom().getPeople() + " Person</p>\n"
                                + "                                                                <p class=\"small mb-0\">" + o.getRoom().getBed() + " Bed</p>\n"
                                + "                                                                </div>\n"
                                + "                                                            </div>\n"
                                + "                                                            <div class=\"align-items-center col-lg-3\">\n"
                                + "\n"
                                + "                                                                <h5 class=\"fw-normal mb-0\"><a href=\"cartController?action=delete&Id=" + o.getRoom().getRoom_Id() + "\">Cancel</a></h5>\n"
                                + "\n"
                                + "                                                                <h5><del>" + FormatUtils.formatPRice(o.getRoom().getPrice()) + "đ/Pernight</del></h5>\n"
                                + "                                                                <h5 class=\"mb-0\" style=\"color:#C59B24\">" + FormatUtils.formatPRice(o.getRoom().getPrice() * o.getRoom().getDiscount()) + "đ/Pernight</h5>\n"
                                + "\n"
                                + "                                                                <a href=\"#!\" style=\"color: #cecece;\"><i class=\"fas fa-trash-alt\"></i></a>\n"
                                + "                                                            </div>\n"
                                + "                                                        </div>\n"
                                + "                                                    </div>\n"
                                + "                                                </div>\n"
                                + "                                            </div>");
                    }
                }

                if (id == 0) {
                    list = booking.getListCartItem();
                    for (CartItem o : list) {
                        out.print("<div class=\"col-lg-12\">\n"
                                + "\n"
                                + "                                                <div class=\"card mb-3\">\n"
                                + "                                                    <div class=\"card-body\" >\n"
                                + "                                                        <div class=\"d-flex \">\n"
                                + "\n"
                                + "                                                            <div class=\"col-lg-3\">\n"
                                + "\n"
                                + "                                                                <img\n"
                                + "                                                                    src=\"" + o.getRoom().getImage() + "\"\n"
                                + "                                                                    class=\"img-fluid rounded-3\" width=\"150px\" height=\"100%\">\n"
                                + "                                                            </div>\n"
                                + "                                                            <div class=\"col-lg-3\">\n"
                                + "                                                                <strong>Da Nang Dream Hotel</strong>\n"
                                + "                                                                <p>"+checkIn+" - "+checkOut+"</p>\n"
                                + "                                                            </div>\n"
                                + "                                                            <div class=\"align-items-center col-lg-3\">\n"
                                + "                                                                <strong>Information Room</strong>\n"
                                + "                                                                <h5>" + o.getRoom().getName() + "</h5>\n"
                                + "                                                                <div style=\"display: flex\">\n"
                                + "                                                                    <p class=\"small mb-0\" style=\"margin-right: 5px\">" + o.getRoom().getPeople() + " Person</p>\n"
                                + "                                                                <p class=\"small mb-0\">" + o.getRoom().getBed() + " Bed</p>\n"
                                + "                                                                </div>\n"
                                + "                                                            </div>\n"
                                + "                                                            <div class=\"align-items-center col-lg-3\">\n"
                                + "\n"
                                + "                                                                <h5 class=\"fw-normal mb-0\"><a href=\"cartController?action=delete&Id=" + o.getRoom().getRoom_Id() + "\">Cancel</a></h5>\n"
                                + "\n"
                                + "                                                                <h5><del>" + FormatUtils.formatPRice(o.getRoom().getPrice()) + "đ/Pernight</del></h5>\n"
                                + "                                                                <h5 class=\"mb-0\" style=\"color:#C59B24\">" + FormatUtils.formatPRice(o.getRoom().getPrice() * o.getRoom().getDiscount()) + "đ/Pernight</h5>\n"
                                + "\n"
                                + "                                                                <a href=\"#!\" style=\"color: #cecece;\"><i class=\"fas fa-trash-alt\"></i></a>\n"
                                + "                                                            </div>\n"
                                + "                                                        </div>\n"
                                + "                                                    </div>\n"
                                + "                                                </div>\n"
                                + "                                            </div>");
                    }
                }
                break;
            case "search":
                String text = request.getParameter("text");
                list = booking.getListByName(text);
                for (CartItem o : list) {
                    out.print("<div class=\"col-lg-12\">\n"
                            + "\n"
                            + "                                                <div class=\"card mb-3\">\n"
                            + "                                                    <div class=\"card-body\" >\n"
                            + "                                                        <div class=\"d-flex \">\n"
                            + "\n"
                            + "                                                            <div class=\"col-lg-4\">\n"
                            + "\n"
                            + "                                                                <img\n"
                            + "                                                                    src=\"" + o.getRoom().getImage() + "\"\n"
                            + "                                                                    class=\"img-fluid rounded-3\" width=\"150px\" height=\"100%\">\n"
                            + "                                                            </div>\n"
                            + "                                                            <div class=\"col-lg-4\">\n"
                            + "                                                                <strong>Information Room</strong>\n"
                            + "                                                                <h5>" + o.getRoom().getName() + "</h5>\n"
                            + "                                                                <p class=\"small mb-0\">" + o.getRoom().getPeople() + " Person</p>\n"
                            + "                                                                <p class=\"small mb-0\">" + o.getRoom().getBed() + " Bed</p>\n"
                            + "                                                            </div>\n"
                            + "\n"
                            + "                                                            <div class=\"align-items-center col-lg-4\">\n"
                            + "\n"
                            + "                                                                <h5 class=\"fw-normal mb-0\"><a href=\"cartController?action=delete&Id=" + o.getRoom().getRoom_Id() + "\">Cancel</a></h5>\n"
                            + "\n"
                            + "\n"
                            + "                                                                <h5 class=\"mb-0\">" + FormatUtils.formatPRice(o.getRoom().getPrice() * o.getRoom().getDiscount()) + "đ</h5>\n"
                            + "\n"
                            + "                                                                <a href=\"#!\" style=\"color: #cecece;\"><i class=\"fas fa-trash-alt\"></i></a>\n"
                            + "                                                            </div>\n"
                            + "                                                        </div>\n"
                            + "                                                    </div>\n"
                            + "                                                </div>\n"
                            + "                                            </div>");
                }
                break;
        }

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
