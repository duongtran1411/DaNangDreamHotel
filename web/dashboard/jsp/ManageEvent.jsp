<%-- 
    Document   : ManageEvent
    Created on : May 27, 2024, 2:35:59 PM
    Author     : Sơnnnn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

    </head>

    <body>
        <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
             data-sidebar-position="fixed" data-header-position="fixed">
            <jsp:include page="SlideBar.jsp"></jsp:include>
                <div class="body-wrapper">
                <jsp:include page="Profile.jsp"></jsp:include>
                    <div class="card">
                        <div class="card-body">
                            <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#addRoomModal">
                                <p class="mb-0 fs-3"><i class="ti ti-plus fs-6"></i>New Event</p>                  
                            </button>
                            <div class="container-fluid">
                                <div class="table-wrapper">
                                    <div class="table-title" style="background-color: #000">                 
                                    </div>
                                    <table class="table table-striped table-hover">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Name</th>
                                                <th>Image</th>
                                                <th>StartDay</th>
                                                <th>EndDay</th>
                                                <th>Description</th>
                                                <th>Discount</th>
                                                <th>Voucher</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${listE}" var="a">
                                        <tr>
                                            <th scope="row">${a.event_Id}</th>
                                            <td>${a.name}</td>
                                            <td><img src="${a.image}" alt="alt" style="width:304px;height: 204px"/></td>
                                            <td>${a.startDay}</td>
                                            <td>${a.endDay}</td>
                                            <td>${a.description}</td>
                                            <td>${a.discount * 100}%</td>
                                            <td>${a.voucher}</td>
                                            <td>
                                                <a href="EditEventControllerURL?id=${a.event_Id}" title="Edit" class="edit" data-toggle="tooltip"><i class="ti ti-pencil fs-7"></i></a>
                                                <a href="DeleteEventControllerURL?id=${a.event_Id}"  title="Delete" data-toggle="tooltip"><i class="ti ti-trash-off fs-7" style="color: red"></i></a>
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

        <!--MODAL FADE-->
        <div class="container-fluid">
            <div class="modal fade" id="addRoomModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="InsertEventControllerURL" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">New Event</h4>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                        <label>Name</label>
                        <input name="name" type="text" class="form-control"  required>
                    </div>
                    <div class="form-group">
                        <label>Image</label>
                        <input name="image" type="text" class="form-control"  required>
                    </div>
                    <div class="form-group">
                        <label>StartDay</label>
                        <input name="start" type="date" class="form-control"  required>
                    </div>
                    <div class="form-group">
                        <label>EndDay</label>
                        <input name="end" type="date" class="form-control"  required>
                    </div>
                    <div class="form-group">
                        <label>Description</label>
                        <input name="description" type="text" class="form-control"  required>
                    </div>
                    <div class="form-group">
                        <label>Discount</label>
                        <input name="discount" type="text" class="form-control"  required>
                    </div>
                    <div class="form-group">
                        <label>Voucher</label>
                        <input name="voucher" type="text" class="form-control" required>
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
        </div>

        <script src="../assets/libs/jquery/dist/jquery.min.js"></script>
        <script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
        <script src="../assets/js/sidebarmenu.js"></script>
        <script src="../assets/js/app.min.js"></script>
        <script src="../assets/libs/simplebar/dist/simplebar.js"></script>
    </body>

</html>