<%-- 
    Document   : Booking
    Created on : Jun 19, 2024, 9:26:46 PM
    Author     : CaoTung
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Entity.FormatUtils" %>
<!DOCTYPE html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
    href="https://fonts.googleapis.com/css?family=Lora:400,700&amp;display=swap"
    rel="stylesheet"
    />
<link
    href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&amp;display=swap"
    rel="stylesheet"
    />


<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
<title>Da Nang Dream Hotel</title>
<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" />
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css" />
<link rel="stylesheet" href="css/flaticon.css" type="text/css" />
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css" />
<link rel="stylesheet" href="css/nice-select.css" type="text/css" />
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css" />
<link rel="stylesheet" href="css/magnific-popup.css" type="text/css" />
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css" />
<link rel="stylesheet" href="css/style.css" type="text/css" />
<link href="css/paging.css" rel="stylesheet" type="text/css"/>
<link href="css/home.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="css/booking.css"/>
<style>
    .filter-box {
        border: 1px solid #ccc;
        padding: 15px;
        border-radius: 5px;
        margin-bottom: 20px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }
    .room-card {
        border: 1px solid #ccc;
        padding: 15px;
        border-radius: 5px;
        margin-bottom: 20px;
    }
    .room-price {
        font-size: 1.2em;
        font-weight: bold;
        color: #e74c3c;
    }
    .original-price {
        text-decoration: line-through;
        color: #999;
    }
    .header-box {
        border: 1px solid #ccc;
        padding: 15px;
        border-radius: 5px;
        margin-bottom: 20px;
        background-color: #f9f9f9;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
</style>

<body>
    <jsp:include page="Header.jsp"></jsp:include>
        <div class="container mt-5">
            <!-- Header Section -->
            <div class="header-box mb-4">
                <div class="form-inline row align-items-end "  >
                    <div class="form-group col-md-4">
                        <label for="destination">Destination</label>
                        <input type="text" class="form-control w-100" id="destination" placeholder="Destination" value="Da Nang Dream Hotel" readonly="" name="dateIn">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="checkin">Check-in</label>
                        <input type="date" class="form-control w-100" id="checkin" value="${sessionScope.checkInDay}" name="dateIn" >
                </div>
                <div class="form-group col-md-3">
                    <label for="checkout">Check-out</label>
                    <input type="date" class="form-control w-100" id="checkout" value="${sessionScope.checkOutDay}" name="dateOut" >
                </div>
                <div class="form-group col-md-2" style="padding-right: 5px;align-items: center">
                    <button  class="btn btn w-100" style="background-color: #C59B24; color: white" id="updateButton" >Update</button>
                </div>
                <input type="hidden" name="action" value="updateDate">
            </div>
        </div>
        <!-- End of Header Section -->
        <c:if test="${checkOutDay > checkInDay}">
        <div class="row">
            <div class="col-md-3">
                <div class="filter-box">
                    <h5>Filter</h5>
                    <div class="form-group">
                        <label for="priceRange">Price per night</label>
                        <input type="range" class="form-control-range" id="priceRange" min="1000000" max="5000000">
                    </div>
                    <div class="form-group">
                        <label>Recreation</label>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="doubleBed">
                            <label class="form-check-label" for="doubleBed">Double bed</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="twoSingleBeds">
                            <label class="form-check-label" for="twoSingleBeds">2 Single Beds</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="oceanView">
                            <label class="form-check-label" for="oceanView">Ocean View</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="cityView">
                            <label class="form-check-label" for="cityView">City View</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="bathtub">
                            <label class="form-check-label" for="bathtub">Bathtub</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="livingRoom">
                            <label class="form-check-label" for="livingRoom">Living room</label>
                        </div>
                    </div>
                    <button class="btn btn" style="background-color: #C59B24; color: white">Filter</button>
                </div>
            </div>
            <div class="col-md-9">
                <div class="d-flex justify-content-between mb-3">
                    <div>
                        <label style="transform: translateY(30px)">Sorted by: </label>
                        <select id="roomSelect" class="custom-select" onchange="handleChange()" style="height:60px;width: 200px">
                            <option value="price">Price</option>
                            <option value="room">Room</option>
                        </select>
                    </div>
                </div>


                <c:forEach items="${listE}" var="o">
                    <div class="name-event" style="background: #f8f8f8; width:100% ;padding: 10px 20px"><h5 style="font-weight: 700;">${o.name}</h5></div>
                    <div class="row room-card">

                        <div class="col-lg-3">
                            <img src="${o.image}" width="width" height="height" alt="alt"/>
                        </div>
                        <br>

                        <div class="col-lg-9" >
                            <p><small>Offer includes</small></p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="row" >
                                    <div class="col-lg-12" style="display: flex; background: white;" >
                                        <div>
                                            <p class="mb-0 original-price">3,889,000 VND/night</p>
                                            <p class="mb-0 room-price">1,750,050 VND/night (Including tax and service charge)</p>

                                        </div>
                                        <div style="padding-top: 7px">
                                            <button class="btn btn btnRoom " id="show-room-details" style="background-color: #C59B24; color: white; margin-left: 10px;" onclick="handleEvent(${o.event_Id})" >Room details</button>
                                        </div>

                                    </div> 
                                    <div id="room-details-${o.event_Id}" style="display: block;">

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </c:forEach>


            </div>
        </div>
        </c:if>
        <c:if test="${checkOutDay < checkInDay}">
            <h2 style="color: red">Check-in date is less than check-out date</h2>
            <a href="homeController" style="color: black">Back to home</a>
        </c:if>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
                                                $(document).ready(function () {
                                                    $("#show-room-details").click(function (e) {
                                                        $("#room-details").toggle();
                                                    });
                                                });

                                                function handleChange() {
                                                    var checkIn = document.getElementById('checkin').value;
                                                    var checkOut = document.getElementById('checkout').value;
                                                    $.ajax({
                                                        url: '/DaNangDreamHotel/loadRoomEvent',
                                                        type: 'POST',
                                                        data: {
                                                            checkIn: checkIn,
                                                            checkOut: checkOut
                                                        },
                                                        success: function (data) {
                                                            var row = document.getElementById('dateCheck');
                                                            row.innerHTML = data;
                                                        },
                                                        error: function (xhr) {
                                                            console.log(xhr);
                                                        }
                                                    });
                                                }

                                                function handleEvent(e) {
                                                    var checkIn = document.getElementById('checkin').value;
                                                    var checkOut = document.getElementById('checkout').value;
                                                    console.log(e);
                                                    $.ajax({
                                                        url: '/DaNangDreamHotel/loadRoomEvent?action=list',
                                                        type: 'GET',
                                                        data: {
                                                            checkIn: checkIn,
                                                            checkOut: checkOut,
                                                            eventId: e
                                                        },
                                                        success: function (data) {
                                                            var row = document.getElementById('room-details-' + e);
                                                            row.innerHTML = data;
                                                        },
                                                        error: function (xhr) {
                                                            console.log(xhr, event);
                                                        }
                                                    });
                                                }

                                                var date = new Date();
                                                var tdate = date.getDate();
                                                var tmonth = date.getMonth() + 1;
                                                if (tdate < 10) {
                                                    tdate = '0' + tdate;
                                                }
                                                if (tmonth < 10) {
                                                    tmonth = '0' + tmonth;
                                                }
                                                var year = date.getUTCFullYear();
                                                var minDate = year + '-' + tmonth + '-' + tdate;
                                                var checkIn = document.getElementById('checkin').setAttribute('min', minDate);
                                                var tdateMin = date.getDate() + 1;
                                                var tmonthMin = date.getMonth() + 1;
                                                if (tdateMin < 10) {
                                                    tdateMin = '0' + tdateMin;
                                                }
                                                if (tmonthMin < 10) {
                                                    tmonthMin = '0' + tmonthMin;
                                                }
                                                var yearMin = date.getUTCFullYear();
                                                var min = yearMin + '-' + tmonthMin + '-' + tdateMin;
                                                var checkOut = document.getElementById('checkout').setAttribute('min', min);
                                                document.getElementById('checkin').addEventListener('input', function (e) {
                                                    if (e.target.value === '') {
                                                        e.preventDefault();
                                                        e.target.value = e.target.defaultValue;
                                                    }
                                                });

                                                

    </script>

</body>
