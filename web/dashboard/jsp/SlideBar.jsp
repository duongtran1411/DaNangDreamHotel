

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<aside class="left-sidebar">
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
            <ul id="sidebarnav">
                <li class="nav-small-cap">
                    <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                    <span class="hide-menu">Home</span>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="./index.html" aria-expanded="false">
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

                <c:if test="${sessionScope.acc.role_Id == 1}" >
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="./ui-buttons.html" aria-expanded="false">
                            <span>
                                <i class="fas fa-user-circle"></i>
                            </span>
                            <span class="hide-menu">Manage Account</span>
                        </a>
                    </li>
                </c:if>

                <c:if test="${sessionScope.acc.role_Id == 2}" >  
                   <li class="sidebar-item">
                    <a class="sidebar-link" href="./ui-buttons.html" aria-expanded="false">
                        <span>
                            <i class="fas fa-hotel"></i> 
                        </span>
                        <span class="hide-menu">Manage Type Room</span>
                    </a>
                </li>
                </c:if>
                <li  class="sidebar-item">
                    <a  class="sidebar-link" href="customerController" aria-expanded="false">
                        <span>
                            <i class="fas fa-user-circle"></i>
                        </span>
                        <span class="hide-menu">Manage Customer</span>
                    </a>
                </li>

                <li  class="sidebar-item">
                    <a  class="sidebar-link" href="itemManageURL" aria-expanded="false">
                        <span>
                            <i class="fas fa-user-circle"></i>
                        </span>
                        <span class="hide-menu">Manage Item In Room</span>
                    </a>
                </li>
                <li  class="sidebar-item">
                    <a  class="sidebar-link" href="ItemController" aria-expanded="false">
                        <span>
                            <i class="fas fa-user-circle"></i>
                        </span>
                        <span class="hide-menu">Manage Item</span>
                    </a>
                </li>
                <li  class="sidebar-item">
                    <a  class="sidebar-link" href="ItemTypeController" aria-expanded="false">
                        <span>
                            <i class="fas fa-user-circle"></i>
                        </span>
                        <span class="hide-menu">Manage Type Of Item</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="${pageContext.request.contextPath}/typeRoomURL" aria-expanded="false">
                        <span>
                            <i class="fas fa-user-circle"></i>
                        </span>
                        <span class="hide-menu">Manage Items In Room</span>
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
            </ul>
        </nav>
        <!-- End Sidebar navigation -->
    </div>
    <!-- End Sidebar scroll-->
</aside>
