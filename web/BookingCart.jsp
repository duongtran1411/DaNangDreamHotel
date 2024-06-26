<%-- 
    Document   : BookingCart
    Created on : Jun 20, 2024, 8:58:20 PM
    Author     : CaoTung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Entity.FormatUtils" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>JSP Page</title>
        <style>
            @media (min-width: 1025px) {
                .h-custom {
                    height: 100vh !important;
                }
            }
        </style>
    </head>
    <body>
        <section class="h-100 h-custom" style="background-color: #eee;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col">
                        <div class="card">
                            <div class="card-body p-4">
                                <div class="row">
                                    <a href="viewRoomController">Continue Book</a>
                                    <c:forEach items="${list}" var="o">
                                        <div class="col-lg-12">

                                            <div class="card mb-3">
                                                <div class="card-body" >
                                                    <div class="d-flex ">

                                                        <div class="col-lg-4">

                                                            <img
                                                                src="${o.room.image}"
                                                                class="img-fluid rounded-3" width="150px" height="100%">
                                                        </div>
                                                        <div class="col-lg-4">
                                                            <strong>Information Room</strong>
                                                            <h5>${o.room.name}</h5>
                                                            <p class="small mb-0">${o.room.people} Person</p>
                                                            <p class="small mb-0">${o.room.bed} Bed</p>
                                                        </div>

                                                        <div class="align-items-center col-lg-4">

                                                            <h5 class="fw-normal mb-0"><a href="cartController?action=delete&Id=${o.room.room_Id}">Cancel</a></h5>

                                                            <h5 class="mb-0">${FormatUtils.formatPRice(o.room.price)}đ</h5>

                                                            <a href="#!" style="color: #cecece;"><i class="fas fa-trash-alt"></i></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 d-flex">
                                        <div class="col-lg-6">
                                            Total: ${FormatUtils.formatPRice(total)}đ
                                        </div>
                                        <div class="col-lg-6">
                                            <button class="btn btn" style="background-color: #C59B24; color: white; right: 0" onclick="redirectToAdd()">Check Out</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
</section>
</body>
<script>
    function redirectToAdd() {
        window.location.href = "vnpay_pay.jsp";
    }
</script>
</html>
