<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags-->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="au theme template">
        <meta name="author" content="Hau Nguyen">
        <meta name="keywords" content="au theme template">

        <!-- Title Page-->
        <title>Dashboard</title>
 <link rel="shortcut icon" type="image/png" href="dashboard/assets/images/logos/favicon.png" />
        <link rel="stylesheet" href="dashboard/assets/css/styles.min.css" />
        <link rel="stylesheet" href="dashboard/assets/css/styles.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <!-- Fontfaces CSS-->
        <link href="Admin/css/font-face.css" rel="stylesheet" media="all">
        <link href="Admin/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
        <link href="Admin/vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
        <link href="Admin/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

        <!-- Bootstrap CSS-->
        <link href="Admin/vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

        <!-- Vendor CSS-->
        <link href="vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
        <link href="vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
        <link href="vendor/wow/animate.css" rel="stylesheet" media="all">
        <link href="vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
        <link href="vendor/slick/slick.css" rel="stylesheet" media="all">
        <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
        <link href="vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

        <!-- Main CSS-->
        <link href="Admin/css/theme.css" rel="stylesheet" media="all">

    </head>

    <body >


                        <!-- END HEADER MOBILE-->

                        <!-- MENU SIDEBAR-->
                       <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
             data-sidebar-position="fixed" data-header-position="fixed">
            <jsp:include page="SlideBar.jsp"></jsp:include>
                <div class="body-wrapper">
                      <div class="main-content">
                                <div class="section__content section__content--p30">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="overview-wrap">
                                                    <h2 class="title-1">overview</h2>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row m-t-25">
                                            <div class="col-sm-6 col-lg-6">
                                                <div class="overview-item overview-item--c1">
                                                    <div class="overview__inner">
                                                        <div class="overview-box clearfix">
                                                            <div class="icon">
                                                                <i class="zmdi zmdi-account-o"></i>
                                                            </div>

                                                            <div class="text">
                                                                <h2>${totalPrice}</h2>
                                                                <span>
                                                                    Room Earnings</span>
                                                            </div>
                                                        </div>
                                                        <div class="overview-chart">
                                                            <canvas id="widgetChart1"></canvas>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 col-lg-6">
                                                <div class="overview-item overview-item--c4">
                                                    <div class="overview__inner">
                                                        <div class="overview-box clearfix">
                                                            <div class="icon">
                                                                <i class="zmdi zmdi-money"></i>
                                                            </div>
                                                            <div class="text">
                                                                <h2>${totalPrice}</h2>
                                                                <span>total earnings</span>
                                                            </div>
                                                        </div>
                                                        <div class="overview-chart">
                                                            <canvas id="widgetChart4"></canvas>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-12">
                                                <h2 class="title-1 m-b-25">Expenses by booking</h2>
                                                <form action="FilterBookingURL" method="post">
                                                    <label for="checkinDate">Start Date:</label>
                                                    <input type="date" id="checkinDate" name="checkinDate" style="margin-right: 10px">
                                                    <label for="checkoutDate">End Date:</label>
                                                    <input type="date" id="checkoutDate" name="checkoutDate" style="margin-right: 10px">
                                                    <button type="submit" class="btn btn-primary">Filter</button>
                                                </form>
                                                <div class="table-responsive table--no-card m-b-40">
                                                    <table class="table table-borderless table-striped table-earning">
                                                        <thead>
                                                            <tr>
                                                                <th>CheckIn</th>
                                                                <th>CheckOut</th>
                                                                <th>Expenses</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach items="${listB}" var="b">
                                                                <tr>
                                                                    <td>${b.checkIn}</td>
                                                                    <td>${b.checkOut}</td>
                                                                    <td>${b.expenses}</td>

                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-lg-9">
                                                <h2 class="title-1 m-b-25">Room</h2>

                                                <div class="table-responsive table--no-card m-b-40">
                                                    <table class="table table-borderless table-striped table-earning">
                                                        <thead>
                                                            <tr>
                                                                <th>Id</th>
                                                                <th>Name</th>
                                                                <th>Price</th>
                                                                <th>Status</th>
                                                                <th>Size</th>

                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach items="${listR}" var="r">
                                                                <tr>
                                                                    <td>${r.room_Id}</td>
                                                                    <td>${r.name}</td>
                                                                    <td>${r.price}</td>
                                                                    <td>${r.status}</td>
                                                                    <td>${r.size}</td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <h2 class="title-1 m-b-25">Top room</h2>
                                                <div class="au-card au-card--bg-blue au-card-top-countries m-b-40">
                                                    <div class="au-card-inner">
                                                        <div class="table-responsive">
                                                            <table class="table table-top-countries">
                                                                <tbody>
                                                                    <c:forEach items="${listT}" var="t">
                                                                        <tr>
                                                                            <td>${t.name}</td>
                                                                            <td>${t.price}</td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="copyright">
                                                
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
        </div>


                        <!-- Jquery JS-->
                        <script src="vendor/jquery-3.2.1.min.js"></script>
                        <!-- Bootstrap JS-->
                        <script src="vendor/bootstrap-4.1/popper.min.js"></script>
                        <script src="vendor/bootstrap-4.1/bootstrap.min.js"></script>
                        <!-- Vendor JS       -->
                        <script src="vendor/slick/slick.min.js">
                        </script>
                        <script src="vendor/wow/wow.min.js"></script>
                        <script src="vendor/animsition/animsition.min.js"></script>
                        <script src="vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
                        </script>
                        <script src="vendor/counter-up/jquery.waypoints.min.js"></script>
                        <script src="vendor/counter-up/jquery.counterup.min.js">
                        </script>
                        <script src="vendor/circle-progress/circle-progress.min.js"></script>
                        <script src="vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
                        <script src="vendor/chartjs/Chart.bundle.min.js"></script>
                        <script src="vendor/select2/select2.min.js">
                        </script>
 <script src="dashboard/assets/libs/jquery/dist/jquery.min.js"></script>
        <script src="dashboard/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
        <script src="dashboard/assets/js/sidebarmenu.js"></script>
        <script src="dashboard/assets/js/app.min.js"></script>
        <script src="dashboard/assets/libs/simplebar/dist/simplebar.js"></script>
                        <!-- Main JS-->
                        <script src="Admin/js/main.js"></script>

                        </body>

                        </html>
                        <!-- end document-->

                        
                        
                       