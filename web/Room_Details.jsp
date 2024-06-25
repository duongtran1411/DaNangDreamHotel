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
                                    <h3>${room.name}</h3>
                                    <div class="rdt-right">
                                        <a href="cartController?action=post&id=${room.room_Id}">Booking Now</a>
                                    </div>
                                </div>
                                <h2>${FormatUtils.formatPRice(room.price)}đ<span>/Pernight</span></h2>
                                <table>
                                    <tbody>
                                        <tr>
                                            <td class="r-o">Size:</td>
                                            <td>${room.size}m2</td>
                                        </tr>
                                        <tr>
                                            <td class="r-o">Capacity:</td>
                                            <td>${room.people} person</td>
                                        </tr>
                                        <tr>
                                            <td class="r-o">Bed:</td>
                                            <td>${room.bed} bed</td>
                                        </tr>
                                        <tr>
                                            <td class="r-o">Bath:</td>
                                            <td>${room.bath} bath</td>
                                        </tr>
                                        <tr>
                                            <td class="r-o">Services:</td>
                                            <td>Wifi, Television, Bathroom,...</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <p class="f-para">Motorhome or Trailer that is the question for you. Here are some of the
                                    advantages and disadvantages of both, so you will be confident when purchasing an RV.
                                    When comparing Rvs, a motorhome or a travel trailer, should you buy a motorhome or fifth
                                    wheeler? The advantages and disadvantages of both are studied so that you can make your
                                    choice wisely when purchasing an RV. Possessing a motorhome or fifth wheel is an
                                    achievement of a lifetime. It can be similar to sojourning with your residence as you
                                    search the various sites of our great land, America.</p>
                                <p>The two commonly known recreational vehicle classes are the motorized and towable.
                                    Towable rvs are the travel trailers and the fifth wheel. The rv travel trailer or fifth
                                    wheel has the attraction of getting towed by a pickup or a car, thus giving the
                                    adaptability of possessing transportation for you when you are parked at your campsite.
                                </p>
                            </div>
                        </div>
                        
                    </div>
                    <div class="col-lg-4">
                        <div class="room-booking">
                            <h3>Your Reservation</h3>
                            <form action="#">
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
                                <div class="select-option">
                                    <label for="room">Room:</label>
                                    <select id="room">
                                        <option value="">1 Room</option>
                                    </select>
                                </div>
                                <button type="submit">Check Availability</button>
                            </form>
                        </div>
                    </div>
                </div>
        </section>
        <!-- Room Details Section End -->

        <!-- Footer Section Begin -->
        <footer class="footer-section">
            <div class="container">
                <div class="footer-text">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="ft-about">
                                <div class="logo">
                                    <a href="#">
                                        <img src="img/footer-logo.png" alt="">
                                    </a>
                                </div>
                                <p>We inspire and reach millions of travelers<br /> across 90 local websites</p>
                                <div class="fa-social">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-tripadvisor"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                    <a href="#"><i class="fa fa-youtube-play"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 offset-lg-1">
                            <div class="ft-contact">
                                <h6>Contact Us</h6>
                                <ul>
                                    <li>(12) 345 67890</li>
                                    <li>info.colorlib@gmail.com</li>
                                    <li>856 Cordia Extension Apt. 356, Lake, United State</li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-3 offset-lg-1">
                            <div class="ft-newslatter">
                                <h6>New latest</h6>
                                <p>Get the latest updates and offers.</p>
                                <form action="#" class="fn-form">
                                    <input type="text" placeholder="Email">
                                    <button type="submit"><i class="fa fa-send"></i></button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="copyright-option">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-7">
                            <ul>
                                <li><a href="#">Contact</a></li>
                                <li><a href="#">Terms of use</a></li>
                                <li><a href="#">Privacy</a></li>
                                <li><a href="#">Environmental Policy</a></li>
                            </ul>
                        </div>
                        <div class="col-lg-5">
                            <div class="co-text"><p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                    Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com/" target="_blank">Colorlib</a>
                                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p></div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Footer Section End -->

        <!-- Search model Begin -->
        <div class="search-model">
            <div class="h-100 d-flex align-items-center justify-content-center">
                <div class="search-close-switch"><i class="icon_close"></i></div>
                <form class="search-model-form">
                    <input type="text" id="search-input" placeholder="Search here.....">
                </form>
            </div>
        </div>
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
    </body>
</html>
