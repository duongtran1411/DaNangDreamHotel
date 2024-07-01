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
                            <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#addItemModal">
                                <p class="mb-0 fs-3"><i class="ti ti-plus fs-6"></i>Add Item</p>                  
                            </button>
                            <div class="container-fluid" style="height: 800px;width: 1300px">

                                <input type="text" id="searchInput" class="search-input" placeholder="Search for items...">

                                <h1 class="h3 mb-2 text-gray-800">Tables Item</h1>
                                <div class="card shadow mb-4">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                                <thead>
                                                    <tr>    
                                                        <th class="sortable">Item Name</th>
                                                        <th class="sortable">Type</th>
                                                        <th class="sortable">Price</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="content">
                                                <c:forEach items="${allItem}" var="o">
                                                    <tr>
                                                        <td data-label="Name">${o.name}</td>
                                                        <td data-label="Type">${o.typeName}</td>
                                                        <td data-label="Price">${FormatUtils.formatPRice(o.price)}đ</td>
                                                        <td data-label="Actions">
                                                            <a href="UpdateItem.jsp?id=${o.item_Id}" class="settings" title="Settings" data-toggle="tooltip"><i class='far fa-edit'></i></a>
                                                            <a href="ItemController?action=delete&id=${o.item_Id}" class="delete" title="Delete" data-toggle="tooltip" 
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
        <div class="container-fluid">
            <div class="modal fade" id="addItemModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form id="addItemForm" action="ItemController?action=add" method="post">
                            <div class="modal-header">			
                                <%
                                    DAOTypeItem dao = new DAOTypeItem();
                                    List<TypeItem> allType = dao.getAllTypeOfItem();
                                %>
                                <h4 class="modal-title">Add Item</h4>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group" style="margin-bottom: 12px">
                                    <label>Name</label>
                                    <input name="name" type="text" class="form-control" required>
                                </div>
                                <div class="form-group" style="margin-bottom: 12px">
                                    <label>Price</label>
                                    <input id="price" name="price" type="number" class="form-control" required>
                                </div>				
                                <div class="form-group" style="margin-bottom: 12px">
                                    <label>Type Item</label>
                                    <select name="type" class="form-select" aria-label="Default select example">
                                        <c:forEach items="<%= allType %>" var="t">
                                            <option value="${t.typeItem_Id}">${t.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
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
            document.getElementById("addItemForm").addEventListener("submit", function (event) {
                var priceInput = document.getElementById("price");
                var price = parseFloat(priceInput.value);

                if (isNaN(price) || price < 0) {
                alert("Please enter a valid number for the price.");
                event.preventDefault();
                }
                });
        </script>
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
                return confirm("Are you sure you want to remove this item?");
            }
        </script>
    </body>

</html>
