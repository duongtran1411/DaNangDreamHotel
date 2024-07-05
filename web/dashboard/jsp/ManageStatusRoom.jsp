

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/png" href="../assets/images/logos/favicon.png" />
        <link rel="stylesheet" href="dashboard/assets/css/styles.min.css" />
        <link rel="stylesheet" href="dashboard/assets/css/styles.css" />
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <title>JSP Page</title>
        <style>
            a{
                text-decoration: none;
            }
            button{
                border: 1px solid #ddd;
                background-color: white;
                padding: 0px 5px;
                width: 170px;
                height: 50px
            }
            .icon-padding{
                padding-right: 5px
            }
            .status-room{
                color: white
            }
            .clean{
                background-color: green;
            }
            .fix{
                background-color: red;
            }
            .dirty{
                background-color: #cccc00;
            }
            .red{
                color: red;
            }
            .blue{
                color: #007BFF;
            }

            .green{
                color: #00ff00;
            }
            .text{
                font-weight: 600;
            }
        </style>
    </head>
    <body>
        <jsp:include page="SlideBar.jsp"></jsp:include>
            <div>

                <div style="margin-left: 300px;border: 1px solid #ddd">
                    <div class="row" style="padding-left: 30px">
                        <h4><i class="fa-solid fa-map"style="padding-right: 10px"></i>Map Room</h4>
                        <div style="padding-bottom: 10px;padding-top: 10px">
                            <label class="text">Type Room:</label>
                            <select id="select-type" style="width: 150px" onchange="handleChange()">
                            <c:forEach items="${listType}" var="o">
                                <option value="${o.getTypeRoom_Id()}">${o.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div>
                        <label class="text">Floor Room:</label>
                        <select id="select-floor" style="width: 150px" onchange="changeFloor()">
                            <c:forEach items="${listFloor}" var="o">
                                <option value="${o.floor_id}">${o.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div style="padding-top: 10px">
                        <span class="text">Status Room:</span>
                    </div>
                    <div >
                        <button onclick="getAll()">All</button>
                        <button><i class="fa-solid fa-person-walking-arrow-right icon-padding green"></i>Prepare to arrive</button>
                        <button><i class="fa-solid fa-house icon-padding blue"></i>Live</button>
                        <button><i class="fa-solid fa-person-walking-arrow-right icon-padding red"></i>Prepare to leave</button>
                        <button class=""><i class="fa-solid fa-square-check icon-padding"></i>Availability</button>
                        <button class="status-room clean">Clean Room</button>
                        <button class="status-room dirty">Dirty Room</button>
                        <button class="status-room fix"><i class="fa-solid fa-wrench icon-padding"></i>Fix Room</button>
                    </div>
                </div>
                <div class="row" id="main-room">
                    <c:forEach items="${list}" var="o">
                        <div class="col-lg-3 col-md-6  justify-content-center" style="padding: 10px 0px;display: flex; width: 100px;height: 300px">
                            <div class="room-item" style="border: 1.5px solid gainsboro; border-radius: 15px; overflow: hidden; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.4); position: relative;">
                                <div class="ri-text" style="padding: 10px; text-align: left; width: 100%;">
                                    <img src="${o.image}" style="width:300px; height: 202px; border-radius: 15px 15px 0 0;" alt="">
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
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

        </div>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script>
                                function handleChange() {
                                    var selectElement = document.getElementById("select-type");
                                    var selectedValue = selectElement.value;
                                    $.ajax({
                                        url: '/DaNangDreamHotel/serviceStatusController?action=type',
                                        type: 'GET',
                                        data: {
                                            typeId: selectedValue
                                        },
                                        success: function (data) {
                                            var row = document.getElementById("main-room");
                                            row.innerHTML = data;
                                            console.log(selectedValue);
                                            console.log("success");
                                        },
                                        error: function (xhr) {
                                            console.log(xhr);
                                        }
                                    });
                                }
                                
                                function changeFloor(){
                                    var selectElement = document.getElementById("select-floor");
                                    var selectedValue = selectElement.value;
                                    $.ajax({
                                        url: '/DaNangDreamHotel/serviceStatusController?action=floor',
                                        type: 'GET',
                                        data: {
                                            floorId: selectedValue
                                        },
                                        success: function (data) {
                                            var row = document.getElementById("main-room");
                                            row.innerHTML = data;
                                            console.log(selectedValue);
                                            console.log("success");
                                        },
                                        error: function (xhr) {
                                            console.log(xhr, selectedValue);
                                        }
                                    });
                                }
                                
                                function getAll(){
                                    window.location.href = "statusRoomController";
                                }
        </script>
    </body>
</html>
