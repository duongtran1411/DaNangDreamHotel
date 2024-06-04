<%-- 
    Document   : authentication-login
    Created on : May 26, 2024, 6:57:44 AM
    Author     : letua
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Da Nang Dream Hotel</title>
        <link
            href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
            rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
        <style type="text/css">
            .form-gap {
                padding-top: 70px;
            }
        </style>
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
                                        <a href="http://localhost:9999/DaNangDreamHotel/dashboard/jsp/authentication-login.jsp"> <button type="button" ><img style="width: 30px;border: 1px solid black; margin-left: -20px" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmweiKifYhYWtioAUGKuLzMwDX2m-l_OdYLQ&s"></button></a>

                                        <a href="./Home.jsp" class="text-nowrap logo-img text-center d-block py-3 w-100">
                                            <img src="dashboard/assets/images/logos/dark-logo.svg" width="180" alt="">
                                        </a>
                                    </div>
                                    <h3 class="text-center">Da Nang Dream Hotel</h3>
                                    <h4 style="padding-top: 10px" class="text-center">Enter OTP</h4>
                                    <div>
                                        <h1 style="color: red; text-align: center; font-size: 20px ">${message}</h1>
                                    </div>

                                    <form id="register-form" action="ValidateOtp" role="form" autocomplete="off"
                                          class="form" method="post">

                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i
                                                        class="glyphicon glyphicon-envelope color-blue"></i></span>
                                                <input
                                                    id="opt" name="otp" placeholder="Enter OTP"
                                                    class="form-control" type="text" required="required">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <input name="recover-submit"
                                                   class="btn btn-lg btn-primary btn-block"
                                                   value="Reset Password" type="submit">
                                        </div>

                                        <input type="hidden" class="hide" name="token" id="token"
                                               value="">
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
