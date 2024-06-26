<%-- 
    Document   : PaymentConfirmation
    Created on : Jun 20, 2024, 8:32:44 PM
    Author     : Sơnnnn
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Submission Received</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                text-align: center;
                padding: 50px;
                background-color: <%
                    String responseCode = request.getParameter("responseCode");
                    if ("00".equals(responseCode)) {
                        out.print("#f5f5f5"); // Successful payment background color
                    } else {
                        out.print("#ffdddd"); // Failed or cancelled payment background color
                    }
                    %>;
            }
            .container {
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                padding: 40px;
                max-width: 500px;
                margin: auto;
            }
            .icon {
                font-size: 48px;
                color: <%
                    if ("00".equals(responseCode)) {
                        out.print("#4CAF50"); // Successful payment color
                    } else {
                        out.print("#FF0000"); // Failed or cancelled payment color
                    }
                    %>;
            }
            .message {
                font-size: 24px;
                margin: 20px 0;
            }
            .submessage {
                font-size: 16px;
                color: #777;
            }
            .back-link {
                display: block;
                margin-top: 20px;
                color: #007BFF;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="icon">
                <% 
                    if ("00".equals(responseCode)) {
                        out.print("✔"); 
                    } else {
                        out.print("X");
                    }
                %>
            </div>
            <div class="message">Thank you!</div>
            <div class="submessage">Your submission is received and we will contact you soon.</div>
            <h4 class="message" style="color: <%
                if ("00".equals(responseCode)) {
                    out.print("#4CAF50"); // Successful payment color
                } else {
                    out.print("#FF0000"); // Failed or cancelled payment color
                }
                %>">
                <%
                    if ("00".equals(responseCode)) {
                        out.print("Payment successful!");
                    } else {
                        out.print("Payment failed or cancelled.");
                    }
                %>
            </h4>
            <a href="homeController" class="back-link">← BACK TO HOME</a>
        </div>
    </body>
</html>
