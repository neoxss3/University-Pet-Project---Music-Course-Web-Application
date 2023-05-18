<%-- 
    Document   : viewCart
    Created on : Oct 23, 2022, 12:37:55 AM
    Author     : anhbs
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="anhbsd.cart.Cart"%>
<%@page import="anhbsd.cart.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

        <!-- title -->
        <title>Cart</title>

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
        <c:url var="shopLink" value="MainController?action=Search&txtSearchValue=all"/> 
        <!--PreLoader-->
        <div class="loader">
            <div class="loader-inner">
                <div class="circle"></div>
            </div>
        </div>
        <!--PreLoader Ends-->

        <!-- header -->
        <c:url var="logoutLink" value="MainController">
                                <c:param name="action" value="Logout"></c:param>
                            </c:url>
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
                                    <li>
                                        <div class="header-icons">
                                            <a class="shopping-cart" href="viewCart.jsp"><i class="fas fa-shopping-cart"></i></a>
                                            <c:if test="${empty sessionScope.LOGIN_USER}">
                                                <a style="color: rgb(214, 36, 36)" href="login.jsp">User Not Logged In</a>  
                                                <ul class="sub-menu">
                                                    <li><a href="tracking.jsp">Tracking Order</a></li>
                                                </ul>
                                            </c:if>
                                            <c:if test="${not empty sessionScope.LOGIN_USER}">
                                                <a href="#">Welcome: ${sessionScope.LOGIN_USER.fullName}</a> 
                                                <ul class="sub-menu">
                                                    <li><a href="tracking.jsp">Tracking Order</a></li>
                                                </ul>
                                            </c:if>
                                            <c:if test="${not empty sessionScope.LOGIN_USER}">
                                                <a href="${logoutLink}">Log out</a>      
                                            </c:if>
                                        </div>
                                    </li>
                                </ul>
                            </nav>
                            <a class="mobile-show search-bar-icon" href="#"><i class="fas fa-search"></i></a>
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
                            <p>Fresh and Organic</p>
                            <h1>Cart</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end breadcrumb section -->

        <!-- cart -->
           
        <c:if test="${sessionScope.CART ==null || sessionScope.CART.getCart().size() < 1 }">
            <div class="product-section mt-150 mb-150">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7 offset-lg-2 text-center">
                        <div class="section-title">
                            <h3><span class="orange-text">No</span> Courses Selected</h3>
                            <a href="${shopLink}" class="boxed-btn mt-4">Begin Learning now!</a>
                        </div>
                    </div>
                </div>
            </div>
                </div>
        </c:if>

        <c:set var = "total" scope = "session" value = "${0}"/>

        <c:if test="${sessionScope.CART !=null && sessionScope.CART.getCart().size() > 0 }">
            <c:if test="${not empty sessionScope.CART}">
                <div class="cart-section mt-150 mb-150">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-8 col-md-12">
                                <div class="cart-table-wrap">
                                    <table class="cart-table">
                                        <thead class="cart-table-head">
                                            <tr class="table-head-row">
                                                <th class="product-remove">Action</th>
                                                <th class="product-image">Product Image</th>
                                                <th class="product-name">Name</th>
                                                <th class="product-price">Tuition Fee</th>
                                                <th class="product-quantity">Amount</th>
                                                <th class="product-total">Total</th>
                                            </tr>
                                        </thead>
                                        <c:forEach var="product" varStatus="counter"  items="${sessionScope.CART.getCart().values()}">
                                            <form action="MainController" method="post">
                                                <p style="display: none">${sessionScope.total = sessionScope.total + product.price * product.quantity}</p>
                                                <tbody>
                                                    <tr class="table-body-row">
                                                        <td class="product-remove">
                                                                <input type="submit" name="action" value="Remove"/>
                                                            </td>
                                                <input type="hidden" name="course" value="${product.name}"/>
                                                <td class="product-image"><img src="${product.img}" alt=""></td>
                                                <td class="product-name">${product.name}</td>
                                                <td class="product-price">$ ${product.price}/mo</td>
                                                <td class="product-quantity"><input type="number" name="quantity" value="${product.quantity}"/></td>
                                                <td class="product-total">${product.price * product.quantity}</td>
                                                </tr>
                                                </tbody>
                                        </c:forEach>
                                    </table>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="total-section">
                                    <table class="total-table">
                                        <thead class="total-table-head">
                                            <tr class="table-total-row">
                                                <th>Total</th>
                                                <th>Price</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr class="total-data">
                                                <td><strong>Subtotal: </strong></td>
                                                <td>$ ${total}</td>
                                            </tr>
                                            <tr class="total-data">
                                                <td><strong>Shipping: </strong></td>
                                                <td>$0</td>
                                            </tr>
                                            <tr class="total-data">
                                                <td><strong>Total: </strong></td>
                                                <td>${total}</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div class="cart-buttons">
                                        <input type="submit" name="action" value="Confirm Order"/>
                                        <input style="margin-left: 25px " type="submit" name="action" value="Update Cart"/>
                                    </div>
                                           
                                </div>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
            </c:if>
        </c:if>


        <!-- end cart -->

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
                        <p>Copyrights &copy; 2019 - <a href="#">AnhBSD16208</a>,  All Rights Reserved.</p>
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

