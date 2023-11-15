<%@ page
		language="java"
		contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Home</title>
<meta charset="UTF-8" />
<meta
		name="viewport"
		content="width=device-width, initial-scale=1" />
<!--===============================================================================================-->
<link
		rel="icon"
		type="image/x-icon"
		href="${pageContext.request.contextPath}/views/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link
		rel="stylesheet"
		type="text/css"
		href="${pageContext.request.contextPath}/views/vendor/bootstrap/css/bootstrap.min.css" />
<!--===============================================================================================-->
<link
		rel="stylesheet"
		type="text/css"
		href="${pageContext.request.contextPath}/views/fonts/font-awesome-4.7.0/css/font-awesome.min.css" />
<!--===============================================================================================-->
<link
		rel="stylesheet"
		type="text/css"
		href="${pageContext.request.contextPath}/views/fonts/iconic/css/material-design-iconic-font.min.css" />
<!--===============================================================================================-->
<link
		rel="stylesheet"
		type="text/css"
		href="${pageContext.request.contextPath}/views/fonts/linearicons-v1.0.0/icon-font.min.css" />
<!--===============================================================================================-->
<link
		rel="stylesheet"
		type="text/css"
		href="${pageContext.request.contextPath}/views/vendor/animate/animate.css" />
<!--===============================================================================================-->
<link
		rel="stylesheet"
		type="text/css"
		href="${pageContext.request.contextPath}/views/vendor/css-hamburgers/hamburgers.min.css" />
<!--===============================================================================================-->
<link
		rel="stylesheet"
		type="text/css"
		href="${pageContext.request.contextPath}/views/vendor/animsition/css/animsition.min.css" />
<!--===============================================================================================-->
<link
		rel="stylesheet"
		type="text/css"
		href="${pageContext.request.contextPath}/views/vendor/select2/select2.min.css" />
<!--===============================================================================================-->
<link
		rel="stylesheet"
		type="text/css"
		href="${pageContext.request.contextPath}/views/vendor/daterangepicker/daterangepicker.css" />
<!--===============================================================================================-->
<link
		rel="stylesheet"
		type="text/css"
		href="${pageContext.request.contextPath}/views/vendor/slick/slick.css" />
<!--===============================================================================================-->
<link
		rel="stylesheet"
		type="text/css"
		href="${pageContext.request.contextPath}/views/vendor/MagnificPopup/magnific-popup.css" />
<!--===============================================================================================-->
<link
		rel="stylesheet"
		type="text/css"
		href="${pageContext.request.contextPath}/views/vendor/perfect-scrollbar/perfect-scrollbar.css" />
<!--===============================================================================================-->
<link
		rel="stylesheet"
		type="text/css"
		href="${pageContext.request.contextPath}/views/css/util.css" />
<link
		rel="stylesheet"
		type="text/css"
		href="${pageContext.request.contextPath}/views/css/main.css" />
<!--===============================================================================================-->
</head>
<body class="animsition">
		<!-- Header -->
		<header>
				<!-- Header desktop -->
				<div class="container-menu-desktop">
						<!-- Topbar -->
						<div class="top-bar">
								<div class="content-topbar flex-sb-m h-full container">
										<div class="left-top-bar">Free shipping for standard
												order over $100</div>
										<div class="right-top-bar flex-w h-full">
												<a
														href="login"
														class="flex-c-m trans-04 p-lr-25"> Login </a> <a
														href="logout"
														class="flex-c-m trans-04 p-lr-25"> Logout </a>
										</div>
								</div>
						</div>
						<div class="wrap-menu-desktop">
								<nav class="limiter-menu-desktop container">
										<!-- Logo desktop -->
										<a
												href="#"
												class="logo"> <img
												src="${pageContext.request.contextPath}/views/images/icons/logo-01.png"
												alt="IMG-LOGO" />
										</a>
										<!-- Menu desktop -->
										<div class="menu-desktop">
												<ul class="main-menu">
														<li class="active-menu"><a href="home">Home</a></li>
														<li><a href="shop">Shop</a></li>
														<li><a href="about">About</a></li>
														<li><a href="contact">Contact</a></li>
												</ul>
										</div>
										<!-- Icon header -->
										<div class="wrap-icon-header flex-w flex-r-m">
												<div
														class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
														<i class="zmdi zmdi-search"></i>
												</div>
												<a
														href="shopping-cart"
														class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 ">
														<i class="zmdi zmdi-shopping-cart"></i>
												</a> <a
														href="my-account"
														class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11"
														data-notify="0"> <i
														class="zmdi zmdi-account-circle"></i>
												</a>
										</div>
								</nav>
						</div>
				</div>
				<!-- Header Mobile -->
				<div class="wrap-header-mobile">
						<!-- Logo moblie -->
						<div class="logo-mobile">
								<a href="index"><img
										src="${pageContext.request.contextPath}/views/images/icons/logo-01.png"
										alt="IMG-LOGO" /></a>
						</div>
						<!-- Icon header -->
						<div class="wrap-icon-header flex-w flex-r-m m-r-15">
								<div
										class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
										<i class="zmdi zmdi-search"></i>
								</div>
								<a
										href="shopping-cart"
										class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 ">
										<i class="zmdi zmdi-shopping-cart"></i>
								</a>
						</div>
						<!-- Button show menu -->
						<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
								<span class="hamburger-box"> <span
										class="hamburger-inner"></span>
								</span>
						</div>
				</div>
				<!-- Menu Mobile -->
				<div class="menu-mobile">
						<ul class="topbar-mobile">
								<li>
										<div class="left-top-bar">Free shipping for standard
												order over $100</div>
								</li>
								<li>
										<div class="right-top-bar flex-w h-full">
												<a
														href="login"
														class="flex-c-m p-lr-10 trans-04"> Login </a> <a
														href="logout"
														class="flex-c-m p-lr-10 trans-04"> Logout </a> <a
														href="my-account"
														class="flex-c-m p-lr-10 trans-04">Account</a>
										</div>
								</li>
						</ul>
						<ul class="main-menu-m">
								<li><a href="index">Home</a> <span
										class="arrow-main-menu-m"> <i
												class="fa fa-angle-right"
												aria-hidden="true"></i>
								</span></li>
								<li><a href="shop">Shop</a></li>
								<li><a href="about">About</a></li>
								<li><a href="contact">Contact</a></li>
						</ul>
				</div>
				<!-- Modal Search -->
				<div
						class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
						<div class="container-search-header">
								<button
										class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
										<img
												src="${pageContext.request.contextPath}/views/images/icons/icon-close2.png"
												alt="CLOSE" />
								</button>
								<form class="wrap-search-header flex-w p-l-15">
										<button class="flex-c-m trans-04">
												<i class="zmdi zmdi-search"></i>
										</button>
										<input
												class="plh3"
												type="text"
												name="search"
												placeholder="Search..." />
								</form>
						</div>
				</div>
		</header>
		<!-- Slider -->
		<section class="section-slide">
				<div class="wrap-slick1">
						<div class="slick1">
								<div
										class="item-slick1"
										style="background-image: url(${pageContext.request.contextPath}/views/images/slide-01.jpg)">
										<div class="container h-full">
												<div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
														<div
																class="layer-slick1 animated visible-false"
																data-appear="fadeInDown"
																data-delay="0">
																<span class="ltext-101 cl2 respon2"> Women
																		Collection 2018 </span>
														</div>
														<div
																class="layer-slick1 animated visible-false"
																data-appear="fadeInUp"
																data-delay="800">
																<h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1">NEW
																		SEASON</h2>
														</div>
														<div
																class="layer-slick1 animated visible-false"
																data-appear="zoomIn"
																data-delay="1600">
																<a
																		href="product"
																		class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">
																		Shop Now </a>
														</div>
												</div>
										</div>
								</div>
								<div
										class="item-slick1"
										style="background-image: url(${pageContext.request.contextPath}/views/images/slide-02.jpg)">
										<div class="container h-full">
												<div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
														<div
																class="layer-slick1 animated visible-false"
																data-appear="rollIn"
																data-delay="0">
																<span class="ltext-101 cl2 respon2"> Men
																		New-Season </span>
														</div>
														<div
																class="layer-slick1 animated visible-false"
																data-appear="lightSpeedIn"
																data-delay="800">
																<h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1">Jackets
																		& Coats</h2>
														</div>
														<div
																class="layer-slick1 animated visible-false"
																data-appear="slideInUp"
																data-delay="1600">
																<a
																		href="product"
																		class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">
																		Shop Now </a>
														</div>
												</div>
										</div>
								</div>
								<div
										class="item-slick1"
										style="background-image: url(${pageContext.request.contextPath}/views/images/slide-03.jpg)">
										<div class="container h-full">
												<div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
														<div
																class="layer-slick1 animated visible-false"
																data-appear="rotateInDownLeft"
																data-delay="0">
																<span class="ltext-101 cl2 respon2"> Men
																		Collection 2018 </span>
														</div>
														<div
																class="layer-slick1 animated visible-false"
																data-appear="rotateInUpRight"
																data-delay="800">
																<h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1">New
																		arrivals</h2>
														</div>
														<div
																class="layer-slick1 animated visible-false"
																data-appear="rotateIn"
																data-delay="1600">
																<a
																		href="product"
																		class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">
																		Shop Now </a>
														</div>
												</div>
										</div>
								</div>
						</div>
				</div>
		</section>
		<!-- Banner -->
		<div class="sec-banner bg0 p-t-80 p-b-50">
				<div class="container">
						<div class="row">
								<div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
										<!-- Block1 -->
										<div class="block1 wrap-pic-w">
												<img
														src="${pageContext.request.contextPath}/views/images/banner-01.jpg"
														alt="IMG-BANNER" /> <a
														href="product"
														class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
														<div class="block1-txt-child1 flex-col-l">
																<span class="block1-name ltext-102 trans-04 p-b-8">
																		Women </span> <span class="block1-info stext-102 trans-04">
																		Spring 2018 </span>
														</div>
														<div class="block1-txt-child2 p-b-4 trans-05">
																<div class="block1-link stext-101 cl0 trans-09">Shop
																		Now</div>
														</div>
												</a>
										</div>
								</div>
								<div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
										<!-- Block1 -->
										<div class="block1 wrap-pic-w">
												<img
														src="${pageContext.request.contextPath}/views/images/banner-02.jpg"
														alt="IMG-BANNER" /> <a
														href="product"
														class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
														<div class="block1-txt-child1 flex-col-l">
																<span class="block1-name ltext-102 trans-04 p-b-8">
																		Men </span> <span class="block1-info stext-102 trans-04">
																		Spring 2018 </span>
														</div>
														<div class="block1-txt-child2 p-b-4 trans-05">
																<div class="block1-link stext-101 cl0 trans-09">Shop
																		Now</div>
														</div>
												</a>
										</div>
								</div>
								<div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
										<!-- Block1 -->
										<div class="block1 wrap-pic-w">
												<img
														src="${pageContext.request.contextPath}/views/images/banner-03.jpg"
														alt="IMG-BANNER" /> <a
														href="product"
														class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
														<div class="block1-txt-child1 flex-col-l">
																<span class="block1-name ltext-102 trans-04 p-b-8">
																		Accessories </span> <span
																		class="block1-info stext-102 trans-04"> New
																		Trend </span>
														</div>
														<div class="block1-txt-child2 p-b-4 trans-05">
																<div class="block1-link stext-101 cl0 trans-09">Shop
																		Now</div>
														</div>
												</a>
										</div>
								</div>
						</div>
				</div>
		</div>
		<!-- Footer -->
		<%@ include file="footer.jsp"%>
		<!-- Back to top -->
		<div
				class="btn-back-to-top"
				id="myBtn">
				<span class="symbol-btn-back-to-top"> <i
						class="zmdi zmdi-chevron-up"></i>
				</span>
		</div>
		<!-- Modal1 -->
		<div class="wrap-modal1 js-modal1 p-t-60 p-b-20">
				<div class="overlay-modal1 js-hide-modal1"></div>
				<div class="container">
						<div class="bg0 p-t-60 p-b-30 p-lr-15-lg how-pos3-parent">
								<button class="how-pos3 hov3 trans-04 js-hide-modal1">
										<img
												src="${pageContext.request.contextPath}/views/images/icons/icon-close.png"
												alt="CLOSE" />
								</button>
								<div class="row">
										<div class="col-md-6 col-lg-7 p-b-30">
												<div class="p-l-25 p-r-30 p-lr-0-lg">
														<div class="wrap-slick3 flex-sb flex-w">
																<div class="wrap-slick3-dots"></div>
																<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>
																<div class="slick3 gallery-lb">
																		<div
																				class="item-slick3"
																				data-thumb="images/product-detail-01.jpg">
																				<div class="wrap-pic-w pos-relative">
																						<img
																								src="${pageContext.request.contextPath}/views/images/product-detail-01.jpg"
																								alt="IMG-PRODUCT" /> <a
																								class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
																								href="images/product-detail-01.jpg">
																								<i class="fa fa-expand"></i>
																						</a>
																				</div>
																		</div>
																		<div
																				class="item-slick3"
																				data-thumb="images/product-detail-02.jpg">
																				<div class="wrap-pic-w pos-relative">
																						<img
																								src="${pageContext.request.contextPath}/views/images/product-detail-02.jpg"
																								alt="IMG-PRODUCT" /> <a
																								class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
																								href="images/product-detail-02.jpg">
																								<i class="fa fa-expand"></i>
																						</a>
																				</div>
																		</div>
																		<div
																				class="item-slick3"
																				data-thumb="images/product-detail-03.jpg">
																				<div class="wrap-pic-w pos-relative">
																						<img
																								src="${pageContext.request.contextPath}/views/images/product-detail-03.jpg"
																								alt="IMG-PRODUCT" /> <a
																								class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
																								href="images/product-detail-03.jpg">
																								<i class="fa fa-expand"></i>
																						</a>
																				</div>
																		</div>
																</div>
														</div>
												</div>
										</div>
										<div class="col-md-6 col-lg-5 p-b-30">
												<div class="p-r-50 p-t-5 p-lr-0-lg">
														<h4 class="mtext-105 cl2 js-name-detail p-b-14">Lightweight
																Jacket</h4>
														<span class="mtext-106 cl2"> $58.79 </span>
														<p class="stext-102 cl3 p-t-23">Nulla eget sem vitae
																eros pharetra viverra. Nam vitae luctus ligula. Mauris
																consequat ornare feugiat.</p>
														<!--  -->
														<div class="p-t-33">
																<div class="flex-w flex-r-m p-b-10">
																		<div class="size-203 flex-c-m respon6">Size</div>
																		<div class="size-204 respon6-next">
																				<div class="rs1-select2 bor8 bg0">
																						<select
																								class="js-select2"
																								name="time">
																								<option>Choose an option</option>
																								<option>Size S</option>
																								<option>Size M</option>
																								<option>Size L</option>
																								<option>Size XL</option>
																						</select>
																						<div class="dropDownSelect2"></div>
																				</div>
																		</div>
																</div>
																<div class="flex-w flex-r-m p-b-10">
																		<div class="size-203 flex-c-m respon6">Color</div>
																		<div class="size-204 respon6-next">
																				<div class="rs1-select2 bor8 bg0">
																						<select
																								class="js-select2"
																								name="time">
																								<option>Choose an option</option>
																								<option>Red</option>
																								<option>Blue</option>
																								<option>White</option>
																								<option>Grey</option>
																						</select>
																						<div class="dropDownSelect2"></div>
																				</div>
																		</div>
																</div>
																<div class="flex-w flex-r-m p-b-10">
																		<div class="size-204 flex-w flex-m respon6-next">
																				<div class="wrap-num-product flex-w m-r-20 m-tb-10">
																						<div
																								class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
																								<i class="fs-16 zmdi zmdi-minus"></i>
																						</div>
																						<input
																								class="mtext-104 cl3 txt-center num-product"
																								type="number"
																								name="num-product"
																								value="1" />
																						<div
																								class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
																								<i class="fs-16 zmdi zmdi-plus"></i>
																						</div>
																				</div>
																				<button
																						class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail">
																						Add to cart</button>
																		</div>
																</div>
														</div>
														<!--  -->
														<div class="flex-w flex-m p-l-100 p-t-40 respon7">
																<div class="flex-m bor9 p-r-10 m-r-11">
																		<a
																				href="#"
																				class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-detail tooltip100"
																				data-tooltip="Add to Wishlist">
																				<i class="zmdi zmdi-favorite"></i>
																		</a>
																</div>
																<a
																		href="#"
																		class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
																		data-tooltip="Facebook"> <i
																		class="fa fa-facebook"></i>
																</a> <a
																		href="#"
																		class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
																		data-tooltip="Twitter"> <i
																		class="fa fa-twitter"></i>
																</a> <a
																		href="#"
																		class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
																		data-tooltip="Google Plus"> <i
																		class="fa fa-google-plus"></i>
																</a>
														</div>
												</div>
										</div>
								</div>
						</div>
				</div>
		</div>
		<!--===============================================================================================-->
		<script
				src="${pageContext.request.contextPath}/views/vendor/jquery/jquery-3.2.1.min.js"></script>
		<!--===============================================================================================-->
		<script
				src="${pageContext.request.contextPath}/views/vendor/animsition/js/animsition.min.js"></script>
		<!--===============================================================================================-->
		<script
				src="${pageContext.request.contextPath}/views/vendor/bootstrap/js/popper.js"></script>
		<script
				src="${pageContext.request.contextPath}/views/vendor/bootstrap/js/bootstrap.min.js"></script>
		<!--===============================================================================================-->
		<script
				src="${pageContext.request.contextPath}/views/vendor/select2/select2.min.js"></script>
		<script>
      $(".js-select2").each(function () {
        $(this).select2({
          minimumResultsForSearch: 20,
          dropdownParent: $(this).next(".dropDownSelect2"),
        })
      })
    </script>
		<!--===============================================================================================-->
		<script
				src="${pageContext.request.contextPath}/views/vendor/daterangepicker/moment.min.js"></script>
		<script
				src="${pageContext.request.contextPath}/views/vendor/daterangepicker/daterangepicker.js"></script>
		<!--===============================================================================================-->
		<script
				src="${pageContext.request.contextPath}/views/vendor/slick/slick.min.js"></script>
		<script
				src="${pageContext.request.contextPath}/views/js/slick-custom.js"></script>
		<!--===============================================================================================-->
		<script
				src="${pageContext.request.contextPath}/views/vendor/parallax100/parallax100.js"></script>
		<script>
      $(".parallax100").parallax100()
    </script>
		<!--===============================================================================================-->
		<script
				src="${pageContext.request.contextPath}/views/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
		<script>
      $(".gallery-lb").each(function () {
        // the containers for all your galleries
        $(this).magnificPopup({
          delegate: "a", // the selector for gallery item
          type: "image",
          gallery: {
            enabled: true,
          },
          mainClass: "mfp-fade",
        })
      })
    </script>
		<!--===============================================================================================-->
		<script
				src="${pageContext.request.contextPath}/views/vendor/isotope/isotope.pkgd.min.js"></script>
		<!--===============================================================================================-->
		<script
				src="${pageContext.request.contextPath}/views/vendor/sweetalert/sweetalert.min.js"></script>
		<script>
      $(".js-addwish-b2").on("click", function (e) {
        e.preventDefault()
      })

      $(".js-addwish-b2").each(function () {
        var nameProduct = $(this).parent().parent().find(".js-name-b2").html()
        $(this).on("click", function () {
          swal(nameProduct, "is added to wishlist !", "success")

          $(this).addClass("js-addedwish-b2")
          $(this).off("click")
        })
      })

      $(".js-addwish-detail").each(function () {
        var nameProduct = $(this).parent().parent().parent().find(".js-name-detail"l())

        $(this).on("click", function () {
          swal(nameProduct, "is added to wishlist !", "success")

          $(this).addClass("js-addedwish-detail")
          $(this).off("click")
        })
      })

      /*---------------------------------------------*/

      $(".js-addcart-detail").each(function () {
        var nameProduct = $(this).parent().parent().parent().parent().find(".js-name-detail").html()
        $(this).on("click", function () {
          swal(nameProduct, "is added to cart !", "success")
        })
      })
    </script>
		<!--===============================================================================================-->
		<script
				src="${pageContext.request.contextPath}/views/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
		<script>
      $(".js-pscroll").each(function () {
        $(this).css("position", "relative")
        $(this).css("overflow", "hidden")
        var ps = new PerfectScrollbar(this, {
          wheelSpeed: 1,
          scrollingThreshold: 1000,
          wheelPropagation: false,
        })

        $(window).on("resize", function () {
          ps.update()
        })
      })
    </script>
		<!--===============================================================================================-->
		<script src="${pageContext.request.contextPath}/views/js/main.js"></script>
</body>
</html>
