/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Entity.FormatUtils;
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
 * @author GIGABYTE
 */
public class LoadRoomEvent extends HttpServlet {

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
            out.println("<title>Servlet LoadRoomEvent</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoadRoomEvent at " + request.getContextPath() + "</h1>");
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
//        String action = request.getParameter("action");
//        if (action.equals("updateDate")) {
//            String checkIn = request.getParameter("dateIn");
//            String checkOut = request.getParameter("dateOut");
//            HttpSession session = request.getSession();
//            session.setAttribute("checkInDay", checkIn);
//            session.setAttribute("checkOutDay", checkOut);
//            request.getRequestDispatcher("bookByEventController").forward(request, response);
//        }
//
//        if (action == null) {
//            action = "list";
//        }
//        
//        if(action.equals("list")){
            String checkIn = request.getParameter("checkIn");
            String checkOut = request.getParameter("checkOut");
            String[] event_Id = request.getParameterValues("eventId");
            for (String string : event_Id) {
                System.out.println(string);
            }
            DAORoom dao = new DAORoom();
            for (int i = 0; i < event_Id.length; i++) {
                int id = Integer.parseInt(event_Id[i]);
                List<Room> list = dao.checkRoom(checkIn, checkOut, id);
                for (Room o : list) {
                    out.print("<div class=\"room col-lg-12 \" id=\"element\" style=\"display: flex; margin-bottom: 10px; margin-top: 20px\">\n"
                            + "                                                <div class=\"col-lg-4\">\n"
                            + "                                                    <img src=\"" + o.getImage() + "\" alt=\"alt\">\n"
                            + "                                                </div>\n"
                            + "\n"
                            + "                                                <div class=\"col-lg-4\">\n"
                            + "                                                    <h6 style=\"font-weight:800\">" + o.getName() + "</h6><br>\n"
                            + "                                                    <div>\n"
                            + "                                                        <i class=\"fa-solid fa-expand icon\" style=\"width: 35px;height: 16px\"></i>" + o.getSize() + " m<sup>2</sup><br>\n"
                            + "                                                        <i class=\"fa-solid fa-bed icon\" style=\"width: 35px;height: 16px\" ></i>" + o.getBed() + " bed<br>\n"
                            + "                                                        <i class=\"fa-solid fa-user-group\"style=\"width: 35px;height: 16px\"></i>" + o.getPeople() + " person\n"
                            + "                                                    </div>\n"
                            + "                                                </div>\n"
                            + "                                                <div class=\"col-lg-4\">\n"
                            + "                                                    <div>\n"
                            + "                                                        <h6 style=\"margin-bottom: 22px;font-weight:800\">Price</h6>\n"
                            + "                                                        <del>" + FormatUtils.formatPRice(o.getPrice()) + "đ<br></del>\n"
                            + "                                                        " + FormatUtils.formatPRice(o.getPrice() * o.getDiscount()) + "đ\n"
                            + "\n"
                            + "                                                        <button class=\"btn btn\" style=\"background-color: #C59B24; color: white; margin-left: 10px\"><a style=\"color: white\" href=\"cartController?action=post&id=" + o.getRoom_Id() + "\">Select Room</a></button>\n"
                            + "                                                    </div>\n"
                            + "                                                </div>\n"
                            + "                                            </div>\n"
                            + "                                            <hr>");
                }
            }
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
