<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link rel="icon" href="img/title_danangdream.jpg" type="image/x-icon"/>
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
                <c:if test="${not empty sessionScope.notificationMessage}">
                    <div style="margin-left: 300px; margin-right: 90px" class="alert alert-${sessionScope.notificationStatus == 'success' ? 'success' : 'danger'} alert-dismissible fade show" role="alert" id="status-alert">
                        ${sessionScope.notificationMessage}
                    </div>
                    <script>
                        setTimeout(function () {
                            var alert = document.getElementById('status-alert');
                            if (alert) {
                                alert.classList.remove('show');
                                alert.classList.add('fade');
                                setTimeout(function () {
                                    alert.parentNode.removeChild(alert);
                                }, 11000);
                            }
                        }, 9000);
                    </script>
                    <c:remove var="notificationMessage" scope="session"/>
                    <c:remove var="notificationStatus" scope="session"/>
                </c:if>
                <div class="container">
                    <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#addTypeRoomModal">
                        <p class="mb-0 fs-3"><i class="ti ti-plus fs-6"></i>New Type</p>                  
                    </button>
                    <div class="row">                 
                        <c:forEach items="${AllTypeRoom}" var="o">
                            <c:url value="/img/typeroom/${o.image}" var="urlImg1"/>
                            <div class="col-lg-3 col-md-6 d-flex justify-content-center">
                                <div class="room-item" style="border: 1.5px solid gainsboro; border-radius: 15px; overflow: hidden; display: flex; flex-direction: column; margin-bottom: 15px; align-items: center; width: 100%; max-width: 400px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.4); position: relative;">
                                    <c:choose>
                                        <c:when test="${fn:startsWith(o.image, 'http')}">
                                            <img src="${o.image}" style="width: 304px; height: 202px; border-radius: 15px 15px 0 0;" alt="">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${urlImg1}" style="width: 304px; height: 202px; border-radius: 15px 15px 0 0;" alt="">
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="ri-text" style="padding: 10px; text-align: left; width: 100%;">
                                        <h4 class="text-center" style="margin-bottom: 3px">${o.name}</h4>
                                        <div class="content-icon d-flex align-items-between justify-content-between" style="font-size: 0.95rem;">
                                            <div style="display: flex; align-items: center; justify-content: center; margin-top: 10px;">
                                                <i class="fa fa-users" aria-hidden="true" style="margin-right: 8px; font-size: 1.2em;"></i>
                                                <c:if test="${o.people == 1}">
                                                    <span>${o.people} Person</span>
                                                </c:if>
                                                <c:if test="${o.people > 1}">
                                                    <span>${o.people} People</span>
                                                </c:if>
                                            </div>
                                            <div style="display: flex; align-items: center; justify-content: center; margin-top: 10px;">
                                                <i class="fa fa-bed" aria-hidden="true" style="margin-right: 8px; font-size: 1.2em;"></i>
                                                <c:if test="${o.bed == 1}">
                                                    <span>${o.bed} Bed</span>
                                                </c:if>
                                                <c:if test="${o.bed > 1}">
                                                    <span>${o.bed} Beds</span>
                                                </c:if>
                                            </div>
                                            <div style="display: flex; align-items: center; justify-content: center; margin-top: 10px;">
                                                <i class="fa fa-bath" aria-hidden="true" style="margin-right: 8px; font-size: 1.2em;"></i>
                                                <c:if test="${o.bath == 1}">
                                                    <span>${o.bath} Bath</span>
                                                </c:if>
                                                <c:if test="${o.bath > 1}">
                                                    <span>${o.bath} Baths</span>
                                                </c:if>                                       
                                            </div>
                                        </div>
                                    </div>
                                    <div style="display: flex; justify-content: space-between; width: 100%; padding: 5px;">
                                        <!--<a href="typeRoomURL?action=loadEdit&id=${o.typeRoom_Id}" class="text-decoration-none" style="color: #08c;">Edit</a>-->
                                        <a data-bs-toggle="modal" data-bs-target="#updateTypeRoom"
                                           onclick="updateTypeRoom('${o.getTypeRoom_Id()}', '${o.name}', '${o.event_Id}', '${o.bed}', '${o.bath}', '${o.people}')" class="text-decoration-none" style="color: #08c;">Edit</a>
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
                                    <input name="name" placeholder="Enter The Room Type Name..." type="text" class="form-control" required>
                                </div>
                                <div class="form-group" style="margin-bottom: 20px">
                                    <label>Bed</label>
                                    <div class="input-group">
                                        <button type="button" class="btn btn-outline-secondary" onclick="updateValue('bed', -1)">-</button>
                                        <input name="bed" id="bed" type="text" class="form-control text-center" value="0" readonly>
                                        <button type="button" class="btn btn-outline-secondary" onclick="updateValue('bed', 1)">+</button>
                                    </div>
                                </div>
                                <div class="form-group" style="margin-bottom: 20px">
                                    <label>Bath</label>
                                    <div class="input-group">
                                        <button type="button" class="btn btn-outline-secondary" onclick="updateValue('bath', -1)">-</button>
                                        <input name="bath" id="bath" type="text" class="form-control text-center" value="0" readonly>
                                        <button type="button" class="btn btn-outline-secondary" onclick="updateValue('bath', 1)">+</button>
                                    </div>
                                </div>
                                <div class="form-group" style="margin-bottom: 20px">
                                    <label>People</label>
                                    <div class="input-group">
                                        <button type="button" class="btn btn-outline-secondary" onclick="updateValue('people', -1)">-</button>
                                        <input name="people" id="people" type="text" class="form-control text-center" value="0" readonly>
                                        <button type="button" class="btn btn-outline-secondary" onclick="updateValue('people', 1)">+</button>
                                    </div>
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

        <div class="modal fade" id="updateTypeRoom" tabindex="-1" role="dialog" aria-labelledby="updateTypeRoomLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="updateTypeRoomLabel">Update Type Room</h5>
                        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="typeRoomURL?action=edit" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <input type="text" class="form-control" id="type_room_Id" name="type_Room_Id" hidden="">
                            </div>
                            <div class="form-group">
                                <label for="floor_Room_Id">Name: </label>
                                <input type="text" class="form-control" id="trname" name="name" >
                            </div>
                            <div class="form-group">
                                <label for="name">Event ID:</label>
                                <input type="number" class="form-control" id="event_Id" name="event_Id">
                            </div>
                            <div class="form-group">
                                <label for="price">Bed: </label>
                                <input type="number" class="form-control" id="bedId" name="bed">
                            </div>
                            <div class="form-group">
                                <label for="size">Bath:</label>
                                <input type="number" class="form-control" id="bathId" name="bath">
                            </div>
                            <div class="form-group">
                                <label for="size">People: </label>
                                <input type="number" class="form-control" id="peopleId" name="people">
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input type="file" class="form-control" id="imageId" name="fileImageTypeRoom"required>
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

        <script>
            function updateValue(elementId, increment) {
                var element = document.getElementById(elementId);
                var currentValue = parseInt(element.value);
                var newValue = currentValue + increment;
                if (newValue >= 0) {
                    element.value = newValue;
                }
            }
            function updateTypeRoom(type_room_Id, trname, event_Id, bed, bath, people, img) {
                $('#type_room_Id').val(type_room_Id);
                $('#trname').val(trname);
                $('#event_Id').val(event_Id);
                $('#bedId').val(bed);
                $('#bathId').val(bath);
                $('#peopleId').val(people);
                $('#imageId').val(img);
                $('#updateTypeRoom').modal('show');
            }
        </script>
    </div>
    <script src="../assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/js/sidebarmenu.js"></script>
    <script src="../assets/js/app.min.js"></script>
    <script src="../assets/libs/simplebar/dist/simplebar.js"></script>
</body>

</html>
</c:if>