<%-- 
    Document   : tracking
    Created on : Oct 28, 2022, 7:26:58 PM
    Author     : anhbs
--%>

<%@page import="java.util.List"%>
<%@page import="anhbsd.music.OrderDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

        <!-- title -->
        <title>Tracking</title>

        <!-- favicon -->
        <link rel="shortcut icon" type="image/png" href="assets/img/favicon.png">
        <!-- google font -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
        <!-- fontawesome -->
        <link rel="stylesheet" href="assets/css/all.min.css">
        <!-- bootstrap -->
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <!-- owl carousel -->
        <link rel="stylesheet" href="assets/css/owl.carousel.css">
        <!-- magnific popup -->
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <!-- animate css -->
        <link rel="stylesheet" href="assets/css/animate.css">
        <!-- mean menu css -->
        <link rel="stylesheet" href="assets/css/meanmenu.min.css">
        <!-- main style -->
        <link rel="stylesheet" href="assets/css/main.css">
        <!-- responsive -->
        <link rel="stylesheet" href="assets/css/responsive.css">

    </head>
    <body>
        <c:if test="${empty sessionScope.LOGIN_USER}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <c:url var="logoutLink" value="MainController">
            <c:param name="action" value="Logout"></c:param>
        </c:url>
        <!--PreLoader-->
        <div class="loader">
            <div class="loader-inner">
                <div class="circle"></div>
            </div>
        </div>
        <!--PreLoader Ends-->

        <!-- header -->
        <div class="top-header-area" id="sticker">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-sm-12 text-center">
                        <div class="main-menu-wrap">
                            <!-- logo -->
                            <div class="site-logo">
                                <a href="index.jsp">
                                    <img src="assets/img/logo.png" alt="">
                                </a>
                            </div>
                            <!-- logo -->

                            <!-- menu start -->
                            <nav class="main-menu">
                                <ul>
                                    <li><a href="store.jsp">Shop</a></li>
                                    <li><c:if test="${empty sessionScope.LOGIN_USER}">
                                            <a style="color: rgb(214, 36, 36)" href="login.jsp">User Not Logged In</a>         
                                        </c:if></li>
                                    <li><c:if test="${not empty sessionScope.LOGIN_USER}">
                                            <a href="#">Welcome: ${sessionScope.LOGIN_USER.fullName}</a>         
                                        </c:if></li>
                                    <li><c:if test="${not empty sessionScope.LOGIN_USER}">
                                            <a href="${logoutLink}">Log out</a>      
                                        </c:if></li>
                                    <li>
                                </ul>
                            </nav>
                            <div class="mobile-menu"></div>
                            <!-- menu end -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end header -->

        <!-- breadcrumb-section -->
        <div class="breadcrumb-section breadcrumb-bg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2 text-center">
                        <div class="breadcrumb-text">
                            <p>Account Task</p>
                            <h1>Change Information</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end breadcrumb section -->

        <!-- tracking -->
        <div class="product-section mt-150 mb-150">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7 offset-lg-2 text-center">
                        <div class="section-title">	
                            <h3><span class="orange-text">Account</span> Update System</h3>
                            <form action="MainController" method="POST">
                                Find a user (use "all" to show all accounts): <input type="text" name="acc" value=""/>
                                <input type="submit" name="action" value="Show"/>
                            </form>
                            <h5>Status:<h5 style="color:red">${UPDATE_ERR}</h5></h5>
                        </div>
                    </div>
                </div>
                
                <c:set var="rs" value="${requestScope.ACCOUNT_RESULT}"/>
                <div class="cart-table-wrap">
                    <table class="cart-table">
                        <thead class="cart-table-head">
                            <tr class="table-head-row">
                                <th class="product-remove">User ID</th>
                                <th class="product-remove">Password</th>
                                <th class="product-image">Full Name</th>
                                <th class="product-name">Email</th>
                                <th class="product-price">Address</th>
                                <th class="product-price">Role</th>
                                <th class="product-price">Img Source</th>
                                <th class="product-price">Update</th>
                        </thead>
                        <tbody>
                        <c:forEach var="ac" items="${rs}">
                            <form action="MainController" method="POST">
                                <tr>                  
                                    <td><input type="text" name="accid" value="${ac.userID}"></td>
                                    <td><input type="text" name="accpass" value="${ac.password}"></td>
                                    <td><input type="text" name="accname" value="${ac.fullName}"></td>
                                    <td><input type="email" name="accmail" value="${ac.email}"></td>
                                    <td><input type="text" name="accaddr" value="${ac.address}"></td>
                                    <td><select name="accrole" value="">
                                            <option selected disabled>${ac.roleID}</option>
                                            <option>AD</option>
                                            <option>US</option>
                                        </select></td>
                                    <td><input type="text" name="accimg" value="${ac.img}"></td>
                                    <td><input type="submit" name="action" value="Save"</td>
                                </tr>
                            </form>
                        </c:forEach>
                        </tbody>
                    </table>
                    <c:if test="${empty requestScope.ACCOUNT_RESULT}">
                        <h5 style='color:red;text-align:center'>No Account here, Try search above</h2>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
    <!-- end tracking -->

    <!-- logo carousel -->
    <div class="logo-carousel-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="logo-carousel-inner">
                        <div class="single-logo-item">
                            <img src="assets/img/company-logos/1.png" alt="">
                        </div>
                        <div class="single-logo-item">
                            <img src="assets/img/company-logos/2.png" alt="">
                        </div>
                        <div class="single-logo-item">
                            <img src="assets/img/company-logos/3.png" alt="">
                        </div>
                        <div class="single-logo-item">
                            <img src="assets/img/company-logos/4.png" alt="">
                        </div>
                        <div class="single-logo-item">
                            <img src="assets/img/company-logos/5.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end logo carousel -->
    <!-- copyright -->
    <div class="copyright">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-12">
                    <p>Copyrights &copy; 2019 - <a href="#">AnhBSD162018</a>,  All Rights Reserved.</p>
                </div>
                <div class="col-lg-6 text-right col-md-12">
                    <div class="social-icons">
                        <ul>
                            <li><a href="#" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
                            <li><a href="#" target="_blank"><i class="fab fa-twitter"></i></a></li>
                            <li><a href="#" target="_blank"><i class="fab fa-instagram"></i></a></li>
                            <li><a href="#" target="_blank"><i class="fab fa-linkedin"></i></a></li>
                            <li><a href="#" target="_blank"><i class="fab fa-dribbble"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end copyright -->

    <!-- jquery -->
    <script src="assets/js/jquery-1.11.3.min.js"></script>
    <!-- bootstrap -->
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <!-- count down -->
    <script src="assets/js/jquery.countdown.js"></script>
    <!-- isotope -->
    <script src="assets/js/jquery.isotope-3.0.6.min.js"></script>
    <!-- waypoints -->
    <script src="assets/js/waypoints.js"></script>
    <!-- owl carousel -->
    <script src="assets/js/owl.carousel.min.js"></script>
    <!-- magnific popup -->
    <script src="assets/js/jquery.magnific-popup.min.js"></script>
    <!-- mean menu -->
    <script src="assets/js/jquery.meanmenu.min.js"></script>
    <!-- sticker js -->
    <script src="assets/js/sticker.js"></script>
    <!-- main js -->
    <script src="assets/js/main.js"></script>

</body>
</html>

