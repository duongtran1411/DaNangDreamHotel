<%-- 
    Document   : ManageRoom.jsp
    Created on : May 25, 2024, 5:34:17 PM
    Author     : Sơnnnn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Da Nang Hotel</title>
        <link rel="shortcut icon" type="image/png" href="../assets/images/logos/favicon.png" />
        <link rel="stylesheet" href="../assets/css/styles.min.css" />
        <link rel="stylesheet" href="../assets/css/styles.css" />

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>

    <body>
        <!--  Body Wrapper -->
        <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
             data-sidebar-position="fixed" data-header-position="fixed">
            <!-- Sidebar Start -->
            <jsp:include page="SlideBar.jsp"></jsp:include>
                <!--  Sidebar End -->

                <!--  Main wrapper -->
                <div class="body-wrapper">
                    <!--  Header Start -->
                    <header class="app-header">
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <ul class="navbar-nav">
                                <li class="nav-item d-block d-xl-none">
                                    <a class="nav-link sidebartoggler nav-icon-hover" id="headerCollapse" href="javascript:void(0)">
                                        <i class="ti ti-menu-2"></i>
                                    </a>
                                </li>
                            </ul>
                            <div class="navbar-collapse justify-content-end px-0" id="navbarNav">
                                <ul class="navbar-nav flex-row ms-auto align-items-center justify-content-end">
                                    <li class="nav-item dropdown">
                                        <a class="nav-link nav-icon-hover" style="margin-right: 120px" href="javascript:void(0)" id="drop2" data-bs-toggle="dropdown"
                                           aria-expanded="false">
                                            <img src="../assets/images/profile/user-1.jpg" alt="" width="35" height="35" class="rounded-circle">
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up" aria-labelledby="drop2">
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
                                                <a href="./authentication-login.html" class="btn btn-outline-primary mx-3 mt-2 d-block">Logout</a>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </nav>
                    </header>
                    <!--  Header End -->
                    <div class="container-fluid">
                        <div class="modal" id="myModal">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <!--<div class="card" style="width: 18rem;">-->
                                    <div class="d-flex justify-content-center">
                                        <img src="../assets/images/profile/user-1.jpg" class="card-img" alt="..." style="width: 60%">
                                    </div>
                                    <div class="card-body" style="text-align: center">
                                        <h2 class="card-header">PROFILE</h2>
                                    </div>
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item" style="font-size: 1.1rem"><strong>Name: </strong> Nguyen Thai Son</li>
                                        <li class="list-group-item" style="font-size: 1.1rem"><strong>Phone: </strong> 012939182</li>
                                        <li class="list-group-item" style="font-size: 1.1rem"><strong>Email: </strong>: sonnthe123@gmail.com</li>
                                    </ul>
                                    <div style="align-content: center; justify-content: center">
                                        <input type="submit">
                                    </div>
                                    <!--</div>-->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <section class="rooms-section spad">
                <div class="container">
                    <div class="row">                 
                        <c:forEach items="${listRoom}" var="o">
                        <div class="col-lg-3 col-md-6 d-flex justify-content-center">
                            <div class="room-item" style="border: 1.5px solid gainsboro; border-radius: 15px; overflow: hidden; display: flex; flex-direction: column; align-items: center; width: 100%; max-width: 400px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.4); position: relative;">
                                <img src="https://flchotelsresorts.com/images/hotels/rooms/original/2c5a0001_1663841903.jpg" style="width: 100%; border-radius: 15px 15px 0 0;" alt="">
                                <div class="ri-text" style="padding: 10px; text-align: left; width: 100%;">
                                    <h4 class="text-center">LUXURY</h4>
                                    <div class="content-icon d-flex align-items-between justify-content-between" style="font-size: 0.9em;">
                                        <div style="display: flex; align-items: center; justify-content: center; margin-top: 10px;">
                                            <i class="fa fa-users" aria-hidden="true" style="margin-right: 8px; font-size: 1.2em;"></i>
                                            <span>02 Adults</span>
                                        </div>
                                        <div style="display: flex; align-items: center; justify-content: center; margin-top: 10px;">
                                            <i class="fa fa-bed" aria-hidden="true" style="margin-right: 8px; font-size: 1.2em;"></i>
                                            <span>01 Double Bed</span>
                                        </div>
                                        <div style="display: flex; align-items: center; justify-content: center; margin-top: 10px;">
                                            <i class="fa fa-bath" aria-hidden="true" style="margin-right: 8px; font-size: 1.2em;"></i>
                                            <span>01 Bath</span>
                                        </div>
                                    </div>
                                    <a href="#" class="position-absolute bottom-0 start-0 text-decoration-none" style="margin: 5px;">DETAIL</a>
                                    <a href="#" class="position-absolute bottom-0 end-0 text-decoration-none" style="margin: 5px;">EDIT</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>  
                </div>
            </div>
        </section>



        <script src="../assets/libs/jquery/dist/jquery.min.js"></script>
        <script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
        <script src="../assets/js/sidebarmenu.js"></script>
        <script src="../assets/js/app.min.js"></script>
        <script src="../assets/libs/simplebar/dist/simplebar.js"></script>
    </body>

</html>