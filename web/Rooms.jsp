<%-- 
    Document   : Rooms
    Created on : May 24, 2024, 1:01:55 AM
    Author     : GIGABYTE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Entity.FormatUtils" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Sona Template">
        <meta name="keywords" content="Sona, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Sona | Template</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css?family=Lora:400,700&amp;display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&amp;display=swap" rel="stylesheet">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>     
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
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
        <link rel="stylesheet" href="css/paging.css"/>
    </head>
    <body>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!-- Offcanvas Menu Section Begin -->
        <div class="offcanvas-menu-overlay"></div>
        <div class="canvas-open">
            <i class="icon_menu"></i>
        </div>
        <div class="offcanvas-menu-wrapper">
            <div class="canvas-close">
                <i class="icon_close"></i>
            </div>
            <div class="search-icon search-switch">
                <i class="icon_search"></i>
            </div>
            <div class="header-configure-area">
                <!--<div class="language-option">
                    <img src="img/flag.jpg" alt="">
                    <span>EN <i class="fa fa-angle-down"></i></span>
                    <div class="flag-dropdown">
                        <ul>
                            <li><a href="#">Zi</a></li>
                            <li><a href="#">Fr</a></li>
                        </ul>
                    </div>
                </div>-->
                <a href="Login.jsp" class="bk-btn">Login</a>
            </div>
            <nav class="mainmenu mobile-menu">
                <ul>
                    <li class="active"><a href="Home.jsp">Home</a></li>
                    <li><a href="AboutUs.jsp">About Us</a></li>
                    <a href="Rooms.jsp">Accommodation</a>
                    <ul class="dropdown">
                        <li><a href="Rooms.jsp">Room</a></li>
                        <li><a href="Room_Details.jsp">Room Details</a></li>
                        <li><a href="Blog_Details.jsp">Blog Details</a></li>
                        <li><a href="#">Family Room</a></li>
                        <li><a href="#">Premium Room</a></li>
                    </ul>
                    </li>
                    <li><a href="Blog.jsp">Event</a></li>
                    <li><a href="Contact.jsp">Contact</a></li>
                </ul>
            </nav>
            <div id="mobile-menu-wrap"></div>
            <div class="top-social">
                <a href="#"><i class="fa fa-facebook"></i></a>
                <a href="#"><i class="fa fa-twitter"></i></a>
                <a href="#"><i class="fa fa-tripadvisor"></i></a>
                <a href="#"><i class="fa fa-instagram"></i></a>
            </div>
            <ul class="top-widget">
                <li><i class="fa fa-phone"></i> (12) 345 67890</li>
                <li><i class="fa fa-envelope"></i> info.colorlib@gmail.com</li>
            </ul>
        </div>
        <!-- Offcanvas Menu Section End -->

        <!-- Header Section Begin -->
        <header class="header-section header-normal">
            <div class="top-nav">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <ul class="tn-left">
                                <li><i class="fa fa-phone"></i> (12) 345 67890</li>
                                <li><i class="fa fa-envelope"></i> info.colorlib@gmail.com</li>
                            </ul>
                        </div>
                        <div class="col-lg-6">
                            <div class="tn-right">
                                <div class="top-social">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-tripadvisor"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                </div>
                                <a href="Login.jsp" class="bk-btn">Login</a>
                                <!--<div class="language-option">
                                    <img src="img/flag.jpg" alt="">
                                    <span>EN <i class="fa fa-angle-down"></i></span>
                                    <div class="flag-dropdown">
                                        <ul>
                                            <li><a href="#">Zi</a></li>
                                            <li><a href="#">Fr</a></li>
                                        </ul>
                                    </div>
                                </div>-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="menu-item">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="logo">
                                <a href="index.html">
                                    <img src="img/logo.png" alt="">
                                </a>
                            </div>

                        </div>
                        <div class="col-lg-8">
                            <div class="nav-menu">
                                <nav class="mainmenu">
                                    <ul>
                                        <li><a href="homeController">Home</a></li>
                                        <li><a href="AboutUs.jsp">About Us</a></li>
                                        <li class="active"><a href="roomController?action=listall">Resort</a>
                                            <ul class="dropdown">
                                                <li><a href="roomController?action=listall">Room</a></li>
                                                
                                            </ul>
                                        </li>
                                        <li><a href="eventController?action=listall">Event</a></li>
                                        <li><a href="Contact.jsp">Feedback</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
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
                <div class="row" style="background-color: #DFA974;">
                    <div class="col-lg-2" style="height: 50px; " >
                        <div style="display: inline-block;" class="search-container">   
                            <div >
                                <input oninput="searchByName(this)" type="text" name="txt" class="input-Search"  placeholder="Search">
                                <i class="fa-solid fa-magnifying-glass btnSearch" ></i>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <ul class="ulType" >
                            <c:forEach items="${listTypeRoom}" var="o">
                                <button class="btnType" name="typeRoom" onclick="loadType(this)" value="${o.typeRoom_Id}"><li>${o.name}</li></button>
                                    </c:forEach>   
                        </ul>
                    </div>

                    <div class="col-lg-2" style="position: relative">
                        <h6 class="textSort" >Sort by price :</h6>
                    </div>
                    <div class="col-lg-2">                        
                        <button class="btnSort" onclick="sortPriceUp()"><i class="fa-solid fa-arrow-up-short-wide"></i></button>
                        <button class="btnSort" onclick="sortPriceDown()"><i class="fa-solid fa-arrow-down-wide-short"></i></button>
                    </div>

                </div>
            </div>
        </div>
        <!-- Breadcrumb Section End -->

        <!-- Rooms Section Begin -->
        <section class="rooms-section spad">
            <div class="container">
                <div class="row" id="content">                 
                    <c:forEach items="${listRoom}" var="o">
                        <div class="room col-lg-4 col-md-6">
                            <div class="room-item " id="item">
                                <img src="${o.image}" alt="" style="height: 240px">
                                <div class="ri-text" style="height:450px">
                                    <h4>${o.name}</h4>
                                    <h3>${FormatUtils.formatPRice(o.price)}đ<span>/Pernight</span></h3>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td class="r-o">Size:</td>
                                                <td>${o.size}m2</td>
                                            </tr>
                                            <tr>
                                                <td class="r-o">Capacity:</td>
                                                <td>${o.people}</td>
                                            </tr>
                                            <tr>
                                                <td class="r-o">Bed:</td>
                                                <td>${o.bed}</td>
                                            </tr>
                                            <tr>
                                                <td class="r-o">Bath:</td>
                                                <td>${o.bath}</td>
                                            </tr>
                                            <tr>
                                                <td class="r-o">Services:</td>
                                                <td>Wifi, Television, Bathroom,...</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <a href="roomDetailsController?Id=${o.room_Id}" class="primary-btn">More Details</a>
                                </div>
                            </div>
                        </div>      
                    </c:forEach>



                </div>
                <button class="btn-Loadmore" onclick="loadMore()">Load More</button>
                <!--                <button class="btn-Loadmore" onclick="loadLess()">Load Less</button>-->
            </div>
        </section>
        <!-- Rooms Section End -->

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
        <script>
                                        function loadMore() {
                                            var amount = document.querySelectorAll(".room").length;
                                            $.ajax({
                                                url: "/DaNangDreamHotel/loadMoreController?action=more",
                                                type: "GET",
                                                data: {
                                                    totalRoom: amount
                                                },
                                                success: function (data) {
                                                    var row = document.getElementById("content");
                                                    row.innerHTML += data;
                                                    console.log("success");
                                                },
                                                error: function (xhr) {
                                                    console.log(xhr);
                                                }
                                            });
                                        }
                                        function searchByName(txtSearch) {
                                            var text = txtSearch.value;
                                            console.log(text);
                                            $.ajax({
                                                url: '/DaNangDreamHotel/searchController',
                                                type: 'GET',
                                                data: {
                                                    txt: text
                                                },
                                                success: function (data) {
                                                    var row = document.getElementById("content");
                                                    row.innerHTML = data;
                                                    console.log("success");
                                                },
                                                error: function (xhr) {
                                                    console.log(xhr, txtSearch.value);
                                                }
                                            });
                                        }

                                        function sortPriceUp() {
                                            var amount = 0;
                                            $.ajax({
                                                url: '/DaNangDreamHotel/sortRoomController?action=asc',
                                                type: 'GET',
                                                data: {
                                                    size: amount
                                                },
                                                success: function (data) {
                                                    var row = document.getElementById("content");
                                                    row.innerHTML = data;
                                                    console.log("success");
                                                },
                                                error: function (xhr) {
                                                    console.log(xhr, txtSearch.value);
                                                }
                                            });
                                        }
                                        ;

                                        function sortPriceDown() {
                                            var amount = 0;
                                            $.ajax({
                                                url: '/DaNangDreamHotel/sortRoomController?action=desc',
                                                type: 'GET',
                                                data: {
                                                    size: amount
                                                },
                                                success: function (data) {
                                                    var row = document.getElementById("content");
                                                    row.innerHTML = data;
                                                    console.log("success");
                                                },
                                                error: function (xhr) {
                                                    console.log(xhr, txtSearch.value);
                                                }
                                            });
                                        }
                                        ;

                                        function loadType(param) {

                                            var typeRoom = param.value;
                                            $.ajax({
                                                url: '/DaNangDreamHotel/roomOfTypeController',
                                                type: 'GET',
                                                data: {
                                                    type: typeRoom
                                                },
                                                success: function (data) {
                                                    var row = document.getElementById("content");
                                                    row.innerHTML = data;
                                                    console.log(typeRoom);
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
