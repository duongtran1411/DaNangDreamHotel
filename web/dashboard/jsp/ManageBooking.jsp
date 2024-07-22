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
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
            .swal2-popup {
                font-size: 12px;
                border-radius: 8px;
            }
            select {
                width: 100%;
                border: 1px solid #ccc;
                border-radius: 8px;
                box-sizing: border-box;
                font-size: 13px;
                background-color: #fff;
                appearance: none;
                -webkit-appearance: none;
                -moz-appearance: none;
                cursor: pointer;
                text-align: center;
                margin-top: 8px;
            }
            .disabled-select {
                pointer-events: none;
                opacity: 0.6; /* để làm mờ màu sắc */
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
                            <div class="container" style="margin-right: 105px; height: 800px;width: 1300px">
                                <!-- Page Heading -->
                                <h1 class="h3 mb-2 text-gray-800">BOOKING</h1>
                                <div class="d-flex justify-content-center">
                                    <div class="search">
                                        <input class="search_input" id="searchInput" type="text" name="txt" placeholder="Search . . .">
                                        <a href="#" class="search_icon"><i class="fa fa-search"></i></a>
                                    </div>
                                </div>
                                <div class="card shadow">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                                <thead>
                                                    <tr>
                                                        <th>View</th>
                                                        <th>Detail</th>
                                                        <th>Card ID</th>
                                                        <th>Check In</th>
                                                        <th>Check Out</th>
                                                        <th>Expenses</th>
                                                        <th>Create At</th>
                                                        <th>Status</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="main-booking">
                                                <c:choose>
                                                    <c:when test="${not empty listB}">
                                                        <c:forEach items="${listB}" var="o">
                                                            <tr>
                                                                <td>
                                                                    <a href="bookingURL?action=view&rCode=${o.customer_Id}"><i class="far fa-eye successful"></i></a>
                                                                </td>
                                                                <td>
                                                                    <a href="bookingURL?action=detail&id=${o.booking_Id}"><i class="far fa-eye successful"></i></a>
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
                                                                <td data-label="Status">
                                                                    <form action="bookingURL?action=status" method="post" class="statusForm">
                                                                        <input type="hidden" name="bookingId" value="${o.booking_Id}">
                                                                        <select name="status" id="status_${o.booking_Id}" onchange="confirmStatusChange(this)" style="
                                                                                background-color: <c:if test="${o.status == 'waiting'}">#FFEFF2</c:if>
                                                                                <c:if test="${o.status == 'processing'}">#FFF9EF</c:if>
                                                                                <c:if test="${o.status == 'done'}">#E7FAF5</c:if>;
                                                                                    ">
                                                                                    <option value="waiting" style="background-color: #FFEFF2" <c:if test="${o.status == 'waiting'}">selected</c:if>>Waiting</option>
                                                                                <option value="processing" style="background-color: #FFF9EF" <c:if test="${o.status == 'processing'}">selected</c:if>>Processing</option>
                                                                                <option value="done" style="background-color: #E7FAF5" <c:if test="${o.status == 'done'}">selected</c:if>>Done</option>
                                                                                </select>
                                                                        </form>
                                                                    </td>
                                                                    <td>
                                                                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#updateBookingModal"
                                                                                onclick="updateBookingModal('${o.checkIn}', '${o.checkOut}', '${o.booking_Id}', '${o.expenses}')">
                                                                        <p class="mb-0 fs-3">Update</p>
                                                                    </button>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <tr>
                                                            <td colspan="7" class="text-center">No bookings available.</td>
                                                        </tr>
                                                    </c:otherwise>
                                                </c:choose>
                                            </tbody>
                                        </table>                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Update Booking Modal -->
                <div class="modal fade" id="updateBookingModal" tabindex="-1" aria-labelledby="updateBookingModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="updateBookingModalLabel">Update Booking</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form action="bookingURL?action=update" method="post">
                                    <div class="form-group">
                                        <input type="number" class="form-control" id="bid" name="bid" hidden="">
                                    </div>
                                    <div class="form-group">
                                        <label for="checkIn">Check In:</label>
                                        <input type="date" class="form-control" id="checkIn" name="checkIn" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label for="checkOut">Check Out:</label>
                                        <input type="date" class="form-control" id="checkOut" name="checkOut" onchange="updateExpenses()">
                                    </div>
                                    <div class="form-group">
                                        <label for="expenses">Expenses:</label>
                                        <input type="text" class="form-control" id="expenses" name="expenses" readonly>
                                    </div>
                                    <input type="hidden" id="dailyRate" name="dailyRate" value=""> <!-- Replace with actual daily rate -->
                                    <input type="hidden" id="initialExpenses" name="initialExpenses">
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
                                                    "ordering": true,
                                                    "info": false,
                                                    "searching": true,
                                                    "lengthChange": false,
                                                    "pagingType": "simple_numbers", // Sử dụng loại phân trang đơn giản, chỉ có next và previous
                                                    "lengthMenu": [5, 10, 25, 50],
                                                    "pageLength": 10, "language": {
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
                                                                $('#dataTable tbody').html('<tr><td class="text-center" colspan="7">No result search for "' + this.value + '"</td></tr>');
                                                            }
                                                        });
                                                    }
                                                });
                                            });

                                            function updateBookingModal(checkIn, checkOut, bookingId, initialExpenses) {
                                                $('#checkIn').val(checkIn);
                                                $('#checkOut').val(checkOut);
                                                $('#bid').val(bookingId);
                                                $('#initialExpenses').val(initialExpenses);

                                                $('#expenses').val(initialExpenses + ' đ');

                                                // Calculate duration in days
                                                var checkInDate = new Date(checkIn);
                                                var checkOutDate = new Date(checkOut);
                                                var timeDifference = checkOutDate.getTime() - checkInDate.getTime();
                                                var daysDifference = timeDifference / (1000 * 3600 * 24);

                                                // Calculate dailyRate
                                                if (daysDifference >= 0) {
                                                    var dailyRate = initialExpenses / daysDifference;
                                                    $('#dailyRate').val(dailyRate.toFixed(2));
                                                } else {
                                                    // Handle invalid date range if necessary
                                                    $('#dailyRate').val('0.00');
                                                }

                                                $('#updateBookingModal').modal('show');
                                            }

                                            function updateExpenses() {
                                                var checkIn = new Date($('#checkIn').val());
                                                var checkOut = new Date($('#checkOut').val());
                                                var dailyRate = parseFloat($('#dailyRate').val());

                                                // Calculate the difference in days
                                                var timeDifference = checkOut.getTime() - checkIn.getTime();
                                                var daysDifference = timeDifference / (1000 * 3600 * 24);

                                                if (daysDifference >= 0) {
                                                    var newExpenses = daysDifference * dailyRate;
                                                    $('#expenses').val(newExpenses.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'}));
                                                } else {
                                                    $('#expenses').val('0 VND'); // Handle invalid date range if necessary
                                                }
                                            }

                                            $(document).ready(function () {
                                                // ... your existing code

                                                // Disable select if status is 'done'
                                                $("select[name='status']").each(function () {
                                                    if ($(this).val() === 'done') {
                                                        $(this).addClass('disabled-select');
                                                    }
                                                });
                                            });

                                            function updateStatus(selectElement) {
                                                var form = selectElement.closest('form');
                                                form.submit();
                                            }


                                            const urlParams = new URLSearchParams(window.location.search);
                                            const statusUpdate = urlParams.get('statusUpdate');

                                            if (statusUpdate === 'success') {
                                                Swal.fire({
                                                    position: "center",
                                                    icon: "success",
                                                    title: "Status updated successfully",
                                                    showConfirmButton: false,
                                                    timer: 1100
                                                });
                                            } else if (statusUpdate === 'error') {
                                                Swal.fire({
                                                    position: "center",
                                                    icon: "error",
                                                    title: "Failed to update status",
                                                    showConfirmButton: false,
                                                    timer: 1200
                                                });
                                            }
                                            function confirmStatusChange(selectElement) {
                                                var status = selectElement.value;

                                                if (status === 'done') {
                                                    Swal.fire({
                                                        title: 'Confirm Change',
                                                        text: 'Are you sure you want to mark this booking as done?',
                                                        icon: 'warning',
                                                        showCancelButton: true,
                                                        confirmButtonText: 'Yes',
                                                        cancelButtonText: 'Cancel',
                                                    }).then((result) => {
                                                        if (result.isConfirmed) {
                                                            selectElement.setAttribute('data-previous-status', selectElement.value);
                                                            updateStatus(selectElement);
                                                        } else {
                                                            var previousStatus = selectElement.getAttribute('data-previous-status');
                                                            var options = selectElement.options;
                                                            for (var i = 0; i < options.length; i++) {
                                                                if (options[i].value === previousStatus) {
                                                                    options[i].selected = true;
                                                                } else {
                                                                    options[i].selected = false;
                                                                }
                                                            }
                                                        }
                                                    });
                                                } else {
                                                    updateStatus(selectElement);
                                                }
                                            }


                </script>
                <script src="dashboard/assets/js/sidebarmenu.js"></script>
                <script src="dashboard/assets/js/app.min.js"></script>
                </body>
                </html>