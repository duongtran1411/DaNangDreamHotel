/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Entity.Account;
import Model.DAOAccount;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author PC QUANG MINH
 */
@WebServlet(name="InsertController", urlPatterns={"/InsertControllerURL"})
public class InsertAccountController extends HttpServlet {
   
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
    DAOAccount dao = new DAOAccount();
    Account lastAccount = dao.getLastAccount();
    
    if (lastAccount == null) {
        // Handle case where there's no last account
        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to retrieve last account");
        return;
    }

    int id = lastAccount.getAccount_Id() + 1;
    int jobId = lastAccount.getJobId().getJob_Id() + 1;

    String userName = request.getParameter("username");
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    int roleId = Integer.parseInt(request.getParameter("roleid"));
    


    dao.insertAccount( userName, firstName, lastName, password, email, phone, roleId);
    response.sendRedirect("ManageAccountControllerURL");
}



        // Create an instance of your DAO (Data Access Object)
        
    

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
/*
public void addRoom(String name, int floor, double price, int size, int typeRoom) {
        String sql = "INSERT INTO managerhotel.`room`\n"
                + "(name,\n"
                + "floor_Room_Id,\n"
                + "price,\n"
                + "size,\n"
                + "type_Room_Id)\n"
                + "VALUES\n"
                + "(?,?,?,?,?);";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, name);
            pre.setInt(2, floor);
            pre.setDouble(3, price);
            pre.setInt(4, size);
            pre.setInt(5, typeRoom);
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAORoom.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
*/
