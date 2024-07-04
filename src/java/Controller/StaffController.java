/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Entity.Customer;
import Model.DAOCustomer;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author CaoTung
 */
public class StaffController extends HttpServlet {

    DAOCustomer daoCustomer = new DAOCustomer();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("dashboard/jsp/Staff.jsp").forward(request, response);
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
        doGet(request, response);
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }
  

//    private void loadEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int typeRoomId = Integer.parseInt(request.getParameter("id"));
//        TypeRoom typeRoom = daoTypeRoom.getTypeRoomByID(typeRoomId);
//        request.setAttribute("TypeRoomBID", typeRoom);
//        request.getRequestDispatcher("dashboard/jsp/EditTypeRoom.jsp").forward(request, response);
//    }

//    private void editTypeRoom(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int id = Integer.parseInt(request.getParameter("type_Room_Id"));
//        String name = request.getParameter("name");
//        int eventId = Integer.parseInt(request.getParameter("event_Id"));
//        String bed = request.getParameter("bed");
//        String bath = request.getParameter("bath");
//        String people = request.getParameter("people");
//        String image = request.getParameter("image");
//
//        daoTypeRoom.editTypeRoom(id, name, eventId, bed, bath, people, image);
//        response.sendRedirect("typeRoomURL?action=listTypeRoom");
//    }

//    private void addTypeRoom(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String name = request.getParameter("name");
//        String bed = request.getParameter("bed");
//        String bath = request.getParameter("bath");
//        String people = request.getParameter("people");
//        try {
//            // Retrieve the file part from the request
//            Part filePart = request.getPart("fileImage");
//            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
//            
//            // Save the file to the server
//            InputStream inputStream = filePart.getInputStream();
//            Files.copy(inputStream, Paths.get(uploadPath + File.separator + fileName));
//            daoTypeRoom.addTypeRoom(name, bed, bath, people, fileName);
//            response.sendRedirect("typeRoomURL");
//        } catch (IOException | ServletException e) {
//            response.getWriter().println("File upload failed due to an error: " + e.getMessage());
//        }
//    }
//
//    private void deleteTypeRoom(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int id = Integer.parseInt(request.getParameter("id"));
//        daoTypeRoom.deleteTypeRoom(id);
//        response.sendRedirect("typeRoomURL?action=listTypeRoom");
//    }

}
