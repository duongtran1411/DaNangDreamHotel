<%-- 
    Document   : EditEvent
    Created on : May 30, 2024, 8:15:06 PM
    Author     : PC QUANG MINH
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Da Nang Dream Hotel</title>
        <link rel="icon" href="img/title_danangdream.jpg" type="image/x-icon"/>
    <link rel="shortcut icon" type="image/png" href="dashboard/assets/images/logos/favicon.png" />
    <link rel="stylesheet" href="dashboard/assets/css/styles.min.css" />
    <link rel="stylesheet" href="dashboard/assets/css/styles.css" />
    <link rel="icon" href="img/title_danangdream.jpg" type="image/x-icon"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
</head>

<body>
    <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
         data-sidebar-position="fixed" data-header-position="fixed">
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title">Edit Account</h3>
                       <form action="EditEventControllerURL" method="post">
                    <input type="hidden" name="event_Id" value="${event.event_Id}" />
                    <div class="form-group">
                        <label>Name</label>
                        <input name="name" type="text" class="form-control" value="${event.name}" required>
                    </div>
                    <div class="form-group">
                        <label>Image</label>
                        <input name="image" type="text" class="form-control" value="${event.image}" required>
                    </div>
                    <div class="form-group">
                        <label>StartDay</label>
                        <input name="start" type="date" class="form-control" value="${event.startDay}" required>
                    </div>
                    <div class="form-group">
                        <label>EndDay</label>
                        <input name="end" type="date" class="form-control" value="${event.endDay}" required>
                    </div>
                    <div class="form-group">
                        <label>Description</label>
                        <input name="description" type="text" class="form-control" value="${event.description}" required>
                    </div>
                    <div class="form-group">
                        <label>Discount</label>
                        <input name="discount" type="text" class="form-control" value="${event.discount}" required>
                    </div>
                    <div class="form-group">
                        <label>Voucher</label>
                        <input name="voucher" type="text" class="form-control" value="${event.voucher}" required>
                    </div>
                 
                        <input type="submit" class="btn btn-success" value="Edit">
                </form>
                </div>
            </div>
        </div>
    </div>
    <script src="dashboard/assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="dashboard/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="dashboard/assets/js/sidebarmenu.js"></script>
    <script src="dashboard/assets/js/app.min.js"></script>
    <script src="dashboard/assets/libs/simplebar/dist/simplebar.js"></script>
</body>
</html>

