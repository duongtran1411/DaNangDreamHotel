package Controller;

import Entity.Config;
import Model.DAOCustomer;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author
 */
public class VNpayReturn extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String vnp_ResponseCode = req.getParameter("vnp_ResponseCode");
        String vnp_TxnRef = req.getParameter("vnp_TxnRef");

        if ("00".equals(vnp_ResponseCode)) {
            // Payment successful, retrieve customer data from session and save to database
            String firstName = (String) req.getSession().getAttribute("firstName");
            String lastName = (String) req.getSession().getAttribute("lastName");
            String phone = (String) req.getSession().getAttribute("phone");
            String email = (String) req.getSession().getAttribute("email");
            String card = (String) req.getSession().getAttribute("card");

            DAOCustomer daoC = new DAOCustomer();
            daoC.insertCustomer(firstName, lastName, phone, email, card);
        }
        
        // Redirect to a confirmation page or display a message
        resp.sendRedirect("PaymentConfirmation.jsp?responseCode=" + vnp_ResponseCode);
    }
}
