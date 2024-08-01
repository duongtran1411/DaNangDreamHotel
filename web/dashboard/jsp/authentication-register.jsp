<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Da Nang Dream Hotel</title>
        <link rel="shortcut icon" type="image/png" href="../assets/images/logos/favicon.png" />
        <link rel="stylesheet" href="../assets/css/styles.min.css" />
        <script src="../assets/libs/jquery/dist/jquery.min.js"></script>
        <script src="../assets/libs/popper.js/dist/umd/popper.min.js"></script>
        <script src="../assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
        <style>
            .container {
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                background-color: #3a98cc;
            }
            .design {
                background: whitesmoke;
                padding: 20px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
            }
            @media (max-width: 1200px) {
                .design {
                    width: 80%;
                    height: auto;
                }
            }
            @media (max-width: 992px) {
                .design {
                    width: 90%;
                    height: auto;
                }
            }
            @media (max-width: 768px) {
                .design {
                    width: 95%;
                    height: auto;
                }
            }
            @media (max-width: 576px) {
                .design {
                    width: 100%;
                    height: auto;
                }
            }
            .body {
                background: #3a98cc;
            }
        </style>
    </head>
    <body class="body">
        <div class="container">
            <div class="card-body design">
                <div>
                    <a href="homeController" class="text-nowrap logo-img text-center d-block py-3 w-100">
                        <img src="img/header_homepage.jpg" alt="" height="100px" width="200px" />
                    </a>
                </div>
                <form action="/DaNangDreamHotel/register" method="POST" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-6">
                            <div class="mb-3">
                                <label class="form-label">First Name</label>
                                <input type="text" class="form-control" name="fname" placeholder="Your Firstname" required/>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Last Name</label>
                                <input type="text" class="form-control" name="lname" placeholder="Your Lastname" required/>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Email Address</label>
                                <input type="email" class="form-control" name="email" placeholder="Your Email address" required/>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Phone</label>
                                <input type="text" class="form-control" name="phone" placeholder="Your Phone Number" required/>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="mb-3">
                                <label class="form-label">Date of Birth</label>
                                <input type="date" class="form-control" name="dob" required/>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">CV</label>
                                <input id="cv" name="cv" class="input-file" type="file" required>
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary w-100 py-8 fs-4 mb-4 rounded-2">Continue</button>
                </form>
            </div>
        </div>
    </body>
</html>
