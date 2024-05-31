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
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Manage Room</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/crudtable.css"/>
        <link rel="shortcut icon" href="images/imgfonts/P.png" type="image/x-icon" />


    <body>
        <div class="container-fluid">
            <div class="table-wrapper">
                <div class="table-title" style="background-color: #000">
                    <div class="row">

                        <div class="col-sm-6">
                            <div class="col-sm-2">
                                <h2><a href="${pageContext.request.contextPath}/roomURL?action=" style="color: #ffff">Back</a></h2>
                            </div>
                        </div>               
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
                                <input value="${RoomByID.price}" name="price" type="number" class="form-control" required>
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
