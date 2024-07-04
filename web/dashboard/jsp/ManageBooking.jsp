<%-- 
    Document   : ManageBooking
    Created on : Jul 2, 2024, 11:24:33 PM
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
        <link rel="shortcut icon" type="image/png" href="dashboard/assets/images/logos/favicon.png" />
        <link rel="stylesheet" href="dashboard/assets/css/styles.min.css" />
        <link rel="stylesheet" href="dashboard/assets/css/styles.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>

    </head>

    <style>
        .search{
            margin-bottom: auto;
            margin-top: auto;
            height: 70px;
            background-color: #fff;
            border: 2px solid #213E66;
            padding: 10px;
            border-radius: 30px;
        }

        .search_input{
            color: black;
            border: 0;
            outline: 0;
            background: none;
            width: 0;
            margin-top:3px;
            line-height: 40px;
            transition: width 0.4s linear;
        }

        .search .search_input{
            padding: 0 10px;
            width: 550px;
            transition: width 0.4s linear;
        }

        .search:hover > .search_icon{
            background: #005cbf;
            color: #fff;
        }

        .search_icon{
            height: 48px;
            width: 48px;
            float: right;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 50%;
            color:white;
            background-color:black;
        }

        a:link{
            text-decoration:none;
        }
    </style>
    <body>
        <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
             data-sidebar-position="fixed" data-header-position="fixed">
            <jsp:include page="SlideBar.jsp"></jsp:include>
                <div class="body-wrapper">
                <jsp:include page="Profile.jsp"></jsp:include>
                    <div class="card">
                        <div class="card-body"> 
                            <div class="container-fluid" style="height: 800px;width: 1300px">

                                <!-- Page Heading -->
                                <h1 class="h3 mb-2 text-gray-800">BOOKING</h1>
                                <div class="d-flex justify-content-center">
                                    <div class="search">
                                        <input class="search_input" oninput="searchByCardId(this)" type="text" name="txt" placeholder="Search for Card ID . . .">
                                        <a href="#" class="search_icon"><i class="fa fa-search"></i></a>
                                    </div>
                                </div>
                                <div class="card shadow mb-4">

                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                                <thead>
                                                    <tr>
                                                        <th>View</th>
                                                        <th>Card ID</th>
                                                        <th>Check In</th>
                                                        <th>Check Out</th>
                                                        <th>Expenses</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="content">
                                                <c:forEach items="${listB}" var="o">
                                                    <tr>
                                                        <td>
                                                            <a href="bookingURL?action=view&rCode=${o.customer_Id}"><i class="far fa-eye successful"></i></a>
                                                        </td>
                                                        <td>${o.idCard}</td>
                                                        <td>${o.checkIn}</td>
                                                        <td>${o.checkOut}</td>
                                                        <td><fmt:formatNumber type="number">${o.expenses}</fmt:formatNumber> đ</td>
                                                        <td>
                                                            <a href="roomURL?action=loadEdit&rid=" class="settings" title="Settings" data-toggle="tooltip"><i class='far fa-edit'></i></a>
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
            </div>
        </div>

        <div class="container-fluid">
            <div class="modal fade" id="addRoomModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="roomURL?action=add" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Add Room</h4>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group" style="margin-bottom: 12px">
                                    <label>Name</label>
                                    <input name="name" type="text" class="form-control" required>
                                </div>
                                <div class="form-group" style="margin-bottom: 12px">
                                    <label>Floor</label>
                                    <input name="floor" type="number" class="form-control" required>
                                </div>
                                <div class="form-group" style="margin-bottom: 12px">
                                    <label>Price</label>
                                    <input name="price" type="number" class="form-control" required>
                                </div>
                                <div class="form-group"style="margin-bottom: 12px">
                                    <label>Size</label>
                                    <input name="size" type="number" class="form-control" required>
                                </div>					
                                <div class="form-group" style="margin-bottom: 12px">
                                    <label>Type Room</label>
                                    <select name="type_Room_Id" class="form-select" aria-label="Default select example">

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
        <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
        <script>
            function searchByCardId(txtSearch) {
                var text = txtSearch.value;
                console.log(text);
                $.ajax({
                    url: '/DaNangDreamHotel/bookingURL?action=search',
                    type: 'GET',
                    data: {
                        txt: text
                    },
                    success: function (data) {
                        var row = document.getElementById("content");
                        row.innerHTML = data;
                        console.log("success");
                    },
                    error: function (xhr) {
                        console.log(xhr, txtSearch.value);
                    }
                });
            }
        </script>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="dashboard/assets/libs/jquery/dist/jquery.min.js"></script>
        <script src="dashboard/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
        <script src="dashboard/assets/js/sidebarmenu.js"></script>
        <script src="dashboard/assets/js/app.min.js"></script>
        <script src="dashboard/assets/libs/simplebar/dist/simplebar.js"></script>
    </body>

</html>