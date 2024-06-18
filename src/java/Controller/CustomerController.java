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
public class CustomerController extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CustomerController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerController at " + request.getContextPath() + "</h1>");
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
        DAOCustomer daoCustomer = new DAOCustomer();
        List<Customer> customerList = daoCustomer.getAllCustomer();
        request.setAttribute("customerList", customerList);
        request.getRequestDispatcher("Customer.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int mod = Integer.parseInt(request.getParameter("mod"));
        int id;
        String firstName;
        String lastName;
        String phoneNumber;
        String email;
        String idCard;
        DAOCustomer daoCustomer = new DAOCustomer();
        List<Customer> customerList;
        switch (mod) {
            case 0://insert

                firstName = request.getParameter("firstName");
                lastName = request.getParameter("lastName");
                phoneNumber = request.getParameter("phoneNumber");
                email = request.getParameter("email");
                idCard = request.getParameter("idCard");

                daoCustomer.insertCustomer(firstName, lastName, phoneNumber, email, idCard);

                customerList = daoCustomer.getAllCustomer();
                request.setAttribute("customerList", customerList);
                request.getRequestDispatcher("Customer.jsp").forward(request, response);
                break;
            case 1://update
                 id = Integer.parseInt(request.getParameter("id"));
                firstName = request.getParameter("firstName");
                lastName = request.getParameter("lastName");
                phoneNumber = request.getParameter("phoneNumber");
                email = request.getParameter("email");
                idCard = request.getParameter("idCard");

                daoCustomer.updateCustomer(id, firstName, lastName, phoneNumber, email, idCard);

                customerList = daoCustomer.getAllCustomer();
                request.setAttribute("customerList", customerList);
                request.getRequestDispatcher("Customer.jsp").forward(request, response);
                break;
            case 2://delete
                id = Integer.parseInt(request.getParameter("id"));
                daoCustomer.deleteCustomer(id);
                customerList = daoCustomer.getAllCustomer();
                request.setAttribute("customerList", customerList);
                request.getRequestDispatcher("Customer.jsp").forward(request, response);
                break;
            default:
                customerList = daoCustomer.getAllCustomer();
                request.setAttribute("customerList", customerList);
                request.getRequestDispatcher("Customer.jsp").forward(request, response);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
