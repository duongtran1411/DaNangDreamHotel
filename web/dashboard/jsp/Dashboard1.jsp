<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="Entity.FormatUtils" %>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
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
              <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- Main CSS-->
        <link href="Admin/css/theme.css" rel="stylesheet" media="all">
        <style>
            .profile-image-container {
                position: relative;
                display: inline-block;
            }
            .profile-dropdown {
                position: absolute;
                top: 100%;
                right: 0;
                z-index: 1000;
                display: none;
            }
            .profile-image-container:hover .profile-dropdown {
                display: block;
                margin-right: 200px;
            }
        </style>
    </head>

    <body>
        <!-- END HEADER MOBILE-->

        <!-- MENU SIDEBAR-->
        <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed">
            <div class="sidebar">
                <jsp:include page="SlideBar.jsp"></jsp:include>
                </div>

                <div class="body-wrapper">
<<<<<<< HEAD
                <jsp:include page="Profile.jsp"></jsp:include>
                    <div class="card">
                        <div class="card-body">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="overview-wrap">
                                            <h2 class="title-1">overview</h2>
                                        </div>
                                    </div>
                                </div>
                                <div class="row m-t-25">
                                    <div class="col-sm-4 col-lg-4">
                                        <div class="overview-item overview-item--c1">
                                            <div class="overview__inner">
                                                <div class="overview-box clearfix">
                                                    <div class="icon">
                                                        <i class="zmdi zmdi-account-o"></i>
                                                    </div>

                                                    <div class="text">
                                                        <h2><fmt:formatNumber value="${totalPrice}"/></h2>
                                                    <span>
                                                        Room Earnings</span>
=======
                    <header class="app-header">
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <ul class="navbar-nav">
                                <li class="nav-item d-block d-xl-none">
                                    <a class="nav-link sidebartoggler nav-icon-hover" id="headerCollapse" href="javascript:void(0)">
                                        <i class="ti ti-menu-2"></i>
                                    </a>
                                </li>
                            </ul>
                            <div class="navbar-collapse justify-content-end px-0" id="navbarNav" >
                                <ul class="navbar-nav flex-row ms-auto align-items-center justify-content-end">
                                    <li class="dropdown">
                                        <div class="profile-image-container">
                                            <a href="javascript:void(0)">
                                                <img src="dashboard/assets/images/profile/user-1.jpg" alt="" width="35" height="35" class="rounded-circle">
                                            </a>
                                            <div class="dropdown-menu profile-dropdown dropdown-menu-end" aria-labelledby="drop2" style="margin-right: 200px">
                                                <div class="message-body">
                                                    <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#myModal">
                                                        <p class="mb-0 fs-3"><i class="ti ti-user fs-6"></i>My Profile</p>
                                                    </button>
                                                    <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#myModal">
                                                        <p class="mb-0 fs-3"><i class="ti ti-mail fs-6"></i>My Account</p>
                                                    </button>
                                                    <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#myModal">
                                                        <p class="mb-0 fs-3"><i class="ti ti-list-check fs-6"></i>My Task</p>
                                                    </button>
                                                    <a href="logoutURL" class="btn btn-outline-primary mx-3 mt-2 d-block">Logout</a>
>>>>>>> f6445d82bc5472ac1da5922d4456604306dd8c1d
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </nav>
                    </header>
                    <!--  Header End -->
                    <div class="container">
                        <div class="modal" id="myModal">
                            <div class="modal-dialog">
                                <div class="modal-content">                         
                                </div>
<<<<<<< HEAD
                                <div class="col-sm-4 col-lg-4">
                                    <div class="overview-item overview-item--c1">
                                        <div class="overview__inner">
                                            <div class="overview-box clearfix">
                                                <div class="icon">
                                                    <i class="zmdi zmdi-account-o"></i>
                                                </div>

                                                <div class="text">
                                                    <h2><fmt:formatNumber value="${totalPriceItem}"/></h2>
                                                    <span>
                                                        Room Earnings By Item</span>
                                                </div>
=======
                                <div class="card-body" style="text-align: center">
                                    <h2 class="card-header">PROFILE</h2>
                                </div>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item" style="font-size: 1.1rem"><strong>Name: </strong>${sessionScope.acc.firstName} ${sessionScope.acc.lastName}</li>
                                <li class="list-group-item" style="font-size: 1.1rem"><strong>Phone: </strong>${sessionScope.acc.phone}</li>
                                <li class="list-group-item" style="font-size: 1.1rem"><strong>Email: </strong>${sessionScope.acc.email}</li>
                            </ul>
                        </div> 
                    </div>
                </div>
            </div>
            <div class="main-content">
                <div class="section__content section__content--p30" style="padding-left: 280px">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="overview-wrap">
                                    <h2 class="title-1">overview</h2>
                                </div>
                            </div>
                        </div>
                        <div class="row m-t-25">
                            <div class="col-sm-4 col-lg-4">
                                <div class="overview-item overview-item--c1">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <div class="icon">
                                                <i class="zmdi zmdi-account-o"></i>
>>>>>>> f6445d82bc5472ac1da5922d4456604306dd8c1d
                                            </div>
                                            <div class="text">
                                                <h2>${FormatUtils.formatPRice(totalPrice)}vnd</h2>
                                                <span>
                                                    Room Earnings</span>
                                            </div>
                                        </div>
<<<<<<< HEAD
                                    </div>
                                </div>
                                <div class="col-sm-4 col-lg-4">
                                    <div class="overview-item overview-item--c4">
                                        <div class="overview__inner">
                                            <div class="overview-box clearfix">
                                                <div class="icon">
                                                    <i class="zmdi zmdi-money"></i>
                                                </div>
                                                <div class="text">
                                                    <h2><fmt:formatNumber value="${totalPrice+totalPriceItem}"/></h2>
                                                    <span>total earnings</span>
                                                </div>
                                            </div>
                                            <div class="overview-chart">
                                                <canvas id="widgetChart4"></canvas>
                                            </div>
=======
                                        <div class="overview-chart">
                                            <canvas id="widgetChart1"></canvas>
>>>>>>> f6445d82bc5472ac1da5922d4456604306dd8c1d
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4 col-lg-4">
                                <div class="overview-item overview-item--c1">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <div class="icon">
                                                <i class="zmdi zmdi-account-o"></i>
                                            </div>

<<<<<<< HEAD
                            <div class="row">
                                <div class="col-lg-12">
                                    <h2 class="title-1 m-b-25">Expenses by booking</h2>
                                    <form action="AdminControllerURL" method="get" onsubmit="return validateDates()">
                                        <label for="checkinDate">Start Date:</label>
                                        <input type="date" id="checkinDate" name="checkinDate" style="margin-right: 10px"
                                               value="${param.checkinDate != null ? param.checkinDate : ''}">
                                        <label for="checkoutDate">End Date:</label>
                                        <input type="date" id="checkoutDate" name="checkoutDate" style="margin-right: 10px"
                                               value="${param.checkoutDate != null ? param.checkoutDate : ''}">
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
                                                        <td><fmt:formatNumber value="${b.expenses}"/></td>

                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
=======
                                            <div class="text">
                                                <h2>${FormatUtils.formatPRice(totalPriceItem)} vnd</h2>
                                                <span>
                                                    Room Earnings By Item</span>
                                            </div>
                                        </div>
                                        <div class="overview-chart">
                                            <canvas id="widgetChart1"></canvas>
                                        </div>
>>>>>>> f6445d82bc5472ac1da5922d4456604306dd8c1d
                                    </div>
                                </div>
                            </div>
<<<<<<< HEAD
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
                                                        <td><fmt:formatNumber value="${r.price}"/></td>
                                                        <td>${r.status}</td>
                                                        <td>${r.size}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>

                                    <!-- Pagination Controls -->
                                    <nav aria-label="Page navigation">
                                        <ul class="pagination">
                                            <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                                <a class="page-link" href="?page=${currentPage - 1}" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                            <c:forEach var="i" begin="1" end="${noOfPages}">
                                                <li class="page-item ${currentPage == i ? 'active' : ''}">
                                                    <a class="page-link" href="?page=${i}">${i}</a>
                                                </li>
                                            </c:forEach>
                                            <li class="page-item ${currentPage == noOfPages ? 'disabled' : ''}">
                                                <a class="page-link" href="?page=${currentPage + 1}" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
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
                                                                <td><fmt:formatNumber value="${t.price}"/></td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <!-- Pagination Controls for Top Rooms -->
                                            <nav aria-label="Top room page navigation">
                                                <ul class="pagination">
                                                    <li class="page-item ${currentTopPage == 1 ? 'disabled' : ''}">
                                                        <a class="page-link" href="?topPage=${currentTopPage - 1}" aria-label="Previous">
                                                            <span aria-hidden="true">&laquo;</span>
                                                        </a>
                                                    </li>
                                                    <c:forEach var="i" begin="1" end="${noOfTopPages}">
                                                        <li class="page-item ${currentTopPage == i ? 'active' : ''}">
                                                            <a class="page-link" href="?topPage=${i}">${i}</a>
                                                        </li>
=======
                            <div class="col-sm-4 col-lg-4">
                                <div class="overview-item overview-item--c4">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <div class="icon">
                                                <i class="zmdi zmdi-money"></i>
                                            </div>
                                            <div class="text">
                                                <h2>${FormatUtils.formatPRice(totalPrice+totalPriceItem)} vnd</h2>
                                                <span>Total Earnings</span>
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
                                <form action="AdminControllerURL" method="get" onsubmit="return validateDates()">
                                    <label for="checkinDate">Start Date:</label>
                                    <input type="date" id="checkinDate" name="checkinDate" style="margin-right: 10px"
                                           value="${param.checkinDate != null ? param.checkinDate : ''}">
                                    <label for="checkoutDate">End Date:</label>
                                    <input type="date" id="checkoutDate" name="checkoutDate" style="margin-right: 10px"
                                           value="${param.checkoutDate != null ? param.checkoutDate : ''}">
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
                                                    <td>${FormatUtils.formatPRice(r.price)}</td>
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
                                                            <td>${FormatUtils.formatPRice(t.price)}</td>
                                                        </tr>
>>>>>>> f6445d82bc5472ac1da5922d4456604306dd8c1d
                                                    </c:forEach>
                                                    <li class="page-item ${currentTopPage == noOfTopPages ? 'disabled' : ''}">
                                                        <a class="page-link" href="?topPage=${currentTopPage + 1}" aria-label="Next">
                                                            <span aria-hidden="true">&raquo;</span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </nav>
                                        </div>
                                    </div>
                                </div>
<<<<<<< HEAD

                            </div>
                           <div class="row">
    <div class="col-md-12">
        <form method="get" action="AdminControllerURL">
            <div class="form-group">
                <label for="searchName">Search by Room Name:</label>
                <input type="text" class="form-control" id="searchName" name="searchName">
            </div>
            <button type="submit" class="btn btn-primary">Search</button>
        </form>
 
        <div class="copyright">
            <div class="table-responsive table--no-card m-b-40">
                <table class="table table-borderless table-striped table-earning">
                    <thead>
                        <tr>
                            <th>RoomName</th>
                            <th>ItemName</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listI}" var="i">
                            <tr>
                                <td>${i.getRoomName()}</td>
                                <td>${i.getItemName()}</td>
                                <td><fmt:formatNumber value="${i.getItempPrice()}" type="number" /></td>
                                <td>${i.getQuantity() }</td>
                                <td><fmt:formatNumber value="${i.getQuantity() * i.getItempPrice()}" type="number" /></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
           <!-- Pagination controls for items -->
<!-- Pagination controls for items -->
<nav aria-label="Page navigation">
    <ul class="pagination">
        <c:if test="${currentItemPage > 1}">
            <li class="page-item">
                <a class="page-link" href="?searchName=${param.searchName}&itemPage=${currentItemPage - 1}" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
        </c:if>
        <c:forEach var="i" begin="1" end="${noOfItemPages}">
            <li class="page-item <c:if test="${i == currentItemPage}">active</c:if>">
                <a class="page-link" href="?searchName=${param.searchName}&itemPage=${i}">${i}</a>
            </li>
        </c:forEach>
        <c:if test="${currentItemPage < noOfItemPages}">
            <li class="page-item">
                <a class="page-link" href="?searchName=${param.searchName}&itemPage=${currentItemPage + 1}" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </c:if>
    </ul>
</nav>


        </div>
    </div>
</div>

            </div>
            <script>
                function validateDates() {
                    var checkinDate = document.getElementById('checkinDate').value;
                    var checkoutDate = document.getElementById('checkoutDate').value;
=======
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <form method="get" action="AdminControllerURL">
                                    <div class="form-group">
                                        <label for="searchName">Search by Room Name:</label>
                                        <input type="text" class="form-control" id="searchName" name="searchName">
                                    </div>
                                    <button type="submit" class="btn btn-primary">Search</button>
                                </form> 
                                <div class="copyright">
                                    <div class="table-responsive table--no-card m-b-40">
                                        <table class="table table-borderless table-striped table-earning">
                                            <thead>
                                                <tr>
                                                    <th>RoomName</th>
                                                    <th>ItemName</th>
                                                    <th>Price</th>
                                                    <th>Quantity</th>
                                                    <th>Total</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${listI}" var="i">
                                                    <tr>
                                                        <td>${i.getRoomName()}</td>
                                                        <td>${i.getItemName()}</td>
                                                        <td>${FormatUtils.formatPRice(i.getItempPrice())}</td>
                                                        <td>${i.getQuantity()}</td>
                                                        <td>${FormatUtils.formatPRice(i.getQuantity() * i.getItempPrice())}</td>

                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>                           
    <script>
        function validateDates() {
            var checkinDate = document.getElementById('checkinDate').value;
            var checkoutDate = document.getElementById('checkoutDate').value;

            if (checkinDate && checkoutDate && checkinDate > checkoutDate) {
                alert('Start Date must be before End Date. Please select the dates again.');
                return false;
            }
            return true;
        }
    </script>
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
>>>>>>> f6445d82bc5472ac1da5922d4456604306dd8c1d

</body>

</html>
<!-- end document-->



