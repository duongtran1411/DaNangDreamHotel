<%-- 
    Document   : Header
    Created on : May 25, 2024, 2:45:33 PM
    Author     : Sơnnnn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<header class="header-section">
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
                        <a href="dashboard/jsp/authentication-login.jsp" class="bk-btn">Login</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="menu-item">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="logo">
                        <a href="index.html">
                            <img src="img/logo.png" alt="" />
                        </a>
                    </div>
                </div>
                <div class="col-lg-10">
                    <div class="nav-menu">
                        <nav class="mainmenu">
                            <ul>
                                <li class="active"><a href="Home.jsp">Home</a></li>
                                <!-- <li><a href="rooms.html">Rooms</a></li> -->
                                <li><a href="AboutUs.jsp">About Us</a></li>
                                <li>
                                    <a href="room">Accommodation</a>
                                    <ul class="dropdown">
                                        <li><a href="room  ">Rooms</a></li>
                                        <li><a href="Blog_Details.jsp">Blog Details</a></li>
                                        <li><a href="#">Family Room</a></li>
                                        <li><a href="#">Premium Room</a></li>
                                        <li><a href="Room_Details.jsp">Room Details</a></li>
                                    </ul>
                                </li>
                                <li><a href="Blog.jsp">Events</a></li>
                                <li><a href="Contact.jsp">Contact</a></li>
                            </ul>
                        </nav>
                        <div class="nav-right search-switch">
                            <i class="icon_search"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
