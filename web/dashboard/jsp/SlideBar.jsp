<%-- 
    Document   : SlideBar
    Created on : May 25, 2024, 5:31:12 PM
    Author     : Sơnnnn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<aside class="left-sidebar">
    <!-- Sidebar scroll-->
    <div>
        <div class="brand-logo d-flex align-items-center justify-content-between">
            <a href="../../Rooms.jsp" class="text-nowrap logo-img">
                <img src="dashboard/assets/images/logos/dark-logo.svg" width="180" alt="" />
            </a>
            <div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
                <i class="ti ti-x fs-8"></i>
            </div>
        </div>
        <!-- Sidebar navigation-->
        <nav class="sidebar-nav scroll-sidebar" data-simplebar="">
            <ul id="sidebarnav">

            <button class="btn hide-menu" id=""><a href="homeController" style="color: white">HOME</a></button>
            <ul class="nav-small-cap">
                <li class="sidebar-item">
                    <a class="sidebar-link" href="./index.html" aria-expanded="false">
                        <span>
                            <i class="ti ti-layout-dashboard white"></i>
                        </span>
                        <span class="hide-menu white">Dashboard</span>
                    </a>
                </li>
            </ul>

            <button class="btn hide-menu btn-manage btnshow" id="show"><label class="white btn-manage" >MANAGER<i class="fa-solid fa-angle-down btn-manage" style="padding-left: 20px"></i></label></button>

            <ul id="sidebarnav" class="list" style="display: block">
                <li class="nav-small-cap">
                    <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                    <span class="hide-menu">Home</span>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="./index.html" aria-expanded="false">
               <c:if test="${sessionScope.acc.role_Id == 2}">
                <li  class="sidebar-item">
                    <a  class="sidebar-link" href="customerController" aria-expanded="false">
                        <span>
                            <i class="ti ti-layout-dashboard"></i>
                        </span>
                        <span class="hide-menu">Dashboard</span>
                    </a>
                </li>
                <li class="nav-small-cap">
                    <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                    <span class="hide-menu">MANAGER</span>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="./ui-buttons.html" aria-expanded="false">
                        <span>
                            <i class="fas fa-user-circle"></i>
                        </span>
                        <span class="hide-menu">Manage Account</span>
                    </a>
                </li>
                <li  class="sidebar-item">
                    <a  class="sidebar-link" href="ItemController" aria-expanded="false">
                        <span>
                            <i class="fa-solid fa-store white"></i>
                        </span>
                        <span class="hide-menu white">Manage Item</span>
                    </a>
                </li>
                <li  class="sidebar-item">
                    <a  class="sidebar-link" href="useSuppliesURL" aria-expanded="false">
                        <span>
                            <i class="fa-solid fa-store white"></i>
                        </span>
                        <span class="hide-menu white">CheckOut</span>
                    </a>
                </li>
                <li  class="sidebar-item">
                    <a  class="sidebar-link" href="ItemTypeController" aria-expanded="false">
                        <span>
                            <i class="fa-solid fa-cookie-bite white"></i>
                        </span>
                        <span class="hide-menu white">Manage Type Of Item</span>
                    </a>
                </li>
                <li  class="sidebar-item">
                    <a  class="sidebar-link" href="statusRoomController" aria-expanded="false">
                        <span>
                            <i class="fa-solid fa-map white"></i>
                        </span>
                        <span class="hide-menu white">Room Diagram</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="${pageContext.request.contextPath}/bookingURL" aria-expanded="false">
                        <span>
                            <i class="fa fa-address-card white" aria-hidden="true"></i>
                        </span>
                        <span class="hide-menu white">Manage Booking</span>
                    </a>
                </li>
                </c:if>
                <c:if test="${acc.role_Id == 3}">
                <li class="sidebar-item">
                    <a class="sidebar-link" href="${pageContext.request.contextPath}/typeRoomURL" aria-expanded="false">
                        <span>
                            <i class="fas fa-hotel"></i> 
                        </span>
                        <span class="hide-menu">Manage Type Room</span>
                        <span class="hide-menu white">Manage Type Room</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="${pageContext.request.contextPath}/ManageEventControllerURL" aria-expanded="false">
                        <span>
                            <i class="far fa-star white"></i>
                        </span>
                        <span class="hide-menu white">Manage Event</span>
                    </a>
                </li>
                </c:if>
                <c:if test="${sessionScope.acc.role_Id == 1}">
                <li class="sidebar-item">
                    <a class="sidebar-link" href="${pageContext.request.contextPath}/ManageAccountControllerURL" aria-expanded="false">
                        <span>
                            <i class="fa-solid fa-user white"></i>
                        </span>
                        <span class="hide-menu white">Manage Account</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="./ManageEvent.jsp" aria-expanded="false">
                        <span>
                            <i class="far fa-star"></i>
                        </span>
                        <span class="hide-menu">Manage Event</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="./ui-forms.html" aria-expanded="false">
                        <span>
                            <i class="ti ti-file-description"></i>
                        </span>
                        <span class="hide-menu">Forms</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="./ui-typography.html" aria-expanded="false">
                        <span>
                            <i class="ti ti-typography"></i>
                        </span>
                        <span class="hide-menu">Typography</span>
                    </a>
                </li>                            
                <li class="nav-small-cap">
                    <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                    <span class="hide-menu">EXTRA</span>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="./icon-tabler.html" aria-expanded="false">
                        <span>
                            <i class="ti ti-mood-happy"></i>
                        </span>
                        <span class="hide-menu">Icons</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="./sample-page.html" aria-expanded="false">
                        <span>
                            <i class="ti ti-aperture"></i>
                        </span>
                        <span class="hide-menu">Sample Page</span>
                    </a>
                </li>
                </c:if>
                
            </ul>
        </nav>
        <!-- End Sidebar navigation -->
    </div>
    <!-- End Sidebar scroll-->
</aside>
