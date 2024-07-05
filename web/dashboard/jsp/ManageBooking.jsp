<%-- 
    Document   : ManageBooking
    Created on : Jul 2, 2024, 11:24:33 PM
    Author     : Sơnnnn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Da Nang Hotel</title>
        <link rel="shortcut icon" type="image/png" href="dashboard/assets/images/logos/favicon.png" />
        <link rel="stylesheet" href="dashboard/assets/css/styles.min.css" />
        <link rel="stylesheet" href="dashboard/assets/css/styles.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
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

            .search:hover > .search_icon {
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

            .dataTables_filter {
                display: none;
            }

            .dataTables_filter input[type="search"] {
                display: none;

            }
        </style>
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
                                <h1 class="h3 mb-2 text-gray-800">BOOKING</h1>
                                <div class="d-flex justify-content-center">
                                    <div class="search">
                                        <input class="search_input" id="searchInput" type="text" name="txt" placeholder="Search . . .">
                                        <a href="#" class="search_icon"><i class="fa fa-search"></i></a>
                                    </div>
                                </div>
                                <div class="card shadow mb-4">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                                <thead>
                                                    <tr>
                                                        <th>View</th>
                                                        <th>Card ID</th>
                                                        <th>Check In</th>
                                                        <th>Check Out</th>
                                                        <th>Expenses</th>
                                                        <th>Create At</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${listB}" var="o">
                                                    <tr>
                                                        <td>
                                                            <a href="bookingURL?action=view&rCode=${o.customer_Id}"><i class="far fa-eye successful"></i></a>
                                                        </td>
                                                        <td data-label="ID">${o.idCard}</td>
                                                        <td data-label="CheckIn">
                                                            <fmt:formatDate value="${o.checkIn}" pattern="dd/MM/yyyy" />
                                                        </td>
                                                        <td data-label="CheckOut">
                                                            <fmt:formatDate value="${o.checkOut}" pattern="dd/MM/yyyy" />
                                                        </td>
                                                        <td data-label="Expenses">
                                                            <fmt:formatNumber type="number" value="${o.expenses}" /> đ
                                                        </td>
                                                        <td data-label="CreateAt">${o.created_at}</td>
                                                        <td>
                                                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#updateBookingModal"
                                                                    onclick="updateBookingModal('${o.checkIn}', '${o.checkOut}', '${o.booking_Id}')">
                                                                <p class="mb-0 fs-3">Update</p>
                                                            </button>
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

            <div class="modal fade" id="updateBookingModal" tabindex="-1" role="dialog" aria-labelledby="updateBookingModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="updateBookingModalLabel">Update Booking Details</h5>
                            <button type="button" class="btn btn-close" data-dismiss="modal" aria-label="Close">
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="bookingURL?action=update" method="post">
                                <div class="form-group">
                                    <input type="number" class="form-control" id="bid" name="bid" hidden="">
                                </div>
                                <div class="form-group">
                                    <label for="checkIn">Check In:</label>
                                    <input type="date" class="form-control" id="checkIn" name="checkIn">
                                </div>
                                <div class="form-group">
                                    <label for="checkOut">Check Out:</label>
                                    <input type="date" class="form-control" id="checkOut" name="checkOut">
                                </div>
                                <input type="hidden" id="bookingId" name="bookingId">
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary">Save changes</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
            <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
            <script>
                                                                        $(document).ready(function () {
                                                                            var table = $('#dataTable').DataTable({
                                                                                "paging": false,
                                                                                "ordering": true,
                                                                                "info": false,
                                                                                "searching": true,
                                                                                "language": {
                                                                                    "emptyTable": "No result search for '<i></i>'",
                                                                                    "zeroRecords": "No result search for '<i></i>'"
                                                                                },
                                                                                "initComplete": function (settings, json) {
                                                                                    var $searchInput = $('#searchInput');
                                                                                    var $dataTable = $('#dataTable').DataTable();

                                                                                    $searchInput.on('input', function () {
                                                                                        $dataTable.search(this.value).draw();

                                                                                        // Customize the message when no search results are found
                                                                                        if ($dataTable.page.info().recordsDisplay === 0) {
                                                                                            $('#dataTable tbody').html('<tr><td class="text-center" colspan="100">No result search for "' + this.value + '"</td></tr>');
                                                                                        }
                                                                                    });
                                                                                }
                                                                            });
                                                                        });

                                                                        function updateBookingModal(checkIn, checkOut, bookingId) {
                                                                            $('#checkIn').val(checkIn);
                                                                            $('#checkOut').val(checkOut);
                                                                            $('#bid').val(bookingId);
                                                                            $('#updateBookingModal').modal('show');
                                                                        }
            </script>

            <script src="dashboard/assets/libs/jquery/dist/jquery.min.js"></script>
            <script src="dashboard/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
            <script src="dashboard/assets/js/sidebarmenu.js"></script>
            <script src="dashboard/assets/js/app.min.js"></script>
            <script src="dashboard/assets/libs/simplebar/dist/simplebar.js"></script>
    </body>
</html>
