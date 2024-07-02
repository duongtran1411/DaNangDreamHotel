package Controller;

import Entity.BookingDetail;
import Model.DAOBooking;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet(name = "BookingController", urlPatterns = {"/BookingDetailURL"})
public class BookingDetailController extends HttpServlet {

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
            action = "listDetail";
        }
        switch (action) {
            case "delete":
                deleteBookingDetail(request, response);
                break;
            case "update":

                break;
            default:
                listDetail(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private void listDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookingId = Integer.parseInt(request.getParameter("id"));
        List<BookingDetail> allBooking = daoBooking.getBookingDetail(bookingId);
        request.setAttribute("allBooking", allBooking);
        request.getRequestDispatcher("dashboard/jsp/ManageBookingDetail.jsp").forward(request, response);
    }

    private void deleteBookingDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookingDetailId = Integer.parseInt(request.getParameter("id"));
        int bookingId = daoBooking.getBookingIdByDetailId(bookingDetailId);
        daoBooking.deleteBookingDetail2(bookingDetailId);
        response.sendRedirect("BookingDetailURL?id=" +bookingId);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
