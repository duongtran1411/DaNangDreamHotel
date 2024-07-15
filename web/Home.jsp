<%-- 
    Document   : home.jsp
    Created on : May 24, 2024, 12:45:23 AM
    Author     : GIGABYTE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Entity.FormatUtils" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8" />
        <meta name="description" content="Sona Template" />
        <meta name="keywords" content="Sona, unica, creative, html" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
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
        <style>

            .check-date input[type="date"]:focus {
                border-color: #7900ff;
                outline: none;
            }
            .check-date input[type="date"] {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                transition: border-color 0.3s ease;
            }

            #checkin::-webkit-clear-button,
            #checkin::-webkit-inner-spin-button {
                display: none;
            }

            input[type="date"]::-webkit-clear-button,
            input[type="date"]::-webkit-inner-spin-button {
                display: none;
            }



        </style>
    </head>
    <body>
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!-- Offcanvas Menu Section End -->

        <!-- Header Section Begin -->
        <jsp:include page="Header.jsp"></jsp:include>
            <!-- Header End -->

            <!-- Hero Section Begin -->
            <section class="hero-section">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="hero-text">
                                <h1>Da Nang Dream Hotel</h1>
                            </div>
                        </div>
                        <div class="col-xl-4 col-lg-5 offset-xl-2 offset-lg-1">
                            <div class="booking-form">
                                <h3>Booking Your Hotel</h3>
                                <form action="bookByEventController" method="get">
                                    <div class="check-date date-picker">
                                        <label for="checkin">Check-in</label>
                                        <input type="date" class="form-control w-100 dateCheck" id="checkin" name="checkIn">
                                    </div>
                                    <div class="check-date date-picker">
                                        <label for="checkout">Check-out</label>
                                        <input type="date" class="form-control w-100 dateCheck" id="checkout" name="checkOut">
                                    </div>
                                    <div class="select-option">
                                        <label for="guest">Guests:</label>
                                        <select id="guest" name="numberPerson">
                                            <option value="1">1 Adults</option>
                                            <option value="2">2 Adults</option>
                                            <option value="3">3 Adults</option>
                                            <option value="3">4 Adults</option>
                                            <option value="3">5 Adults</option>
                                        </select>
                                    </div>
                                    <button type="submit">Check Availability</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hero-slider owl-carousel" >
                    <div class="hs-item set-bg" data-setbg="img/img_HomePage01_1.jpg"></div>
                    <div class="hs-item set-bg" data-setbg="img/img_HomePage02_1.jpg"></div>
                    <div class="hs-item set-bg" data-setbg="img/img_HomePage05.jpg"></div>
                </div>
            </section>
            <!-- Hero Section End -->

            <!-- About Us Section Begin -->
            <section class="aboutus-section spad">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="about-text">
                                <div class="section-title">
                                    <span>About Us</span>
                                    <h2>Intercontinental LA <br />Westlake Hotel</h2>
                                </div>
                                <p class="f-para">
                                    Sona.com is a leading online accommodation site. We’re
                                    passionate about travel. Every day, we inspire and reach
                                    millions of travelers across 90 local websites in 41 languages.
                                </p>
                                <p class="s-para">
                                    So when it comes to booking the perfect hotel, vacation rental,
                                    resort, apartment, guest house, or tree house, we’ve got you
                                    covered.
                                </p>
                                <a href="#" class="primary-btn about-btn">Read More</a>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="about-pic">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <img src="img/about/about-1.jpg" alt="" />
                                    </div>
                                    <div class="col-sm-6">
                                        <img src="img/about/about-2.jpg" alt="" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- About Us Section End -->

            <!-- Home Room Section Begin -->  <!--BEST SELLER-->
            <!-- Home Room Section Begin -->  <!--BEST SELLER-->
            <section class="hp-room-section">
                <div class="container-fluid">
                    <div class="hp-room-items">
                        <div class="row">
                        <c:forEach items="${listR}" var="o">
                            <div class="col-lg-3 col-md-6">
                                <div
                                    class="hp-room-item set-bg"
                                    data-setbg="${o.image}"
                                    >
                                    <div class="hr-text">
                                        <h3>${o.name}</h3>
                                        <h2>
                                            <fmt:formatNumber value="${o.price}" type="number" maxFractionDigits="0"/>đ
                                            <span>/Pernight</span>
                                        </h2>
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td class="r-o">Size:</td>
                                                    <td>${o.size}m<sup>2</sup></td>
                                                </tr>
                                                <tr>
                                                    <td class="r-o">Capacity:</td>
                                                    <td>${o.people} person</td>
                                                </tr>
                                                <tr>
                                                    <td class="r-o">Bed:</td>
                                                    <td>${o.bed} bed</td>
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
                </div>
            </div>
        </section>
        <!-- Home Room Section End -->

        <!-- Home Room Section End -->

        <!-- Testimonial Section Begin -->
        <section class="testimonial-section spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title">
                            <span>Testimonials</span>
                            <h2>What Customers Say?</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-8 offset-lg-2">
                        <div class="testimonial-slider owl-carousel">
                            <div class="ts-item">
                                <p>
                                    After a construction project took longer than expected, my
                                    husband, my daughter and I needed a place to stay for a few
                                    nights. As a Chicago resident, we know a lot about our city,
                                    neighborhood and the types of housing options available and
                                    absolutely love our vacation at Sona Hotel.
                                </p>
                                <div class="ti-author">
                                    <div class="rating">
                                        <i class="icon_star"></i>
                                        <i class="icon_star"></i>
                                        <i class="icon_star"></i>
                                        <i class="icon_star"></i>
                                        <i class="icon_star-half_alt"></i>
                                    </div>
                                    <h5>- Alexander Vasquez</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Testimonial Section End -->

        <!-- Blog Section Begin -->
        <section class="blog-section spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title">
                            <span>Hotel News</span>
                            <h2>Event</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <c:forEach items="${listE}" var="o">
                        <div class="col-lg-4">
                            <div class="blog-item set-bg" data-setbg="${o.image}">
                                <div class="bi-text">
                                    <span class="b-tag">NEW EVENT</span>
                                    <h4 ><a class="name-Event"  href="eventController?Id=${o.event_Id}&action=listdetail">${o.name}</a></h4>
                                    <div class="b-time">
                                        <i class="icon_clock_alt"></i> ${o.startDay}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>
        <!-- Blog Section End -->

        <!-- Footer Section Begin -->
        <footer class="footer-section">
            <div class="container">
                <div class="footer-text">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="ft-about">
                                <div class="logo">
                                    <a href="#">
                                        <img src="img/footer-logo.png" alt="" />
                                    </a>
                                </div>
                                <p>
                                    We inspire and reach millions of travelers<br />
                                    across 90 local websites
                                </p>
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
                                    <input type="text" placeholder="Email" />
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
                            <div class="co-text">
                                <p>
                                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                    Copyright &copy;
                                    <script>
                                        document.write(new Date().getFullYear());
                                    </script>
                                    All rights reserved | This template is made with
                                    <i class="fa fa-heart" aria-hidden="true"></i> by
                                    <a href="https://colorlib.com/" target="_blank">Colorlib</a>
                                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                </p>
                            </div>
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
                    <input type="text" id="search-input" placeholder="Search here....." />
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
                                        var showDateIn = document.getElementById('checkin').setAttribute('value', minDate);
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
                                        var showDateOut = document.getElementById('checkout').setAttribute('value', min);
                                        document.getElementById('checkin').addEventListener('input', function (e) {
                                            if (e.target.value === '') {
                                                e.preventDefault();
                                                e.target.value = e.target.defaultValue;
                                            }
                                        });

                                        document.getElementById('checkout').addEventListener('input', function (e) {
                                            if (e.target.value === '') {
                                                e.preventDefault();
                                                e.target.value = e.target.defaultValue;
                                            }
                                        });

                                        

        </script>
    </body>
</html>
