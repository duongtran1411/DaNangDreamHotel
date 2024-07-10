package Controller;

import Entity.Booking;
import Entity.Customer;
import Entity.FormatUtils;
import Entity.Room;
import Model.DAOBooking;
import Model.DAORoom;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "BookingController", urlPatterns = {"/bookingURL"})
public class BookingController extends HttpServlet {

    private DAORoom daoRoom = new DAORoom();
    private DAOBooking daoBooking = new DAOBooking();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.isEmpty()) {
            action = "list";
        }
        switch (action) {
            case "view":
                viewCustomer(request, response);
                break;
            case "status":
                updateBookingStatus(request, response);
                break;
            case "detail":
                listBookingDetail(request, response);
                break;
            case "update":
                updateBooking(request, response);
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

    private void viewCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int rCode = Integer.parseInt(request.getParameter("rCode"));
        List<Customer> customers = daoBooking.getCustomerSameBooking(rCode);
        request.setAttribute("customers", customers);
        request.getRequestDispatcher("dashboard/jsp/ManageCustomer.jsp").forward(request, response);
    }

    private void listBooking(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Booking> bookings = daoBooking.getAllBooking();
        request.setAttribute("listB", bookings);
        request.getRequestDispatcher("dashboard/jsp/ManageBooking.jsp").forward(request, response);
    }
    private void listBookingDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookingId = Integer.parseInt(request.getParameter("id"));
        List<Room> rooms = daoBooking.getRoomsByBookingId(bookingId);
        request.setAttribute("rooms", rooms);
        request.getRequestDispatcher("dashboard/jsp/ManageBookingDetail.jsp").forward(request, response);
    }

    private void updateBooking(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookingId = Integer.parseInt(request.getParameter("bid"));
        String checkInStr = request.getParameter("checkIn");
        String checkOutStr = request.getParameter("checkOut");
        double dailyRate = Double.parseDouble(request.getParameter("dailyRate"));

        daoBooking.updateBooking(bookingId, checkInStr, checkOutStr, dailyRate);

        response.sendRedirect("bookingURL?action=updateSuccess");
    }

    private void updateBookingStatus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookingIdStr = request.getParameter("bookingId");
        String status = request.getParameter("status");

        if (bookingIdStr != null && status != null) {
            try {
                int bookingId = Integer.parseInt(bookingIdStr);
                daoBooking.updateBookingStatus(bookingId, status);
                if ("Done".equalsIgnoreCase(status)) {
                    daoRoom.updateRoomStatusByBookingId(bookingId, "Available");
                }

                response.sendRedirect("bookingURL?action=statusUpdate&statusUpdate=success");
            } catch (IOException e) {
                response.sendRedirect("bookingURL?action=statusUpdate&statusUpdate=error");
            }
        } else {
            response.sendRedirect("bookingURL?action=statusUpdate&statusUpdate=error");
        }
    }

    @Override
    public String getServletInfo() {
        return "Booking Controller Servlet";
    }
}
