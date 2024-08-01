<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Entity.FormatUtils" %>
<%@ page import="Model.DAORoom" %>
<%@ page import="Entity.Room" %>
<c:if test="${empty sessionScope.acc}">
    <jsp:include page="../../Pages.jsp"></jsp:include>
</c:if>
<c:if test="${not empty sessionScope.acc}">
    <!doctype html>
    <html lang="en">

        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>Da Nang Hotel</title>
            <link rel="shortcut icon" type="image/png" href="../assets/images/logos/favicon.png" />
            <link rel="stylesheet" href="dashboard/assets/css/styles.min.css" />
            <link rel="stylesheet" href="dashboard/assets/css/styles.css" />
            <link rel="icon" href="img/title_danangdream.jpg" type="image/x-icon"/>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

                .popup {
                    display: none;
                    position: fixed;
                    left: 55%;
                    top: 15%;
                    transform: translate(-50%, -50%);
                    background-color: white;
                    padding: 20px;
                    box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
                    z-index: 1000;
                }
                .popup.active {
                    display: block;
                }
                .overlay {
                    display: none;
                    position: fixed;
                    left: 0;
                    top: 0;
                    width: 100%;
                    height: 100%;
                    background: rgba(0, 0, 0, 0.7);
                    z-index: 999;
                }
                .overlay.active {
                    display: block;
                }

                .card {

                    display: flex;
                    flex-direction: column;
                    min-width: 0;
                    word-wrap: break-word;
                    background-color: #fff;
                    background-clip: border-box;
                    border: 0 solid rgba(0,0,0,.125);
                    border-radius: 1rem;
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
                                    <input type="text" id="searchInput" class="search-input" placeholder="Search for item...">
                                    <div class="card shadow mb-4">
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                                    <thead>
                                                        <tr>
                                                            <th class="sortable">Item Name</th>
                                                            <th class="sortable">Quantity</th>
                                                            <th class="sortable">Price</th>

                                                        </tr>
                                                    </thead>
                                                    <tbody id="content">
                                                    <c:set var="currentRoomName" value="" />
                                                    <c:forEach items="${list}" var="o">
                                                        <tr data-price="${o.getPrice()}">
                                                            <td data-label="Item">${o.name}</td>
                                                            <td data-label="Quantity" class="quantity-container">
                                                                <button class="btn-adjust btn-decrease"
                                                                        data-id="${o.item_Id}"><i
                                                                        class="fas fa-minus"></i></button>
                                                                <span class="quantity" id="quantity-${o.item_Id}">0</span>
                                                                <button class="btn-adjust btn-increase"
                                                                        data-id="${o.item_Id}"><i
                                                                        class="fas fa-plus"></i></button>
                                                            </td>
                                                            <td data-label="Price" class="price" id="price-${o.item_Id}"
                                                                data-price="${o.price}">0đ</td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                            <div>
                                                <div style="display: flex">
                                                    <h4>Total: </h4>
                                                    <h4 id="totalPrice" style="font-weight: 600;color: #16181b">0</h4>
                                                    <h4>VND</h4>
                                                </div>
                                                <button class="btn btn-primary" onclick="saveTotalPrice()">Check Out</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="overlay" id="overlay" onclick="hidePopup()"></div>
                        <div class="popup" id="popup" style="border: 1px solid #ddd; border-radius: 5px;margin-top: 350px;height: 870px">
                            <div class="row">
                                <div class="col-lg-12" >
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <div class="text-muted">
                                                        <h5 class="font-size-20 mb-4">Room Name: ${roomName}</h5>
                                                        <div class="mt-4">
                                                            <h5 class="font-size-15 mb-1" id="checkin"></h5>
                                                        </div>
                                                        <div class="mt-4">
                                                            <h5 class="font-size-15 mb-1">Code No: ${bookingDetailId}</h5>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="py-2">
                                                <h5 class="font-size-15" style="text-align: center; color: #00b5e9">Order Summary</h5>
                                                <div class="table-responsive">
                                                    <table class="table align-middle table-nowrap table-centered mb-0" id="mainTable">
                                                        <thead>
                                                            <tr>
                                                                <th style="width: 70px;">No.</th>
                                                                <th>Item Name</th>
                                                                <th>Quantity</th>
                                                                <th>Price</th>
                                                                <th class="text-end" style="width: 120px;">Total</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <th scope="row">01</th>
                                                                <td>
                                                                    <div>
                                                                        <h5 class="text-truncate font-size-14 mb-1">Black Strap A012</h5>
                                                                        <p class="text-muted mb-0">Watch, Black</p>
                                                                    </div>
                                                                </td>
                                                                <td>$ 245.50</td>
                                                                <td>1</td>
                                                                <td class="text-end">$ 245.50</td>
                                                            </tr>
                                                            <tr id="total">
                                                                <th scope="row" colspan="4" class="text-end">Sub Total</th>
                                                                <td class="text-end">${total}</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="d-print-none mt-4">
                                                    <div class="float-end">
                                                        <a href="javascript:window.print()" class="btn btn-success me-1"><i class="fa fa-print"></i></a>
                                                        <a href="#" class="btn btn-primary w-md">Send</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                                <div id="totalPrice"></div>
                            <button class="btn-save" onclick="saveTotalPrice()">Check out</button>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
                                document.addEventListener('DOMContentLoaded', function () {
                                    document.querySelectorAll('.btn-decrease').forEach(button => {
                                        button.addEventListener('click', function () {
                                            adjustQuantity(this.getAttribute('data-id'), -1);
                                        });
                                    });

                                    document.querySelectorAll('.btn-increase').forEach(button => {
                                        button.addEventListener('click', function () {
                                            adjustQuantity(this.getAttribute('data-id'), 1);
                                        });
                                    });

                                    function adjustQuantity(itemId, change) {
                                        let quantityElement = document.getElementById('quantity-' + itemId);
                                        let quantity = parseInt(quantityElement.textContent) + change;
                                        if (quantity >= 0) {
                                            quantityElement.textContent = quantity;
                                            updatePrice(itemId, quantity);
                                        }
                                    }

                                    function updateTotalPrice() {
                                        let totalPrice = 0;
                                        document.querySelectorAll('#content tr').forEach(row => {
                                            let quantity = parseInt(row.querySelector('.quantity').textContent);
                                            let pricePerItem = parseFloat(row.getAttribute('data-price'));
                                            totalPrice += quantity * pricePerItem;
                                        });
                                        document.getElementById('totalPrice').textContent = totalPrice;
                                    }

                                    function updatePrice(itemId, quantity) {
                                        let priceElement = document.getElementById('price-' + itemId);
                                        let originalPrice = parseFloat(priceElement.getAttribute('data-price'));
                                        if (!isNaN(originalPrice)) {
                                            let newPrice = originalPrice * quantity;
                                            priceElement.textContent = newPrice.toLocaleString('vi-VN') + 'đ';
                                            updateTotalPrice();
                                        } else {
                                            console.error('Original price is not a valid number:', originalPrice);
                                        }
                                    }
                                });

                                function saveTotalPrice() {
                                    let totalPrice = document.getElementById('totalPrice').textContent;
                                    let bookingDetailId = ${bookingDetailId};
                                    $.ajax({
                                        url: '/DaNangDreamHotel/useSuppliesURL?action=update',
                                        type: 'GET',
                                        data: {
                                            total: totalPrice,
                                            id: bookingDetailId
                                        },
                                        success: function (data) {
//                                            showPopup();
//                                            let totalRow = document.querySelector('#total'); 
//                                            if (totalRow) {
//                                                totalRow.innerHTML = `
//                    <th scope="row" colspan="4" class="text-end">Sub Total</th>
//                    <td class="text-end">${totalPrice}</td>
//                `;
//                                            } else {
//                                                console.error('Element with id "total" not found in popup.');
//                                            }
                                            Swal.fire({
                                                position: "center",
                                                icon: "success",
                                                title: "Your work has been saved",
                                                showConfirmButton: false,
                                                timer: 1500
                                            });
                                            
                                            setTimeout(()=>{
                                                location.reload();
                                            },1000);
                                        },
                                        error: function (xhr) {
                                            console.log("Error:", xhr, totalPrice, bookingDetailId);
                                        }
                                    });
                                }




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

                                function showPopup() {
                                    const popup = document.getElementById('popup');
                                    const overlay = document.getElementById('overlay');
                                    const roomInfo = document.getElementById('roomInfo');
                                    popup.classList.add('active');
                                    overlay.classList.add('active');
                                }

                                function hidePopup() {
                                    const popup = document.getElementById('popup');
                                    const overlay = document.getElementById('overlay');
                                    popup.classList.remove('active');
                                    overlay.classList.remove('active');
                                }
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
                                var checkIn = document.getElementById('checkin').setAttribute('min', minDate);
                                document.getElementById('checkin').innerText = 'Invoice Date: ' + minDate;
        </script>
    </body>

</html>
</c:if>
