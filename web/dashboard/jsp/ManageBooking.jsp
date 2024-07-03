<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Entity.FormatUtils" %>
<%@ page import="Model.DAOTypeItem" %>
<%@ page import="Entity.TypeItem" %>
<%@ page import="java.util.List" %>
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
        <style>
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
            .search-input {
                margin-bottom: 20px;
                padding: 10px;
                width: 100%;
                box-sizing: border-box;
                border: 1px solid #dee2e6;
                border-radius: 5px;
            }

            .sortable:after {
                content: '\f0dc';
                font-family: FontAwesome;
                padding-left: 10px;
            }

            .sortable.asc:after {
                content: '\f0de';
            }

            .sortable.desc:after {
                content: '\f0dd';
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

                                <input type="text" id="searchInput" class="search-input" placeholder="Search for bookings...">

                                <h1 class="h3 mb-2 text-gray-800">Tables Booking</h1>
                                <div class="card shadow mb-4">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                                <thead>
                                                    <tr>    
                                                        <th class="sortable">First Name</th>
                                                        <th class="sortable">Last Name</th>
                                                        <th class="sortable">Start Day</th>
                                                        <th class="sortable">End Day</th>
                                                        <th class="sortable">Expenses</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="content">
                                                <c:forEach items="${allBooking}" var="o">
                                                    <tr>
                                                        <td data-label="FirstName">${o.firstName}</td>
                                                        <td data-label="LastName">${o.lastName}</td>
                                                        <td data-label="StartDay">${o.startDay}</td>
                                                        <td data-label="endDay">${o.endDay}</td>
                                                         <td data-label="Expenses">${o.expenses}</td>
                                                        <td data-label="Actions">
                                                            <a href="BookingDetailURL?id=${o.bookingId}" class="settings" title="Detail" data-toggle="tooltip"><i class='far fa-edit'></i></a>
                                                            <a href="bookingController?action=delete&id=${o.bookingId}" class="delete" title="Delete" data-toggle="tooltip" 
                                                               onclick="return confirmDelete();"><i class='far fa-trash-alt' style="color: #c80000"></i></a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="pagination-container">
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
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                $("#searchInput").on("keyup", function () {
                    var value = $(this).val().toLowerCase();
                    $("#content tr").filter(function () {
                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                    });
                });

                $('#dataTable th').on('click', function () {
                    var index = $(this).index();
                    var table = $(this).parents('table');
                    var rows = table.find('tbody > tr').toArray().sort(comparer(index));
                    this.asc = !this.asc;
                    if (!this.asc) {
                        rows = rows.reverse();
                    }
                    table.find('thead th').removeClass('asc desc');
                    $(this).addClass(this.asc ? 'asc' : 'desc');
                    for (var i = 0; i < rows.length; i++) {
                        table.append(rows[i]);
                    }
                });

                function comparer(index) {
                    return function (a, b) {
                        var valA = getCellValue(a, index),
                                valB = getCellValue(b, index);
                        return $.isNumeric(valA) && $.isNumeric(valB) ? valA - valB : valA.localeCompare(valB);
                    };
                }

                function getCellValue(row, index) {
                    return $(row).children('td').eq(index).text();
                }
            });
        </script>
        <script>
            function confirmDelete() {
                return confirm("Are you sure you want to remove this booking?");
            }
        </script>
    </body>

</html>
