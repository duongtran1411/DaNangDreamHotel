<%-- 
    Document   : ManageRoom
    Created on : May 26, 2024, 5:49:23 PM
    Author     : Sơnnnn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Da Nang Hotel</title>
        <link rel="shortcut icon" type="image/png" href="dashboard/assets/images/logos/favicon.png" />
        <link rel="stylesheet" href="dashboard/assets/css/styles.min.css" />
        <link rel="stylesheet" href="dashboard/assets/css/styles.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>

    </head>

    <body>
        <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
             data-sidebar-position="fixed" data-header-position="fixed">
            <jsp:include page="SlideBar.jsp"></jsp:include>
                <div class="body-wrapper">
                <jsp:include page="Profile.jsp"></jsp:include>
                    <div class="card">
                        <div class="card-body">
                            <div class="container-fluid" style="height: 800px;width: 1300px">
                                <!-- Page Heading -->
                                <h1 class="h3 mb-2 text-gray-800">CUSTOMERS</h1>
                            <c:if test="${not empty customer}">
                                <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#addCustomer">
                                    <p class="mb-0 fs-3"><i class="ti ti-plus fs-6"></i>Add Customer</p>
                                </button>
                            </c:if>
                            <div class="card shadow mb-4">

                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th class="sortable">ID</th>
                                                    <th class="sortable">First Name</th>
                                                    <th class="sortable">Last Name</th>
                                                    <th class="sortable">Phone Number</th>
                                                    <th class="sortable">Email</th>
                                                    <th class="sortable">ID Card</th>
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
                                                            <a href="UpdateCustomer.jsp?id=${o.customerId}"class="settings" title="Settings" data-toggle="tooltip"><i class='far fa-edit'></i></a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                <c:forEach items="${customer}" var="o">
                                                    <tr>
                                                        <td>${o.customerId}</td>
                                                        <td>${o.firstName}</td>
                                                        <td>${o.lastName}</td>
                                                        <td>${o.phoneNumber}</td>
                                                        <td >${o.email}</td>
                                                        <td>${o.idCard}</td>
                                                        <td data-label="Actions">
                                                            <a href="UpdateCustomer.jsp?id=${o.customerId}"class="settings" title="Settings" data-toggle="tooltip"><i class='far fa-edit'></i></a>
                                                            <a href="customerController?action=delete&id=${o.customerId}" class="delete" title="Delete" data-toggle="tooltip"><i class='far fa-trash-alt' style="color: #c80000"></i></a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid">
            <div class="modal fade" id="addCustomer">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="customerController?action=add" method="post">        
                            <div class="modal-header">						
                                <h4 class="modal-title">Add Customer</h4>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <input class="form-control" id="firstName" name="firstName" type="text"  placeholder="First Name"/>
                                    <span id="firstName-error" style="color: red;"></span>
                                </div>
                                <br>
                                <div class="form-group">
                                    <input class="form-control" id="lastName" name="lastName" type="text" placeholder="Last Name"/>
                                    <span id="lastName-error" style="color: red;"></span>
                                </div>
                                <br>
                                <div class="form-group">
                                    <input class="form-control" id="phone" name="phoneNumber" type="text" placeholder="Phone Number"/>
                                    <span id="phone-error" style="color: red;"></span>
                                </div>
                                <br>
                                <div class="form-group">
                                    <input class="form-control" id="email" name="email" type="email" placeholder="Your Email"/>
                                    <span id="email-error" style="color: red;"></span>
                                </div>
                                <br>
                                <div class="form-group">
                                    <input class="form-control" id="card" name="idCard" type="text" placeholder="Card"/>
                                    <span id="card-error" style="color: red;"></span>
                                </div>
                                <br>
                                <% int rCode = Integer.parseInt(request.getParameter("rCode")); %>
                                <input class="form-control" id="rCode" name="rCode" hidden value="<%= rCode %>"/>
                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-bs-dismiss="modal" value="Cancel">
                                <input type="submit" class="btn btn-success" value="Add">
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>
        <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
        <script>
            $(document).ready(function () {
                function validateField(field, regex, errorElement, errorMessage) {
                    var value = field.val();
                    if (!regex.test(value)) {
                        errorElement.text(errorMessage);
                    } else {
                        errorElement.text("");
                    }
                }

                $("#firstName").on("input", function () {
                    validateField(
                            $(this),
                            /^[A-Z]/,
                            $("#firstName-error"),
                            "The first letter with uppercase."
                            );
                });

                $("#lastName").on("input", function () {
                    validateField(
                            $(this),
                            /^[A-Z]/,
                            $("#lastName-error"),
                            "The first letter with uppercase."
                            );
                });

                $("#card").on("input", function () {
                    validateField(
                            $(this),
                            /^\d{12}$/,
                            $("#card-error"),
                            "Card number must be exactly 12 digits."
                            );
                });

                $("#phone").on("input", function () {
                    validateField(
                            $(this),
                            /^0\d{9}$/,
                            $("#phone-error"),
                            "Phone number must be exactly 10 digits."
                            );
                });
            });
        </script>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="dashboard/assets/libs/jquery/dist/jquery.min.js"></script>
        <script src="dashboard/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
        <script src="dashboard/assets/js/sidebarmenu.js"></script>
        <script src="dashboard/assets/js/app.min.js"></script>
        <script src="dashboard/assets/libs/simplebar/dist/simplebar.js"></script>
    </body>

</html>