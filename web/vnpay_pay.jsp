<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Entity.FormatUtils" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
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
        <title>Information</title>
        <link href="/vnpay_jsp/assets/bootstrap.min.css" rel="stylesheet"/>
        <link href="/vnpay_jsp/assets/jumbotron-narrow.css" rel="stylesheet">      
        <script src="/vnpay_jsp/assets/jquery-1.11.3.min.js"></script>
        <link href="css/vnpay_pay.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
        <style>
            .information{
                border: 1px solid #ddd;
            }
            .booking{
                border: 1px solid #ddd;

            }
            .text-muted{
                text-align: center
            }
            .booking-infor{
                border:1px solid #ddd;
                background-color: #F8F8F8;
                width: 100%;
                height: 90px
            }
            .price{
                color:#C59B24;
                padding-left: 80px;
            }
            .name{
                font-weight: 600;
                color: #0057A0;
            }
            label{
                font-weight: 500;
            }
            
            .colo-main{
                color: #C59B24
            }
            .main{
                height: 600px
            }
            .cart{
                margin-left: 13px
            }
            .infor{
                padding-bottom: 10px
            }
            .conten{
                padding: 10px 10px;
            }
            .name-room{
                padding-left: 12px
            }
            .detail{
                display: flex;
                padding-top: 25px
            }
            .total{
               padding-top: 10px 
            }
            
            .total span{
                font-weight: 500
            }
            body{
                padding: 0px;
            }
            .list-room{
                margin-top: 30px
            }
        </style>
    </head>

    <body>
        <jsp:include page="Header.jsp"></jsp:include>
            <div class="container main">
                <div class="header clearfix">
                    <h3 class="text-muted">BOOKING INFORMATION</h3>
                </div>
                <div class="row" style="height: 500px;overflow: hidden;">
                    <div class="col-lg-8 information">
                        <h5 class="text-muted">GUEST INFORMATION</h5>
                        <div>
                            <form action="vnpayajax" id="frmCreateOrder" method="post">        
                                <div class="form-group">
                                    <input class="form-control" data-val="true" data-val-number="The field Amount must be a number." data-val-required="The Amount field is required." id="amount" name="amount" type="hidden" value="${total}" readonly=""/>
                                <span id="amount-error" style="color: red;"></span>

                            </div>
                            <div class="row"> 
                                <div class="form-group col-lg-6">
                                    <label for="firstName">First Name<sup class="colo-main">*</sup></label>
                                    <input class="form-control" id="firstName" name="firstName" type="text" value=""/>
                                    <span id="firstName-error" style="color: red;"></span>
                                </div>
                                <div class="form-group col-lg-6">
                                    <label for="lastName">Last Name<sup class="colo-main">*</sup></label>
                                    <input class="form-control" id="lastName" name="lastName" type="text" value=""/>
                                    <span id="lastName-error" style="color: red;"></span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-lg-6">
                                    <label for="phone">Phone<sup class="colo-main">*</sup></label>
                                    <input class="form-control" id="phone" name="phone" type="text" value=""/>
                                    <span id="phone-error" style="color: red;"></span>
                                </div>
                                <div class="form-group col-lg-6">
                                    <label for="email">Your Email<sup class="colo-main">*</sup></label>
                                    <input class="form-control" id="email" name="email" type="email" value=""/>
                                    <span id="email-error" style="color: red;"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="card">Card<sup class="colo-main">*</sup></label>
                                <input class="form-control" id="card" name="card" type="text" value=""/>
                                <span id="card-error" style="color: red;"></span>
                            </div>
                            <button type="submit" class="btn-success">Booking Now</button>
                        </form>
                    </div>
                </div>
                <div class="col-lg-4 booking">
                    <div>
                        <h5 class="text-muted">REQUEST YOUR BOOKING</h5>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-lg-4">
                            <img src="img/img_HomePage01.jpg" alt="alt" width="120px" height="60px"/>
                        </div>
                        <div class="col-lg-8">
                            <p class="name">Da Nang Dream Hotel</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">${checkInDay}  ${checkOutDay}</div>
                    </div>
                    <div class="row list-room" >
                        <%--<c:forEach items="${cart}" var="o">--%>

                        <!--                            <div class="col-lg-12 booking-infor" >
                                                        <div class="row">
                                                            <div class="col-lg-12">${o.room.name}</div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-6">more details</div>
                                                            <div class="col-lg-6">${o.room.price * o.room.discount}</div>
                                                        </div>
                                                        <div>
                        
                                                        </div>
                                                    </div>-->
                        <%--</c:forEach>--%>
                        <div class="col-lg-12 cart" >
                            <div class="row booking-infor infor" >
                                <div class="col-lg-12 conten">
                                    <div class="name-room">Family Suite</div>
                                    <div class="detail">
                                        <div class="col-lg-6"><strong>Show details</strong></div>
                                        <div class="col-lg-6 price">3.000.000d</div>
                                    </div>
                                </div>
                            </div> 
                            <div class="row total">
                                <div class="col-lg-12">
                                    <span>Total room price:</span>
                                    <p>Including all taxes and service fees</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>           
        <link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
        <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                function validateField(field, regex, errorElement, errorMessage) {
                    var value = field.val();
                    if (!regex.test(value)) {
                        errorElement.text(errorMessage);
                    } else {
                        errorElement.text("");
                    }
                }

                $("#card").on("input", function () {
                    validateField(
                            $(this),
                            /^\d{12}$/,
                            $("#card-error"),
                            "Invalid card number. Card number must be exactly 12 digits."
                            );
                });

                $("#phone").on("input", function () {
                    validateField(
                            $(this),
                            /^\d{10}$/,
                            $("#phone-error"),
                            "Invalid phone number. Phone number must be exactly 10 digits."
                            );
                });

                $("#frmCreateOrder").submit(function (event) {
                    event.preventDefault();

                    var card = $("#card").val();
                    var phone = $("#phone").val();
                    var hasError = false;

                    if (!/^\d{12}$/.test(card)) {
                        $("#card-error").text("Invalid card number. Card number must be exactly 12 digits.");
                        hasError = true;
                    }

                    if (!/^\d{10}$/.test(phone)) {
                        $("#phone-error").text("Invalid phone number. Phone number must be exactly 10 digits.");
                        hasError = true;
                    }

                    if (!hasError) {
                        var postData = $("#frmCreateOrder").serialize();
                        var submitUrl = $("#frmCreateOrder").attr("action");
                        $.ajax({
                            type: "POST",
                            url: submitUrl,
                            data: postData,
                            dataType: 'JSON',
                            success: function (x) {
                                if (x.code === '00') {
                                    if (window.vnpay) {
                                        vnpay.open({width: 768, height: 600, url: x.data});
                                    } else {
                                        location.href = x.data;
                                    }
                                } else {
                                    alert(x.message);
                                }
                            }
                        });
                    }
                });
            });
        </script>       
    </body>
</html>
