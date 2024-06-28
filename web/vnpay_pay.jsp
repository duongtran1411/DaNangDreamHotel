<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Entity.FormatUtils" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Tạo mới đơn hàng</title>
        <link href="/vnpay_jsp/assets/bootstrap.min.css" rel="stylesheet"/>
        <link href="/vnpay_jsp/assets/jumbotron-narrow.css" rel="stylesheet">      
        <script src="/vnpay_jsp/assets/jquery-1.11.3.min.js"></script>
        <link href="css/vnpay_pay.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
    </head>

    <body>
        <div class="container">
            <div class="header clearfix">
                <h3 class="text-muted">VNPAY DEMO</h3>
            </div>
            <h3>Tạo mới đơn hàng</h3>
            <div class="table-responsive">
                <form action="vnpayajax" id="frmCreateOrder" method="post">        
                    <div class="form-group">
                        <label for="amount">Số tiền</label>
                        <input class="form-control" data-val="true" data-val-number="The field Amount must be a number." data-val-required="The Amount field is required." id="amount" name="amount" type="text" value="${total}" readonly=""/>
                        <span id="amount-error" style="color: red;"></span>
                    </div>
                    <div class="form-group">
                        <label for="firstName">First Name</label>
                        <input class="form-control" id="firstName" name="firstName" type="text" value=""/>
                        <span id="firstName-error" style="color: red;"></span>
                    </div>
                    <div class="form-group">
                        <label for="lastName">Last Name</label>
                        <input class="form-control" id="lastName" name="lastName" type="text" value=""/>
                        <span id="lastName-error" style="color: red;"></span>
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone</label>
                        <input class="form-control" id="phone" name="phone" type="text" value=""/>
                        <span id="phone-error" style="color: red;"></span>
                    </div>
                    <div class="form-group">
                        <label for="email">Your Email</label>
                        <input class="form-control" id="email" name="email" type="email" value=""/>
                        <span id="email-error" style="color: red;"></span>
                    </div>
                    <div class="form-group">
                        <label for="card">Card</label>
                        <input class="form-control" id="card" name="card" type="text" value=""/>
                        <span id="card-error" style="color: red;"></span>
                    </div>
                    <button type="submit" class="btn-success">Thanh toán</button>
                </form>
            </div>
            <footer class="footer">
                <p>&copy; VNPAY 2020</p>
            </footer>
        </div>

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
