<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Da Nang Hotel</title>
    <link rel="shortcut icon" type="image/png" href="../assets/images/logos/favicon.png" />
    <link rel="stylesheet" href="dashboard/assets/css/styles.min.css" />
    <link rel="stylesheet" href="dashboard/assets/css/styles.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <style>
       

        .page-wrapper {
            display: flex;
        }

        .sidebar {
            width: 250px;
            position: fixed;
            top: 0;
            bottom: 0;
            left: 0;
            background-color: #343a40;
            color: white;
            z-index: 1000;
            padding-top: 20px;
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            display: block;
            padding: 10px 20px;
        }

        .sidebar a:hover {
            background-color: #495057;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: white;
            display: contents;
        }

        table th,
        table td {
            padding: 12px 15px;
            border: 1px solid #dee2e6;
            text-align: left;
        }

        table thead th {
            background-color: #343a40;
            color: white;
        }

        table tbody tr:nth-of-type(even) {
            background-color: #f8f9fa;
        }

        table tbody tr:hover {
            background-color: #e9ecef;
        }

        @media (max-width: 768px) {
            .body-wrapper {
                margin-left: 0;
            }

            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }
        }
    </style>
</head>

<body>
    <!--  Body Wrapper -->
    <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
        data-sidebar-position="fixed" data-header-position="fixed">
        <div class="sidebar">
            <jsp:include page="SlideBar.jsp"></jsp:include>
        </div>

        <div class="body-wrapper">
            <jsp:include page="Profile.jsp"></jsp:include>

            <section class="rooms-section spad">
                <table id="customerTable">
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
                        <c:forEach items="${allCustomer}" var="o">
                            <tr>
                                <td data-label="ID">${o.customerId}</td>
                                <td data-label="First Name">${o.firstName}</td>
                                <td data-label="Last Name">${o.lastName}</td>
                                <td data-label="Phone Number">${o.phoneNumber}</td>
                                <td data-label="Email">${o.email}</td>
                                <td data-label="ID Card">${o.idCard}</td>
                                <td data-label="Actions">
                                    <a href="UpdateCustomer.jsp?id=${o.customerId}">Edit</a> | <a href="customerController?action=delete&id=${o.customerId}">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </section>
        </div>
    </div>

    <script src="../assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/js/sidebarmenu.js"></script>
    <script src="../assets/js/app.min.js"></script>
    <script src="../assets/libs/simplebar/dist/simplebar.js"></script>
</body>

</html>
