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
            <section class="blog-details-hero set-bg" data-setbg="img/banner4_1634483115.jpg">
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
                          
                        <div class="blog-details-text">

                            <div class="bd-title">
                                <img src="${pageContext.request.contextPath}/uploads/image/${utilities.image}" alt="alt"/>        

                            </div>
                          <h3 class="event-main">Other Service</h3>
                        <c:forEach items="${listU}" var="o">
                            <div class="row">
                                <div class="col-lg-3 list-img">
                                    <img src="${pageContext.request.contextPath}/uploads/image/${o.image}" width="160px" height="86px" alt="">
                                </div>
                                <div class="col-lg-8">
                                    <a class="serviceName" href="UtilitiesController?action=listdetail&id=${o.utilities_Id}">${o.name}</a>
                                </div>
                            </div>
                        </c:forEach>
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
                        <h3 class="utilities-main" style="margin-bottom: 15px">${utilities.name}</h3>
                        <p>${utilities.description}</p>
                        <p>${utilities.time}</p>
                        <p>Location: ${utilities.location}</p>
                        <div class="blog-details-text">

                           
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
