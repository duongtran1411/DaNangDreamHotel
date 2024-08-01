<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                            <div class="container-fluid" >
                                <div class="container" style="margin-right: 105px; height: 800px;">

                                    <!-- Page Heading -->
                                    <h1 class="h3 mb-2 text-gray-800">ITEMS</h1>
                                    <div class="d-flex justify-content-center">
                                        <div class="search">
                                            <input class="search_input" id="searchInput" type="text" name="txt" placeholder="Search...">
                                            <a href="#" class="search_icon"><i class="fa fa-search"></i></a>
                                        </div>
                                    </div>
                                    <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#addItemModal">
                                        <p class="mb-0 fs-3"><i class="ti ti-plus fs-6"></i>Add Item</p>
                                    </button>
                                
                                <div class="card shadow mb-4">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                                <thead>
                                                    <tr>
                                                        <!--<th class="sortable">ID</th>-->
                                                        <th class="sortable">Name of item</th>
                                                        <th class="sortable">Type</th>
                                                        <th class="sortable">Price</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${allItem}" var="o">
                                                        <tr>
                                                            <td data-label="Name">${o.name}</td>

                                                            <td data-label="Type">
                                                                <c:forEach items="<%= allType %>" var="t">
                                                                    <c:if test="${t.typeItem_Id == o.typeItem_Id}">
                                                                        ${t.name}
                                                                    </c:if>
                                                                </c:forEach> 
                                                            </td>
                                                            <td data-label="Price">${FormatUtils.formatPRice(o.price)}đ</td>

                                                            <td data-label="Actions">
                                                                <a href="#" class="update-link" 
                                                                   data-id="${o.item_Id}" 
                                                                   data-name="${o.name}" 
                                                                   data-price="${o.price}" 
                                                                   data-type="${o.typeItem_Id}" 
                                                                   title="Update" 
                                                                   data-toggle="tooltip"><i class='far fa-edit'></i></a>
                                                                <a  class="delete" title="Delete" data-toggle="tooltip" 
                                                                    onclick="confirmDelete(${o.item_Id})"><i class='far fa-trash-alt' style="color: #c80000"></i></a>
                                                            </td>

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

            <div class="container-fluid">
                <div class="modal fade" id="addItemModal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form id="addItemForm" action="ItemController?action=add" method="post">
                                <div class="modal-header">			

                                    <h4 class="modal-title">Add Item</h4>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                </div>
                                <div class="modal-body">					
                                    <div class="form-group" style="margin-bottom: 12px">
                                        <label>Name</label>
                                        <input id="itemName"name="name" type="text" class="form-control" required>
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
                <div class="modal fade" id="updateItemModal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form id="updateItemForm" action="ItemController?action=update" method="post">
                                <div class="modal-header">			
                                    <h4 class="modal-title">Update Item</h4>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                </div>
                                <div class="modal-body">					
                                    <div class="form-group" style="margin-bottom: 12px">
                                        <label>Name</label>
                                        <input id="updateItemName" name="name" type="text" class="form-control" required>
                                    </div>
                                    <div class="form-group" style="margin-bottom: 12px">
                                        <label>Price</label>
                                        <input id="updatePrice" name="price" type="number" class="form-control" required>
                                    </div>				
                                    <div class="form-group" style="margin-bottom: 12px">
                                        <label>Type Item</label>
                                        <select id="updateType" name="type" class="form-select" aria-label="Default select example">
                                            <c:forEach items="<%= allType %>" var="t">
                                                <option value="${t.typeItem_Id}">${t.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <input type="hidden" id="updateItemId" name="itemId">
                                </div>
                                <div class="modal-footer">
                                    <input type="button" class="btn btn-default" data-bs-dismiss="modal" value="Cancel">
                                    <input type="submit" class="btn btn-success" value="Update">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
                <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<!--                <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>-->
                <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

                <script>
                                                                        document.getElementById("updateItemForm").addEventListener("submit", function (event) {
                                                                            var hasError = false;
                                                                            var errorMessage = "";

                                                                            // Validate price
                                                                            var priceInput = document.getElementById("updatePrice");
                                                                            var price = parseFloat(priceInput.value);

                                                                            if (isNaN(price) || price < 0) {
                                                                                errorMessage += "Please enter a valid number for the price.\n";
                                                                                hasError = true;
                                                                            }

                                                                            // Validate name
                                                                            var nameInput = document.getElementById("updateItemName");
                                                                            var name = nameInput.value.trim();
                                                                            var nameRegex = /\d/; // Regular expression to check for digits

                                                                            if (name === '') {
                                                                                errorMessage += "Name cannot be empty or just whitespace.\n";
                                                                                hasError = true;
                                                                            } else if (name.length < 3 || name.length > 100) {
                                                                                errorMessage += "Name must be between 3 and 100 characters long.\n";
                                                                                hasError = true;
                                                                            } else if (nameRegex.test(name)) {
                                                                                errorMessage += "Name cannot contain numbers.\n";
                                                                                hasError = true;
                                                                            }

                                                                            if (hasError) {
                                                                                alert(errorMessage.trim());
                                                                                event.preventDefault();
                                                                                if (name === '' || name.length < 3 || name.length > 100 || nameRegex.test(name)) {
                                                                                    nameInput.focus();
                                                                                }
                                                                                return;
                                                                            }
                                                                        });

                                                                        document.getElementById("addItemForm").addEventListener("submit", function (event) {
                                                                            var hasError = false;
                                                                            var errorMessage = "";

                                                                            // Validate price
                                                                            var priceInput = document.getElementById("price");
                                                                            var price = parseFloat(priceInput.value);

                                                                            if (isNaN(price) || price < 0) {
                                                                                errorMessage += "Please enter a valid number for the price.\n";
                                                                                hasError = true;
                                                                            }

                                                                            // Validate name
                                                                            var nameInput = document.getElementById("itemName");
                                                                            var name = nameInput.value.trim();
                                                                            var nameRegex = /\d/; // Regular expression to check for digits

                                                                            if (name === '') {
                                                                                errorMessage += "Name cannot be empty or just whitespace.\n";
                                                                                hasError = true;
                                                                            } else if (name.length < 3 || name.length > 100) {
                                                                                errorMessage += "Name must be between 3 and 100 characters long.\n";
                                                                                hasError = true;
                                                                            } else if (nameRegex.test(name)) {
                                                                                errorMessage += "Name cannot contain numbers.\n";
                                                                                hasError = true;
                                                                            }

                                                                            if (hasError) {
                                                                                alert(errorMessage.trim());
                                                                                event.preventDefault();
                                                                                if (name === '' || name.length < 3 || name.length > 100 || nameRegex.test(name)) {
                                                                                    nameInput.focus();
                                                                                }
                                                                                return;
                                                                            }
                                                                        });
                </script>
                <script>
                    $(document).ready(function () {
                        // Click event for update links
                        $(document).on('click', '.update-link', function () {
                            var itemId = $(this).data('id');
                            var itemName = $(this).data('name');
                            var itemPrice = $(this).data('price');
                            var itemType = $(this).data('type');

                            // Set the data in the modal
                            $('#updateItemId').val(itemId);
                            $('#updateItemName').val(itemName);
                            var formattedPrice = parseFloat(itemPrice.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'}));
                            $('#updatePrice').val(formattedPrice);
                            $('#updateType').val(itemType);
                            $('#updateItemModal').modal('show');
                        });
                    });


                </script>
                <script>
                    function confirmDelete(id) {
                        Swal.fire({
                            title: "Are you sure?",
                            text: "You won't be able to revert this!",
                            icon: "warning",
                            showCancelButton: true,
                            confirmButtonColor: "#3085d6",
                            cancelButtonColor: "#d33",
                            confirmButtonText: "Yes, delete it!",
                            timer: 2000
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $.ajax({
                                    url: '/DaNangDreamHotel/ItemController?action=delete',
                                    type: 'GET',
                                    data: {
                                        id: id
                                    },
                                    success: function (data) {
                                        Swal.fire("Deleted!", "", "success");
                                        setTimeout(() => {
                                            location.reload();
                                        }, 1000);
                                    },
                                    error: function (xhr) {
                                        console.log(xhr);
                                    }
                                });
                            } else if (result.isDenied) {
                                Swal.fire("Item is not deleted", "", "info");
                            }
                        });
                    }


                </script>

                <script>

                    $(document).ready(function () {
                        var table = $('#dataTable').DataTable({
                            "pagingType": "simple_numbers", // Sử dụng loại phân trang đơn giản, chỉ có next và previous
                            "lengthMenu": [5, 10, 25, 50],
                            "pageLength": 10,
                            "language": {
                                //"info": "Hiển thị START đến END của TOTAL bản ghi",
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
                </script>


                <script src="dashboard/assets/libs/jquery/dist/jquery.min.js"></script>
                <script src="dashboard/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
                <script src="dashboard/assets/js/sidebarmenu.js"></script>
                <script src="dashboard/assets/js/app.min.js"></script>
                <script src="dashboard/assets/libs/simplebar/dist/simplebar.js"></script>
                </body>

                </html>