<%-- 
    Document   : AboutUs
    Created on : May 24, 2024, 12:56:02 AM
    Author     : GIGABYTE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Sona Template">
        <meta name="keywords" content="Sona, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Sona | Template</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css?family=Lora:400,700&amp;display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&amp;display=swap" rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/flaticon.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
         <style>
    .sidebar {
      background: #f8f9fa;
      padding: 20px;
      border-right: 1px solid #ddd;
    }
    .sidebar .menu {
      font-size: 24px;
      font-weight: bold;
      margin-bottom: 40px;
    }
    .content h3 {
      margin-top: 20px;
    }
    .content .reason {
      margin-bottom: 40px;
    }
    .book-now {
      background: #ffc107;
      padding: 20px;
      text-align: center;
      position: fixed;
      right: 0;
      top: 50%;
      transform: translateY(-50%);
      writing-mode: vertical-rl;
      text-orientation: mixed;
      cursor: pointer;
    }
    .footer {
      position: fixed;
      bottom: 0;
      left: 0;
      width: 100%;
      background: #f8f9fa;
      padding: 10px;
      text-align: center;
      border-top: 1px solid #ddd;
    }
      .apply-now {
      margin: 40px 0;
      text-align: center;
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
                <a href="Login.jsp" class="bk-btn">Login</a>
            </div>
            <nav class="mainmenu mobile-menu">
                <ul>
                    <li class="active"><a href="Home.jsp">Home</a></li>
                    <li><a href="AboutUs.jsp">About Us</a></li>
                    <li><a href="Rooms.jsp">Accommodation</a>
                        <ul class="dropdown">
                            <li><a href="Rooms.jsp">Rooms</a></li>
                            <li><a href="Room_Details.jsp">Room Details</a></li>
                            <li><a href="Blog_Details.jsp">Blog Details</a></li>
                            <li><a href="#">Family Room</a></li>
                            <li><a href="#">Premium Room</a></li>
                        </ul>
                    </li>
                    <li><a href="Blog.jsp">Events</a></li>
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
        <header class="header-section header-normal">
            <div class="top-nav">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <ul class="tn-left">
                                <li><i class="fa fa-phone"></i> (12) 345 67890</li>
                                <li><i class="fa fa-envelope"></i> info.colorlib@gmail.com</li>
                            </ul>
                        </div>
                        <div class="col-lg-6">
                            <div class="tn-right">
                                <div class="top-social">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-tripadvisor"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                </div>
                                <a href="Login.jsp" class="bk-btn">Login</a>
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
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="menu-item">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-2">
                            <div class="logo">
                                <a href="index.html">
                                    <img src="img/logo.png" alt="">
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-10">
                            <div class="nav-menu">
                                <nav class="mainmenu">
                                    <ul>
                                        <li class="active"><a href="Home.jsp">Home</a></li>
                                        <li><a href="AboutUs.jsp">About Us</a></li>
                                        <li><a href="Rooms.jsp">Accommodation</a>
                                            <ul class="dropdown">
                                                <li><a href="Rooms.jsp">Rooms</a></li>
                                                <li><a href="Room_Details.jsp">Room Details</a></li>
                                                <li><a href="Blog_Details.jsp">Blog Details</a></li>
                                                <li><a href="#">Family Room</a></li>
                                                <li><a href="#">Premium Room</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="Blog.jsp">Events</a></li>
                                        <li><a href="Contact.jsp">Contact</a></li>
                                    </ul>
                                </nav>
                                <div class="nav-right search-switch">
                                    <i class="icon_search"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Header End -->

        <!-- Breadcrumb Section Begin -->
        <div class="breadcrumb-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb-text">
                            <h2>Jobs</h2>
                            <div class="bt-option">
                                <a href="index.html">Home</a>
                                <span>Jobs</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb Section End -->

        <!-- About Us Page Section Begin -->
        <section class="aboutus-page-section spad">
            <div class="container">
                <div class="about-page-text">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="ap-title">
                                <h2>Welcome To Sona.</h2>
                                <p>Built in 1910 during the Belle Epoque period, this hotel is located in the center of
                                    Paris, with easy access to the city’s tourist attractions. It offers tastefully
                                    decorated rooms.</p>
                               
                            </div>
                        </div>
                    </div>
                </div>
                <div class="about-page-services">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="ap-service-item set-bg" data-setbg="https://img.timviec.com.vn/2023/03/L%C3%A0m-sao-%C4%91%E1%BB%83-tr%E1%BB%9F-th%C3%A0nh-l%E1%BB%85-t%C3%A2n-nh%C3%A0-h%C3%A0ng-xu%E1%BA%A5t-s%E1%BA%AFc.jpg">
                                <div class="api-text">
                                    <h3>Receptionist</h3>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="ap-service-item set-bg" data-setbg="https://media.vneconomy.vn/w800/images/upload/2022/06/30/chef-ooi.JPG">
                                <div class="api-text">
                                    <h3>Chef</h3>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="ap-service-item set-bg" data-setbg="https://hct.edu.vn/sites/default/files/cao_dang_du_lich_hai_phong_thuc_tap_1_giam_dl_0.jpg">
                                <div class="api-text">
                                    <h3>Staff services</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- About Us Page Section End -->

        <!-- Video Section Begin -->
        <section class="video-section set-bg" data-setbg="img/video-bg.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="video-text">
                            <h2>Discover Our Hotel & Services.</h2>
                            <p>It S Hurricane Season But We Are Visiting Hilton Head Island</p>
                            <a href="https://www.youtube.com/watch?v=EzKkl64rRbM" class="play-btn video-popup"><img
                                    src="img/play.png" alt=""></a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
 

  <div class="container-fluid">
    <div class="row">
      <!-- Sidebar -->
      <div class="col-md-3 sidebar">
        <h2>3 LÝ DO CHỌN LÀM VIỆC TẠI DaNangDreamHotel</h2>
      </div>
      
      <!-- Content -->
      <div class="col-md-6 content">
        <div class="reason">
          <h3>PHÁT TRIỂN BẢN THÂN TOÀN DIỆN</h3>
          <p>DaNangDreamHotel provides favorable conditions and opportunities for each individual to simultaneously develop their professional skills and fully develop themselves. Employees are encouraged to participate in various internal and external short/long-term training programs...</p>
        </div>
        <div class="reason">
          <h3>CƠ HỘI THĂNG TIẾN RỘNG MỞ</h3>
          <p>With a wide scale of development across many areas, DaNangDreamHotel creates a large number of opportunities for advancement and rotation for individuals with potential and learning needs...</p>
        </div>
        <div class="reason">
          <h3>VĂN HÓA DOANH NGHIỆP ĐỘC ĐÁO</h3>
          <p>In addition to ensuring an attractive long-term working environment with attractive policies, DaNangDreamHotel also pays special attention to the daily life of employees...</p>
        </div>
      </div>
      
      <!-- Right Sidebar (empty) -->
      <div class="col-md-3"></div>
    </div>
  </div>
       <div class="apply-now">
    <a class="btn btn-primary text-uppercase" href="Register.jsp">Ứng tuyển ngay</a>
  </div>

  <!-- Book Now Button -->
  <div class="book-now">
    ĐẶT PHÒNG
  </div>

  <!-- Footer -->
        <!-- Video Section End -->

        <!-- Gallery Section Begin -->
 
        <!-- Gallery Section End -->

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
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="scripts.js"></script>
    </body>
</html>

