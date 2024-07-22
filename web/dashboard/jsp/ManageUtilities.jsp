<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
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
                            <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#addAccountModal">
                                <p class="mb-0 fs-3"><i class="ti ti-plus fs-6"></i>Add New Utilities</p>                  
                            </button>
                            <div class="container-fluid" >
                                <div class="table-wrapper">
                                    <div class="table-title" style="background-color: #000">                 
                                    </div>
                                    <table class="table table-striped table-hover">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Name</th>
                                                <th>Image</th>
                                                <th>Description</th>
                                                <th>Time</th>
                                                <th>Location</th>                              
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="u" items="${listU}" >
                                            <tr>
                                                <th >${u.utilities_Id}</th>
                                                <td>${u.name}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${not empty u.image}">
                                                            <a href="${pageContext.request.contextPath}/uploads/image/${u.image}" target="_blank">View Image</a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            No Image
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>${u.description}</td>
                                                <td>${u.time}</td>
                                                <td>${u.location}</td>
                                                <td>
                                                    <a href="EditUtilitiesControllerURL?id=${u.utilities_Id}"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                                    <a href="#" class="delete" data-bs-toggle="modal" data-bs-target="#deleteModal" data-url="DeleteUtilitiesControllerURL?id=${u.utilities_Id}">
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
                                                                    Are you sure you want to delete this utility?
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

        <!--MODAL FADE-->
        <div class="modal" id="loadImage">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">All Image</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row" style="margin-left: 35px">
                            <img src="" style="width: 32%; margin-bottom: 20px" alt="alt"/>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="modal fade" id="addAccountModal" tabindex="-1" role="dialog" aria-labelledby="addAccountModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <form id="addUtilitiesForm" action="InsertUtilitiesControllerURL" method="post" enctype="multipart/form-data">
                            <div class="modal-header">
                                <h5 class="modal-title" id="addAccountModalLabel">Add New Utilities</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label>Name</label>
                                    <input id="name" name="name" type="text" class="form-control" placeholder="Enter name" required>
                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <input id="description" name="description" type="text" class="form-control" placeholder="Enter description" required>
                                </div>
                                <div class="form-group">
                                    <label>Time</label>
                                    <input id="time" name="time" type="text" class="form-control" placeholder="Enter time" required>
                                </div>
                                <div class="form-group">
                                    <label>Location</label>
                                    <input id="location" name="location" type="text" class="form-control" placeholder="Enter location" required>
                                </div>
                                <div class="form-group">
                                    <label>Images</label>
                                    <input id="image" name="image" class="input-file" type="file" placeholder="Enter Images" required>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-bs-dismiss="modal" value="Cancel">
                                <button type="submit" class="btn btn-success" onclick="return validateForm()">Add</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
        <script >
            function validateForm() {
                const name = document.getElementById('name').value.trim();
                const description = document.getElementById('description').value.trim();
                const time = document.getElementById('time').value.trim();
                const location = document.getElementById('location').value.trim();
                const image = document.getElementById('image').value;

                if (name === "") {
                    alert("Please enter a name.");
                    return false;
                }

                if (description === "") {
                    alert("Please enter a description.");
                    return false;
                }

                if (time === "") {
                    alert("Please enter a time.");
                    return false;
                }

                if (location === "") {
                    alert("Please enter a location.");
                    return false;
                }

                if (image === "") {
                    alert("Please upload an image.");
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
        <script src="dashboard/assets/libs/jquery/dist/jquery.min.js"></script>
        <script src="dashboard/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
        <script src="dashboard/assets/js/sidebarmenu.js"></script>
        <script src="dashboard/assets/js/app.min.js"></script>
        <script src="dashboard/assets/libs/simplebar/dist/simplebar.js"></script>
    </body>
</html>
