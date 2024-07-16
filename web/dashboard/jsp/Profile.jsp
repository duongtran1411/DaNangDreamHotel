<%-- 
    Document   : Profile.jsp
    Created on : May 26, 2024, 8:07:57 PM
    Author     : Sơnnnn
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Entity.RegistrationDTO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<!--  Header Start -->
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
    }
</style>

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
                <li class="dropdown">
                    <div class="profile-image-container">
                        <a href="javascript:void(0)">
                            <img src="dashboard/assets/images/profile/user-1.jpg" alt="" width="35" height="35" class="rounded-circle">
                        </a>
                        <div class="dropdown-menu profile-dropdown dropdown-menu-end" aria-labelledby="drop2">
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
                </div>
                <div class="card-body" style="text-align: center">
                    <h2 class="card-header">PROFILE</h2>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item" style="font-size: 1.1rem"><strong>Name: </strong> Nguyen Thai Son</li>
                    <li class="list-group-item" style="font-size: 1.1rem"><strong>Phone: </strong> 012939182</li>
                    <li class="list-group-item" style="font-size: 1.1rem"><strong>Email: </strong> sonnthe123@gmail.com</li>
                </ul>
                <form action="profileURL" method="post" enctype="multipart/form-data">
                    <div class="d-flex justify-content-center mt-3">
                        <input id="fileAva" name="fileAva" style="width: 60%; margin-bottom: 21px" type="file" class="form-control">
                        <button type="submit" style="margin-left: 11px; width: 20%; height: 39px" class="btn btn-primary">Save</button>
                    </div>
                </form>
            </div> 
        </div>
    </div>
</div>
