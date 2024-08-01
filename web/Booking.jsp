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
<link rel="icon" href="img/title_danangdream.jpg" type="image/x-icon"/>
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
                <form class="form-inline row align-items-end " action="bookByEventController" method="get">
                    <div class="form-group col-md-3">
                        <label for="destination">Destination</label>
                        <input type="text" class="form-control w-100" id="destination" placeholder="Destination" value="Da Nang Dream Hotel" readonly="">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="checkin">Check-in</label>
                        <input type="date" class="form-control w-100" id="checkin" value="${sessionScope.checkInDay}" name="dateIn"  >
                </div>
                <div class="form-group col-md-3">
                    <label for="checkout">Check-out</label>
                    <input type="date" class="form-control w-100" id="checkout" value="${sessionScope.checkOutDay}" name="dateOut" >
                </div>
                <div class="form-group col-md-1">
                    <label for="checkout">Person</label>
                    <input type="text" class="form-control w-100" value="<c:if test="${sessionScope.numberPerson == null}">2</c:if>${sessionScope.numberPerson}" style="padding-left: 25px" readonly="" >
                    </div>
                    <div class="form-group col-md-2" style="padding-right: 5px;align-items: center">
                        <button type="submit" class="btn btn w-100" style="background-color: #C59B24; color: white" id="updateButton">Update</button>
                    </div>
                    <input type="hidden" name="action" value="updateDate">
                </form>
            </div>
            <!-- End of Header Section -->
        <c:if test="${checkOutDay > checkInDay}">
            <div class="row">
                <!--<div class="col-md-3">-->
<!--                    <div class="filter-box">
                        <h5>Filter</h5>
                        <div class="form-group">
                            <label for="priceRange">Price per night</label>
                            <input type="range" class="form-control-range" id="priceRange" min="1000000" max="5000000">
                        </div>
                        <div class="form-group">
                            <label>Recreation</label>
                            <div class="form-check">
                                <input class="filterInput" type="radio" value="Couple" id="doubleBed">
                                <label class="form-check-label" for="doubleBed">Couple Room</label>
                            </div>
                            <div class="form-check">
                                <input class="filterInput" type="radio" value="Luxury" id="twoSingleBeds">
                                <label class="form-check-label" for="LUXURY">Luxury Room</label>
                            </div>
                            <div class="form-check">
                                <input class="filterInput" type="radio" value="Ocean View" id="oceanView">
                                <label class="form-check-label" for="oceanView">Ocean View</label>
                            </div>
                            <div class="form-check">
                                <input class="filterInput" type="radio" value="Golf View" id="cityView">
                                <label class="form-check-label" for="cityView">Golf View</label>
                            </div>
                        </div>
                        <button class="btn btn" id="filterButton" style="background-color: #C59B24; color: white" value="">Filter</button>
                    </div>-->
                <!--</div>-->
                <div class="col-md-12">

                    <c:forEach items="${listE}" var="o" varStatus="status">
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
                                                <p class="mb-0 ">Min price: <del>${FormatUtils.formatPRice(priceRoom[status.index])} VND/night</del></p>
                                                <p class="mb-0 room-price">${FormatUtils.formatPRice(priceDiscount[status.index])} VND/night (Including tax and service charge)</p>
                                            </div>
                                            <div style="padding-top: 7px">
                                                <button class="btn btn btnRoom show-room-details"  style="background-color: #C59B24; color: white; margin-left: 10px; "   data-event-id="${o.event_Id}" >Room details</button>
                                            </div>
                                        </div> 
                                        <div id="room-details-${o.event_Id}" style="display: none;">

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
            <a href="homeController" class="btn btn-danger">Back to home</a>
        </c:if>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>

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

                            $(document).ready(function () {
                                $(".show-room-details").click(function () {
                                    var checkIn = document.getElementById('checkin').value;
                                    var checkOut = document.getElementById('checkout').value;
                                    var eventId = $(this).data('event-id');
                                    console.log(eventId);
                                    $.ajax({
                                        url: '/DaNangDreamHotel/loadRoomEvent?action=list',
                                        type: 'GET',
                                        data: {
                                            checkIn: checkIn,
                                            checkOut: checkOut,
                                            eventId: eventId
                                        },
                                        success: function (data) {
                                            var detailsElement = $('#room-details-' + eventId);
                                            detailsElement.html(data);
                                            detailsElement.toggle();

                                        },
                                        error: function (xhr) {
                                            console.log(xhr, eventId);
                                        }
                                    });

                                });
                            });

//                                                function handleEvent(e) {
//                                                    var checkIn = document.getElementById('checkin').value;
//                                                    var checkOut = document.getElementById('checkout').value;
//                                                    console.log(e);
//                                                    $.ajax({
//                                                        url: '/DaNangDreamHotel/loadRoomEvent?action=list',
//                                                        type: 'GET',
//                                                        data: {
//                                                            checkIn: checkIn,
//                                                            checkOut: checkOut,
//                                                            eventId: e
//                                                        },
//                                                        success: function (data) {
//                                                            var row = document.getElementById('room-details-' + e);
//                                                            row.innerHTML = data;
//                                                        },
//                                                        error: function (xhr) {
//                                                            console.log(xhr, event);
//                                                        }
//                                                    });
//                                                }

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
                            var showCheckIn = document.getElementById('checkin').value;

                            var tdateMin = date.getDate() + 2;
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
                            var showCheckOut = document.getElementById('checkout').value;
                            document.getElementById('checkin').addEventListener('input', function (e) {
                                if (e.target.value === '') {
                                    e.preventDefault();
                                    e.target.value = e.target.defaultValue;
                                }
                            });


                            function handleFilter(e) {
                                var selectedValues = [];

                                document.querySelectorAll('.filterInput:checked').forEach(function (checkbox) {
                                    if (checkbox.checked) {
                                        selectedValues.push(checkbox.value);
                                        console.log(checkbox.value);

                                    }

                                    if (selectedValues.length > 0) {
                                        $.ajax({
                                            url: '/DaNangDreamHotel/loadRoomEvent?action=filter',
                                            type: 'GET',
                                            data: {
                                                filterType: selectedValues,
                                                eventId: e
                                            },
                                            success: function (data) {
                                                var row = document.getElementById('room-details-' + e); // Ensure 'e' is defined
                                                row.innerHTML = data;
                                            },
                                            error: function (xhr) {
                                                console.log(xhr);
                                            }
                                        });
                                    } else {
                                        console.log("No checkboxes selected");
                                    }

                                });
                            }







    </script>

</body>