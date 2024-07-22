/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Entity.Booking;
import Entity.Room;
import Model.DAOBooking;
import Model.DAORoom;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 *
 * @author PC QUANG MINH
 */
@WebServlet(name="FilterBookingURL", urlPatterns={"/FilterBookingURL"})
public class FilterBookingURL extends HttpServlet {
   
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
            out.println("<title>Servlet FilterBookingURL</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FilterBookingURL at " + request.getContextPath () + "</h1>");
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
        processRequest(request, response);
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
        String checkinDateStr = request.getParameter("checkinDate");
        String checkoutDateStr = request.getParameter("checkoutDate");

        // Kiểm tra nếu các ngày không null và không trống
        if (checkinDateStr != null && !checkinDateStr.isEmpty() && checkoutDateStr != null && !checkoutDateStr.isEmpty()) {
            try {
                // Chuyển đổi từ String sang đối tượng Date
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date checkinDate = dateFormat.parse(checkinDateStr);
                java.util.Date checkoutDate = dateFormat.parse(checkoutDateStr);

                // Gọi DAO để lấy danh sách booking dựa trên ngày
                DAOBooking dao = new DAOBooking();
                DAORoom daoroom=new DAORoom();
                List<Booking> listB = dao.getAllBookingByDate(new Date(checkinDate.getTime()), new Date(checkoutDate.getTime()));
                List<Room>listT=daoroom.sortRoomsByNameDesc();
                List<Room>listR=daoroom.listAllRoom();
                // Đặt danh sách booking vào request để hiển thị trong JSP
                request.setAttribute("listB", listB);
                request.setAttribute("listT", listT);
                long totalPrice=0;
                
                  for (Booking booking : listB) {
                    totalPrice+=booking.getExpenses();
                }
                request.setAttribute("listR", listR);
                request.setAttribute("totalPrice", totalPrice);
                // Chuyển hướng đến trang hiển thị danh sách booking
                request.getRequestDispatcher("dashboard/jsp/Dashboard.jsp").forward(request, response);

            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("AdminControllerURL"); // Xử lý lỗi nếu có
            }
        } else {
            response.sendRedirect("AdminControllerURL"); // Quay lại trang filter nếu không có ngày được chọn
        }
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
