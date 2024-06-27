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
       

        body,
        html {
            height: 100%;
            margin: 0;
        }

        .page-wrapper {
            display: flex;
            min-height: 100vh;
            flex-direction: column;
        }

        .sidebar {
            width: 250px;
            position: fixed;
            top: 0;
            bottom: 0;
            left: 0;
            background-color: #C59B24;
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
            background-color: #a07d1d;
        }

        .body-wrapper {
            flex-grow: 1;
            margin-left: 250px;
            padding: 20px;
            background-color: #f5f5f5;
            display: flex;
            flex-direction: column;
        }

        .content {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: white;
        }

        table th,
        table td {
            padding: 12px 15px;
            border: 1px solid #dee2e6;
            text-align: left;
        }

        table thead th {
            background-color: #C59B24;
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

        .btn-adjust {
            border: none;
            background-color: #C59B24;
            color: white;
            padding: 5px 10px;
            margin: 0 5px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .btn-adjust:hover {
            background-color: #a07d1d;
        }

        .quantity-container {
            display: flex;
            align-items: center;
        }

        .quantity {
            margin: 0 10px;
        }

        .btn-save {
            border: none;
            background-color: #28a745;
            color: white;
            padding: 5px 10px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .btn-save:hover {
            background-color: #218838;
        }

        .pagination-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .pagination a {
            margin: 0 5px;
            padding: 10px 15px;
            text-decoration: none;
            color: #343a40;
            border: 1px solid #dee2e6;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .pagination a:hover {
            background-color: #f8f9fa;
        }

        .pagination a.active {
            background-color: #C59B24;
            color: white;
        }
        .btn-add {
            border: none;
            background-color: #C59B24; /* Màu nền */
            color: white; /* Màu chữ */
            padding: 10px 20px; /* Khoảng cách bên trong nút */
            margin: 10px 0; /* Khoảng cách bên ngoài nút */
            cursor: pointer; /* Con trỏ chuột */
            border-radius: 5px; /* Bo tròn góc */
            text-decoration: none; /* Bỏ gạch chân */
            transition: background-color 0.3s; /* Hiệu ứng chuyển đổi màu nền */
        }

        .btn-add:hover {
            background-color: #C59B24; /* Màu nền khi hover */
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
