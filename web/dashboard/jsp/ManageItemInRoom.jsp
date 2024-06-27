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
            background-color: #C59B24;
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
            background-color: #a07d1d;
        }

        .body-wrapper {
            flex-grow: 1;
            margin-left: 250px;
            padding: 20px;
            background-color: #f5f5f5;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: white;
        }

        table th,
        table td {
            padding: 12px 15px;
            border: 1px solid #dee2e6;
            text-align: left;
        }

        table thead th {
            background-color: #C59B24;
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

        .btn-back {
            display: inline-block;
            margin-bottom: 20px;
            background-color: #C59B24;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .btn-back:hover {
            background-color: #a07d1d;
        }
    </style>
</head>

<body>
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
                                <td data-label="Room Name">
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
                                <td data-label="Price">${FormatUtils.formatPRice(o.getItempPice())}đ</td>
                                <td data-label="Actions">
                                    <button class="btn-save item" data-id="${o.itemInRoomId}" onclick="saveQuantity(this)">Save</button>
                                </td>
                                <input class="roomId" type="hidden" value="${o.roomId}" />
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <!-- Uncomment the pagination section if needed -->
                <!-- 
                <div class="pagination">
                    <c:if test="${currentPage > 1}">
                        <a href="itemManageURL?page=${currentPage - 1}&action=view">Previous</a>
                    </c:if>
                    <c:forEach begin="1" end="${totalPages}" var="page">
                        <a href="itemManageURL?page=${page}&action=view" class="${page == currentPage ? 'active' : ''}">${page}</a>
                    </c:forEach>
                    <c:if test="${currentPage < totalPages}">
                        <a href="itemManageURL?page=${currentPage + 1}&action=view">Next</a>
                    </c:if>
                </div>
                -->
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
</body>

</html>
