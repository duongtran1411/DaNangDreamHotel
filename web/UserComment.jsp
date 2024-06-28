<%--
    Document   : Rooms
    Created on : May 24, 2024, 1:01:55 AM
    Author     : GIGABYTE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Sona Template">
    <meta name="keywords" content="Sona, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Da Nang Dream Hotel</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/flaticon.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="styles.css">

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .nav-tabs {
            display: flex;
            list-style-type: none;
            padding: 0;
            margin: 0;
            background-color: #f8f8f8;
            border-bottom: 1px solid #ddd;
        }

        .nav-item {
            flex: 1;
            text-align: center;
        }

        .nav-link {
            display: block;
            padding: 10px;
            color: #007bff;
            text-decoration: none;
            border: 1px solid transparent;
        }

        .nav-link:hover,
        .nav-link:focus {
            background-color: #e9ecef;
        }

        .nav-span {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .nav-div {
            display: flex;
            align-items: center;
        }

        .nav-text {
            font-size: 16px;
        }

        .section-content {
            margin-left: 50px;
            display: none;
            padding: 20px;
        }

        .room-info {
            margin-top: 50px;
            display: flex;
            align-items: center;
        }

        .room-image {
            width: 200px;
            height: auto;
            margin-right: 20px;
        }

        .room-details h3 {
            margin: 0 0 10px;
        }

        .comment-section {
            margin-top: 20px;
        }
        .comment {
            background: #fff;
            padding: 15px;
            margin-bottom: 15px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .comment .username {
            font-weight: bold;
            color: #007bff;
        }
        .comment .date {
            color: #999;
            font-size: 0.9em;
        }
        .comment .content {
            margin-top: 10px;
        }
        .comment .rating {
            color: #f39c12;
            font-size: 1.2em;
        }
        .add-comment {
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin-top: 20px;
        }
    </style>
</head>

<body>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- Offcanvas Menu Section Begin -->
<div class="offcanvas-menu-overlay"></div>
<div class="canvas-open">
    <i class="icon_menu"></i>
</div>
<div class="offcanvas-menu-wrapper">
    <div class="canvas-close">
        <i class="icon_close"></i>
    </div>
    <div class="search-icon search-switch">
        <i class="icon_search"></i>
    </div>
    <div class="header-configure-area">
        <!--<div class="language-option">
            <img src="img/flag.jpg" alt="">
            <span>EN <i class="fa fa-angle-down"></i></span>
            <div class="flag-dropdown">
                <ul>
                    <li><a href="#">Zi</a></li>
                    <li><a href="#">Fr</a></li>
                </ul>
            </div>
        </div>-->
        <a href="dashboard/jsp/authentication-login.jsp" class="bk-btn">Login</a>
    </div>
    <nav class="mainmenu mobile-menu">
        <ul>
            <li class="active"><a href="Home.jsp">Home</a></li>
            <li><a href="AboutUs.jsp">About Us</a></li>
            <a href="Rooms.jsp">Accommodation</a>
            <ul class="dropdown">
                <li><a href="Rooms.jsp">Room</a></li>
                <li><a href="Room_Details.jsp">Room Details</a></li>
                <li><a href="Blog_Details.jsp">Blog Details</a></li>
                <li><a href="#">Family Room</a></li>
                <li><a href="#">Premium Room</a></li>
            </ul>
            </li>
            <li><a href="Blog.jsp">Event</a></li>
            <li><a href="Contact.jsp">Contact</a></li>
        </ul>
    </nav>
    <div id="mobile-menu-wrap"></div>
    <div class="top-social">
        <a href="#"><i class="fa fa-facebook"></i></a>
        <a href="#"><i class="fa fa-twitter"></i></a>
        <a href="#"><i class="fa fa-tripadvisor"></i></a>
        <a href="#"><i class="fa fa-instagram"></i></a>
    </div>
    <ul class="top-widget">
        <li><i class="fa fa-phone"></i> (12) 345 67890</li>
        <li><i class="fa fa-envelope"></i> info.colorlib@gmail.com</li>
    </ul>
</div>
<!-- Offcanvas Menu Section End -->

<!-- Header Section Begin -->
<jsp:include page="Header.jsp"></jsp:include>
<!-- Header End -->

<!-- Breadcrumb Section Begin -->
<div class="breadcrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text">
                    <h2>Our Rooms</h2>
                    <div class="bt-option">
                        <a href="home.html">Home</a>
                        <span>Rooms</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb Section End -->




<ul class="nav-tabs">
    <li role="none" class="nav-item">
        <a data-testid="Property-Header-Nav-Tab-Trigger-overview" data-tab-link="true" data-scroll="a[name=overview]" aria-current="page" aria-controls="overview" tabindex="0" href="#overview" class="nav-link">
                        <span class="nav-span">
                            <div class="nav-div">
                                <span class="nav-text">Tổng quan</span>
                            </div>
                        </span>
        </a>
    </li>
    <li role="none" class="nav-item">
        <a data-testid="Property-Header-Nav-Tab-Trigger-reviews" data-tab-link="true" data-scroll="a[name=reviews]" aria-controls="reviews" tabindex="0" href="#reviews" class="nav-link">
                        <span class="nav-span">
                            <div class="nav-div">
                                <span class="nav-text">Đánh giá</span>
                            </div>
                        </span>
        </a>
    </li>
    <li role="none" class="nav-item">
        <a data-testid="Property-Header-Nav-Tab-Trigger-other" data-tab-link="true" data-scroll="a[name=other]" aria-controls="other" tabindex="0" href="#other" class="nav-link">
                        <span class="nav-span">
                            <div class="nav-div">
                                <span class="nav-text">Nội dung khác</span>
                            </div>
                        </span>
        </a>
    </li>
</ul>

<!-- Overview Section -->
<section id="overview" class="section-content">
    <h2 style="text-align: center">Tổng quan</h2>
    <div class="room-info">
        <img style="height: 300px; width: 400px" src="https://th.bing.com/th/id/OIP.uBZzLNUexdwwV7S-lX3o0QHaFj?w=228&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7" alt="Room Image" class="room-image">
        <div class="room-details">
            <h3>Deluxe Room</h3>
            <p>Giá: $200 / đêm</p>
            <p>Kích thước: 30 ft</p>
            <p>Sức chứa: Tối đa 3 người</p>
            <p>Giường: Giường King</p>
            <p>Dịch vụ: Wifi, Truyền hình, Phòng tắm,...</p>
        </div>
    </div>
</section>

<!-- Reviews Section -->
<div class="container">
    <h1 class="text-center">Room Comments</h1>
    <section id="reviews" class="section-content">
        <h2 class="text-center">Đánh giá</h2>
        <p class="text-center">Đây là phần Đánh giá của khách hàng...</p>
        <div class="comment-section">
            <c:if test="${not empty comments}">
                <c:forEach var="comment" items="${comments}">
                    <div class="comment">
                        <div class="d-flex justify-content-between">
                            <div class="username">${comment.username}</div>
                            <div class="date">${comment.createdAt}</div>
                        </div>
                        <div class="content">${comment.content}</div>
                        <div class="rating">
                            <c:choose>
                                <c:when test="${comment.likesCount == 5}">★★★★★</c:when>
                                <c:when test="${comment.likesCount == 4}">★★★★☆</c:when>
                                <c:when test="${comment.likesCount == 3}">★★★☆☆</c:when>
                                <c:when test="${comment.likesCount == 2}">★★☆☆☆</c:when>
                                <c:when test="${comment.likesCount == 1}">★☆☆☆☆</c:when>
                                <c:otherwise>☆☆☆☆☆</c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${empty comments}">
                <p class="text-center">Chưa có đánh giá nào.</p>
            </c:if>
        </div>
        <div class="add-comment">
            <h3>Thêm Đánh Giá</h3>
            <form action="addComment" method="post">
                <input type="hidden" name="roomId" value="${roomId}">
                <div class="form-group">
                    <label for="username">Tên:</label>
                    <input type="text" class="form-control" id="username" name="username" required>
                </div>
                <div class="form-group">
                    <label for="content">Nội dung:</label>
                    <textarea class="form-control" id="content" name="content" rows="3" required></textarea>
                </div>
                <div class="form-group">
                    <label for="rating">Đánh giá:</label>
                    <select class="form-control" id="rating" name="rating">
                        <option value="5">5 Sao</option>
                        <option value="4">4 Sao</option>
                        <option value="3">3 Sao</option>
                        <option value="2">2 Sao</option>
                        <option value="1">1 Sao</option>
                        <option value="0">0 Sao</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Gửi</button>
            </form>
        </div>

    </section>
</div>

<!-- Other Content Section -->
<section id="other" class="section-content">
    <h2>Nội dung khác</h2>
    <p>Đây là phần Nội dung khác...</p>
</section>

<!-- JavaScript to handle tab navigation -->
<script>
    document.querySelectorAll('.nav-link').forEach(link => {
        link.addEventListener('click', function (e) {
            e.preventDefault();
            document.querySelectorAll('.section-content').forEach(section => {
                section.style.display = 'none';
            });
            const target = document.querySelector(this.getAttribute('href'));
            target.style.display = 'block';
        });
    });

    // Show the first section by default
    document.querySelector('#overview').style.display = 'block';
</script>
<!-- Rooms Section Begin -->



<section class="rooms-section spad">
    <div class="container">
        <div class="row">
            <c:forEach items="${listRoom}" var="o">
                <div class="col-lg-4 col-md-6">
                    <div class="room-item">
                        <img src="img/room/room-1.jpg" alt="">
                        <div class="ri-text">
                            <h4>${o.roomName}</h4>
                            <h3>${o.price} VND<span>/Pernight</span></h3>
                            <table>
                                <tbody>
                                <tr>
                                    <td class="r-o">Size:</td>
                                    <td>30 ft</td>
                                </tr>
                                <tr>
                                    <td class="r-o">Capacity:</td>
                                    <td>Max persion 3</td>
                                </tr>
                                <tr>
                                    <td class="r-o">Bed:</td>
                                    <td>King Beds</td>
                                </tr>
                                <tr>
                                    <td class="r-o">Services:</td>
                                    <td>Wifi, Television, Bathroom,...</td>
                                </tr>
                                </tbody>
                            </table>
                            <a href="#" class="primary-btn">More Details</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <div class="col-lg-12">
                <div class="room-pagination">
                    <a href="#">1</a>
                    <a href="#">2</a>
                    <a href="#">Next <i class="fa fa-long-arrow-right"></i></a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Rooms Section End -->

<!-- Footer Section Begin -->
<footer class="footer-section">
    <div class="container">
        <div class="footer-text">
            <div class="row">
                <div class="col-lg-4">
                    <div class="ft-about">
                        <div class="logo">
                            <a href="#">
                                <img src="img/footer-logo.png" alt="">
                            </a>
                        </div>
                        <p>We inspire and reach millions of travelers<br /> across 90 local websites</p>
                        <div class="fa-social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-tripadvisor"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-youtube-play"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 offset-lg-1">
                    <div class="ft-contact">
                        <h6>Contact Us</h6>
                        <ul>
                            <li>(12) 345 67890</li>
                            <li>info.colorlib@gmail.com</li>
                            <li>856 Cordia Extension Apt. 356, Lake, United State</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 offset-lg-1">
                    <div class="ft-newslatter">
                        <h6>New latest</h6>
                        <p>Get the latest updates and offers.</p>
                        <form action="#" class="fn-form">
                            <input type="text" placeholder="Email">
                            <button type="submit"><i class="fa fa-send"></i></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="copyright-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-7">
                    <ul>
                        <li><a href="#">Contact</a></li>
                        <li><a href="#">Terms of use</a></li>
                        <li><a href="#">Privacy</a></li>
                        <li><a href="#">Environmental Policy</a></li>
                    </ul>
                </div>
                <div class="col-lg-5">
                    <div class="co-text"><p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com/" target="_blank">Colorlib</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p></div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- Footer Section End -->

<!-- Search model Begin -->
<div class="search-model">
    <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-switch"><i class="icon_close"></i></div>
        <form class="search-model-form">
            <input type="text" id="search-input" placeholder="Search here.....">
        </form>
    </div>
</div>
<!-- Search model end -->

<!-- Js Plugins -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
