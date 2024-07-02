<%-- 
    Document   : Room_Details
    Created on : May 24, 2024, 12:53:04 AM
    Author     : GIGABYTE
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Entity.FormatUtils" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Sona Template">
        <meta name="keywords" content="Sona, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Da Nang Dream Hotel</title>
        <link href="https://fonts.googleapis.com/css?family=Lora:400,700&amp;display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&amp;display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"/>
        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/flaticon.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">   
        <link rel="stylesheet" href="css/slide.css"/>
        <link rel="stylesheet" href="css/roomDetail.css"/>
        <style>


            #slide{
                width: max-content;
                margin-top: 20px;
                margin-left: 150px;
                margin-bottom: 50px
            }

            .roomItem{
                width: 220px;
                height: 150px;
                background-position: 50% 50%;
                display: inline-block;
                transition: 1s;
                background-size: 200%;
                position: absolute;
                z-index: -1;

            }
            .roomItem:nth-child(1){
                transform: translate(-150%);
                opacity: 0;
                background-position: 0% 50%;
            }
            .roomItem:nth-child(2){
                transform: translate(-40%);
                background-position: 20% 50%;
            }
            .roomItem:nth-child(3){
                transform: translate(70%);
                background-position: 50% 50%;
            }
            .roomItem:nth-child(4){
                transform: translate(180%);
                background-position: 80% 50%;
            }
            .roomItem:nth-child(n+5){
                transform: translate(290%);
                opacity: 0;
                background-position: 100% 50%;
            }

            .roomItem .content{
                position: absolute;
                top: 100%;
                background-color: #b9b9b9;
                width: 80%;
                padding: 0 10%;
                text-align: center;
                transition: 0.5s;
/*                overflow: hidden;*/
                max-height: 0;
                box-shadow: 0 30px 50px #b9b9b9;
            }

            .roomItem .content:hover {
                max-height: 100px;
            }

            .buttons{
                position: absolute;
                bottom: 150px;
                left: 0px;
                width: 100%;
            }

            .buttons button{
                width: 50px;
                height: 50px;
                border-radius: 50%;
                border: 1px solid #DFA974;
                transition: 0.5s;
                background-color: #DFA974
            }

            .buttons button:hover{
                background-color: #bac383;

            }

            .white{
                color: #FFF;
            }
            #next{
                transform: translateX(755px);

            }
            .right{
                left: 100px;

            }
        </style>
    </head>
    <body>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>
        <!-- Header Section Begin -->
        <jsp:include page="Header.jsp"></jsp:include>
            <!-- Header End -->

            <!-- Breadcrumb Section Begin -->
            <div class="breadcrumb-section">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="breadcrumb-text">
                                <h2>Our Rooms</h2>
                                <div class="bt-option">
                                    <a href="home.html">Home</a>
                                    <span>Rooms</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Breadcrumb Section End -->

            <!-- Room Details Section Begin -->
            <section class="room-details-section spad">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="room-details-item "  >
                                <div class="slide">
                                    <div class="image-rooms list-image">
                                    <c:forEach items="${listImage}" var="o">
                                        <img src="${o.image}" alt="" width="750px" height="502px" id="slide-img" >
                                    </c:forEach>
                                </div>
                                <div class="btns">
                                    <div class="btn-Left btn-arrow" style="padding-left: 25px"><i class="fa-solid fa-chevron-left icon-L"></i></div>
                                    <div class="btn-Right btn-arrow" style="padding-right: 25px"><i class="fa-solid fa-chevron-right icon-R"></i></div>
                                </div>
                            </div>

                            <div class="rd-text">
                                <div class="rd-title">
<!--                                    <h3>${room.name}</h3>-->
                                    <!--                                    <div class="rdt-right">
                                                                            <a href="cartController?action=&id=${room.room_Id}">Booking Now</a>
                                                                        </div>-->
                                    <h3 style="font-weight: 700">${room.name}</h3>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <h4 style="font-weight: 500;color:#DFA974 ">${FormatUtils.formatPRice(room.price * room.discount)}đ<span>/Pernight</span></h4>
                                        <h5><del>${FormatUtils.formatPRice(room.price)}đ</del><span>/Pernight</span></h5><br>
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td class="r-o"><i class="fa-solid fa-expand icon"></i></td>
                                                    <td>${room.size}m<sup>2</sup></td>
                                                </tr>
                                                <tr>
                                                    <td class="r-o"><i class="fa-solid fa-user-group"></i></td>
                                                    <td>${room.people} person</td>
                                                </tr>
                                                <tr>
                                                    <td class="r-o"><i class="fa-solid fa-bed icon" ></i></td>
                                                    <td>${room.bed} bed</td>
                                                </tr>
                                                <tr>
                                                    <td class="r-o"><i class="fa-solid fa-bath icon"></i></td>
                                                    <td>${room.bath} bath</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="col-lg-6">
                                        <div style="padding-top: 35px">
                                            <h5>Services in room:</h5><br>       
                                            <ul class="column-list">
                                                <c:forEach items="${listI}" var="o">
                                                    <li style="list-style: none"><i class="fa-solid fa-check"></i> ${o.itemName}</li>
                                                    </c:forEach>
                                            </ul> 
                                        </div>
                                    </div>

                                </div>

                            </div>
                        </div>
                        <div class="rdt-right">
                            <button style="background-color: #DFA974; border: none; padding: 10px 20px;"><a style="color: white" href="cartController?action=post&id=${room.room_Id}">Booking Now</a></button>
                        </div>

                    </div>

                    <div class="col-lg-4">
                        <div class="room-booking">
                            <h3>Your Reservation</h3>
                            <!--                            <form action="#">
                                                            <div class="check-date">
                                                                <label for="date-in">Check In:</label>
                                                                <input type="text" class="date-input" id="date-in">
                                                                <i class="icon_calendar"></i>
                                                            </div>
                                                            <div class="check-date">
                                                                <label for="date-out">Check Out:</label>
                                                                <input type="text" class="date-input" id="date-out">
                                                                <i class="icon_calendar"></i>
                                                            </div>
                                                            <div class="select-option">
                                                                <label for="guest">Guests:</label>
                                                                <select id="guest">
                                                                    <option value="">3 Adults</option>
                                                                </select>
                                                            </div>
                                                            <button type="submit">Check Availability</button>
                                                        </form>-->
                            <div style="padding-top: 35px">
                                <h5>Services in room:</h5><br>       
                                <ul class="column-list">
                                    <c:forEach items="${listI}" var="o">
                                        <li style="list-style: none"><i class="fa-solid fa-check"></i> ${o.itemName}</li>
                                        </c:forEach>
                                </ul> 
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" style="width: 100%; height: 270px">
                    <div class="col-lg-12">
                        <div id="slide" >
                            <c:forEach items="${listR}" var="o">
                                <div class="roomItem" style="background-image: url(${o.image})">
                                    <div class="content">
                                        <div><h6><a href="roomDetailsController?Id=${o.room_Id}" style="color: black">${o.name}</a></h6></div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="buttons">
                            <button id="prev"> <i class="fa-solid fa-chevron-left white"></i></button>
                            <button id="next"><i class="fa-solid fa-chevron-right white"></i></button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Room Details Section End -->

        <!-- Footer Section Begin -->
        <jsp:include page="Footer.jsp"></jsp:include>
        <!-- Search model end -->

        <!-- Js Plugins -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>
        <script src="js/slide.js"></script>
        <script>
            document.getElementById('next').onclick = function () {
                let list = document.querySelectorAll('.roomItem');
                document.getElementById('slide').appendChild(list[0]);
            };
            document.getElementById('prev').onclick = function () {
                let list = document.querySelectorAll('.roomItem');
                document.getElementById('slide').prepend(list[list.length - 1]);
            };
        </script>
    </body>
</html>
