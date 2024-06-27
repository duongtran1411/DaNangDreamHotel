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
            .page-wrapper {
                display: flex;
            }

            .sidebar {
                width: 250px;
                position: fixed;
                top: 0;
                bottom: 0;
                left: 0;
                background-color: #343a40;
                color: white;
                z-index: 1000;
                padding-top: 20px;
            }

            .sidebar a {
                color: white;
                text-decoration: none;
                display: block;
                padding: 10px 20px;
            }

            .sidebar a:hover {
                background-color: #495057;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
                background-color: white;
                display: contents;
            }

            table th,
            table td {
                padding: 12px 15px;
                border: 1px solid #dee2e6;
                text-align: left;
            }

            table thead th {
                background-color: #343a40;
                color: white;
            }

            table tbody tr:nth-of-type(even) {
                background-color: #f8f9fa;
            }

            table tbody tr:hover {
                background-color: #e9ecef;
            }

            @media (max-width: 768px) {
                .body-wrapper {
                    margin-left: 0;
                }

                .sidebar {
                    width: 100%;
                    height: auto;
                    position: relative;
                }
            }

            .btn-adjust {
                border: none;
                background-color: #343a40;
                color: white;
                padding: 5px 10px;
                margin: 0 5px;
                cursor: pointer;
                border-radius: 5px;
                transition: background-color 0.3s;
            }

            .btn-adjust:hover {
                background-color: #495057;
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
                background-color: #28a745;
                color: white;
                padding: 5px 10px;
                cursor: pointer;
                border-radius: 5px;
                transition: background-color 0.3s;
            }

            .btn-save:hover {
                background-color: #218838;
            }
        </style>
    </head>

    <body>
        <!--  Body Wrapper -->
        <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed">
            <div class="sidebar">
                <jsp:include page="SlideBar.jsp"></jsp:include>
                </div>

                <div class="body-wrapper">
                <jsp:include page="Profile.jsp"></jsp:include>
                <a href="roomURL?action=detail&trid=${trid}" class="btn-back">Back</a>
                <section class="rooms-section spad">
                    <table id="customerTable">
                        <thead>
                            <tr>
                                <th>Room Name</th>
                                <th>Item Name</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="currentRoomName" value="" />
                            <c:forEach items="${allItem}" var="o">
                                <tr>
                                    <td data-label="ID">
                                        <c:if test="${currentRoomName != o.roomName}">
                                            ${o.roomName}
                                            <c:set var="currentRoomName" value="${o.roomName}" />
                                        </c:if>
                                    </td>
                                    <td data-label="Item">${o.itemName}</td>
                                    <td data-label="Quantity" class="quantity-container">
                                        <button class="btn-adjust btn-decrease" data-id="${o.itemId}"><i class="fas fa-minus"></i></button>
                                        <span class="quantity" id="quantity-${o.itemId}">${o.quantity}</span>
                                        <button class="btn-adjust btn-increase" data-id="${o.itemId}"><i class="fas fa-plus"></i></button>
                                    </td>
                                    <td data-label="Price">
                                        ${FormatUtils.formatPRice(o.getItempPice())}đ
                                    </td>
                                    <td data-label="Actions">
                                        <button class="btn-save item" data-id="${o.itemInRoomId}" onclick="saveQuantity(this)">Save</button>
                                    </td>

                            <input  class="roomId" type="hidden" value="${o.roomId}" />
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </section>
            </div>
        </div>


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
                            // Cập nhật số lượng trong cơ sở dữ liệu nếu cần thiết
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
                        // Cập nhật số lượng trong cơ sở dữ liệu nếu cần thiết
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
    </body>

</html>
