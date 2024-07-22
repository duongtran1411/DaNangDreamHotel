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
                                <p class="mb-0 fs-3"><i class="ti ti-plus fs-6"></i>Add Account</p>                  
                            </button>
                            <div class="container-fluid" style="height: 800px;width: 1300px; margin-left: 400px">
                                <div class="table-wrapper">
                                    <div class="table-title" style="background-color: #000">                 
                                    </div>
                                    <table class="table table-striped table-hover">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Role Name</th>
                                                <th>Username</th>
                                                <th>Password</th>
                                                <th>Full Name</th>
                                                <th>Email</th>
                                                <th>Phone</th>
                                                <th>Create-at</th>
                                                <th>Update-at</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${listA}" var="o">
                                            <tr>
                                                <td>${o.account_Id}</td>
                                                <td>${o.roleId.name}</td>
                                                <td>${o.userName}</td>
                                                <td>${o.password}</td>
                                                <td>${o.lastName} ${o.firstName}</td>
                                                <td>${o.email}</td>
                                                <td>${o.phone}</td>
                                                <td>
                                                    <a href="EditAccountControllerURL?id=${o.account_Id}"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                                    <a href="#" class="delete" data-bs-toggle="modal" data-bs-target="#deleteModal" data-url="DeleteAccountControllerURL?id=${o.account_Id}">
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
                                                                    Are you sure you want to delete this account?
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
                        <form  id="addAccountForm" action="InsertControllerURL" method="post">
                            <div class="modal-header">
                                <h5 class="modal-title" id="addAccountModalLabel">Add Information Account</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label>Username</label>
                                    <input name="username" type="text" class="form-control" placeholder="Enter username" required>
                                </div>
                                <div class="form-group">
                                    <label>First Name</label>
                                    <input name="firstName" type="text" class="form-control" placeholder="Enter first name" required>
                                </div>
                                <div class="form-group">
                                    <label>Last Name</label>
                                    <input name="lastName" type="text" class="form-control" placeholder="Enter last name" required>
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <input name="password" type="password" class="form-control" placeholder="Enter password" required>
                                </div>
                                <div class="form-group">
                                    <label>Role Id</label>
                                    <input name="roleid" type="text" class="form-control" value="2" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Phone</label>
                                    <input name="phone" type="text" class="form-control" placeholder="Enter phone" required pattern="\d{10}">
                                </div>
                                <div class="form-group">
                                    <label>Email</label>
                                    <input name="email" type="email" class="form-control" placeholder="Enter email" required>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-bs-dismiss="modal" value="Cancel">
                                <button type="submit" class="btn btn-success" onclick="return validateAccountForm()">Add</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
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
        <script>
            function validateAccountForm() {
                const username = document.getElementById('username').value.trim();
                const firstName = document.getElementById('firstName').value.trim();
                const lastName = document.getElementById('lastName').value.trim();
                const password = document.getElementById('password').value.trim();
                const phone = document.getElementById('phone').value.trim();
                const email = document.getElementById('email').value.trim();

                if (username === "") {
                    alert("Please enter a username.");
                    return false;
                }

                if (firstName === "") {
                    alert("Please enter a first name.");
                    return false;
                }

                if (lastName === "") {
                    alert("Please enter a last name.");
                    return false;
                }

                if (password === "") {
                    alert("Please enter a password.");
                    return false;
                }

                if (phone === "") {
                    alert("Please enter a phone number.");
                    return false;
                } else if (!phone.match(/^\d{10}$/)) {
                    alert("Please enter a valid 10-digit phone number.");
                    return false;
                }

                const phonePattern = /^[0-9]+$/;
                if (!phonePattern.test(phone)) {
                    alert("Please enter a valid phone number.");
                    return false;
                }

                if (email === "") {
                    alert("Please enter an email.");
                    return false;
                } else if (!email.match(/^[^\s@]+@[^\s@]+\.[^\s@]+$/)) {
                    alert("Please enter a valid email address.");
                    return false;
                }

                return true; // If all fields are valid, submit the form
            }
        </script>
        <script src="dashboard/assets/libs/jquery/dist/jquery.min.js"></script>
        <script src="dashboard/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
        <script src="dashboard/assets/js/sidebarmenu.js"></script>
        <script src="dashboard/assets/js/app.min.js"></script>
        <script src="dashboard/assets/libs/simplebar/dist/simplebar.js"></script>
    </body>
</html>
