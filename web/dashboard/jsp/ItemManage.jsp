<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Entity.FormatUtils" %>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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

            .btn-adjust {
                border: none;
                background-color: #343a40;
                color: white;
                padding: 5px 10px;
                margin: 0 5px;
                cursor: pointer;
                border-radius: 5px;
                transition: background-color 0.3s;
            }

            .btn-adjust:hover {
                background-color: #495057;
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
    background-color: #343a40;
    color: white;
}
        </style>
    </head>

    <body>
        <!--  Body Wrapper -->
        <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed">
            <div class="sidebar">
                
                <jsp:include page="SlideBar.jsp"></jsp:include>
                </div>

                <div class="body-wrapper">
                <jsp:include page="Profile.jsp"></jsp:include>
                <a href="AddItem.jsp?id=${o.item_Id}">Add</a>
                    <section class="rooms-section spad">
                        <table id="customerTable">
                            <thead>
                                <tr>
                                    <th>Item ID</th>
                                    <th>Item Name</th>
                                    <th>Type</th>
                                    <th>Price</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${allItem}" var="o">
                                <tr>
                                    <td data-label="Item">${o.item_Id}</td>
                                    <td data-label="Name">
                                        ${o.name}
                                    </td>
                                    <td data-label="type">
                                        ${o.typeItem_Id}
                                    </td>
                                    <td data-label="Price">
                                        ${FormatUtils.formatPRice(o.price)}đ
                                    </td>
                                    <td data-label="Actions">
                                      <a href="UpdateItem.jsp?id=${o.item_Id}">Edit</a> | <a href="ItemController?action=delete&id=${o.item_Id}">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                         
                </section>
                    <div class="pagination">
                    <c:if test="${currentPage > 1}">
                        <a href="ItemController?page=${currentPage - 1}">Previous</a>
                    </c:if>
                    <c:forEach begin="1" end="${totalPages}" var="page">
                        <a href="ItemController?page=${page}" class="${page == currentPage ? 'active' : ''}">${page}</a>
                    </c:forEach>
                    <c:if test="${currentPage < totalPages}">
                        <a href="ItemController?page=${currentPage + 1}">Next</a>
                    </c:if>
                </div>
            </div>
                     
        </div>



    </body>

</html>
