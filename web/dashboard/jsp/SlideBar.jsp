

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"/>
<style>
    .white{
        color: white;
    }
    .btn-manage:hover{
        background-color: #213e68;
        cursor: pointer;
    }
</style>
<aside class="left-sidebar" style="background-color: #213e66">
    <!-- Sidebar scroll-->
    <div>
        <div class="brand-logo d-flex align-items-center justify-content-between">
            <a href="homeController" class="text-nowrap logo-img">
                <img src="dashboard/assets/images/logos/dark-logo.svg" width="180" alt="" />
            </a>
            <div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
                <i class="ti ti-x fs-8"></i>
            </div>
        </div>
        <!-- Sidebar navigation-->
        <nav class="sidebar-nav scroll-sidebar" data-simplebar="">

            <button class="btn hide-menu" id=""><label class="white" >HOME</label></button>
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

            <button class="btn hide-menu btn-manage" id="show"><label class="white btn-manage" >MANAGER<i class="fa-solid fa-angle-down btn-manage" style="padding-left: 20px"></i></label></button>

            <ul id="sidebarnav" class="list" style="display: block">
                <li class="nav-small-cap">
                    <i class="ti ti-dots nav-small-cap-icon fs-4"></i>

                </li>


                <li class="sidebar-item">
                    <a class="sidebar-link" href="./ui-buttons.html" aria-expanded="false">
                        <span>
                            <i class="fas fa-user-circle white"></i>
                        </span>
                        <span class="hide-menu white">Manage Account</span>
                    </a>
                </li>

                <li  class="sidebar-item">
                    <a  class="sidebar-link" href="customerController" aria-expanded="false">
                        <span>
                            <i class="fa-solid fa-users white"></i>
                        </span>
                        <span class="hide-menu white">Manage Customer</span>
                    </a>
                </li>

                <li  class="sidebar-item">
                    <a  class="sidebar-link" href="itemManageURL" aria-expanded="false">
                        <span>
                            <i class="fa-solid fa-gears white"></i>
                        </span>
                        <span class="hide-menu white">Manage Item In Room</span>
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
                    <a  class="sidebar-link" href="ItemTypeController" aria-expanded="false">
                        <span>
                           <i class="fa-solid fa-cookie-bite white"></i>
                        </span>
                        <span class="hide-menu white">Manage Type Of Item</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="${pageContext.request.contextPath}/typeRoomURL" aria-expanded="false">
                        <span>
                            <i class="fas fa-hotel white"></i> 
                        </span>
                        <span class="hide-menu white">Manage Type Room</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="./ManageEvent.jsp" aria-expanded="false">
                        <span>
                            <i class="far fa-star white"></i>
                        </span>
                        <span class="hide-menu white">Manage Event</span>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- End Sidebar navigation -->
    </div>
    <!-- End Sidebar scroll-->
</aside>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script>
    $(document).ready(function () {
        $("#show").click(function () {
            $(".list").toggle();
        });
    });
</script>
