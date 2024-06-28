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

        <title>Da Nang Dream Hotel</title>
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
        <link
            href="https://fonts.googleapis.com/css?family=Lora:400,700&amp;display=swap"
            rel="stylesheet"
            />
        <link
            href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&amp;display=swap"
            rel="stylesheet"
            />
        <style>
            @media (min-width: 1025px) {
                .h-custom {
                    height: 100vh !important;
                }
            }
        </style>
    </head>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>
            <section class="h-100 h-custom" style="background-color: #eee;">
                <div class="container py-5 h-100">

                    <div class="row d-flex justify-content-center align-items-center h-100">

                        <div class="col">
                            <div class="card">
                            <c:if test="${cart.size() != 0}" >
                                <div class="card-body p-4">
                                    <div style="padding-bottom: 10px">
                                        <input type="text" placeholder="Search..." oninput="searchByName(this)"  >
                                        <select id="roomSelect" onchange="handleChange()" style="padding-right: 50px;padding-top: 3px;padding-bottom: 3px">
                                            <option value="0">All</option>
                                            <c:forEach items="${listT}" var="o"> 
                                                <option  value="${o.typeRoom_Id}">${o.name}</option> 
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="row" id="content">

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


                                                                <h5 class="mb-0">${FormatUtils.formatPRice(o.room.price * o.room.discount)}đ</h5>

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
                                            <div class="col-lg-6" >
                                                <h4 style="color: red">Total: ${FormatUtils.formatPRice(total)}đ</h4>
                                            </div>
                                            <div class="col-lg-6">
                                                <button class="btn btn" style="background-color: #C59B24; color: white; right: 0" onclick="redirectToAdd()">Check Out</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </div>

                </div>
            </div>
        </section>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> 
    <script>
                                                    function redirectToAdd() {
                                                        window.location.href = "vnpay_pay.jsp";
                                                    }
                                                    function handleChange() {
                                                        var selectElement = document.getElementById("roomSelect");
                                                        var selectedValue = selectElement.value;
                                                        $.ajax({
                                                            url: '/DaNangDreamHotel/serviceCartController?action=filter',
                                                            type: 'GET',
                                                            data: {
                                                                type: selectedValue
                                                            },
                                                            success: function (data) {
                                                                var row = document.getElementById("content");
                                                                row.innerHTML = data;
                                                                console.log(selectedValue);
                                                                console.log("success");
                                                            },
                                                            error: function (xhr) {
                                                                console.log(xhr);
                                                            }
                                                        });
                                                    }
                                                    function searchByName(txtSearch) {
                                                        var text = txtSearch.value;
                                                        console.log(text);
                                                        $.ajax({
                                                            url: '/DaNangDreamHotel/serviceCartController?action=search',
                                                            type: 'GET',
                                                            data: {
                                                                txt: text
                                                            },
                                                            success: function (data) {
                                                                var row = document.getElementById("content");
                                                                row.innerHTML = data;
                                                                console.log("success");
                                                            },
                                                            error: function (xhr) {
                                                                console.log(xhr, txtSearch.value);
                                                            }
                                                        });
                                                    }
//        var sessionTimeout = setTimeout(function() {
//            alert("timeout");
//        }, 1000);

    </script>
</html>
