<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Da Nang Hotel</title>
        <link rel="icon" href="img/title_danangdream.jpg" type="image/x-icon"/>
        <link rel="shortcut icon" type="image/png" href="../assets/images/logos/favicon.png" />
        <link rel="stylesheet" href="dashboard/assets/css/styles.min.css" />
        <link rel="stylesheet" href="dashboard/assets/css/styles.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    </head>

    <body>
        <!--  Body Wrapper -->
        <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
             data-sidebar-position="fixed" data-header-position="fixed">
            <jsp:include page="SlideBar.jsp"></jsp:include>

                <div class="body-wrapper">
                <jsp:include page="Profile.jsp"></jsp:include>
                </div>
                <section class="rooms-section spad">
                    <div class="container">
                    <c:if test="${not empty sessionScope.notificationMessage}">
                        <div class="alert alert-${sessionScope.notificationStatus == 'success' ? 'success' : 'danger'} alert-dismissible fade show" role="alert" id="status-alert">
                            ${sessionScope.notificationMessage}
                        </div>
                        <script>
                            setTimeout(function () {
                                var alert = document.getElementById('status-alert');
                                if (alert) {
                                    alert.classList.remove('show');
                                    alert.classList.add('fade');
                                    setTimeout(function () {
                                        alert.parentNode.removeChild(alert);
                                    }, 500);
                                }
                            }, 3000);
                        </script>
                        <c:remove var="notificationMessage" scope="session"/>
                        <c:remove var="notificationStatus" scope="session"/>
                    </c:if>
                    <div class="row">                 
                        <c:forEach items="${AllTypeRoom}" var="o">
                            <c:url value="/img/typeroom/${o.image}" var="urlImg1"/>
                            <div class="col-lg-3 col-md-6 d-flex justify-content-center">
                                <div class="room-item" style="border: 1.5px solid gainsboro; border-radius: 15px; overflow: hidden; display: flex; flex-direction: column; margin-bottom: 15px; align-items: center; width: 100%; max-width: 400px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.4); position: relative;">
                                    <c:choose>
                                        <c:when test="${fn:startsWith(o.image, 'http')}">
                                            <img src="${o.image}" style="width: 304px; height: 202px; border-radius: 15px 15px 0 0;" alt="">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${urlImg1}" style="width: 304px; height: 202px; border-radius: 15px 15px 0 0;" alt="">
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="ri-text" style="padding: 10px; text-align: left; width: 100%;">
                                        <h4 class="text-center" style="margin-bottom: 3px">${o.name}</h4>
                                        <div class="content-icon d-flex align-items-between justify-content-between" style="font-size: 0.95rem;">
                                            <div style="display: flex; align-items: center; justify-content: center; margin-top: 10px;">
                                                <i class="fa fa-users" aria-hidden="true" style="margin-right: 8px; font-size: 1.2em;"></i>
                                                <c:if test="${o.people == 1}">
                                                    <span>${o.people} Person</span>
                                                </c:if>
                                                <c:if test="${o.people > 1}">
                                                    <span>${o.people} People</span>
                                                </c:if>
                                            </div>
                                            <div style="display: flex; align-items: center; justify-content: center; margin-top: 10px;">
                                                <i class="fa fa-bed" aria-hidden="true" style="margin-right: 8px; font-size: 1.2em;"></i>
                                                <c:if test="${o.bed == 1}">
                                                    <span>${o.bed} Bed</span>
                                                </c:if>
                                                <c:if test="${o.bed > 1}">
                                                    <span>${o.bed} Beds</span>
                                                </c:if>
                                            </div>
                                            <div style="display: flex; align-items: center; justify-content: center; margin-top: 10px;">
                                                <i class="fa fa-bath" aria-hidden="true" style="margin-right: 8px; font-size: 1.2em;"></i>
                                                <c:if test="${o.bath == 1}">
                                                    <span>${o.bath} Bath</span>
                                                </c:if>
                                                <c:if test="${o.bath > 1}">
                                                    <span>${o.bath} Baths</span>
                                                </c:if>                                       
                                            </div>
                                        </div>
                                    </div>
                                    <div  width: 100%; padding: 5px;">
                                        <a href="itemManageURL?action=detail&trid=${o.typeRoom_Id}" class="text-decoration-underline" style="color: seagreen;">View</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>
        </div> 
      


    </div>
    <script src="../assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/js/sidebarmenu.js"></script>
    <script src="../assets/js/app.min.js"></script>
    <script src="../assets/libs/simplebar/dist/simplebar.js"></script>
</body>

</html>
