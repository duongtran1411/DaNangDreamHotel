<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, Entity.Customer" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer List</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8" />
    <meta name="description" content="Sona Template" />
    <meta name="keywords" content="Sona, unica, creative, html" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link
        href="https://fonts.googleapis.com/css?family=Lora:400,700&amp;display=swap"
        rel="stylesheet"
    />
    <link
        href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&amp;display=swap"
        rel="stylesheet"
    />
    <title>Da Nang Hotel</title>
    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" />
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css" />
    <link rel="stylesheet" href="css/flaticon.css" type="text/css" />
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css" />
    <link rel="stylesheet" href="css/nice-select.css" type="text/css" />
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css" />
    <link rel="stylesheet" href="css/magnific-popup.css" type="text/css" />
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css" />
    <link rel="stylesheet" href="css/style.css" type="text/css" />
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
            color: #333;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        @media (max-width: 600px) {
            table, thead, tbody, th, td, tr {
                display: block;
                width: 100%;
            }
            tr {
                margin-bottom: 15px;
            }
            td {
                text-align: right;
                padding-left: 50%;
                position: relative;
            }
            td::before {
                content: attr(data-label);
                position: absolute;
                left: 0;
                width: 45%;
                padding-left: 15px;
                font-weight: bold;
                text-align: left;
            }
        }
    </style>
</head>
<body>
    <div class="menu-item">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="logo">
                        <a href="index.html">
                            <img src="img/logo.png" alt="" />
                        </a>
                    </div>
                </div>
                <div class="col-lg-10">
                    <div class="nav-menu">
                        <nav class="mainmenu">
                            <ul>
                                <li class="active"><a href="Home.jsp">Home</a></li>
                                <li>
                                    <a href="ItemManager">Item List</a>
                                    <ul class="dropdown">
                                        <li><a href="#">Luxury Rooms</a></li>
                                        <li><a href="#">Grand Rooms</a></li>
                                        <li><a href="#">Family Rooms</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </nav>
                        <div class="nav-right search-switch">
                            <i class="icon_search"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <h1>Customer List</h1>
    <div>
        <button onclick="location.href='AddCustomer.jsp'">Booking now</button>
    </div>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Phone Number</th>
                <th>Email</th>
                <th>ID Card</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Customer> customerList = (List<Customer>) request.getAttribute("customerList");
                if (customerList != null) {
                    for (Customer customer : customerList) {
            %>
            <tr>
                <td data-label="ID"><%= customer.getCustomerId() %></td>
                <td data-label="First Name"><%= customer.getFirstName() %></td>
                <td data-label="Last Name"><%= customer.getLastName() %></td>
                <td data-label="Phone Number"><%= customer.getPhoneNumber() %></td>
                <td data-label="Email"><%= customer.getEmail() %></td>
                <td data-label="ID Card"><%= customer.getIdCard() %></td>
                <td data-label="Actions">
                    <button onclick="location.href='UpdateCustomer.jsp?id=<%= customer.getCustomerId() %>'">Update</button>
                    <button onclick="if(confirm('Are you sure you want to delete this customer?')) { location.href='customerController?mod=2?id=<%= customer.getCustomerId() %>'; }">Delete</button>
                </td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>
</body>
</html>
