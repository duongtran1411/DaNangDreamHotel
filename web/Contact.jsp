<%-- 
    Document   : Contact
    Created on : May 24, 2024, 12:58:30 AM
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
        <title>Da Nang Dream Hotel</title>

        <!-- Google Font -->
        <link rel="icon" href="img/title_danangdream.jpg" type="image/x-icon"/>
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
            .colo-main{
                color: #C59B24
            }
            color-hover:hover{
                color: #ff6600;
            }
        </style>
    </head>
    <body>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <jsp:include page="Header.jsp"></jsp:include>
        <!-- Header End -->

        <!-- Contact Section Begin -->
        <section class="contact-section spad">
            <div class="container">
                <div class="row" style="background-image: url(img/white-concrete-wall.jpg);background-size: cover" >
                    <div class="col-lg-4">
                        <div class="contact-text">
                            <h2>Contact Info</h2>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                                labore et dolore magna aliqua.</p>
                            <table>
                                <tbody>
                                    <tr>
                                        <td class="c-o">Address:</td>
                                        <td>Da Nang, VIE</td>
                                    </tr>
                                    <tr>
                                        <td class="c-o">Phone:</td>
                                        <td>+(84)335 500390</td>
                                    </tr>
                                    <tr>
                                        <td class="c-o">Email:</td>
                                        <td>danangdreamhotel@gmail.com</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="col-lg-7 offset-lg-1">
                        <h2>Feedback Form</h2>
                        <p>We would love to hear your thoughts, concerns or problem with anything so we can improve!</p>
                        <hr>
                        <form id="feedbackForm">
                            <h4>Feedback type</h4>
                            <div class="row">

                                <div class="col-md-6">
                                    <label>Comments</label>
                                    <input type="radio" name="feed" class="pointer" value="Comments"/>
                                </div>
                                <div class="col-md-6">
                                    <label>Questions</label>
                                    <input type="radio" name="feed" class="pointer" value="Questions"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="form-label">First Name<sup class="colo-main">*</sup></label>
                                    <input type="text" name="firstname" class="form-control" required=""/>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Last Name<sup class="colo-main">*</sup></label>
                                    <input type="text" name="lastname" class="form-control" required=""/>
                                </div>
                            </div> 
                            <div class="form-group mb-2-2">
                                <label class="form-label">Email<sup class="colo-main">*</sup></label>
                                <input type="email" name="email" class="form-control" required=""/>
                            </div>
                            <div class="form-group mb-2">
                                <label class="form-label">Describe Feedback<sup class="colo-main">*</sup></label>
                                <textarea rows="4" name="description" class="form-control" required=""></textarea>
                            </div>
                            <button type="submit" class="btn btn-success">Submit feedback</button>
                        </form>
                    </div>
                </div>
                <div class="map">
                    <iframe
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3022.0606825994123!2d-72.8735845851828!3d40.760690042573295!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89e85b24c9274c91%3A0xf310d41b791bcb71!2sWilliam%20Floyd%20Pkwy%2C%20Mastic%20Beach%2C%20NY%2C%20USA!5e0!3m2!1sen!2sbd!4v1578582744646!5m2!1sen!2sbd"
                        height="470" style="border:0;" allowfullscreen=""></iframe>
                </div>
            </div>
        </section>
        <!-- Contact Section End -->

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
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>
        <script>
                                        $('#feedbackForm').on('submit', function (e) {
                                            e.preventDefault();
                                            $.ajax({
                                                url: 'feedBackController',
                                                type: 'POST',
                                                data: $(this).serialize(),
                                                dataType: 'json',
                                                success: function (data) {
                                                    if (data.status === 'success') {
                                                        Swal.fire({
                                                            title: 'Success!',
                                                            text: 'Feedback submitted successfully!',
                                                            icon: 'success',
                                                            confirmButtonText: 'OK',
                                                            timer: 2000
                                                        });
                                                        
                                                    } else {
                                                        Swal.fire({
                                                            title: 'Error!',
                                                            text: 'Email no have booking',
                                                            icon: 'error',
                                                            confirmButtonText: 'OK',
                                                            timer: 2000
                                                        });
                                                    }
                                                    setTimeout(() => {
                                                            location.reload();
                                                    }, 1000);
                                                },
                                                error: function () {
                                                    Swal.fire({
                                                        title: 'Error!',
                                                        text: 'An error occurred. Please try again later.',
                                                        icon: 'error',
                                                        confirmButtonText: 'OK'
                                                    });
                                                }
                                            });
                                        });
        </script>
    </body>
</html>
