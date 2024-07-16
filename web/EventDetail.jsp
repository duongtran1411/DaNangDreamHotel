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
                                        <button type="submit" class="site-btn" style="margin-bottom: 20px; background-color: #DFA974; border: none; width: 148px;height: 47px"><a href="bookByEventController" style="color: white; background: ">Booking Now</a></button>
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


    </body>
</html>
