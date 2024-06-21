package Controller;

import Entity.RoomWithItem;
import Entity.TypeRoom;
import Model.DAOImageRoom;
import Model.DAOItem;
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
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

@WebServlet(name = "TypeRoomController", urlPatterns = {"/typeRoomURL"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 5, // 5 MB
        maxRequestSize = 1024 * 1024 * 10) // 10 MB
public class ItemInRoomController extends HttpServlet {

    private DAOTypeRoom daoTypeRoom = new DAOTypeRoom();
    private DAORoom daoRoom = new DAORoom();
    private DAOImageRoom daoImageRoom = new DAOImageRoom();
    private DAOItem daoItem = new DAOItem();
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
        if (action == null || action.isEmpty()) {
            action = "listTypeRoom";
        }
        switch (action) {
            case "view":
                allItemInRoom(request, response);
                break;
            case "update":
                updateQuantity(request, response);
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

    private void allItemInRoom(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int roomId = Integer.parseInt(request.getParameter("rid"));
        List<RoomWithItem> allItem = daoItem.getRoomWithItem(roomId);
        request.setAttribute("allItem", allItem);
        request.getRequestDispatcher("dashboard/jsp/ManageItemInRoom.jsp").forward(request, response);
    }

    private void updateQuantity(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int itemId = Integer.parseInt(request.getParameter("id"));
//        int newQuantity = Integer.parseInt(request.getParameter("quantity"));
//        int roomId = Integer.parseInt(request.getParameter("roomId"));
//        System.out.println(itemId + newQuantity + roomId);
//        daoItem.updateItemQuantity(itemId, newQuantity, roomId);
//        request.getRequestDispatcher("itemManageURL").forward(request, response);
        PrintWriter out = response.getWriter();
        String[] itemId = request.getParameterValues("itemId");
        String[] newQuantity = request.getParameterValues("quantity");
        int roomId = Integer.parseInt(request.getParameter("roomId"));
        for (int i = 0; i < itemId.length; i++) {
            System.out.println(itemId[i]+'a');
        }
        
        for (int i = 0; i < newQuantity.length; i++) {
            System.out.println(newQuantity[i]+'b');
        }
        System.out.println(roomId+ "c");
        int[] itemIds = null;
        int[] quantity = null;
        
        System.out.println("lengt:" + itemIds.length);
        if (itemId != null && newQuantity != null) {
            itemIds = new int[itemId.length];
            quantity = new int[newQuantity.length];
            for (int i = 0; i <  10; i++) {
               
                    itemIds[i] = Integer.parseInt(itemId[i]);
                    quantity[i] = Integer.parseInt(newQuantity[i]);
                
                System.out.println("item" + itemIds[i]);
                System.out.println("quantity" + quantity[i]);
                daoItem.updateItemQuantity(itemIds[i], quantity[i], roomId);
            }
        }
  
        response.sendRedirect("itemManageURL?action=view");

    }
}
