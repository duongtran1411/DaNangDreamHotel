<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Edit Utilities</title>
        <link rel="shortcut icon" type="image/png" href="dashboard/assets/images/logos/favicon.png" />
        <link rel="stylesheet" href="dashboard/assets/css/styles.min.css" />
        <link rel="stylesheet" href="dashboard/assets/css/styles.css" />
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    </head>

    <body>
        <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
             data-sidebar-position="fixed" data-header-position="fixed">
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title">Edit Utilities</h3>
                    <form action="EditUtilitiesControllerURL" method="post">
                        <input type="hidden" name="id" value="${u.utilities_Id}" />
                        <div class="form-group">
                            <label>Name</label>
                            <input name="name" type="text" class="form-control" value="${u.name}" required>
                        </div>
          
                        <div class="form-group">
                            <label>Description</label>
                            <input name="description" type="text" class="form-control" value="${u.description}" required>
                        </div>
                        <div class="form-group">
                            <label>Time</label>
                            <input name="time" type="text" class="form-control" value="${u.time}" required>
                        </div>
                        <div class="form-group">
                            <label>Location</label>
                            <input name="location" type="text" class="form-control" value="${u.location}" required>
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
