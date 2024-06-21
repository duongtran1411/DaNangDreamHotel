<%-- 
    Document   : Booking
    Created on : Jun 19, 2024, 9:26:46 PM
    Author     : CaoTung
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
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
    </head>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>
            <div class="container mt-5">
                <!-- Header Section -->
                <div class="header-box mb-4">
                    <form class="form-inline row align-items-end">
                        <div class="form-group col-md-3">
                            <label for="destination">Destination</label>
                            <input type="text" class="form-control w-100" id="destination" placeholder="Destination" value="Da Nang Dream Hotel">
                        </div>
                        <div class="form-group col-md-3">
                            <label for="checkin">Check-in</label>
                            <input type="date" class="form-control w-100" id="checkin" value="2024-06-18">
                        </div>
                        <div class="form-group col-md-3">
                            <label for="checkout">Check-out</label>
                            <input type="date" class="form-control w-100" id="checkout" value="2024-06-20">
                        </div>
                        <div class="form-group col-md-2">
                            <label for="rooms">No. of Rooms</label>
                            <input type="number" class="form-control w-100" id="rooms" placeholder="No. of Rooms" value="1">
                        </div>
                        <div class="form-group col-md-1" style="padding-right: 5px">
                            <button type="submit" class="btn btn w-100" style="background-color: #C59B24; color: white">Update</button>
                        </div>
                    </form>
                </div>
                <!-- End of Header Section -->

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
                            <h5>Have to 4 search results</h5>
                            <div>
                                <label for="sortSelect">Sorted by: </label>
                                <select id="sortSelect" class="custom-select">
                                    <option value="price">Price</option>
                                    <option value="room">Room</option>
                                </select>
                            </div>
                        </div>
                        <div class="row room-card">
                            <div class="col-lg-3">
                                <h6>ƯU ĐÃI SHOCK ĐÓN CƠN LỐC HÈ - TIẾT KIỆM 55%</h6> 
                            </div>
                            <div class="col-lg-9">
                                <p><small>Offer includes</small></p>
                                <div class="d-flex justify-content-between align-items-center">

                                    <div class="row" id="content">
                                        <div class="col-lg-12" style="display: flex">
                                            <div>
                                                <p class="mb-0 original-price">3,889,000 VND/night</p>
                                                <p class="mb-0 room-price">1,750,050 VND/night (Including tax and service charge)</p>
                                            </div>
                                            <button class="btn btn btnRoom" onclick="handleClick()" style="background-color: #C59B24; color: white; margin-left: 10px">Room details</button>
                                        </div>   
                                    <c:forEach items="${listR}" var="o">
                                        <div class="room col-lg-12 element" style="display: flex; margin-bottom: 10px; margin-top: 20px">
                                            <div class="col-lg-4">
                                                <img src="${o.image}" alt="alt"/>
                                            </div>
                                            <div class="col-lg-3">${o.name}</div>
                                            <div class="col-lg-3">${o.price}</div>
                                            <div class="col-lg-2"><button class="btn btn" style="background-color: #C59B24; color: white; margin-left: 10px"><a href="cartController?action=post&id=${o.room_Id}">Select Room</a></button></div>
                                        </div>
                                        <hr>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>
                                                function handleClick() {
                                                    
                                                    $.ajax({
                                                        url: '/DaNangDreamHotel/bookingController',
                                                        type: 'GET',
                                                        data: {
                                                            
                                                        },
                                                        success: function (data) {
                                                            var row = document.getElementById("content");
                                                            row.innerHTML = data;
                                                            console.log("success");
                                                        },
                                                        error: function (xhr) {
                                                            console.log(xhr);
                                                        }
                                                    });
                                                }
        </script>
    </body>
</html>