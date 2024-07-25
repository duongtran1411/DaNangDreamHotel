

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"/>
<style>
    .white{
        color: white;
    }
    .btn-manage:hover{
        background-color: #213e68;
        cursor: pointer;
    }
    .btnshow{
        border: solid 1px #ffffff
    }

   
    ::-webkit-scrollbar {
        width: 12px; 
    }

  
    ::-webkit-scrollbar-track {
        background: #f1f1f1; 
        border-radius: 10px; 
    }

    
    ::-webkit-scrollbar-thumb {
        background: #888; 
        border-radius: 10px;
        overflow: hidden;
    }

   
    ::-webkit-scrollbar-thumb:hover {
        background: #555; 
    }



</style>
<aside class="left-sidebar" style="background-color: #213e66;height: 100%" >
    <!-- Sidebar scroll-->
    <div>
        <!-- Sidebar navigation-->
        <nav class="sidebar-nav scroll-sidebar" data-simplebar="">
            <ul class="nav-small-cap">
                <li class="sidebar-item">
                    <a class="sidebar-link" href="${pageContext.request.contextPath}/AdminControllerURL" aria-expanded="false">
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

                </li>
                <c:if test="${sessionScope.acc.role_Id == 2}">
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
                            <i class="fas fa-hotel white"></i> 
                        </span>
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
                    <a class="sidebar-link" href="${pageContext.request.contextPath}/ManagerJobsControllerURL" aria-expanded="false">
                        <span>
                            <i class="fa-solid fa-user white"></i>
                        </span>
                        <span class="hide-menu white">Manage Jobs</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="${pageContext.request.contextPath}/ManageUtilitiesController" aria-expanded="false">
                        <span>
                            <i class="fa fa-address-card white" aria-hidden="true"></i>
                        </span>
                        <span class="hide-menu white">Manage Service</span>
                    </a>
                </li>
                </c:if>
                
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
