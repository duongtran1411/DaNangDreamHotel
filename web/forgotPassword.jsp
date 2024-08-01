<%-- 
    Document   : authentication-login
    Created on : May 26, 2024, 6:57:44 AM
    Author     : letua
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Da Nang Dream Hotel</title>
        <link rel="shortcut icon" type="image/png" href="dashboard/assets/images/logos/favicon.png" />
        <link rel="stylesheet" href="dashboard/assets/css/styles.min.css" />
    </head>

    <body>
        <!--  Body Wrapper -->
        <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
             data-sidebar-position="fixed" data-header-position="fixed">
            <div
                class="position-relative overflow-hidden radial-gradient min-vh-100 d-flex align-items-center justify-content-center">
                <div class="d-flex align-items-center justify-content-center w-100">
                    <div class="row justify-content-center w-100">
                        <div class="col-md-8 col-lg-6 col-xxl-3">
                            <div class="card mb-0">
                                <div class="card-body">
                                    <div style="display: flex">
                                        <a href="authentication-login"> <button type="button" ><img style="width: 30px;border: 1px solid black; margin-left: -20px" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmweiKifYhYWtioAUGKuLzMwDX2m-l_OdYLQ&s"></button></a>

                                        <a href="./Home.jsp" class="text-nowrap logo-img text-center d-block py-3 w-100">
                                            <img src="dashboard/assets/images/logos/dark-logo.svg" width="180" alt="">
                                        </a>
                                    </div>
                                    <p class="text-center">Da Nang Dream Hotel</p>
                                    
                                    <form action="forgotPassword" method="post">
                                        <div class="mb-4">
                                            <label for="exampleInputPassword1" class="form-label">Enter Your Email</label>
                                            <input class="form-control" placeholder="Your Email" type="text" name="email" id="email-for-pass" required="">
                                        </div>
                                        
                                        <button class="btn btn-primary w-100 py-8 fs-4 mb-4 rounded-2" class="btn float-right login_btn" type="submit">Get New Password</button>
                                        
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="../assets/libs/jquery/dist/jquery.min.js"></script>
        <script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    </body>

</html>
