
package Controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet(name = "BookingController", urlPatterns = {"/BookingDetailURL"})
public class BookingDetailController extends HttpServlet {
   

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    } 


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
            String action = request.getParameter("action");
        if (action == null || action.isEmpty()) {
            action = "listBooking";
        }
        switch (action) {
            case "delete":
      
                break;
            case "update":      
         
                break;
            default:
                listDetail(request, response);
                break;
        }
    } 


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doGet(request, response);
    }
 private void listDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
