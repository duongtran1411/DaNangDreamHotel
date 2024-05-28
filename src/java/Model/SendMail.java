/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Entity.RegistrationDTO;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.apache.catalina.User;

/**
 *
 * @author ADMIN
 */
public class SendMail {

    public boolean sendEmailRegister(String toMail) throws javax.mail.MessagingException {
        boolean test = false;
        String fromEmail = "lem29140@gmail.com";
        String password = "aose lzcu dxzb yvna";
        
        String toEmail = toMail;

        Properties props = new Properties();
        props.setProperty("mail.smtp.host", "smtp.gmail.com");
        props.setProperty("mail.smtp.port", "587");
        props.setProperty("mail.smtp.auth", "true");
        props.setProperty("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.socketFactory.port", "587");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

        
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(fromEmail));
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
        message.setSubject("Comfirm Register");
        message.setText("Click the following link to comfirm your account: http://localhost:9999/PROJECT/verify");
        
        Transport.send(message);
        test = true;
       

        return test;
        
    }

    public boolean sendEmailResetPass(String emailReset) {
        boolean test = false;
        String fromEmail = "truonghmhe163617@fpt.edu.vn";
        String password = "aose lzcu dxzb yvna";
        
        String toEmail = emailReset;

        Properties props = new Properties();
        props.setProperty("mail.smtp.host", "smtp.gmail.com");
        props.setProperty("mail.smtp.port", "587");
        props.setProperty("mail.smtp.auth", "true");
        props.setProperty("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.socketFactory.port", "587");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

        try {
            
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            message.setSubject("Reset Password");
            message.setText("Click the following link to reset your password: http://localhost:9999/PROJECT/changePassResetServlet");

            Transport.send(message);
            test = true;
            
        } catch (MessagingException e) {
            e.printStackTrace();
        }

        return test;
        
    }

}
