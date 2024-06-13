/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Entity.ImageRoom;
import Entity.Room;
import Model.DAOImageRoom;
import Model.DAORoom;
import Model.DAOTypeRoom;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

/**
 *
 * @author Sơnnnn
 */
@WebServlet(name = "ImageRoomController", urlPatterns = {"/imageRoomURL"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 5, // 5 MB
        maxRequestSize = 1024 * 1024 * 10) // 10 MB
public class ImageController extends HttpServlet {

    private DAORoom daoRoom = new DAORoom();
    private DAOImageRoom daoImageRoom = new DAOImageRoom();
    private static String uploadPath = null;

    @Override
    public void init() throws ServletException {
        uploadPath = getServletContext().getRealPath("/img/room");
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
    }
    
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
            action = "not found";
        }
        switch (action) {
            case "add":
                addImage(request, response);
                break;
            case "delete":
                deleteImage(request, response);
                break;
            case "view":
                viewImageByRoomId(request, response);
                break;
            default:
                response.sendRedirect("Pages.jsp");
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
        doGet(request, response);
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

    private void viewImageByRoomId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int roomId = Integer.parseInt(request.getParameter("rid"));
        Room room = daoRoom.getNameByRoomId(roomId);
        List<ImageRoom> imageRooms = daoImageRoom.getImageByRoomId(roomId);
        request.setAttribute("rid", roomId);
        request.setAttribute("ImageRoomBRID", imageRooms);
        request.setAttribute("NameRoom", room);
        request.getRequestDispatcher("dashboard/jsp/ViewImageRoom.jsp").forward(request, response);
    }

    private void addImage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int roomId = Integer.parseInt(request.getParameter("rid"));
        try {
            Part filePart = request.getPart("fileImageRoom");
            String fileName = UUID.randomUUID().toString() + "_" + Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

            InputStream inputStream = filePart.getInputStream();
            Files.copy(inputStream, Paths.get(uploadPath + File.separator + fileName));
            daoImageRoom.addImageByRoomId(roomId, fileName);
            response.sendRedirect("imageRoomURL?action=view&rid=" + roomId + "");
        } catch (IOException | ServletException e) {
            response.getWriter().println("File upload failed due to an error: " + e.getMessage());
            e.printStackTrace();
        }
    }

    private void deleteImage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
