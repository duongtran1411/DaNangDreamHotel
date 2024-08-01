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
                    <form action="EditAccountControllerURL" method="post">
                        <input type="hidden" name="account_Id" value="${account.account_Id}" />
                        <div class="form-group">
                            <label>Username</label>
                            <input name="userName" type="text" class="form-control" value="${account.userName}" required>
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input name="password" type="password" class="form-control" value="${account.password}" required>
                        </div>
                        <div class="form-group">
                            <label>First Name</label>
                            <input name="firstName" type="text" class="form-control" value="${account.firstName}" required>
                        </div>
                        <div class="form-group">
                            <label>Last Name</label>
                            <input name="lastName" type="text" class="form-control" value="${account.lastName}" required>
                        </div>
                        <div class="form-group">
                            <label>Email</label>
                            <input name="email" type="email" class="form-control" value="${account.email}" required>
                        </div>
                        <div class="form-group">
                            <label>Phone</label>
                            <input name="phone" type="text" class="form-control" value="${account.phone}" required>
                        </div>

                                <input type="submit" class="btn btn-success" value="Edit" >
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
