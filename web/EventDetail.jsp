<%-- 
    Document   : Blog_Details
    Created on : May 24, 2024, 12:56:56 AM
    Author     : GIGABYTE
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" href="css/event.css" type="text/css"/>
    </head>
    <body>
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!-- Header Section Begin -->
        <jsp:include page="Header.jsp"></jsp:include>
            <!-- Header End -->

            <!-- Blog Details Hero Section Begin -->
            <section class="blog-details-hero set-bg" data-setbg="img/img_EventPage.png">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-10 offset-lg-1">

                        </div>
                    </div>
                </div>
            </section>
            <!-- Blog Details Hero End -->

            <!-- Blog Details Section Begin -->
            <section class="blog-details-section">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8">
                            <h3 class="event-main">${event.name}</h3>
                        <div class="blog-details-text">
                            <div class="bd-title">
                                <img src="${event.image}" alt="alt"/>
                                <p>${event.description}</p>
                            </div>
                            <div class="leave-comment">
                                <h4>Da Nang Dream Hotel</h4>
                                <p>Hotline: 0822 86 44 99</p>
                                <p>  Email:danangdreamhotel@gmail.com
                                    <br>
                                    Website:danangdreamhotel.vn
                                    <br>
                                    Instagram: instagram.com/danang.hotelsandresorts
                                    <br>
                                    Zalo: zalo.me/3884774082846062547
                                    <br>
                                    Tiktok: tiktok.com/@danangdreamhotelsresorts
                                </p>
                                <div class="row">
                                    <div class="col-lg-12 text-center">
                                        <button type="submit" class="site-btn" style="margin-bottom: 20px; background-color: #DFA974; border: none; width: 148px;height: 47px"><a href="bookByEventController?eventId=${event.event_Id}" style="color: white; background: ">Booking Now</a></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br/>        

                    <div class="col-lg-4" style="display: block">
                        <h3 class="event-main">Other Event</h3>
                        <c:forEach items="${list}" var="o">
                            <div class="row">
                                <div class="col-lg-6 list-img">
                                    <img src="${o.image}" width="160px" height="86px" alt="">
                                </div>
                                <div class="col-lg-6">
                                    <a class="eventName" href="eventController?action=listdetail&Id=${o.event_Id}">${o.name}</a>
                                    <p class="startDay" >${o.startDay}</p>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                </div>
            </div>
        </section>
        <!-- Blog Details Section End -->

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


    </body>
</html>
