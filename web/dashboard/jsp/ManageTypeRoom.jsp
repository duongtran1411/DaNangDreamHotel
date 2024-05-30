<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
        <!--  Body Wrapper -->
        <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
             data-sidebar-position="fixed" data-header-position="fixed">
            <jsp:include page="SlideBar.jsp"></jsp:include>

                <div class="body-wrapper">
                <jsp:include page="Profile.jsp"></jsp:include>
                </div>
                <section class="rooms-section spad">
                    <div class="container">
                        <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#addTypeRoomModal">
                            <p class="mb-0 fs-3"><i class="ti ti-plus fs-6"></i>New Type</p>                  
                        </button>
                        <div class="row">                 
                        <c:forEach items="${AllTypeRoom}" var="o">
                            <c:url value="${o.image}" var="urlImg1"/>
                            <div class="col-lg-3 col-md-6 d-flex justify-content-center">
                                <div class="room-item" style="border: 1.5px solid gainsboro; border-radius: 15px; overflow: hidden; display: flex; flex-direction: column; margin-bottom: 15px; align-items: center; width: 100%; max-width: 400px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.4); position: relative;">
                                    <img src="${o.image}" style="width: 100%; border-radius: 15px 15px 0 0;" alt="">
                                    <div class="ri-text" style="padding: 10px; text-align: left; width: 100%;">
                                        <h4 class="text-center" style="margin-bottom: 3px">${o.name}</h4>
                                        <div class="content-icon d-flex align-items-between justify-content-between" style="font-size: 0.95rem;">
                                            <div style="display: flex; align-items: center; justify-content: center; margin-top: 10px;">
                                                <i class="fa fa-users" aria-hidden="true" style="margin-right: 8px; font-size: 1.2em;"></i>
                                                <span>${o.people}</span>
                                            </div>
                                            <div style="display: flex; align-items: center; justify-content: center; margin-top: 10px;">
                                                <i class="fa fa-bed" aria-hidden="true" style="margin-right: 8px; font-size: 1.2em;"></i>
                                                <span>${o.bed}</span>
                                            </div>
                                            <div style="display: flex; align-items: center; justify-content: center; margin-top: 10px;">
                                                <i class="fa fa-bath" aria-hidden="true" style="margin-right: 8px; font-size: 1.2em;"></i>
                                                <span>${o.bath}</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div style="display: flex; justify-content: space-between; width: 100%; padding: 5px;">
                                        <a href="typeRoomURL?action=loadEdit&id=${o.typeRoom_Id}" class="text-decoration-none" style="color: #08c;">Edit</a>
                                        <a href="roomURL?action=detail&trid=${o.typeRoom_Id}" class="text-decoration-underline" style="color: seagreen;">Detail</a>
                                        <a href="typeRoomURL?action=delete&id=${o.typeRoom_Id}" class="text-decoration-none" style="color: red; ">Delete</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>
        </div> 
        <div class="container-fluid">
            <div class="modal fade" id="addTypeRoomModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="typeRoomURL?action=add" method="post" enctype="multipart/form-data">
                            <div class="modal-header">						
                                <h4 class="modal-title">New Type Room</h4>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group" style="margin-bottom: 20px">
                                    <label>Type Name</label>
                                    <input name="name" placeholder="..." type="text" class="form-control" required>
                                </div>
                                <div class="form-group" style="margin-bottom: 20px">
                                    <label>Bed</label>
                                    <input name="bed" placeholder="... Beds"class="form-control" required>
                                </div>
                                <div class="form-group" style="margin-bottom: 20px">
                                    <label>Bath</label>
                                    <input name="bath" placeholder="... Baths" class="form-control" required>
                                </div>
                                <div class="form-group" style="margin-bottom: 20px">
                                    <label>People</label>
                                    <input name="people" placeholder="... Adults" type="text" class="form-control" required>
                                </div>					
                                <div class="form-group" style="margin-bottom: 20px">
                                    <label>Image</label>
                                    <input name="fileImage" type="file" class="form-control" required>
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
