<%-- 
    Document   : editProduct
    Created on : Jan 28, 2024, 9:48:29 AM
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
        <title>Manage Type Room</title>
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
                                <h2><a href="${pageContext.request.contextPath}/typeRoomURL" style="color: #ffff">Back</a></h2>
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
                    <form action="typeRoomURL?action=edit" method="post" enctype="multipart/form-data">
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit Type Room</h4>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>ID</label>
                                <input value="${TypeRoomBID.getTypeRoom_Id()}" name="type_Room_Id" type="text" class="form-control" readonly required>
                            </div>
                            <div class="form-group">
                                <label>Name</label>
                                <input value="${TypeRoomBID.name}" name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Even ID</label>
                                <input value="${TypeRoomBID.event_Id}" name="event_Id" type="number" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Bed</label>
                                <input value="${TypeRoomBID.bed}" name="bed" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Bath</label>
                                <input value="${TypeRoomBID.bath}" name="bath" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>People</label>
                                <input value="${TypeRoomBID.people}" name="people" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input name="fileImageTypeRoom" type="file" class="form-control" required>
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
