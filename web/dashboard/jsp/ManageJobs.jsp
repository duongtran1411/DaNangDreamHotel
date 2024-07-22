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
                                <p class="mb-0 fs-3"><i class="ti ti-plus fs-6"></i>Add Jobs</p>                  
                            </button>
                            <div class="container-fluid" style="height: 800px;width: 1300px; margin-left: 400px">
                                <div class="table-wrapper">
                                    <div class="table-title" style="background-color: #000">                 
                                    </div>
                                    <table class="table table-striped table-hover">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>FirstName</th>
                                                <th>LastName</th>
                                                <th>DateOfBirth</th>
                                                <th>Phone</th>
                                                <th>Email</th>
                                                <th>CV</th>
                                                <th>Status</th>
                                                <th>Action</th> 
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="l" items="${listC}" >
                                            <tr>
                                                <th scope="row">${l.getJob_Id()}</th>
                                                <td>${l.getFirstName()}</td>
                                                <td>${l.getLastName()}</td>
                                                <td>${l.getDateOfBirth()}</td>
                                                <td>${l.getPhone()}</td>
                                                <td>${l.getEmailPersonal()}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${not empty l.getCv()}">
                                                            <a href="${pageContext.request.contextPath}/uploads/cv/${l.getCv()}" target="_blank">View CV</a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            No CV
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>${l.getStatus()}</td>   
                                                <td>                        
                                                    <form action="ManagerJobsControllerURL" method="post">
                                                        <input type="hidden" name="id" value="${l.getJob_Id()}">
                                                        <select name="action">
                                                            <option value="accept">Accept</option>
                                                            <option value="reject">Reject</option>
                                                            <option value="wait">Wait</option>
                                                        </select>
                                                        <button type="submit">Submit</button>
                                                    </form>
                                                </td>
                                            </tr>      
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
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
                                        <form action="InsertJobsControllerURL" method="post" enctype="multipart/form-data">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="addAccountModalLabel">Add Information Jobs</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                            </div>
                                            <div class="modal-body">

                                                <div class="form-group">
                                                    <label>First Name</label>
                                                    <input name="firstname" type="text" class="form-control" placeholder="Enter first name" required>
                                                </div>
                                                <div class="form-group">
                                                    <label>Last Name</label>
                                                    <input name="lastname" type="text" class="form-control" placeholder="Enter last name" required>
                                                </div>
                                                <div class="form-group">
                                                    <label>Date of birth</label>
                                                    <input name="dob" type="date" class="form-control" placeholder="Enter date of birth" required>
                                                </div>
          
                                                <div class="form-group">
                                                    <label>Phone</label>
                                                    <input name="phone" type="text" class="form-control" placeholder="Enter phone" required>
                                                </div>
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input name="email" type="email" class="form-control" placeholder="Enter email" required>
                                                </div>
                                                <div class="form-group">
                                                    <label>CV</label>
                                                    <input name="cv" class="input-file" type="file"  placeholder="Enter CV" required="">
                                                </div>
                                                <div class="form-group">
                                                    <label>Status</label>
                                                    <input id="status" name="status" class="form-control" value="wait" readonly="">
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <input type="button" class="btn btn-default" data-bs-dismiss="modal" value="Cancel">
                                                <button type="submit" class="btn btn-success">Add</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <script src="../assets/libs/jquery/dist/jquery.min.js"></script>
                        <script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
                        </body>

                        </html>
          