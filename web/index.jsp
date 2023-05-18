<%@page import="java.util.List"%>
<%@page import="anhbsd.music.ProductDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

        <!-- title -->
        <title>TTK</title>

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
        <c:if test="${not empty sessionScope.LOGIN_USER && sessionScope.LOGIN_USER.roleID ne 'US' }">
            <c:redirect url="adminPage.jsp"></c:redirect>
        </c:if>

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
                                <a href="#">
                                    <img src="assets/img/logo.png" alt="">
                                </a>
                            </div>
                            <!-- logo -->

                            <!-- menu start -->
                            <c:url var="logoutLink" value="MainController">
                                <c:param name="action" value="Logout"></c:param>
                            </c:url>
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
                                                    <li><a href="profile.jsp">Your Profile</a></li>
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
        <!-- home page slider -->
        <div class="homepage-slider">
            <!-- single home slider -->
            <div class="single-homepage-slider homepage-bg-1" style="background-image: url('assets/img/slide1.jpg') !important">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 col-lg-7 offset-lg-1 offset-xl-0">
                            <div class="hero-text">
                                <div class="hero-text-tablecell">
                                    <p class="subtitle">Best & Performance</p>
                                    <h1>High Quality Courses</h1>
                                    <div class="hero-btns">
                                        <a href="${shopLink}" class="boxed-btn">Course Collection</a>
                                        <a href="#" class="bordered-btn">Contact Us</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- single home slider -->
            <div class="single-homepage-slider homepage-bg-2" style="background-image: url('assets/img/slide2.jpg') !important">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-10 offset-lg-1 text-center">
                            <div class="hero-text">
                                <div class="hero-text-tablecell">
                                    <p class="subtitle">Update Everytime</p>
                                    <h1>100% Fully Covered Lessons</h1>
                                    <div class="hero-btns">
                                        <a href="${shopLink}" class="boxed-btn">Visit Shop</a>
                                        <a href="#" class="bordered-btn">Contact Us</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- single home slider -->
            <div class="single-homepage-slider homepage-bg-3" style="background-image: url('assets/img/slide3.jpg') !important">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-10 offset-lg-1 text-right">
                            <div class="hero-text">
                                <div class="hero-text-tablecell">
                                    <p class="subtitle">Mega Sale Going On!</p>
                                    <h1>Get December Discount</h1>
                                    <div class="hero-btns">
                                        <a href="shop.html" class="boxed-btn">On Shop now!</a>
                                        <a href="#" class="bordered-btn">Contact Us</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end home page slider -->

        <!-- product section -->

        <div class="product-section mt-150" style="margin-bottom: 20px !important">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-12">
                        <div style="padding: 70px 0">
                            <h2>Our <span class="orange-text">Courses</span></h2>
                            <h5>Fire your dreams and Improve your skills now</h5>
                            <p> <form method="POST" action="MainController" >
                                <input type="hidden" name="txtSearchValue" value="all"/>
                                <input type="submit" value="Explore" name="action"/><p><i class="arrow right"></i></p>
                            </form>
                            </p>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12">
                        <div class="abt-bg">
                            <img style="height:404px"src="assets/img/ttkenroll.jpg" alt=""/>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- end product section -->
        <!-- features list section -->
        <div class="list-section pt-80 pb-80">
            <div class="container">

                <div class="row">
                    <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
                        <div class="list-box d-flex align-items-center">
                            <div class="list-icon">
                                <i class="fas fa-shipping-fast"></i>
                            </div>
                            <div class="content">
                                <h3>Free Moving Services</h3>
                                <p>When learn more than 2 courses</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
                        <div class="list-box d-flex align-items-center">
                            <div class="list-icon">
                                <i class="fas fa-phone-volume"></i>
                            </div>
                            <div class="content">
                                <h3>24/7 Support</h3>
                                <p>Get support all day</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="list-box d-flex justify-content-start align-items-center">
                            <div class="list-icon">
                                <i class="fas fa-sync"></i>
                            </div>
                            <div class="content">
                                <h3>Refund</h3>
                                <p>Get refund within 3 days!</p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- end features list section -->

        <!-- advertisement section -->
        <div class="abt-section mb-150 mt-100">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-12">
                        <div class="abt-bg">
                            <img style="height:404px"src="assets/img/wettk.jpg" alt=""/>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12">
                        <div class="abt-text">
                            <p class="top-sub">Since Year 1999</p>
                            <h2>We are <span class="orange-text">TTK</span></h2>
                            <p>Inspired and taken back experiences in teaching music at all the level and the major students at all FU system school in all around the country from 1999 to now!</p>
                            <p>The Path of 22 years improving in quality and making the scope to reach all the limits, helping in expanding music around the world</p>
                            <a href="#" class="boxed-btn mt-4">Know more</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end advertisement section -->

        <!-- shop banner -->
        <section class="shop-banner">
            <div class="container">
                <h3>December sale is on! <br> with big <span class="orange-text">Discount...</span></h3>
                <div class="sale-percent"><span>Sale! <br> Up to</span>50% <span>off</span></div>
                <a href="#" class="cart-btn btn-lg">Shop Now</a>
            </div>
        </section>
        <!-- end shop banner -->


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