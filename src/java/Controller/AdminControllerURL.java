/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Entity.Booking;
import Entity.Item;
import Entity.Room;
import Entity.RoomWithItem;
import Entity.ServicePayment;
import Model.DAOBooking;
import Model.DAOItem;
import Model.DAOPayment;
import Model.DAORoom;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author PC QUANG MINH
 */
@WebServlet(name = "AdminControllerURL", urlPatterns = {"/AdminControllerURL"})
public class AdminControllerURL extends HttpServlet {

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
            out.println("<title>Servlet AdminControllerURL</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminControllerURL at " + request.getContextPath() + "</h1>");
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
        DAOBooking dao = new DAOBooking();
        DAORoom daoroom = new DAORoom();

        int page = 1;
        int recordsPerPage = 5;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
        List<Room> listR = daoroom.listAllRooms();
        List<Booking> listB=new ArrayList<>();
        String checkinDateStr = request.getParameter("checkinDate");
        String checkoutDateStr = request.getParameter("checkoutDate");
         long totalPrice=0;
          if (checkinDateStr != null && !checkinDateStr.isEmpty() && checkoutDateStr != null && !checkoutDateStr.isEmpty()) {
              try {
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date checkinDate = dateFormat.parse(checkinDateStr);
                java.util.Date checkoutDate = dateFormat.parse(checkoutDateStr);

                // Gọi DAO để lấy danh sách booking dựa trên ngày
                listB = dao.getAllBookingByDate(new Date(checkinDate.getTime()), new Date(checkoutDate.getTime()));
               
        for (Booking booking : listB) {
            totalPrice+=booking.getExpenses();
        }
        
       
              } catch (Exception e) {
              }
          }else{
              listB = dao.getAllBooking();
              for (Booking booking : listB) {
                  totalPrice+=booking.getExpenses();
              }
          }
         request.setAttribute("totalPrice", totalPrice);
         request.setAttribute("listB", listB);
         
        int noOfRecords = daoroom.getNoOfRecords();
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);

        request.setAttribute("listR", listR);
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);
        int topPage = 1;
        int topRecordsPerPage = 3; // Example for top rooms per page
        if (request.getParameter("topPage") != null) {
            topPage = Integer.parseInt(request.getParameter("topPage"));
        }
        List<Room> listT = daoroom.sortRoomsByPricesDesc((topPage - 1) * topRecordsPerPage, topRecordsPerPage);
        int noOfTopRecords = daoroom.getNoOfRecords(); // Use a similar method to get the total number of top rooms
        int noOfTopPages = (int) Math.ceil(noOfTopRecords * 1.0 / topRecordsPerPage);

        request.setAttribute("listT", listT);
        request.setAttribute("noOfTopPages", noOfTopPages);
        request.setAttribute("currentTopPage", topPage);
        DAOItem daoitem = new DAOItem();
       
        int count = 1;
        for (Room room : listR) {
            if (room.getRoom_Id() != room.getRoom_Id() + 1) {
                count++;
            }
        }
         int itemPage=1;
        int itemsPerPage = 12; // Example for items per page
    if (request.getParameter("itemPage") != null) {
        itemPage = Integer.parseInt(request.getParameter("itemPage"));
    }

    String searchName = request.getParameter("searchName");
    List<RoomWithItem> items = new ArrayList<>();
    int noOfItemRecords = 0;

    if (searchName != null && !searchName.trim().isEmpty()) {
        items = daoitem.getAllItemsInRoomByName(searchName);
        noOfItemRecords = daoitem.getNoOfItemRecordsByName(searchName);
    } else {
        items = daoitem.getAllItemsInRoom();
        noOfItemRecords = daoitem.getNoOfItemRecords();
    }

    int noOfItemPages = (int) Math.ceil(noOfItemRecords * 1.0 / itemsPerPage);
    
long totalPriceItem = 0;
    DAOPayment daoP = new DAOPayment();
    List<ServicePayment> listItem =daoP.getAllPayment();
        for (ServicePayment o : listItem) {
            totalPriceItem+=(long)(o.getExtramoney());
        }
    request.setAttribute("totalPriceItem", totalPriceItem);
    request.setAttribute("listI", items);
    request.setAttribute("noOfItemPages", noOfItemPages);
    request.setAttribute("currentItemPage", itemPage);
    request.setAttribute("searchName", searchName);

        
        
        request.getRequestDispatcher("dashboard/jsp/Dashboard.jsp").forward(request, response);
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
