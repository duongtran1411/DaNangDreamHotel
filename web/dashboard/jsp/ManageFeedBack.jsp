<%-- 
    Document   : ManageBooking
    Created on : Jul 2, 2024, 11:24:33 PM
    Author     : Sơnnnn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${empty sessionScope.acc}">
    <jsp:include page="../../Pages.jsp"></jsp:include>
</c:if>
<c:if test="${not empty sessionScope.acc}">
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Da Nang Hotel</title>
        <link rel="icon" href="img/title_danangdream.jpg" type="image/x-icon"/>
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
                                <h1 class="h3 mb-2 text-gray-800">FEEDBACK</h1>
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
                                                        <th>First Name</th>
                                                        <th>Last Name</th>
                                                        <th>Description</th>
                                                        <th>Status</th>
                                                        <th>Type Feedback</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="main-booking">
                                                <c:forEach items="${listFB}" var="o">
                                                    <tr>
                                                        <td style="text-align: center;" data-label="ID">${o.fistName}</td>
                                                        <td style="text-align: center" data-label="CreateAt">${o.lastName}</td>
                                                        <td style="text-align: center" >${o.content}</td>
                                                        <td data-label="Status" >
                                                            <select name="status" onchange="updateStatus(this,${o.feedback_Id})" style="
                                                                    background-color: <c:if test="${o.status == 0}">#FFEFF2</c:if>
                                                                    <c:if test="${o.status == 1}">#E7FAF5</c:if>;
                                                                        " id="statusSelect">
                                                                        <option value="0" style="background-color: #FFEFF2" <c:if test="${o.status == 0}">selected</c:if>>Waiting</option>
                                                                    <option value="1" style="background-color: #E7FAF5" <c:if test="${o.status == 1}">selected</c:if>>Done</option>
                                                                    </select>
                                                            </td>
                                                            <td style="text-align: center">${o.type}</td>
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

                <!-- Update Booking Modal -->


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

                                                                $(document).ready(function () {
                                                                    // ... your existing code

                                                                    // Disable select if status is 'done'
                                                                    $("select[name='status']").each(function () {
                                                                        if ($(this).val() === 'done') {
                                                                            $(this).addClass('disabled-select');
                                                                        }
                                                                    });
                                                                });

                                                                function updateStatus(selectElement, id) {
                                                                    var status = selectElement.value;
                                                                    console.log("status", status);
                                                                    console.log("id", id);

                                                                    Swal.fire({
                                                                        title: "Do you want to save the changes?",
                                                                        showDenyButton: true,
                                                                        showCancelButton: true,
                                                                        confirmButtonText: "Save",
                                                                        denyButtonText: `Don't save`
                                                                    }).then((result) => {
                                                                        if (result.isConfirmed) {
                                                                            $.ajax({
                                                                                url: '/DaNangDreamHotel/manageFeedBackController?action=update',
                                                                                type: 'GET',
                                                                                data: {
                                                                                    id: id,
                                                                                    status: status
                                                                                },
                                                                                success: function (data) {
                                                                                    if (status === 0) {
                                                                                        selectElement.style.backgroundColor = '#FFEFF2';
                                                                                    } else if (status === 1) {
                                                                                        selectElement.style.backgroundColor = '#E7FAF5';
                                                                                    }
                                                                                    Swal.fire("Saved!", "", "success");
                                                                                    setTimeout(() => {
                                                                                        location.reload();
                                                                                    }, 2000);
                                                                                },
                                                                                error: function (xhr) {
                                                                                    console.log(xhr);
                                                                                }
                                                                            });
                                                                        } else if (result.isDenied) {
                                                                            Swal.fire("Changes are not saved", "", "info");
                                                                            // Revert the select element to its previous value
                                                                            if (selectElement.dataset.previousStatus === 0) {
                                                                                selectElement.value = "0";
                                                                                selectElement.style.backgroundColor = '#FFEFF2';
                                                                            } else if (selectElement.dataset.previousStatus === 1) {
                                                                                selectElement.value = "1";
                                                                                selectElement.style.backgroundColor = '#E7FAF5';
                                                                            }
                                                                            setTimeout(() => {
                                                                                location.reload();
                                                                            }, 2000);
                                                                        }
                                                                    });


                                                                    selectElement.dataset.previousStatus = selectElement.value;
                                                                }






                </script>
                <script src="dashboard/assets/js/sidebarmenu.js"></script>
                <script src="dashboard/assets/js/app.min.js"></script>
                </body>
                </html>
                </c:if>
