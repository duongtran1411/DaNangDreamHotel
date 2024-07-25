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
        <title>Da Nang Dream Hotel</title>

        <!-- Google Font -->
        <link rel="icon" href="img/title_danangdream.jpg" type="image/x-icon"/>
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
            <section class="blog-details-hero set-bg" data-setbg="img/z5637010616325_eee280111ccccd13cfe6f87589e01359.jpg">
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
                            <h3 class="event-main">${utilities.name}</h3>
                        <div class="blog-details-text">
                            <div class="bd-title">
                                <img src="${pageContext.request.contextPath}/uploads/image/${utilities.image}" alt="alt"/>
                                <p>${utilities.description}</p>
                                <p>${utilities.time}</p>
                                <p>Location: ${utilities.location}</p>
                            </div>
                            <div class="leave-comment">
                                <h4>Da Nang Dream Hotel</h4>
                                <p> Hotline: 0822 86 44 99 
                                    <br>
                                    Email:danangdreamhotel@gmail.com
                                    <br>
                                    Website:danangdreamhotel.vn
                                    <br>
                                    Instagram: instagram.com/danang.hotelsandresorts
                                    <br>
                                    Zalo: zalo.me/3884774082846062547
                                    <br>
                                    Tiktok: tiktok.com/@danangdreamhotelsresorts
                                </p>
                            </div>
                        </div>
                    </div>
                    <br/>        
                    <div class="col-lg-4">
                        <h3 class="event-main">Other Service</h3>
                        <c:forEach items="${listU}" var="o">
                            <div class="row">
                                <div class="col-lg-6 list-img">
                                    <img src="${pageContext.request.contextPath}/uploads/image/${o.image}" width="160px" height="86px" alt="">
                                </div>
                                <div class="col-lg-6">
                                    <a class="eventName" href="UtilitiesController?action=listdetail&id=${o.utilities_Id}" >${o.name}</a>
                                    <p class="utilities-main" style="margin-top: 30px">${o.time}</p>
                                </div>
                            </div>
                        </c:forEach>

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
