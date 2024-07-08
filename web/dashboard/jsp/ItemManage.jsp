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
        body,
        html {
            height: 100%;
            margin: 0;
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
            background-color: #a07d1d; /* Màu nền khi hover */
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
    <script>
        $(document).ready(function() {
            $("#searchInput").on("keyup", function() {
                var value = $(this).val().toLowerCase();
                $("#itemsTable tbody tr").filter(function() {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });

            $('#itemsTable th').on('click', function() {
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
                return function(a, b) {
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
</head>

<body>
    <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed">
        <div class="sidebar">
            <jsp:include page="SlideBar.jsp"></jsp:include>
        </div>

        <div class="body-wrapper">
            <jsp:include page="Profile.jsp"></jsp:include>
            <a href="AddItem.jsp" class="btn-add">Add Item</a>
            
            <input type="text" id="searchInput" class="search-input" placeholder="Search for items...">
            
            <section class="rooms-section spad content">
                <div class="table-container">
                    <table id="itemsTable">
                        <thead>
                            <tr>
                                <th class="sortable">Item ID</th>
                                <th class="sortable">Item Name</th>
                                <th class="sortable">Type</th>
                                <th class="sortable">Price</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${allItem}" var="o">
                                <tr>
                                    <td data-label="Item">${o.item_Id}</td>
                                    <td data-label="Name">${o.name}</td>
                                    <td data-label="Type">${o.typeItem_Id}</td>
                                    <td data-label="Price">${FormatUtils.formatPRice(o.price)}đ</td>
                                    <td data-label="Actions">
                                        <a href="UpdateItem.jsp?id=${o.item_Id}" class="btn-adjust">Edit</a>
                                        <a href="ItemController?action=delete&id=${o.item_Id}" class="btn-adjust">Delete</a>
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
            </section>
        </div>
    </div>
</body>

</html>
