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
                        <li><i class="fa fa-envelope"></i> danangdreamhotel@gmail.com</li>
                    </ul>
                </div>
                <div class="col-lg-6">
                    <div class="tn-right">
                        <div class="top-social">
                           
                        </div>
                        <a href="authentication-login" class="bk-btn">Login</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="menu-item">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div >
                        <a href="homeController">
                            <img src="img/logo2.jpg" alt="" height="90px" width="165px"/>
                        </a>
                    </div>
                </div>
                <div class="col-lg-10">
                    <div class="nav-menu">
                        <nav class="mainmenu">
                            <ul>
                                <li class="active"><a href="homeController" style="text-decoration: none">Home</a></li>
                                <li>
                                    <a href="AboutUs.jsp" style="text-decoration: none">About Us</a>
                                    <ul class="dropdown">
                                        <li><a href="Jobs.jsp">Jobs</a></li>
                                    </ul>
                                <li>
                                    <a href="viewRoomController" style="text-decoration: none">Resort</a>
                                </li>
                                <li><a href="eventController" style="text-decoration: none">Events</a></li>
                                <li><a href="Contact.jsp" style="text-decoration: none">Contact</a></li>
                                <li><a href="viewCartController" style="text-decoration: none">Booked</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
