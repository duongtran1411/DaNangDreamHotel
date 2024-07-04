<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Entity.FormatUtils" %>
<%@ page import="Model.DAORoom" %>
<%@ page import="Entity.Room" %>
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


            .btn-adjust {
                border: none;
                background-color: #C59B24;
                color: white;
                padding: 5px 10px;
                margin: 0 5px;
                cursor: pointer;
                border-radius: 5px;
                transition: background-color 0.3s;
            }

            .btn-adjust:hover {
                background-color: #a07d1d;
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
                background-color: #C59B24;
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
        <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed">
            <jsp:include page="SlideBar.jsp"></jsp:include>
                <div class="body-wrapper">
                <jsp:include page="Profile.jsp"></jsp:include>
                    <div class="card">
                        <div class="card-body">
                            <div class="container-fluid" style="height: 800px;width: 1300px">
                                <input type="text" id="searchInput" class="search-input" placeholder="Search for item...">
                               <%
    try {
        int roomId = Integer.parseInt(request.getParameter("rid"));
        DAORoom dao = new DAORoom();
        Room r = dao.getNameByRoomId(roomId);

        if (r != null) {
            out.println("<h1 class='h3 mb-2 text-gray-800'>Table Item In " + r.getName() + "</h1>");
        } else {
            out.println("<h1 class='h3 mb-2 text-gray-800'>Room not found</h1>");
        }
    } catch (NumberFormatException e) {
        out.println("<h1 class='h3 mb-2 text-gray-800'>Invalid room ID</h1>");
        e.printStackTrace();
    } catch (Exception e) {
        out.println("<h1 class='h3 mb-2 text-gray-800'>Error retrieving room</h1>");
        e.printStackTrace();
    }
%>
                            
                                <div class="card shadow mb-4">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                                <thead>
                                                    <tr> 
                                                        <th class="sortable">Item Name</th>
                                                        <th class="sortable">Quantity</th>
                                                        <th class="sortable">Price</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                  <tbody id="content">
                                                <c:set var="currentRoomName" value="" />
                                                <c:forEach items="${allItem}" var="o">
                                                    <tr>
                                                
                                                        <td data-label="Item">${o.itemName}</td>
                                                        <td data-label="Quantity" class="quantity-container">
                                                            <button class="btn-adjust btn-decrease" data-id="${o.itemId}"><i class="fas fa-minus"></i></button>
                                                            <span class="quantity" id="quantity-${o.itemId}">${o.quantity}</span>
                                                            <button class="btn-adjust btn-increase" data-id="${o.itemId}"><i class="fas fa-plus"></i></button>
                                                        </td>
                                                        <td data-label="Price">${FormatUtils.formatPRice(o.getItempPice())}đ</td>
                                                        <td data-label="Actions">
                                                            <button class="btn-save item" data-id="${o.itemInRoomId}" onclick="saveQuantity(this)">Save</button>
                                                        </td>
                                                <input class="roomId" type="hidden" value="${o.roomId}" />
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
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
                                                                document.addEventListener('DOMContentLoaded', function () {
                                                                    document.querySelectorAll('.btn-decrease').forEach(button => {
                                                                        button.addEventListener('click', function () {
                                                                            let id = this.getAttribute('data-id');
                                                                            let quantityElement = document.getElementById('quantity-' + id);
                                                                            let quantity = parseInt(quantityElement.textContent);
                                                                            if (quantity > 0) {
                                                                                quantity--;
                                                                                quantityElement.textContent = quantity;
                                                                                // Update quantity in the database if needed
                                                                            }
                                                                        });
                                                                    });

                                                                    document.querySelectorAll('.btn-increase').forEach(button => {
                                                                        button.addEventListener('click', function () {
                                                                            let id = this.getAttribute('data-id');
                                                                            let quantityElement = document.getElementById('quantity-' + id);
                                                                            let quantity = parseInt(quantityElement.textContent);
                                                                            quantity++;
                                                                            quantityElement.textContent = quantity;
                                                                            // Update quantity in the database if needed
                                                                        });
                                                                    });
                                                                });

                                                                function saveQuantity(button) {
                                                                    var itemInRoomId = button.getAttribute('data-id');
                                                                    var row = button.closest('tr');
                                                                    var quantityElement = row.querySelector('.quantity');
                                                                    var quantity = quantityElement.textContent;

                                                                    console.log("itemInRoomId:", itemInRoomId);
                                                                    console.log("quantity:", quantity);

                                                                    $.ajax({
                                                                        url: '/DaNangDreamHotel/itemManageURL?action=update',
                                                                        type: 'GET',
                                                                        data: {
                                                                            itemInRoomId: itemInRoomId,
                                                                            quantity: quantity
                                                                        },
                                                                        success: function (data) {
                                                                            console.log("Success:", data);
                                                                        },
                                                                        error: function (xhr) {
                                                                            console.log("Error:", xhr);
                                                                        }
                                                                    });
                                                                }
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
    </body>

</html>
