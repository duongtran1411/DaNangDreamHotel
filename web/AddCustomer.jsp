<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Add Customer</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
            }
            .container {
                max-width: 600px;
                margin: 50px auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            h1 {
                text-align: center;
            }
            form {
                margin-top: 20px;
            }
            label {
                display: block;
                margin-bottom: 5px;
            }
            input[type="text"] {
                width: 100%;
                padding: 8px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            input[type="submit"] {
                width: 100%;
                padding: 10px;
                background-color: #007bff;
                border: none;
                border-radius: 4px;
                color: #fff;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            input[type="submit"]:hover {
                background-color: #0056b3;
            }
            .back-btn {
                margin-top: 20px;
                text-align: center;
            }
            .back-btn a {
                text-decoration: none;
                color: #007bff;
                font-weight: bold;
            }
            .phone-form {
                display: flex;
                align-items: center;
                margin-bottom: 10px;
            }
            .phone-form label {
                margin-right: 10px;
            }
            .phone-form select,
            .phone-form input {
                margin-right: 10px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Personal Information</h1>
            <form id ="bookingForm" action="customerController?action=add" method="post">
                <label for="firstName">First Name:</label>
                <input required="" type="text" id="firstName" name="firstName"><br>
                <label for="lastName">Last Name:</label>
                <input required="" type="text" id="lastName" name="lastName"><br>
                <label for="phoneNumber">Phone Number:</label>
                <input required="" type="text" id="phoneNumber" name="phoneNumber"><br>
                <label for="email">Email:</label>
                <input required=""type="text" id="email" name="email"><br>
                <label for="idCard">ID Card:</label>
                <input required="" type="text" id="idCard" name="idCard"><br>
                <input type="submit" value="Submit">
            </form>
            <div class="back-btn">
                <a href="customerController">Back</a>
            </div>
        </div>
    </body>

</html>
