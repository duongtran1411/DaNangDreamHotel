package Controller;

import Entity.ImageRoom;
import Entity.Room;
import Entity.TypeRoom;
import Model.DAOImageRoom;
import Model.DAORoom;
import Model.DAOTypeRoom;
import java.io.IOException;
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

@WebServlet(name = "TypeRoomController", urlPatterns = {"/typeRoomURL"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 5, // 5 MB
        maxRequestSize = 1024 * 1024 * 10) // 10 MB
public class TypeRoomController extends HttpServlet {

    private DAOTypeRoom daoTypeRoom = new DAOTypeRoom();
    private DAORoom daoRoom = new DAORoom();
    private DAOImageRoom daoImageRoom = new DAOImageRoom();
    private static String uploadPath = null;

    @Override
    public void init() throws ServletException {
        uploadPath = getServletContext().getRealPath("/img/typeroom");
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        /* TODO output your page here. You may use following sample code. */
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.isEmpty() || action.isBlank()) {
            action = "listTypeRoom";
        }
        switch (action) {
            case "loadEdit":
                loadEdit(request, response);
                break;
            case "edit":
                editTypeRoom(request, response);
                break;
            case "add":
                addTypeRoom(request, response);
                break;
            case "delete":
                deleteTypeRoom(request, response);
                break;
            default:
                listTypeRoom(request, response);
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
    }

    private void listTypeRoom(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<TypeRoom> allTypeRoom = daoTypeRoom.getAllTypeRoom();
        request.setAttribute("AllTypeRoom", allTypeRoom);
        request.getRequestDispatcher("dashboard/jsp/ManageTypeRoom.jsp").forward(request, response);
    }

    private void loadEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int typeRoomId = Integer.parseInt(request.getParameter("id"));
        TypeRoom typeRoom = daoTypeRoom.getTypeRoomByID(typeRoomId);
        request.setAttribute("TypeRoomBID", typeRoom);
        request.getRequestDispatcher("dashboard/jsp/EditTypeRoom.jsp").forward(request, response);
    }

    private void editTypeRoom(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("type_Room_Id"));
        String name = request.getParameter("name");
        int eventId = Integer.parseInt(request.getParameter("event_Id"));
        String bed = request.getParameter("bed");
        String bath = request.getParameter("bath");
        String people = request.getParameter("people");
        String image = request.getParameter("image");

        daoTypeRoom.editTypeRoom(id, name, eventId, bed, bath, people, image);
        response.sendRedirect("typeRoomURL?action=listTypeRoom");
    }

    private void addTypeRoom(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String bed = request.getParameter("bed");
        String bath = request.getParameter("bath");
        String people = request.getParameter("people");
        try {
            // Retrieve the file part from the request
            Part filePart = request.getPart("fileImage");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            System.out.println(fileName);

            // Save the file to the server
            InputStream inputStream = filePart.getInputStream();
            Files.copy(inputStream, Paths.get(uploadPath + File.separator + fileName));
            daoTypeRoom.addTypeRoom(name, bed, bath, people, fileName);
            response.sendRedirect("typeRoomURL");
        } catch (IOException | ServletException e) {
            response.getWriter().println("File upload failed due to an error: " + e.getMessage());
        }
    }

    private void deleteTypeRoom(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("type_Room_Id"));
        daoTypeRoom.deleteTypeRoom(id);
        response.sendRedirect("typeRoomURL?action=listTypeRoom");
    }

}
