<%-- 
    Document   : Header
    Created on : May 25, 2024, 2:45:33 PM
    Author     : Sơnnnn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<style>
     li {
            list-style-type: none;
        }
        a {
            text-decoration: none;
            position: relative;
            display: inline-block;
            color: #000; 
        }
        .fa-paper-plane {
            font-size: 24px;
            color: #C59B24; 
            position: absolute;
            bottom: -15px;
            left: 10%;
            transform: translateX(-60%);
            opacity: 0;
            transition: opacity 0.5s ease, transform 0.5s ease;
        }
        
        .fa-paper-plane.show {
            opacity: 1;
            transform: translateX(-50%) translateY(-20px); 
        }
</style>
<header class="header-section">
    <div class="top-nav">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <ul class="tn-left">
                        <li><i class="fa fa-phone"></i> (+84) 335 500390</li>
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
                            <img src="img/header_homepage.jpg" alt="" height="70px" />
                        </a>
                    </div>
                </div>
                <div class="col-lg-10">
                    <div class="nav-menu">
                        <nav class="mainmenu">
                            <ul>
                                <li class="active"><a href="homeController" style="text-decoration: none">Home</a></li>
                                <li>
                                    <a href="UtilitiesController">Service</a>
                                  
                                <li>
                                    <a href="viewRoomController" style="text-decoration: none">Resort</a>
                                </li>
                                <li><a href="eventController" style="text-decoration: none">Events</a></li>
                                <li><a href="Contact.jsp" style="text-decoration: none">Contact</a></li>
                                <c:if test="${cart.size() != 0}">
                                <li><a href="viewCartController" style="text-decoration: none">Booked<i id="flashingIcon"class="fa-solid fa-paper-plane"></i></a></li>
                                </c:if>
                               
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<script>
        
        document.addEventListener('DOMContentLoaded', function() {
            const icon = document.getElementById('flashingIcon');
            let isVisible = false;

            setInterval(function() {
                isVisible = !isVisible;
                icon.classList.toggle('show', isVisible);
            }, 1000);
        });
</script>
