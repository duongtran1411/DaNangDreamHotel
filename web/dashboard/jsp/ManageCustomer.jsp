<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${empty sessionScope.acc}">
    <jsp:include page="../../Pages.jsp"></jsp:include>
</c:if>
<c:if test="${not empty sessionScope.acc}">
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
            <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        </head>
        <style>
            .search {
                margin-bottom: auto;
                margin-top: auto;
                height: 70px;
                background-color: #fff;
                border: 2px solid #213E66;
                padding: 10px;
                border-radius: 30px;
            }

            .search_input {
                color: black;
                border: 0;
                outline: 0;
                background: none;
                width: 0;
                margin-top: 3px;
                line-height: 40px;
                transition: width 0.4s linear;
            }

            .search .search_input {
                padding: 0 10px;
                width: 550px;
                transition: width 0.4s linear;
            }

            .search:hover>.search_icon {
                background: #005cbf;
                color: #fff;
            }

            .search_icon {
                height: 48px;
                width: 48px;
                float: right;
                display: flex;
                justify-content: center;
                align-items: center;
                border-radius: 50%;
                color: white;
                background-color: black;
            }

            a:link {
                text-decoration: none;
            }
            .dataTables_wrapper .dataTables_paginate .paginate_button {
                background-color: #007bff;
                color: #fff !important;
                border-radius: 5px;
                margin: 0 2px;
            }
            .dataTables_length select{
                border-radius: 5px;
                padding-left: 3px;
                padding-right: 3px;
                margin-left: 8px;
                margin-right: 8px;
            }

        </style>

        <body>
            <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed">
                <jsp:include page="SlideBar.jsp"></jsp:include>
                    <div class="body-wrapper">
                    <jsp:include page="Profile.jsp"></jsp:include>
                        <div class="card">
                            <div class="card-body">
                                <div class="container-fluid" >
                                    <div class="container" style="margin-right: 105px; height: 800px;">

                                        <!-- Page Heading -->
                                        <h1 class="h3 mb-2 text-gray-800">CUSTOMERS</h1>
                                        <div class="d-flex justify-content-center">
                                            <div class="search">
                                                <input class="search_input" id="searchInput" type="text" name="txt" placeholder="Search...">
                                                <a href="#" class="search_icon"><i class="fa fa-search"></i></a>
                                            </div>
                                        </div>
                                    <c:if test="${not empty customers}">
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
                                                            <!--<th class="sortable">ID</th>-->
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
                                                                <!--<td data-label="ID">${o.customerId}</td>-->
                                                                <td data-label="First Name">${o.firstName}</td>
                                                                <td data-label="Last Name">${o.lastName}</td>
                                                                <td data-label="Phone Number">${o.phoneNumber}</td>
                                                                <td data-label="Email">${o.email}</td>
                                                                <td data-label="ID Card">${o.idCard}</td>
                                                                <td data-label="Actions">
                                                                    <a href="#" class="update-link" 
                                                                       data-id="${o.customerId}" 
                                                                       data-firstName="${o.firstName}" 
                                                                       data-lastName="${o.lastName}" 
                                                                       data-phoneNumber="${o.phoneNumber}" 
                                                                       data-email="${o.email}" 
                                                                       data-idCard="${o.idCard}" 
                                                                       title="Update" 
                                                                       data-toggle="tooltip"><i class='far fa-edit'></i></a>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                        <c:forEach items="${customers}" var="o">
                                                            <tr>
                                                                <!--<td>${o.customerId}</td>-->
                                                                <td>${o.firstName}</td>
                                                                <td>${o.lastName}</td>
                                                                <td>${o.phoneNumber}</td>
                                                                <td>${o.email}</td>
                                                                <td>${o.idCard}</td>
                                                                <td data-label="Actions">
                                                                    <a href="#" class="update-link0" 
                                                                       data-id="${o.customerId}" 
                                                                       data-firstname="${o.firstName}" 
                                                                       data-lastname="${o.lastName}" 
                                                                       data-phonenumber="${o.phoneNumber}" 
                                                                       data-email="${o.email}" 
                                                                       data-idcard="${o.idCard}" 
                                                                       title="Update" 
                                                                       data-toggle="tooltip"><i class='far fa-edit'></i></a>

                                                                   <!--<a onclick="confirmDelete(${o.customerId})" class="delete" title="Delete" data-toggle="tooltip"><i class='far fa-trash-alt' style="color: #c80000"></i></a>-->
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
                                            <input class="form-control" id="firstName" name="firstName" type="text" placeholder="First Name" />
                                            <span id="firstName-error" style="color: red;"></span>
                                        </div>
                                        <br>
                                        <div class="form-group">
                                            <input class="form-control" id="lastName" name="lastName" type="text" placeholder="Last Name" />
                                            <span id="lastName-error" style="color: red;"></span>
                                        </div>
                                        <br>
                                        <div class="form-group">
                                            <input class="form-control" id="phone" name="phoneNumber" type="text" placeholder="Phone Number" />
                                            <span id="phone-error" style="color: red;"></span>
                                        </div>
                                        <br>
                                        <div class="form-group">
                                            <input class="form-control" id="email" name="email" type="email" placeholder="Your Email" />
                                            <span id="email-error" style="color: red;"></span>
                                        </div>
                                        <br>
                                        <div class="form-group">
                                            <input class="form-control" id="card" name="idCard" type="text" placeholder="Card" />
                                            <span id="card-error" style="color: red;"></span>
                                        </div>
                                        <br>
                                        <% String rCode = request.getParameter("rCode"); %>
                                        <input class="form-control" id="rCode" name="rCode" hidden value="<%= rCode %>" />
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
                <div class="modal fade" id="updateCustomerModal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form id="updateItemForm" action="customerController?action=edit" method="post">
                                <div class="modal-header">			
                                    <h4 class="modal-title">Update Customer</h4>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                </div>
                                <div class="modal-body">					
                                    <div class="form-group" style="margin-bottom: 12px">
                                        <label>First Name</label>
                                        <input id="updateFirstName" name="firstName" type="text" class="form-control" required>
                                        <span id="updateFirstName-error" style="color: red;"></span>
                                    </div>
                                    <div class="form-group" style="margin-bottom: 12px">
                                        <label>Last Name</label>
                                        <input id="updateLastName" name="lastName" type="text" class="form-control" required>
                                        <span id="updateLastName-error" style="color: red;"></span>
                                    </div>				
                                    <div class="form-group" style="margin-bottom: 12px">
                                        <label>Phone Number</label>
                                        <input id="updatePhoneNumber" name="phoneNumber" type="text" class="form-control" required>
                                        <span id="updatePhoneNumber-error" style="color: red;"></span>
                                    </div>
                                    <div class="form-group" style="margin-bottom: 12px">
                                        <label>Email</label>
                                        <input id="updateEmail" name="email" type="text" class="form-control" required>
                                        <span id="updateEmail-error" style="color: red;"></span>
                                    </div>
                                    <div class="form-group" style="margin-bottom: 12px">
                                        <label>ID Card</label>
                                        <input id="updateIdCard" name="idCard" type="text" class="form-control" required>
                                        <span id="updateIdCard-error" style="color: red;"></span>
                                    </div>
                                    <input type="hidden" id="updateCustomerId" name="customerId">
                                </div>
                                <div class="modal-footer">
                                    <input type="button" class="btn btn-default" data-bs-dismiss="modal" value="Cancel">
                                    <input type="submit" class="btn btn-success" value="Update">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
            <div class="modal fade" id="updateCustomerModal0">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form id="updateItemForm" action="bookingURL?action=edit" method="post">
                            <div class="modal-header">			
                                <h4 class="modal-title">Update Customer</h4>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group" style="margin-bottom: 12px">
                                    <label>First Name</label>
                                    <input id="updateFirstName0" name="firstName" type="text" class="form-control" required>
                                    <span id="updateFirstName0-error" style="color: red;"></span>
                                </div>
                                <div class="form-group" style="margin-bottom: 12px">
                                    <label>Last Name</label>
                                    <input id="updateLastName0" name="lastName" type="text" class="form-control" required>
                                    <span id="updateLastName0-error" style="color: red;"></span>
                                </div>				
                                <div class="form-group" style="margin-bottom: 12px">
                                    <label>Phone Number</label>
                                    <input id="updatePhoneNumber0" name="phoneNumber" type="text" class="form-control" required>
                                    <span id="updatePhoneNumber0-error" style="color: red;"></span>
                                </div>
                                <div class="form-group" style="margin-bottom: 12px">
                                    <label>Email</label>
                                    <input id="updateEmail0" name="email" type="text" class="form-control" required>
                                    <span id="updateEmail0-error" style="color: red;"></span>
                                </div>
                                <div class="form-group" style="margin-bottom: 12px">
                                    <label>ID Card</label>
                                    <input id="updateIdCard0" name="idCard" type="text" class="form-control" required>
                                    <span id="updateIdCard0-error" style="color: red;"></span>
                                </div>
                                <input type="hidden" id="updateCustomerId0" name="customerId">
                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-bs-dismiss="modal" value="Cancel">
                                <input type="submit" class="btn btn-success" value="Update">
                            </div>
                        </form>
                    </div>
                </div>
            </div>


            <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
            <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <script>
                $(document).ready(function () {
                    // Click event for update links
                    $(document).on('click', '.update-link', function () {
                        var customerId = $(this).data('id');
                        var firstName = $(this).data('firstname');
                        var lastName = $(this).data('lastname');
                        var phoneNumber = $(this).data('phonenumber');
                        var email = $(this).data('email');
                        var idCard = $(this).data('idcard');

                        // Set the data in the modal
                        $('#updateCustomerId').val(customerId);
                        $('#updateFirstName').val(firstName);
                        $('#updateLastName').val(lastName);
                        $('#updatePhoneNumber').val(phoneNumber);
                        $('#updateEmail').val(email);
                        $('#updateIdCard').val(idCard);

                        // Show the modal
                        $('#updateCustomerModal').modal('show');
                    });
                });

                $(document).ready(function () {
                    // Click event for update links
                    $(document).on('click', '.update-link0', function () {
                        var customerId = $(this).data('id');
                        var firstName = $(this).data('firstname');
                        var lastName = $(this).data('lastname');
                        var phoneNumber = $(this).data('phonenumber');
                        var email = $(this).data('email');
                        var idCard = $(this).data('idcard');

                        // Set the data in the modal
                        $('#updateCustomerId0').val(customerId);
                        $('#updateFirstName0').val(firstName);
                        $('#updateLastName0').val(lastName);
                        $('#updatePhoneNumber0').val(phoneNumber);
                        $('#updateEmail0').val(email);
                        $('#updateIdCard0').val(idCard);

                        // Show the modal
                        $('#updateCustomerModal0').modal('show');
                    });
                });
                function confirmDelete(id) {
                    Swal.fire({
                        title: "Are you sure to delete?",
                        text: "Delete this customer!",
                        icon: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#3085d6",
                        cancelButtonColor: "#d33",
                        confirmButtonText: "Yes, delete it!",
                        timer: 3000
                    }).then((result) => {
                        if (result.isConfirmed) {
                            $.ajax({
                                url: '/DaNangDreamHotel/customerController?action=delete',
                                type: 'GET',
                                data: {
                                    id: id
                                },
                                success: function (data) {
                                    Swal.fire("Deleted!", "", "success");
                                    setTimeout(() => {
                                        location.reload();
                                    }, 1000);
                                },
                                error: function (xhr) {
                                    console.log(xhr);
                                }
                            });
                        } else if (result.isDenied) {
                            Swal.fire("Item is not deleted", "", "info");
                        }
                    });
                }

            </script>
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
                                /^[A-Z][a-zA-Z]/,
                                $("#firstName-error"),
                                "The first letter must be uppercase and no special characters are allowed."
                                );
                    });
                    $("#updateFirstName").on("input", function () {
                        validateField(
                                $(this),
                                /^[A-Z][a-zA-Z]*$/,
                                $("#updateFirstName-error"),
                                "The first letter must be uppercase and no special characters are allowed."
                                );
                    });
                    $("#updateFirstName0").on("input", function () {
                        validateField(
                                $(this),
                                /^[A-Z][a-zA-Z]/,
                                $("#updateFirstName0-error"),
                                "The first letter with uppercase."
                                );
                    });

                    $("#lastName").on("input", function () {
                        validateField(
                                $(this),
                                /^[A-Z][a-zA-Z]/,
                                $("#lastName-error"),
                                "The first letter must be uppercase and no special characters are allowed."
                                );
                    });
                    $("#updateLastName").on("input", function () {
                        validateField(
                                $(this),
                                /^[A-Z][a-zA-Z]/,
                                $("#updateLastName-error"),
                                "The first letter with uppercase."
                                );
                    });
                    $("#updateLastName0").on("input", function () {
                        validateField(
                                $(this),
                                /^[A-Z][a-zA-Z]/,
                                $("#updateLastName0-error"),
                                "The first letter with uppercase."
                                );
                    });

                    $("#updateIdCard").on("input", function () {
                        validateField(
                                $(this),
                                /^\d{12}$/,
                                $("#updateIdCard-error"),
                                "Card number must be exactly 12 digits."
                                );
                    });
                    $("#updateIdCard0").on("input", function () {
                        validateField(
                                $(this),
                                /^\d{12}$/,
                                $("#updateIdCard0-error"),
                                "Card number must be exactly 12 digits."
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
                    $("#updatePhoneNumber").on("input", function () {
                        validateField(
                                $(this),
                                /^0\d{9}$/,
                                $("#updatePhoneNumber-error"),
                                "Phone number must be exactly 10 digits."
                                );
                    });
                    $("#updatePhoneNumber0").on("input", function () {
                        validateField(
                                $(this),
                                /^0\d{9}$/,
                                $("#updatePhoneNumber0-error"),
                                "Phone number must be exactly 10 digits."
                                );
                    });
                });
                $(document).ready(function () {
                    var table = $('#dataTable').DataTable({
                        "pagingType": "simple_numbers", // Sử dụng loại phân trang đơn giản, chỉ có next và previous
                        "lengthMenu": [5, 10, 25, 50],
                        "pageLength": 10,
                        "language": {
                            //"info": "Hiển thị START đến END của TOTAL bản ghi",
                            "paginate": {
                                //                        "next": "next",
                                //                        "previous": "rev"
                            }
                        },
                        "dom": 'lrtip' // Ẩn thanh tìm kiếm, phần chọn hiển thị số lượng bản ghi và nút first với last
                    });

                    // Sử dụng thanh tìm kiếm tùy chỉnh
                    $('#searchInput').on('input', function () {
                        table.search(this.value).draw();
                    });
                });
            </script>

            <script src="dashboard/assets/libs/jquery/dist/jquery.min.js"></script>
            <script src="dashboard/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
            <script src="dashboard/assets/js/sidebarmenu.js"></script>
            <script src="dashboard/assets/js/app.min.js"></script>
            <script src="dashboard/assets/libs/simplebar/dist/simplebar.js"></script>
        </body>

    </html>
</c:if>