package Controller;

import Model.DAOCustomer;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author
 */
public class VNpayReturn extends HttpServlet {

    public static final String HOST_NAME = "smtp.gmail.com";

    public static final int SSL_PORT = 465; // Port for SSL

    public static final int TSL_PORT = 587; // Port for TLS/STARTTLS

    public static final String APP_EMAIL = "danangdreamhotel@gmail.com"; // your email

    public static final String APP_PASSWORD = "nwnv qoet tkwi dyoo"; // your password

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

            if (email != null && !email.equals("")) {
                String to = email; // recipient's email
                Properties props = new Properties();
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.host", HOST_NAME);
                props.put("mail.smtp.socketFactory.port", SSL_PORT);
                props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
                props.put("mail.smtp.port", SSL_PORT);

                // get Session
                Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(APP_EMAIL, APP_PASSWORD);
                    }
                });

                LocalDate currentDate = LocalDate.now();

                // Định dạng ngày tháng năm theo format dd/MM/yyyy
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                String formattedDate = currentDate.format(formatter);
                // compose message
                try {
                    MimeMessage message = new MimeMessage(session);
                    message.setFrom(new InternetAddress(APP_EMAIL)); // sender's email
                    message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                    message.setSubject("Booking Confirmation");

                    // HTML content for the email
                    String htmlContent = "<h1>Thank You for Your Booking!</h1>"
                            + "<p>Dear Customer,</p>"
                            + "<p>We appreciate your booking. Here are the details:</p>"
                            + "<ul>"
                            + "<li><b>Booking ID:</b> 1</li>"
                            + "<li><b>Date:</b> " + formattedDate + " </li>"
                            + "<li><b>Room:</b> P401 </li>"
                            + "</ul>"
                            + "<p>We look forward to serving you.</p>"
                            + "<p>Best regards,</p>"
                            + "<p><b>Da Nang Dream Hotel</b></p>";

                    message.setContent(htmlContent, "text/html; charset=utf-8");

                    // send message
                    Transport.send(message);

                    System.out.println("Message sent successfully");
                } catch (MessagingException e) {
                    throw new RuntimeException(e);
                }
            }

            req.getSession().removeAttribute("firstName");
            req.getSession().removeAttribute("lastName");
            req.getSession().removeAttribute("phone");
            req.getSession().removeAttribute("email");
            req.getSession().removeAttribute("card");
        }

        // Redirect to a confirmation page or display a message
        resp.sendRedirect("PaymentConfirmation.jsp?responseCode=" + vnp_ResponseCode);
    }
}
