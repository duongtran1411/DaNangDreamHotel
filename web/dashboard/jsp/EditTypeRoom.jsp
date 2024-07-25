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
        <div class="container-fluid">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="typeRoomURL?action=edit" method="post" enctype="multipart/form-data">
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit Type Room</h4>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group" style="margin-bottom: 20px">
                                <label>ID</label>
                                <input value="${TypeRoomBID.getTypeRoom_Id()}" name="type_Room_Id" type="text" class="form-control" readonly required>
                            </div>
                            <div class="form-group" style="margin-bottom: 20px">
                                <label>Name</label>
                                <input value="${TypeRoomBID.name}" name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group" style="margin-bottom: 20px">
                                <label>Event ID</label>
                                <input value="${TypeRoomBID.event_Id}" name="event_Id" type="number" class="form-control" required>
                            </div>
                            <div class="form-group" style="margin-bottom: 20px">
                                <label>Bed</label>
                                <input value="${TypeRoomBID.bed}" name="bed" type="text" class="form-control" required>
                            </div>
                            <div class="form-group" style="margin-bottom: 20px">
                                <label>Bath</label>
                                <input value="${TypeRoomBID.bath}" name="bath" type="text" class="form-control" required>
                            </div>
                            <div class="form-group" style="margin-bottom: 20px">
                                <label>People</label>
                                <input value="${TypeRoomBID.people}" name="people" type="text" class="form-control" required>
                            </div>
                            <div class="form-group" style="margin-bottom: 20px">
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
