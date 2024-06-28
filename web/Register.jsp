<!-- Toastr CSS and JS -->

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

<style>
    .center-text {
        text-align: center;
    }
    .center-button {
        display: flex;
        justify-content: center;
    }
</style>
<script>
    function showAlert(event) {
        event.preventDefault();
        toastr.success('Register thành công');
        setTimeout(function () {
            document.getElementById("registerForm").submit();
        }, 2000); // Adjust the delay time (in milliseconds) as needed
    }
</script>
</head>
<body>
    <form id="registerForm" class="form-horizontal" action="InsertJobsControllerURL" method="post" onsubmit="showAlert(event)" enctype="multipart/form-data">
        <fieldset>
            <!-- Form Name -->
            <legend class="center-text">Registers</legend>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="firstname">FirstName</label>  
                <div class="col-md-4">
                    <input id="firstname" name="firstname" placeholder="FirstName" class="form-control input-md" required="" type="text">
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="lastname">LastName</label>  
                <div class="col-md-4">
                    <input id="lastname" name="lastname" placeholder="LastName" class="form-control input-md" required="" type="text">
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="dob">Date Of Birth</label>  
                <div class="col-md-4">
                    <input id="dob" name="dob" placeholder="Date Of Birth" class="form-control input-md" required="" type="date">
                </div>
            </div>

            <!-- Select Basic -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="phone">Phone</label>  
                <div class="col-md-4">
                    <input id="phone" name="phone" placeholder="Phone" class="form-control input-md" required="" type="text">
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="email">Email Personal</label>  
                <div class="col-md-4">
                    <input id="email" name="email" placeholder="Email Personal" class="form-control input-md" required="" type="text">
                </div>
            </div>

            <!-- File input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="cv">CV</label>
                <div class="col-md-4">
                    <input id="cv" name="cv" class="input-file" type="file">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="status">Status</label>
                <div class="col-md-4">
                    <input id="status" name="status" class="form-control input-md" value="wait" readonly="">
                </div>
            </div>
            <!-- Button -->
            <div class="form-group center-button">
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success">Register</button>
                    <input type="button" class="btn btn-default" data-bs-dismiss="modal" value="Cancel">
                </div>
            </div>
        </fieldset>
    </form>
</body>
</html>