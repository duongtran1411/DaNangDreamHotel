/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Entity.Jobs;
import Model.DAOJobs;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 *
 * @author PC QUANG MINH
 */
@WebServlet(name = "InsertJobsController", urlPatterns = {"/InsertJobsControllerURL"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 5, // 5 MB
        maxRequestSize = 1024 * 1024 * 10) // 10
public class InsertJobsController extends HttpServlet {

    private static String uploadPath = null;

    @Override
    public void init() throws ServletException {
        uploadPath = getServletContext().getRealPath("/uploads/cv");
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
    }

    private List<Jobs> jobList = new ArrayList<>();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InsertJobsController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InsertJobsController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String dob = request.getParameter("dob");

        // Define the date format
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        // Parse the date strings
        java.sql.Date create_at = null;
        try {
            java.util.Date createDate = sdf.parse(dob);
            create_at = new java.sql.Date(createDate.getTime());
        } catch (ParseException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid date format");
            return;
        }

        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        // Handle file upload
        String fileName = null;
        try {
            Part filePart = request.getPart("cv");
            if (filePart != null && filePart.getSize() > 0) {
                fileName = UUID.randomUUID().toString() + "_" + Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                Files.copy(filePart.getInputStream(), Paths.get(uploadPath + File.separator + fileName));
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("File upload failed due to an error: " + e.getMessage());
            return;
        }
  String status = request.getParameter("status");
        // Save job details
        DAOJobs dao = new DAOJobs();
        int id = dao.getLastJobs().getJob_Id();
        dao.insertJobs(id+1 , firstName, lastName, create_at, phone, email, fileName, status);

        response.sendRedirect("ManagerJobsControllerURL");
    }

    // Extracts file name from HTTP header content-disposition
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
/*
 try {
            Part filePart = request.getPart("fileImage");
            String fileName = UUID.randomUUID().toString() + "_" + Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

            InputStream inputStream = filePart.getInputStream();
            Files.copy(inputStream, Paths.get(uploadPath + File.separator + fileName));
            if (daoTypeRoom.isValidName(name)) {
                daoTypeRoom.addTypeRoom(name, bed, bath, people, fileName);
                response.sendRedirect("typeRoomURL?action=listTypeRoom");
            } else {
                
                response.sendRedirect("typeRoomURL?action=listTypeRoom");
            }
        } catch (IOException | ServletException e) {
            response.getWriter().println("File upload failed due to an error: " + e.getMessage());
            e.printStackTrace();
        }
*/
