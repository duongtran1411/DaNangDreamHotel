<%-- 
    Document   : ManageRoom
    Created on : May 26, 2024, 5:49:23 PM
    Author     : Sơnnnn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Da Nang Hotel</title>
        <link rel="icon" href="img/title_danangdream.jpg" type="image/x-icon"/>
        <link rel="shortcut icon" type="image/png" href="dashboard/assets/images/logos/favicon.png" />
        <link rel="stylesheet" href="dashboard/assets/css/styles.min.css" />
        <link rel="stylesheet" href="dashboard/assets/css/styles.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>

    </head>

    <body>
        <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
             data-sidebar-position="fixed" data-header-position="fixed">
            <jsp:include page="SlideBar.jsp"></jsp:include>
                <div class="body-wrapper">
                <jsp:include page="Profile.jsp"></jsp:include>
                    <div class="card">
                        <div class="card-body">
             
                        <div class="container-fluid" style="height: 800px;width: 1300px;">

                            <!-- Page Heading -->
                            <h1 class="h3 mb-2 text-gray-800">Table Rooms</h1>
                            <div class="card shadow mb-4">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>Action</th>
                                                    <th>Floor</th>
                                                    <th>Name
                                                    </th>
                                                    <th>Price
                                                    </th>
                                                    <th>Size</th>
                                                </tr>
                                            </thead>
                                            <tbody id="content">
                                                <c:forEach items="${ListRoomBID}" var="o">
                                                    <tr>
                                                        <td>
                                                            <a href="itemManageURL?action=view&rid=${o.room_Id}" class="settings" title="Settings" data-toggle="tooltip"><i class='far fa-edit'></i></a>
                                                        </td>
                                                        <td>${o.floor_Room_Id}</td>
                                                        <td>${o.name}</td>
                                                        <td><fmt:formatNumber type="number">${o.price}</fmt:formatNumber> </td>
                                                        <td>${o.size} m²</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <a href="itemManageURL">Back</a>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

   

        </div>
        <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>


        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="dashboard/assets/libs/jquery/dist/jquery.min.js"></script>
        <script src="dashboard/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
        <script src="dashboard/assets/js/sidebarmenu.js"></script>
        <script src="dashboard/assets/js/app.min.js"></script>
        <script src="dashboard/assets/libs/simplebar/dist/simplebar.js"></script>
    </body>

</html>