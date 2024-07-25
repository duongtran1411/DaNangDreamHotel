<%-- 
    Document   : ManageEvent
    Created on : May 27, 2024, 2:35:59 PM
    Author     : Sơnnnn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Da Nang Hotel</title>
        <link rel="shortcut icon" type="image/png" href="../assets/images/logos/favicon.png" />
        <link rel="stylesheet" href="dashboard/assets/css/styles.min.css" />
        <link rel="stylesheet" href="dashboard/assets/css/styles.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    </head>

    <body>
        <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
             data-sidebar-position="fixed" data-header-position="fixed">
            <jsp:include page="SlideBar.jsp"></jsp:include>
                <div class="body-wrapper">
                <jsp:include page="Profile.jsp"></jsp:include>
                    <div class="card">
                        <div class="card-body">

                            <div class="container-fluid">
                                <div class="row">
                                    <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#addRoomModal" style="padding-right: 1400px">
                                        <p class="mb-0 fs-3"><i class="ti ti-plus fs-6"></i>New Event</p>                  
                                    </button>
                                </div>
                                <div class="row">
                                    <div class="table-wrapper" style="width: 1600px">
                                        <div>
                                            <div class="table-title" style="background-color: #000">                 
                                            </div>
                                            <table class="table table-striped table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Name</th>
                                                        <th>Image</th>
                                                        <th>StartDay</th>
                                                        <th>EndDay</th>
                                                        <th>Description</th>
                                                        <th>Discount</th>
                                                        <th>Voucher</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${listE}" var="a">
                                                    <tr>
                                                        <th scope="row">${a.event_Id}</th>
                                                        <td>${a.name}</td>
                                                        <td><img src="${a.image}" alt="alt" style="width:304px;height: 204px"/></td>
                                                        <td>${a.startDay}</td>
                                                        <td>${a.endDay}</td>
                                                        <td>${a.description}</td>
                                                        <td>${a.discount}</td>
                                                        <td>${a.voucher}</td>
                                                        <td>
                                                            <a href="EditEventControllerURL?id=${a.event_Id}" title="Edit" class="edit" data-toggle="tooltip"><i class="ti ti-pencil fs-7"></i></a>
                                                            <a href="#" class="delete" data-bs-toggle="modal" data-bs-target="#deleteModal" data-url="DeleteEventControllerURL?id=${a.event_Id}">
                                                                <i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i>
                                                            </a>

                                                            <!-- Confirmation Modal -->
                                                            <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title" id="deleteModalLabel">Confirm Delete</h5>
                                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            Are you sure you want to delete event?
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                                            <a href="#" id="confirmDeleteBtn" class="btn btn-danger">Delete</a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
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

        <!--MODAL FADE-->
        <div class="container-fluid">
            <div class="modal fade" id="addRoomModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form id="addEventForm" action="InsertEventControllerURL" method="post" onsubmit="return validateEventForm()">
                            <div class="modal-header">						
                                <h4 class="modal-title">New Event</h4>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <label for="name">Name</label>
                                    <input id="name" name="name" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label for="image">Image</label>
                                    <input id="image" name="image" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label for="start">Start Day</label>
                                    <input id="start" name="start" type="date" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label for="end">End Day</label>
                                    <input id="end" name="end" type="date" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label for="description">Description</label>
                                    <input id="description" name="description" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label for="discount">Discount</label>
                                    <input id="discount" name="discount" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label for="voucher">Voucher</label>
                                    <input id="voucher" name="voucher" type="text" class="form-control" required>
                                </div>		
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-bs-dismiss="modal">Cancel</button>
                                <button type="submit" class="btn btn-success">Add</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function validateEventForm() {
                const name = document.getElementById('name').value.trim();
                const image = document.getElementById('image').value.trim();
                const start = document.getElementById('start').value;
                const end = document.getElementById('end').value;
                const description = document.getElementById('description').value.trim();
                const discount = document.getElementById('discount').value.trim();
                const voucher = document.getElementById('voucher').value.trim();

                if (name === "") {
                    alert("Please enter a name.");
                    return false;
                }

                if (image === "") {
                    alert("Please enter an image URL.");
                    return false;
                }

                if (start === "") {
                    alert("Please select a start day.");
                    return false;
                }

                if (end === "") {
                    alert("Please select an end day.");
                    return false;
                }

                if (new Date(start) > new Date(end)) {
                    alert("Start day cannot be after end day.");
                    return false;
                }

                if (description === "") {
                    alert("Please enter a description.");
                    return false;
                }

                if (discount === "") {
                    alert("Please enter a discount.");
                    return false;
                }

                if (voucher === "") {
                    alert("Please enter a voucher.");
                    return false;
                }

                return true; // If all fields are valid, submit the form
            }
        </script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var deleteModal = document.getElementById('deleteModal');
                deleteModal.addEventListener('show.bs.modal', function (event) {
                    var button = event.relatedTarget; // Button that triggered the modal
                    var url = button.getAttribute('data-url'); // Extract info from data-* attributes

                    // Update the modal's content.
                    var confirmDeleteBtn = deleteModal.querySelector('#confirmDeleteBtn');
                    confirmDeleteBtn.setAttribute('href', url);
                });
            });

        </script>
        <script src="../assets/libs/jquery/dist/jquery.min.js"></script>
        <script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
        <script src="../assets/js/sidebarmenu.js"></script>
        <script src="../assets/js/app.min.js"></script>
        <script src="../assets/libs/simplebar/dist/simplebar.js"></script>
    </body>

</html>