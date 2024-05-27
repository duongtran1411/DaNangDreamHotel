<%-- 
    Document   : ManageEvent
    Created on : May 27, 2024, 2:35:59 PM
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
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

    </head>

    <body>
        <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
             data-sidebar-position="fixed" data-header-position="fixed">
            <jsp:include page="SlideBar.jsp"></jsp:include>
                <div class="body-wrapper">
                <jsp:include page="Profile.jsp"></jsp:include>
                    <div class="card">
                        <div class="card-body">
                            <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#addRoomModal">
                                <p class="mb-0 fs-3"><i class="ti ti-plus fs-6"></i>New Event</p>                  
                            </button>
                            <div class="container-fluid">
                                <div class="table-wrapper">
                                    <div class="table-title" style="background-color: #000">                 
                                    </div>
                                    <table class="table table-striped table-hover">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Type</th>
                                                <th>Floor</th>
                                                <th>NoP</th>
                                                <th>Bed</th>
                                                <th>Bath</th>
                                                <th>Price</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${listUsers}" var="o">
                                        <tr>
                                            <th scope="row">${o.userID}</th>
                                            <td>${o.userName}</td>
                                            <td>${o.userName}</td>
                                            <td>${o.password}</td>
                                            <td>${o.email}</td>
                                            <td>${o.phone}</td>
                                            <td>o.roleID</td>
                                            <td>
                                                <a href="DeleteUser?userID=${o.userID}" title="Delete" data-toggle="tooltip"><i class="ti ti-pencil fs-7"></i></a>
                                                <a href="LoadEditUser?userID=${o.userID}"  title="Settings" data-toggle="tooltip"><i class="ti ti-trash-off fs-7" style="color: red"></i></a>
                                            </td>
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

        <!--MODAL FADE-->
        <div class="container-fluid">
            <div class="modal fade" id="addRoomModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="addProduct" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">New Event</h4>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <label>Name</label>
                                    <input name="productName" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Price</label>
                                    <input name="price" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Img</label>
                                    <input name="img" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <input name="description" type="text" class="form-control" required>
                                </div>					
                                <div class="form-group">
                                    <label>Category</label>
                                    <select name="category" class="form-select">
                                        <c:forEach items="${listCate}" var="o">
                                            <option value="${o.categoryID}">${o.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>					
                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-bs-dismiss="modal" value="Cancel">
                                <input type="submit" class="btn btn-success" value="Add">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="../assets/libs/jquery/dist/jquery.min.js"></script>
        <script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
        <script src="../assets/js/sidebarmenu.js"></script>
        <script src="../assets/js/app.min.js"></script>
        <script src="../assets/libs/simplebar/dist/simplebar.js"></script>
    </body>

</html>