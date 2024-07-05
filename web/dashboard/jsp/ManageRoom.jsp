<%-- 
    Document   : ManageRoom
    Created on : May 26, 2024, 5:49:23 PM
    Author     : Sơnnnn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Da Nang Hotel</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="dashboard/assets/css/styles.min.css">
        <link rel="stylesheet" href="dashboard/assets/css/styles.css">
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
                                <!-- Page Heading -->
                                <h1 class="h3 mb-2 text-gray-800">Room</h1>
                                <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#addRoomModal">
                                    <p class="mb-0 fs-3"><i class="ti ti-plus fs-6"></i>Add Room</p>
                                </button>
                                <div class="card shadow mb-4">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                                <thead>
                                                    <tr>
                                                        <th>Image</th>
                                                        <th>Floor</th>
                                                        <th>Name
                                                            <button onclick="sortNameUp()" class="btn" style="border: none; background-color: transparent; padding: 2px"><i class="fa fa-angle-down"></i></button>
                                                            <button onclick="sortNameDown()"class="btn" style="border: none; background-color: transparent; padding: 2px"><i class="fa fa-angle-up"></i></button>
                                                        </th>
                                                        <th>Price
                                                            <button onclick="sortPriceUp()"class="btn" style="border: none; background-color: transparent; padding: 2px"><i class="fa fa-angle-down"></i></button>
                                                            <button onclick="sortPriceDown()"class="btn" style="border: none; background-color: transparent; padding: 2px"><i class="fa fa-angle-up"></i></button>
                                                        </th>
                                                        <th>Size</th>
                                                        <th class="text-center" style="width: 20%">Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="content">
                                                <c:forEach items="${AllRoom}" var="o">
                                                    <tr>
                                                        <td>
                                                            <a href="imageRoomURL?action=view&rid=${o.room_Id}"><i class="far fa-eye successful"></i></a>
                                                        </td>
                                                        <td>${o.floor_Room_Id}</td>
                                                        <td>${o.name}</td>
                                                        <td><fmt:formatNumber type="number">${o.price}</fmt:formatNumber> đ</td>
                                                        <td>${o.size} m²</td>
                                                        <td class="text-center">
                                                            <button type="button" class="btn btn-primary"
                                                                    data-bs-toggle="modal" data-bs-target="#updateRoom"
                                                                    onclick="updateRoom('${o.room_Id}', '${o.floor_Room_Id}', '${o.name}', '${o.price}', '${o.size}')">
                                                                <p class="mb-0 fs-3">Update</p>
                                                            </button>                                                            
                                                            <a href="roomURL?action=delete&rid=${o.room_Id}" class="btn btn-danger delete" title="Delete" data-toggle="tooltip">Delete</a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                <c:forEach items="${ListRoomBID}" var="o">
                                                    <tr>
                                                        <td>
                                                            <a href="imageRoomURL?action=view&rid=${o.room_Id}"><i class="far fa-eye"></i></a>
                                                        </td>
                                                        <td>${o.floor_Room_Id}</td>
                                                        <td>${o.name}</td>
                                                        <td><fmt:formatNumber type="number">${o.price}</fmt:formatNumber> đ</td>
                                                        <td>${o.size} m²</td>
                                                        <td>
                                                            <button type="button" class="btn btn-primary"
                                                                    data-bs-toggle="modal" data-bs-target="#updateRoom"
                                                                    onclick="updateRoom('${o.room_Id}', '${o.floor_Room_Id}', '${o.name}', '${o.price}', '${o.size}')">
                                                                <p class="mb-0 fs-3">Update</p>
                                                            </button>
                                                            <a href="roomURL?action=delete&rid=${o.room_Id}" class="delete" title="Delete" data-toggle="tooltip"><i class='far fa-trash-alt' style="color: #c80000"></i></a>
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

        <div class="modal fade" id="updateRoom" tabindex="-1" role="dialog" aria-labelledby="updateRoomLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="updateRoomLabel">Update Room Details</h5>
                        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="roomURL?action=update" method="post">
                            <div class="form-group">
                                <input type="text" class="form-control" id="room_Id" name="rid" hidden="">
                            </div>
                            <div class="form-group">
                                <label for="floor_Room_Id">Floor:</label>
                                <input type="text" class="form-control" id="floor_Room_Id" name="floor" >
                            </div>
                            <div class="form-group">
                                <label for="name">Room Name:</label>
                                <input type="text" class="form-control" id="name" name="name">
                            </div>
                            <div class="form-group">
                                <label for="price">Price:</label>
                                <input type="number" class="form-control" id="price" name="price">
                            </div>
                            <div class="form-group">
                                <label for="size">Size (m²):</label>
                                <input type="number" class="form-control" id="size" name="size">
                            </div>
                            <div class="form-group" style="margin-bottom: 12px">
                                <label>Type Room</label>
                                <select name="trid" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${AllTypeRoom}" var="o">
                                        <option value="${o.typeRoom_Id}">${o.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" value="Close">Close</button>
                                <button type="submit" class="btn btn-primary">Save changes</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid">
            <div class="modal fade" id="addRoomModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="roomURL?action=add" method="post">
                            <div class="modal-header">
                                <h4 class="modal-title">Add Room</h4>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group" style="margin-bottom: 12px">
                                    <label>Name</label>
                                    <input name="name" type="text" class="form-control" required>
                                </div>
                                <div class="form-group" style="margin-bottom: 12px">
                                    <label>Floor</label>
                                    <input name="floor" type="number" class="form-control" required>
                                </div>
                                <div class="form-group" style="margin-bottom: 12px">
                                    <label>Price</label>
                                    <input name="price" type="number" class="form-control" required>
                                </div>
                                <div class="form-group" style="margin-bottom: 12px">
                                    <label>Size</label>
                                    <input name="size" type="number" class="form-control" required>
                                </div>
                                <div class="form-group" style="margin-bottom: 12px">
                                    <label>Type Room</label>
                                    <select name="type_Room_Id" class="form-select" aria-label="Default select example">
                                        <c:forEach items="${AllTypeRoom}" var="o">
                                            <option value="${o.typeRoom_Id}">${o.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" value="Close">Close</button>
                                <button type="submit" class="btn btn-primary">Save changes</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="dashboard/assets/js/sidebarmenu.js"></script>
        <script src="dashboard/assets/js/app.min.js"></script>

        <script>
                                                                        function sortNameUp() {
                                                                            $.ajax({
                                                                                url: 'roomURL?action=sortnameasc',
                                                                                type: 'GET',
                                                                                success: function (data) {
                                                                                    $('#content').html(data);
                                                                                    console.log("Sorting by name ascending successful");
                                                                                },
                                                                                error: function (xhr) {
                                                                                    console.log(xhr);
                                                                                }
                                                                            });
                                                                        }

                                                                        function sortNameDown() {
                                                                            $.ajax({
                                                                                url: 'roomURL?action=sortnamedesc',
                                                                                type: 'GET',
                                                                                success: function (data) {
                                                                                    $('#content').html(data);
                                                                                    console.log("Sorting by name descending successful");
                                                                                },
                                                                                error: function (xhr) {
                                                                                    console.log(xhr);
                                                                                }
                                                                            });
                                                                        }

                                                                        function sortPriceUp() {
                                                                            $.ajax({
                                                                                url: 'roomURL?action=sortpriceup',
                                                                                type: 'GET',
                                                                                success: function (data) {
                                                                                    $('#content').html(data);
                                                                                    console.log("Sorting by price ascending successful");
                                                                                },
                                                                                error: function (xhr) {
                                                                                    console.log(xhr);
                                                                                }
                                                                            });
                                                                        }

                                                                        function sortPriceDown() {
                                                                            $.ajax({
                                                                                url: 'roomURL?action=sortpricedown',
                                                                                type: 'GET',
                                                                                success: function (data) {
                                                                                    $('#content').html(data);
                                                                                    console.log("Sorting by price descending successful");
                                                                                },
                                                                                error: function (xhr) {
                                                                                    console.log(xhr);
                                                                                }
                                                                            });
                                                                        }

                                                                        function updateRoom(room_Id, floor_Room_Id, name, price, size) {
                                                                            $('#room_Id').val(room_Id);
                                                                            $('#floor_Room_Id').val(floor_Room_Id);
                                                                            $('#name').val(name);
                                                                            $('#price').val(price);
                                                                            $('#size').val(size);
                                                                            $('#updateRoom').modal('show');
                                                                        }
        </script>

    </body>

</html>
