<%-- 
    Document   : ChangeResetPasss
    Created on : May 28, 2024, 10:07:53 PM
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
                                        <a href="http://localhost:9999/DaNangDreamHotel/Home.jsp"> <button type="button" ><img style="width: 30px;border: 1px solid black; margin-left: -20px" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmweiKifYhYWtioAUGKuLzMwDX2m-l_OdYLQ&s"></button></a>

                                        <a href="./index.jsp" class="text-nowrap logo-img text-center d-block py-3 w-100">
                                            <img src="dashboard/assets/images/logos/dark-logo.svg" width="180" alt="">
                                        </a>
                                    </div>
                                    <p class="text-center">Da Nang Dream Hotel</p>
                                    <c:set var="cookie" value="${pageContext.request.cookies}" /> 
                                    <form action="changepass" method="post">
                                        <div class="mb-3">
                                            <label for="exampleInputPassword1" class="form-label">Enter Password</label>
                                            <input type="password" class="form-control" placeholder="Password" name="password" required>
                                        </div>
                                        <div class="mb-4">
                                            <label for="exampleInputPassword1" class="form-label">Enter Password Again</label>
                                            <input type="password" class="form-control" placeholder="Password Again" name="confPassword" required>
                                        </div>

                                        <input class="btn btn-primary w-100 py-8 fs-4 mb-4 rounded-2" type="submit" value="Submit" class="btn float-right login_btn" name="btAction">
                                    </form>
                                    <p class="text-danger" style="color: red ;  width: auto ; margin: auto ;padding: auto ; text-align: center ; border-radius: 50px;">${mess1}
                                    </p>
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