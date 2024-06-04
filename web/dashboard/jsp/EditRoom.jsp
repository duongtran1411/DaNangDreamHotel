<%-- 
    Document   : EditRoom.jsp
    Created on : May 30, 2024, 3:16:03 PM
    Author     : Sơnnnn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <style>
            .modal-dialog {
                max-width: 500px;
            }
            .back-link {
                font-size: 18px;
                color: #fff;
                text-decoration: none;
            }
            .back-link:hover {
                text-decoration: underline;
            }
            .table-title h2 {
                margin: 0;
            }
        </style>
    </head>
    <body>
        <div class="table-wrapper">
            <div class="table-title" style="background-color: #000; padding: 15px;">
                <div class="row">
                    <div class="col-sm-12 text-left">
                        <h2><a href="${pageContext.request.contextPath}/typeRoomURL" class="back-link"><i class="fas fa-arrow-left"></i> </a></h2>
                    </div>               
                </div>
            </div>
        </div>


        <!-- Edit Modal HTML -->
        <div id="editEmployeeModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="roomURL?action=edit" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit Room</h4>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>ID</label>
                                <input value="${RoomByID.room_Id}" name="rid" type="text" class="form-control" readonly required>
                            </div>
                            <div class="form-group">
                                <label>Name</label>
                                <input value="${RoomByID.name}" name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Floor</label>
                                <input value="${RoomByID.floor_Room_Id}" name="floor" min="1" max="6" step="1" type="number" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input value="${RoomByID.price}" name="price" min="1" type="number" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Size</label>
                                <input value="${RoomByID.size}" name="size" type="number" class="form-control" required>
                            </div>
                            <div class="form-group" style="margin-bottom: 12px">
                                <label>Type Room</label>
                                <select name="trid" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${AllTypeRoom}" var="o">
                                        <option value="${o.typeRoom_Id}">${o.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-success" value="Edit">
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!--<script src="js/custom.js"></script>-->
</html>
