/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Entity.Booking;
import Entity.Customer;
import Entity.FormatUtils;
import Model.DAOBooking;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author GIGABYTE
 */
@WebServlet(name = "BookingController", urlPatterns = {"/bookingURL"})
public class BookingController extends HttpServlet {

    private DAOBooking daoB = new DAOBooking();

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
            action = "booking";
        }
        switch (action) {
            case "view":
                viewCustomer(request, response);
                break;
            case "search":
                searchCardID(request, response);
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

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void viewCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int rCode = Integer.parseInt(request.getParameter("rCode"));
        List<Customer> viewCustomer = daoB.getCustomerSameBooking(rCode);
        request.setAttribute("customer", viewCustomer);
        request.getRequestDispatcher("dashboard/jsp/ManageCustomer.jsp").forward(request, response);
    }

    private void listBooking(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Booking> booking = daoB.getAllBooking();
        request.setAttribute("listB", booking);
        request.getRequestDispatcher("dashboard/jsp/ManageBooking.jsp").forward(request, response);
    }

    private void searchCardID(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String txtSearch = request.getParameter("txt");
        List<Booking> search = daoB.searchBookingByCID(txtSearch);
        FormatUtils format = new FormatUtils();
        if (search.isEmpty()) {
            out.println("<tr><td colspan='6' style='text-align: center;'>No results found for '" + txtSearch + "'</td></tr>");
        }
        for (Booking booking : search) {
            out.println("<tr>\n"
                    + "                                                        <td>\n"
                    + "                                                            <a href=\"bookingURL?action=view&rCode=" + booking.getIdCard() + "\"><i class=\"far fa-eye successful\"></i></a>\n"
                    + "                                                        </td>\n"
                    + "                                                        <td>" + booking.getIdCard() + "</td>\n"
                    + "                                                        <td>" + booking.getCheckIn() + "</td>\n"
                    + "                                                        <td>" + booking.getCheckOut() + "</td>\n"
                    + "                                                        <td>" + format.formatPRice(booking.getExpenses()) + " đ</td>\n"
                    + "                                                        <td>\n"
                    + "                                                            <a href=\"roomURL?action=loadEdit&rid=\" class=\"settings\" title=\"Settings\" data-toggle=\"tooltip\"><i class='far fa-edit'></i></a>\n"
                    + "                                                            <a href=\"roomURL?action=delete&rid=\" class=\"delete\" title=\"Delete\" data-toggle=\"tooltip\"><i class='far fa-trash-alt' style=\"color: #c80000\"></i></a>\n"
                    + "                                                        </td>\n"
                    + "                                                    </tr>");
        }
    }

}
