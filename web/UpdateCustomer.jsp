<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Model.DAOCustomer" %>
<%@ page import="Entity.Customer" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Customer</title>
    <link rel="icon" href="img/title_danangdream.jpg" type="image/x-icon"/>
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
    </style>
</head>
<body>
    <div class="container">
        <h1>Update Customer Information</h1>
    <%
       int currCustomerId = Integer.parseInt(request.getParameter("id"));
        DAOCustomer daoCustomer = new DAOCustomer();
        Customer cus = daoCustomer.getCustomerById(currCustomerId);
    %>
    <form action="customerController?action=edit" method="post">
        Id: <input  readonly="" type="text" name="id" value="<%= cus.customerId %>"><br>
        First Name: <input type="text" name="firstName" value="<%= cus.firstName %>"><br>
        Last Name: <input type="text" name="lastName" value="<%= cus.lastName %>"><br>
        Phone Number: <input type="text" name="phoneNumber" value="<%= cus.phoneNumber %>"><br>
        Email: <input type="text" name="email" value="<%= cus.email %>"><br>
        ID Card: <input type="text" name="idCard" value="<%= cus.idCard %>"><br>
        
        <input type="submit" value="Submit" style="background-color: #C59B24; color: white">
    </form>
        <div class="back-btn">
            <a href="customerController" style="color: #C59B24">Back</a>
        </div>
    </div>
        
</body>
</html>
