/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Entity.Booking;
import Entity.Item;
import Entity.Room;
import Entity.RoomWithItem;
import Model.DAOBooking;
import Model.DAOItem;
import Model.DAORoom;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author PC QUANG MINH
 */
@WebServlet(name="AdminControllerURL", urlPatterns={"/AdminControllerURL"})
public class AdminControllerURL extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<h1>Servlet AdminControllerURL at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        DAOBooking dao=new DAOBooking();
        DAORoom daoroom=new DAORoom();
        DAOItem daoitem=new DAOItem();
        List<Booking>list=dao.getAllBooking();
        List<Room>listR=daoroom.listAllRoom();
        int count=1;
        for (Room room : listR) {
            if(room.getRoom_Id()!=room.getRoom_Id()+1){
                count++;
            }
        }
        List<Room>listT=daoroom.sortRoomsByPriceDesc();
        List<RoomWithItem>listI=daoitem.getAllItemsInRoom();
        long totalPrice=0;
        for (Booking booking : list) {
            totalPrice+=booking.getExpenses();
        }
        request.setAttribute("listB", list);
        request.setAttribute("listT", listT);
        request.setAttribute("totalPrice", totalPrice);
        request.setAttribute("listR", listR);
        String searchName = request.getParameter("searchName");
        
        DAOItem daoItem = new DAOItem();
        List<RoomWithItem> items = new ArrayList<>();
        
        if (searchName != null && !searchName.trim().isEmpty()) {
            items = daoItem.getAllItemsInRoomByName(searchName);
        } else {
            items = daoItem.getAllItemsInRoom(); // Method to get all items if no search is performed
        }
        long totalPriceItem=0;
       
        
        for (RoomWithItem item : items) {
            totalPriceItem+= (long)(item.getQuantity()*item.getItempPice());
        }
        request.setAttribute("totalPriceItem", totalPriceItem);
        request.setAttribute("listI", items); 
        request.getRequestDispatcher("dashboard/jsp/Dashboard.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        DAORoom dao=new DAORoom();
       int id=Integer.parseInt(request.getParameter("id"));
       String service=request.getParameter("action");
       /*if(service.equals("available")){
           dao.updateAvailableRoom(id);
       }else if(service.equals("unavailable")){
           dao.updateUnavailableRoom(id);
       }*/
       response.sendRedirect("AdminControllerURL");
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
