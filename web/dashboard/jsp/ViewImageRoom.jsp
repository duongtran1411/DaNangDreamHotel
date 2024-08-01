<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Da Nang Hotel</title>
        <link rel="icon" href="img/title_danangdream.jpg" type="image/x-icon"/>
        <link rel="shortcut icon" type="image/png" href="../assets/images/logos/favicon.png" />
        <link rel="stylesheet" href="dashboard/assets/css/styles.min.css" />
        <link rel="stylesheet" href="dashboard/assets/css/styles.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    </head>
    <style>
        .room-item {
            position: relative;
            overflow: hidden;
        }

        .room-image {
            width: 304px;
            height: 202px;
            border-radius: 15px 15px 0 0;
        }

        .delete-icon {
            position: absolute;
            top: 12px;
            right: 15px;
            transform: translate(50%, -50%);
            color: red;
            font-size: 22px;
            background: rgba(255, 255, 233, 0.4);
            border-radius: 20%;
            padding: 8px;
            text-decoration: none;
            display: none;
        }

        .room-item:hover .delete-icon {
            display: block;
        }
    </style>
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
                        <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#addImage">
                            <p class="mb-0 fs-3"><i class="ti ti-plus fs-6"></i>Add Image</p>                  
                        </button>
                        <h2>${NameRoom.name}</h2>
                    <div class="row">                 
                        <c:forEach items="${ImageRoomBRID}" var="o">
                            <c:url value="/img/room/${o.image}" var="urlImgRoom"/>
                            <div class="col-lg-3 col-md-6 d-flex justify-content-center">
                                <div class="room-item" style="border: 1.5px solid gainsboro; border-radius: 15px; overflow: hidden; display: flex; flex-direction: column; align-items: center; width: 100%; max-width: 400px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.4); position: relative; margin-bottom: 12px">
                                    <c:choose>
                                        <c:when test="${fn:startsWith(o.image, 'http')}">
                                            <img src="${o.image}" class="room-image" alt="" onclick="showImageModal('${o.image}')">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${urlImgRoom}" class="room-image" alt="" onclick="showImageModal('${urlImgRoom}')">
                                        </c:otherwise>
                                    </c:choose>                      
                                    <a href="imageRoomURL?action=delete&irid=${o.image_Room_Id}&rid=${o.room_Id}" class="delete-icon">×</a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>
        </div> 
        <div class="container-fluid">
            <div class="modal fade" id="addImage">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="imageRoomURL?action=add&rid=${rid}" method="post" enctype="multipart/form-data">
                            <div class="modal-header">						
                                <h4 class="modal-title">Add Image Room</h4>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
                            <div class="modal-body">			
                                <div class="form-group">
                                    <label>Image</label>
                                    <input name="fileImageRoom" type="file" class="form-control" required>
                                </div>						
                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-bs-dismiss="modal" value="Cancel">
                                <input type="submit" class="btn btn-success" value="Add">
                            </div>
                        </form>
                    </div>        
                    <div class="container-fluid">
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal to display the enlarged image -->
        <div class="modal fade" id="imageModal" tabindex="-1" aria-labelledby="imageModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="imageModalLabel">Image Preview</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body text-center">
                        <img id="enlargedImage" src="" class="img-fluid" alt="Enlarged Image">
                    </div>
                </div>
            </div>
        </div>

        <script>
            function showImageModal(imageSrc) {
                document.getElementById('enlargedImage').src = imageSrc;
                var myModal = new bootstrap.Modal(document.getElementById('imageModal'));
                myModal.show();
            }
        </script>

        <script src="../assets/libs/jquery/dist/jquery.min.js"></script>
        <script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
        <script src="../assets/js/sidebarmenu.js"></script>
        <script src="../assets/js/app.min.js"></script>
        <script src="../assets/libs/simplebar/dist/simplebar.js"></script>
    </body>
</html>
