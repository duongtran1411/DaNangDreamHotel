

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
        <link rel="stylesheet" href="css/statusroom.css" type="text/css" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <title>Manage Status Room</title>
        <style>
            .popup {
                display: none;
                position: fixed;
                left: 55%;
                top: 15%;
                transform: translate(-50%, -50%);
                background-color: white;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
                z-index: 1000;
            }
            .popup.active {
                display: block;
            }
            .overlay {
                display: none;
                position: fixed;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.7);
                z-index: 999;
            }
            .overlay.active {
                display: block;
            }
            .image-room:hover{
                cursor: pointer;
            }

            .dirtyRoom {
                background-color: yellow;
            }
            .cleanRoom {
                background-color: green;
            }
            .fixRoom {
                background-color: red;
            }

            .btn-status{
                border-radius: 14px;
            }

        </style>
    </head>
    <body>
        <jsp:include page="SlideBar.jsp"></jsp:include>
            <div>
                <div style="margin-left: 280px;border: 1px solid #ddd;">
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
                    <div style="padding-top: 10px; padding-bottom: 10px">
                        <span class="text">Status Room:</span>
                        <input type="date" id="now-date"/>
                    </div>
                    <div>
                        <button onclick="getAll()">All</button>
                        <button onclick="handleArrive()"><i class="fa-solid fa-person-walking-arrow-right icon-padding green" ></i>Prepare arrive</button>
                        <button><i class="fa-solid fa-house icon-padding blue"></i>Live</button>
                        <button onclick="handleLeave()"><i class="fa-solid fa-person-walking-arrow-right icon-padding red"></i>Prepare leave</button>
                        <button class=""><i class="fa-solid fa-square-check icon-padding"></i>Availability</button>
                        <button class="status-room clean">Clean Room</button>
                        <button class="status-room dirty">Dirty Room</button>
                        <button class="status-room fix"><i class="fa-solid fa-wrench icon-padding"></i>Fix Room</button>
                    </div>
                </div>
                <div class="row" id="main-room">
                    <c:forEach items="${list}" var="o">
                        <div class="col-lg-3 col-md-6  justify-content-center element">
                            <input value="${o.room_Id}" type="hidden" id="room-id" class="RID"/>
                            <div class="room-item item-room">
                                <div class="ri-text">
                                    <img src="${o.image}" alt="" class="image-room" id="unique-image">
                                    <h4 class="text-center name-room" id="room-name">
                                        ${o.name}
                                    </h4>

                                    <div class="content-icon d-flex align-items-between justify-content-between main-content">
                                        <div class="content-room">
                                            <i class="fa fa-users icon-room" aria-hidden="true"></i>
                                            <c:if test="${o.people == 1}">
                                                <span>${o.people} Person</span>
                                            </c:if>
                                            <c:if test="${o.people > 1}">
                                                <span>${o.people} People</span>
                                            </c:if>
                                        </div>
                                        <div class="content-room">
                                            <i class="fa fa-bed icon-room" aria-hidden="true"></i>
                                            <c:if test="${o.bed == 1}">
                                                <span>${o.bed} Bed</span>
                                            </c:if>
                                            <c:if test="${o.bed > 1}">
                                                <span>${o.bed} Beds</span>
                                            </c:if>
                                        </div>
                                        <div class="content-room">
                                            <i class="fa fa-bath icon-room" aria-hidden="true" ></i>
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
                <div id="pagination-container" class="text-center mt-4 justify-content-center" style="padding-bottom: 10px">
                </div>

            </div>
            <div class="overlay" id="overlay" onclick="hidePopup()"></div>
            <div class="popup" id="popup" style="border: 1px solid #ddd; border-radius: 5px;">
                <h2 id="roomInfo"></h2>
                <input type="hidden" value="" />
                <div style="padding-left: 35px">
                    <button class="btn-status" style="background-color:#E7FAF5" onclick="updateRoomStatus(this)" value="clean room">Clean Room</button>
                    <button class="btn-status"  style="background-color:#FFF9EF" onclick="updateRoomStatus(this)" value="dirty room" >Dirty Room</button>
                    <button class="btn-status" style="background-color:#FFEFF2" onclick="updateRoomStatus(this)" value="fix room">Fix Room</button>
                </div>
                <div style="transform: translateY(-150px);padding-left: 550px;"><button class="close-btn" style="width: 30px;height: 30px;border-radius: 50%;background-color:grey ;color: white;transform: translateX(30px);margin-top: 10px;border-color: grey" onclick="hidePopup()">X</button></div>
            </div>

        </div>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="js/demo/pagingNumber.js"></script>
        <script src="js/now-date.js"></script>
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

                    function changeFloor() {
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

                    function handlePage(param) {
                        var numberPage = param.value;
                        $.ajax({
                            url: '/DaNangDreamHotel/serviceStatusController?action=paging',
                            type: 'GET',
                            data: {
                                page: numberPage
                            },
                            success: function (data, value) {
                                var row = document.getElementById("main-room");
                                row.innerHTML = data;
                                var page = document.getElementById("list-page");
                                page.innerHTML = value;
                            },
                            error: function (xhr) {
                                console.log(xhr);
                            }
                        });
                    }

                    function handlePrev(param) {
                        var numberPage = param.value;
                        console.log(numberPage);
                        $.ajax({
                            url: '/DaNangDreamHotel/serviceStatusController?action=paging',
                            type: 'GET',
                            data: {
                                page: numberPage
                            },
                            success: function (data) {
                                var row = document.getElementById("main-room");
                                row.innerHTML = data;
                                console.log("success");
                            },
                            error: function (xhr) {
                                console.log(xhr);
                            }
                        });
                    }

                    function handleNext(param) {
                        var numberPage = param.value;
                        $.ajax({
                            url: '/DaNangDreamHotel/serviceStatusController?action=paging',
                            type: 'GET',
                            data: {
                                page: numberPage
                            },
                            success: function (data) {
                                var row = document.getElementById("main-room");
                                row.innerHTML = data;
                                console.log("success");
                            },
                            error: function (xhr) {
                                console.log(xhr);
                            }
                        });
                    }

                    function handleArrive() {
                        var date = document.getElementById("now-date");
                        var value = date.value;
                        console.log(date);
                        $.ajax({
                            url: '/DaNangDreamHotel/serviceStatusController?action=arrive',
                            type: 'GET',
                            data: {
                                date: value
                            },
                            success: function (data) {
                                var row = document.getElementById("main-room");
                                row.innerHTML = data;
                                console.log("success");
                            },
                            error: function (xhr) {
                                console.log(xhr);
                            }
                        });
                    }

                    function handleLeave() {
                        var date = document.getElementById("now-date");
                        var value = date.value;
                        console.log(date);
                        $.ajax({
                            url: '/DaNangDreamHotel/serviceStatusController?action=leave',
                            type: 'GET',
                            data: {
                                date: value
                            },
                            success: function (data) {
                                var row = document.getElementById("main-room");
                                row.innerHTML = data;
                                console.log("success");
                            },
                            error: function (xhr) {
                                console.log(xhr);
                            }
                        });
                    }


                    function getAll() {
                        window.location.href = "statusRoomController";
                    }

                    let currentRoomElement;

                    function showPopup(id) {
                        const popup = document.getElementById('popup');
                        const overlay = document.getElementById('overlay');
                        const roomInfo = document.getElementById('roomInfo');

                        popup.classList.add('active');
                        overlay.classList.add('active');
                    }

                    function hidePopup() {
                        const popup = document.getElementById('popup');
                        const overlay = document.getElementById('overlay');
                        popup.classList.remove('active');
                        overlay.classList.remove('active');
                    }

//                    function updateRoomStatus(status) {
//                        const roomNameElement = document.querySelector('.item-room');
//                        if (roomNameElement) {
//                            roomNameElement.classList.add(status);
//                        }
//                        hidePopup();
//                    }

                    document.querySelectorAll('.element').forEach(item => {
                        item.addEventListener('click', function () {
                            console.log(item);
                            const id = this.querySelector('.RID').value;
                            console.log(id);
                            $.ajax({
                                url: '/DaNangDreamHotel/serviceStatusController?action=getRoom',
                                type: 'GET',
                                data: {
                                    roomId: id
                                },
                                success: function (data) {
                                    var row = document.getElementById("roomInfo");
                                    row.innerHTML = data;

                                    console.log("success" + id);
                                },
                                error: function (xhr) {
                                    console.log(xhr);
                                }
                            });

                            currentRoomElement = this;
                            showPopup(id);
                            updateRoomStatus(id);
                        });
                    });

                    function updateRoomStatus(e, id) {
                        const statusRoom = e.value;
                        $.ajax({
                            url: '/DaNangDreamHotel/serviceStatusController?action=updateRoom',
                            type: 'GET',
                            data: {
                                status: statusRoom,
                                roomId: id
                            },
                            success: function (data) {
                                
                            },
                            error: function (xhr) {
                                console.log(xhr, statusRoom);
                            }
                        });
                    }


        </script>
    </body>
</html>
