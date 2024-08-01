

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty sessionScope.acc}">
    <jsp:include page="../../Pages.jsp"></jsp:include>
</c:if>
<c:if test="${not empty sessionScope.acc}">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/png" href="../assets/images/logos/favicon.png" />
        <link rel="stylesheet" href="dashboard/assets/css/styles.min.css" />
        <link rel="stylesheet" href="dashboard/assets/css/styles.css" />
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css" />
        <script src="dashboard/assets/js/sidebarmenu.js"></script>
        <script src="dashboard/assets/js/app.min.js"></script>
        <link rel="icon" href="img/title_danangdream.jpg" type="image/x-icon"/>
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

            .btn-status{
                border-radius: 14px;
            }

            .fix-room{
                background-color: #FFEFF2;
            }
            .dirty-room{
                background-color: #FFF9EF;
            }
            .clean-room{
                background-color: #E7FAF5;
            }
            .btn-hover:hover{
                background-color: #ddd;
            }
            .select{
                background-color: #ddd;
            }
            a:link {
                text-decoration: none;
            }

            .profile-image-container {
                position: relative;
                display: inline-block;
            }
            .profile-dropdown {
                position: absolute;
                top: 100%;
                right: 0;
                z-index: 1000;
                display: none;
            }
            .profile-image-container:hover .profile-dropdown {
                display: block;
            }
            
        </style>
    </head>
    <body>
       
        <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
             data-sidebar-position="fixed" data-header-position="fixed">
            <jsp:include page="SlideBar.jsp"></jsp:include>
                <div class="body-wrapper">
                <jsp:include page="Profile.jsp"></jsp:include>
                    <div class="card">
                        <div class="card-body"> 
                            <div class="container-fluid">
                                    <div class="row" style="padding-left: 20px;width: 1600px;">
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
                                        <button class="btn-hover select" onclick="getAll()">All</button>
                                        <button class="btn-hover" onclick="handleArrive()"><i class="fa-solid fa-person-walking-arrow-right icon-padding green" ></i>Prepare arrive</button>
                                        <button class="btn-hover" onclick="handleUnavai()"><i class="fa-solid fa-house icon-padding blue"></i>Live</button>
                                        <button class="btn-hover" onclick="handleLeave()"><i class="fa-solid fa-person-walking-arrow-right icon-padding red"></i>Prepare leave</button>
                                        <button class="btn-hover" onclick="handlAvai()"><i class="fa-solid fa-square-check icon-padding"></i>Availability</button>
                                        <button class="btn-hover status-room clean" onclick="cleanRoom()">Clean Room</button>
                                        <button class="btn-hover status-room dirty" onclick="dirtyRoom()">Dirty Room</button>
                                        <button class="btn-hover status-room fix" onclick="FixRoom()"><i class="fa-solid fa-wrench icon-padding"></i>Fix Room</button>
                                    </div>
                                </div>
                                <div class="row" id="main-room" style="width: 1600px">
                                    <c:forEach items="${list}" var="o">
                                        <div class="col-lg-3 col-md-6  justify-content-center element">
                                            <input value="${o.room_Id}" type="hidden" id="room-id" class="RID"/>
                                            <div class="room-item item-room <c:if test="${o.maintenance_status == 'dirty room'}">dirty-room</c:if><c:if test="${o.maintenance_status == 'fix room'}">fix-room</c:if>
                                                 <c:if test="${o.maintenance_status == 'clean room'}">clean-room</c:if>">
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
                                <div id="pagination-info" class="text-center mt-2" style="padding-bottom: 10px;">

                                </div>
                                <div id="pagination-container" class="text-center mt-4 justify-content-center" style="padding-bottom: 10px">
                                </div>

                            </div>
                            <div class="overlay" id="overlay" onclick="hidePopup()"></div>
                            <div class="popup" id="popup" style="border: 1px solid #ddd; border-radius: 5px;">
                                <h2 id="roomInfo"></h2>
                                <!--                <input type="hidden" id="currentRoomId" value="" />-->
                                <div style="padding-left: 35px">
                                    <button class="btn-status" style="background-color:#E7FAF5" onclick="updateRoomStatus(this)" value="clean room">Clean Room</button>
                                    <button class="btn-status"  style="background-color:#FFF9EF" onclick="updateRoomStatus(this)" value="dirty room" >Dirty Room</button>
                                    <button class="btn-status" style="background-color:#FFEFF2" onclick="updateRoomStatus(this)" value="fix room">Fix Room</button>
                                </div>
                                <div style="transform: translateY(-150px);padding-left: 550px;"><button class="close-btn" style="width: 30px;height: 30px;border-radius: 50%;background-color:grey ;color: white;transform: translateX(30px);margin-top: 10px;border-color: grey" onclick="hidePopup()">X</button></div>
                            </div>

                        </div>
                    
                </div>
            </div>
            <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
                                        handlePage();

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
                                        handlePage();
                                        console.log(selectedValue);
                                        console.log("success");
                                    },
                                    error: function (xhr) {
                                        console.log(xhr, selectedValue);
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
                                        handlePage();
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
                                        handlePage();
                                        console.log("success");
                                    },
                                    error: function (xhr) {
                                        console.log(xhr);
                                    }
                                });
                            }


                            function updateRoomStatus(e) {
                                const statusRoom = e.value;
                                const roomId = document.getElementById('currentRoomId').value;
                                $.ajax({
                                    url: '/DaNangDreamHotel/serviceStatusController?action=updateRoom',
                                    type: 'GET',
                                    data: {
                                        status: statusRoom,
                                        roomId: roomId
                                    },
                                    success: function (data) {
                                        var row = document.getElementById("roomInfo");
                                        row.innerHTML = data;
                                        Swal.fire({
                                            position: "center",
                                            icon: "success",
                                            title: "Your work has been saved",
                                            showConfirmButton: false,
                                            timer: 2000
                                        });
                                        setTimeout(() => {
                                            location.reload();
                                        }, 1000);
                                        hidePopup();
                                    },
                                    error: function (xhr) {
                                        console.log(xhr, statusRoom);
                                    }
                                });
                            }
                            function handlAvai() {
                                var date = document.getElementById("now-date");
                                var dateNow = date.value;
                                $.ajax({
                                    url: '/DaNangDreamHotel/serviceStatusController?action=checkAvailable',
                                    type: 'GET',
                                    data: {
                                        date: dateNow
                                    },
                                    success: function (data) {
                                        var row = document.getElementById("main-room");
                                        row.innerHTML = data;
                                        handlePage();
                                    },
                                    error: function (xhr) {
                                        console.log(xhr, statusRoom);
                                    }
                                });
                            }

                            function handleUnavai() {
                                var date = document.getElementById("now-date");
                                var dateNow = date.value;
                                $.ajax({
                                    url: '/DaNangDreamHotel/serviceStatusController?action=checkUnavai',
                                    type: 'GET',
                                    data: {
                                        date: dateNow
                                    },
                                    success: function (data) {
                                        var row = document.getElementById("main-room");
                                        row.innerHTML = data;
                                        handlePage();
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
                                                        row.innerHTML = data + "<input type=\"hidden\" id=\"currentRoomId\" value=\"" + id + "\" />";
                                                        console.log("success" + id);
                                                    },
                                                    error: function (xhr) {
                                                        console.log(xhr);
                                                    }
                                                });
                                                currentRoomElement = this;
                                                showPopup(id);
                                            });
                                        });
                                    },
                                    error: function (xhr) {
                                        console.log(xhr, statusRoom);
                                    }
                                });
                            }

                            var buttons = document.querySelectorAll('.btn-hover');
                            buttons.forEach(function (button) {
                                button.addEventListener('click', function () {

                                    buttons.forEach(function (btn) {
                                        btn.classList.remove('select');
                                    });
                                    this.classList.add('select');
                                });
                            });
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
                                            row.innerHTML = data + "<input type=\"hidden\" id=\"currentRoomId\" value=\"" + id + "\" />";
                                            console.log("success" + id);
                                        },
                                        error: function (xhr) {
                                            console.log(xhr);
                                        }
                                    });
                                    currentRoomElement = this;
                                    showPopup(id);
                                });
                            });

                            function handlePage() {
                                const itemsPerPage = 6;
                                const paginationContainer = document.getElementById('pagination-container');
                                const pageInfo = document.getElementById('pagination-info');

                                function showPage(page) {
                                    const items = document.querySelectorAll('#main-room .element');
                                    const start = (page - 1) * itemsPerPage;
                                    const end = start + itemsPerPage;

                                    items.forEach((item, index) => {
                                        if (index >= start && index < end) {
                                            item.style.display = 'flex';
                                        } else {
                                            item.style.display = 'none';
                                        }
                                    });

                                    const pageItems = paginationContainer.querySelectorAll('li');
                                    pageItems.forEach((item, index) => {
                                        if (index === (page - 1)) {
                                            item.classList.add('active');
                                        } else {
                                            item.classList.remove('active');
                                        }
                                    });

                                    //                            const totalPages = Math.ceil(items.length / itemsPerPage);
                                    //                            pageInfo.innerText = `Page ${page} of ${totalPages}`;

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
                                                    row.innerHTML = data + "<input type=\"hidden\" id=\"currentRoomId\" value=\"" + id + "\" />";
                                                    console.log("success" + id);
                                                },
                                                error: function (xhr) {
                                                    console.log(xhr);
                                                }
                                            });
                                            currentRoomElement = this;
                                            showPopup(id);
                                        });
                                    });
                                }

                                function setupPagination() {
                                    const items = document.querySelectorAll('#main-room .element');
                                    const totalPages = Math.ceil(items.length / itemsPerPage);
                                    paginationContainer.innerHTML = '';
                                    const ul = document.createElement('ul');
                                    ul.className = 'pagination justify-content-center';

                                    for (let i = 1; i <= totalPages; i++) {
                                        const li = document.createElement('li');
                                        li.className = 'page-item';

                                        const link = document.createElement('a');
                                        link.className = 'page-link';
                                        link.href = '#';
                                        link.innerText = i;
                                        (function (page) {
                                            link.addEventListener('click', function (event) {
                                                event.preventDefault();
                                                showPage(page);
                                            });
                                        })(i);

                                        li.appendChild(link);
                                        ul.appendChild(li);
                                        if (i === 1) {
                                            li.classList.add('active');
                                        }
                                    }

                                    paginationContainer.appendChild(ul);
                                    //                            pageInfo.innerText = `Page 1 of ${totalPages}`;
                                }

                                setupPagination();
                                showPage(1);
                            }
                            document.addEventListener('DOMContentLoaded', handlePage);



            </script>
    </body>
</html>
</c:if>
