package Controller;

import Entity.TypeRoom;
import Model.DAOTypeRoom;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "TypeRoomController", urlPatterns = {"/typeRoomURL"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 5, // 5 MB
        maxRequestSize = 1024 * 1024 * 10) // 10 MB
public class TypeRoomController extends HttpServlet {

    private DAOTypeRoom daoTypeRoom = new DAOTypeRoom();
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
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.isEmpty()) {
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
        if (allTypeRoom == null) {
            response.sendRedirect("Pages.jsp");
        } else {
            request.setAttribute("AllTypeRoom", allTypeRoom);
            request.getRequestDispatcher("dashboard/jsp/ManageTypeRoom.jsp").forward(request, response);
        }
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
        int bed = Integer.parseInt(request.getParameter("bed"));
        int bath = Integer.parseInt(request.getParameter("bath"));
        int people = Integer.parseInt(request.getParameter("people"));

        try {
            Part filePart = request.getPart("fileImageTypeRoom");
            String fileName = UUID.randomUUID().toString() + "_" + Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

            InputStream inputStream = filePart.getInputStream();
            Files.copy(inputStream, Paths.get(uploadPath + File.separator + fileName));
            if (daoTypeRoom.isValidName(name)) {
                daoTypeRoom.editTypeRoom(id, name, eventId, bed, bath, people, fileName);
                setNotificationAndRedirect(request, response, "Updated successfully!", "success");
            } else {
                setNotificationAndRedirect(request, response, "Invalid Type Room name!", "error");
            }

        } catch (IOException | ServletException e) {
            setNotificationAndRedirect(request, response, "File upload failed due to an error: " + e.getMessage(), "error");
            e.printStackTrace();
        }
    }

    private void addTypeRoom(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        int bed = Integer.parseInt(request.getParameter("bed"));
        int bath = Integer.parseInt(request.getParameter("bath"));
        int people = Integer.parseInt(request.getParameter("people"));

        try {
            Part filePart = request.getPart("fileImage");
            String fileName = UUID.randomUUID().toString() + "_" + Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

            InputStream inputStream = filePart.getInputStream();
            Files.copy(inputStream, Paths.get(uploadPath + File.separator + fileName));
            if (daoTypeRoom.isValidName(name)) {
                daoTypeRoom.addTypeRoom(name, bed, bath, people, fileName);
                setNotificationAndRedirect(request, response, "Added successfully!", "success");
            } else {
                setNotificationAndRedirect(request, response, "Invalid Type Room name!", "error");
            }
        } catch (IOException | ServletException e) {
            setNotificationAndRedirect(request, response, "File upload failed due to an error: " + e.getMessage(), "error");
            e.printStackTrace();
        }
    }

    private void deleteTypeRoom(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        boolean isDeleted = daoTypeRoom.deleteTypeRoom(id);

        if (isDeleted) {
            setNotificationAndRedirect(request, response, "Type Room deleted successfully!", "success");
        } else {
            setNotificationAndRedirect(request, response, "This room type have the room can't delete", "error");
        }
    }

    private void setNotificationAndRedirect(HttpServletRequest request, HttpServletResponse response, String message, String status) throws IOException {
        request.getSession().setAttribute("notificationMessage", message);
        request.getSession().setAttribute("notificationStatus", status);
        response.sendRedirect("typeRoomURL?action=listTypeRoom");
    }
}
