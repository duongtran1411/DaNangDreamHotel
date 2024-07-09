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
                            <div class="container-fluid" style="height: 800px;width: 1300px">
                                <!-- Page Heading -->
                                <h1 class="h3 mb-2 text-gray-800">BOOKING DETAIL</h1>
                                <input readonly type="date" id="now-date"/>
                                <div class="d-flex justify-content-center">
                                    <div class="search">
                                        <input class="search_input" id="searchInput" type="text" name="txt" placeholder="Search...">
                                        <a href="#" class="search_icon"><i class="fa fa-search"></i></a>
                                    </div>
                                </div>

                                <div class="card shadow mb-4">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                                <thead>
                                                    <tr>
                                                        <th>Check Out</th>
                                                        <th class="sortable">Type</th>
                                                        <th class="sortable">Name</th>
                                                        <th class="sortable">Status</th>
                                                        <th class="sortable">Create At</th>
                                                        <th class="sortable">Update At</th>
                                                        <th class="sortable">Size</th>

                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${list}" var="o">
                                                    <tr>
                                                        <td>
                                                            <a href="useSuppliesURL?action=edit&id=${o.room_Id}"><i class="far fa-eye successful"></i></a>
                                                        </td>
                                                        <td data-label="Type">${o.type_Room_Id}</td>
                                                        <td data-label="Name">${o.name}</td>
                                                        <td data-label="Status">${o.status}</td>
                                                        <td data-label="Create At">${o.created_at}</td>
                                                        <td data-label="Update At">${o.updated_at}</td>
                                                        <td data-label="Size">${o.size}</td>

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



        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
        <script>

            $(document).ready(function () {
                var table = $('#dataTable').DataTable({
                    "pagingType": "simple_numbers", // Sử dụng loại phân trang đơn giản, chỉ có next và previous
                    "lengthMenu": [5, 10, 25, 50],
                    "pageLength": 10,
                    "language": {
                        //"info": "Hiển thị _START_ đến _END_ của _TOTAL_ bản ghi",
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
            var date = new Date();
            var tdate = date.getDate();
            var tmonth = date.getMonth() + 1;
            if (tdate < 10) {
                tdate = '0' + tdate;
            }
            if (tmonth < 10) {
                tmonth = '0' + tmonth;
            }
            var year = date.getUTCFullYear();
            var minDate = year + '-' + tmonth + '-' + tdate;
            var checkIn = document.getElementById('now-date').setAttribute('min', minDate);
            var showDateIn = document.getElementById('now-date').setAttribute('value', minDate);
            document.getElementById('now-date').addEventListener('input', function (e) {
                if (e.target.value === '') {
                    e.preventDefault();
                    e.target.value = e.target.defaultValue;
                }
            });
        </script>

        <script src="dashboard/assets/libs/jquery/dist/jquery.min.js"></script>
        <script src="dashboard/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
        <script src="dashboard/assets/js/sidebarmenu.js"></script>
        <script src="dashboard/assets/js/app.min.js"></script>
        <script src="dashboard/assets/libs/simplebar/dist/simplebar.js"></script>
    </body>

</html>
