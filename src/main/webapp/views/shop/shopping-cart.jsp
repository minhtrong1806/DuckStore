<%@ page
		language="java"
		contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Shoping Cart</title>
<meta charset="UTF-8">
<meta
		name="viewport"
		content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link
		rel="icon"
		type="image/x-icon"
		href="${pageContext.request.contextPath}/views/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link
		rel="stylesheet"
		type="text/css"
		href="${pageContext.request.contextPath}/views/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link
		rel="stylesheet"
		type="text/css"
		href="${pageContext.request.contextPath}/views/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link
		rel="stylesheet"
		type="text/css"
		href="${pageContext.request.contextPath}/views/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link
		rel="stylesheet"
		type="text/css"
		href="${pageContext.request.contextPath}/views/fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link
		rel="stylesheet"
		type="text/css"
		href="${pageContext.request.contextPath}/views/vendor/animate/animate.css">
<!--===============================================================================================-->
<link
		rel="stylesheet"
		type="text/css"
		href="${pageContext.request.contextPath}/views/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link
		rel="stylesheet"
		type="text/css"
		href="${pageContext.request.contextPath}/views/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link
		rel="stylesheet"
		type="text/css"
		href="${pageContext.request.contextPath}/views/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link
		rel="stylesheet"
		type="text/css"
		href="${pageContext.request.contextPath}/views/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
<link
		rel="stylesheet"
		type="text/css"
		href="${pageContext.request.contextPath}/views/css/util.css">
<link
		rel="stylesheet"
		type="text/css"
		href="${pageContext.request.contextPath}/views/css/main.css">
<!--===============================================================================================-->
</head>
<body class="animsition">
		<!-- Header -->
		<header class="header-v4">
				<!-- Header desktop -->
				<div class="container-menu-desktop">
        <!-- Topbar -->
				<%@include file="top-bar.jsp" %>
				<!--  -->
						<div class="wrap-menu-desktop how-shadow1">
								<nav class="limiter-menu-desktop container">
										<!-- Logo desktop -->
										<a
												href="home"
												class="logo"> <img
												src="${pageContext.request.contextPath}/views/images/icons/logo-01.png"
												alt="IMG-LOGO" />
										</a>
										<!-- Menu desktop -->
										<div class="menu-desktop">
												<ul class="main-menu">
														<li><a href="home">Home</a></li>
														<li><a href="shop">Shop</a></li>
														<li><a href="about">About</a></li>
														<li><a href="contact">Contact</a></li>
												</ul>
										</div>
										<!-- Icon header -->
										<%@include file="icon-header-desktop.jsp" %>
										<!--  -->
								</nav>
						</div>
				</div>
				<!-- Header Mobile -->
				<div class="wrap-header-mobile">
						<!-- Logo moblie -->
						<div class="logo-mobile">
								<a href="home"><img
										src="${pageContext.request.contextPath}/views/images/icons/logo-01.png"
										alt="IMG-LOGO" /></a>
						</div>
						<!-- Icon header -->
						<%@include file="icon-header-mobile.jsp" %>
						<!--  -->
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
														href="info"
														class="flex-c-m p-lr-10 trans-04"> Account </a>
										</div>
								</li>
						</ul>
						<ul class="main-menu-m">
								<li><a href="home">Home</a></li>
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
		<!-- breadcrumb -->
		<div class="container">
				<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
						<a
								href="home"
								class="stext-109 cl8 hov-cl1 trans-04"> Home <i
								class="fa fa-angle-right m-l-9 m-r-10"
								aria-hidden="true"></i>
						</a> <span class="stext-109 cl4"> Shoping Cart </span>
				</div>
		</div>
		<!-- Shoping Cart -->
		<form class="bg0 p-t-75 p-b-85">
				<div class="container">
						<div class="row">
								<div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
										<div class="m-l-25 m-r--38 m-lr-0-xl">
												<div class="wrap-table-shopping-cart">
														<table class="table-shopping-cart">
																<tr class="table_head">
																		<th class="column-1">Product</th>
																		<th class="column-2"></th>
																		<th class="column-3">Price</th>
																		<th class="column-4">Quantity</th>
																		<th class="column-5">Total</th>
																		<th class="column-6"></th>
																</tr>
																<tr class="table_row">
																		<td class="column-1">
																				<div class="how-itemcart1">
																						<img
																								src="${pageContext.request.contextPath}/views/images/item-cart-04.jpg"
																								alt="IMG">
																				</div>
																		</td>
																		<td class="column-2">Fresh Strawberries</td>
																		<td class="column-3">$ 36.00</td>
																		<td class="column-4">
																				<div class="wrap-num-product flex-w m-l-auto m-r-0">
																						<div
																								class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
																								<i class="fs-16 zmdi zmdi-minus"></i>
																						</div>
																						<input
																								class="mtext-104 cl3 txt-center num-product"
																								type="number"
																								name="num-product1"
																								value="1">
																						<div
																								class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
																								<i class="fs-16 zmdi zmdi-plus"></i>
																						</div>
																				</div>
																		</td>
																		<td class="column-5">$ 36.00</td>
																		<td class="column-6">
																				<button class="flex-c-m trans-04 hov-cl1">
																						<i class="zmdi zmdi-close"></i>
																				</button>
																		</td>
																</tr>
														</table>
												</div>
												<div
														class="flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm">
														<div class="flex-w flex-m m-r-20 m-tb-5">
																<input
																		class="stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-r-10 m-tb-5"
																		type="text"
																		name="coupon"
																		placeholder="Coupon Code">
																<button
																		class="flex-c-m stext-101 cl2 size-118 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5">Apply
																		coupon</button>
														</div>
														<button
																class="flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15  pointer m-tb-10">Update
																Cart</button>
												</div>
										</div>
								</div>
								<div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">
										<div
												class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm">
												<h4 class="mtext-109 cl2 p-b-30">Cart Totals</h4>
												<div class="flex-w flex-t bor12 p-b-13">
														<div class="size-208">
																<span class="stext-110 cl2"> Subtotal: </span>
														</div>
														<div class="size-209">
																<span class="mtext-110 cl2"> $79.65 </span>
														</div>
												</div>
												<div class="flex-w flex-t bor12 p-t-15 p-b-30">
														<div class="size-208 w-full-ssm">
																<span class="stext-110 cl2"> Shipping: </span>
														</div>
														<div class="size-209 p-r-18 p-r-0-sm w-full-ssm">
																<p class="stext-111 cl6 p-t-2">There are no shipping
																		methods available. Please double check your address,
																		or contact us if you need any help.</p>
																<div class="p-t-15">
																		<span class="stext-112 cl8"> Calculate Shipping
																		</span>
																		<div class="bor8 bg0 m-b-12">
																				<input
																						class="stext-111 cl8 plh3 size-111 p-lr-15"
																						type="text"
																						name="state"
																						placeholder="State /  country">
																		</div>
																		<div class="bor8 bg0 m-b-22">
																				<input
																						class="stext-111 cl8 plh3 size-111 p-lr-15"
																						type="text"
																						name="postcode"
																						placeholder="Postcode / Zip">
																		</div>
																		<div class="flex-w">
																				<button
																						class="flex-c-m stext-101 cl2 size-115 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer">
																						Update Totals</button>
																		</div>
																</div>
														</div>
												</div>
												<div class="flex-w flex-t p-t-27 p-b-33">
														<div class="size-208">
																<span class="mtext-101 cl2"> Total: </span>
														</div>
														<div class="size-209 p-t-1">
																<span class="mtext-110 cl2"> $79.65 </span>
														</div>
												</div>
												<button
														class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer">
														Proceed to Checkout</button>
										</div>
								</div>
						</div>
				</div>
		</form>
		<!-- Cart -->
    <%@ include file="cart.jsp" %>
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
			$(".js-select2").each(function() {
				$(this).select2({
					minimumResultsForSearch : 20,
					dropdownParent : $(this).next('.dropDownSelect2')
				});
			})
		</script>
		<!--===============================================================================================-->
		<script
				src="${pageContext.request.contextPath}/views/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
		<!--===============================================================================================-->
		<script
				src="${pageContext.request.contextPath}/views/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
		<script>
			$('.js-pscroll').each(function() {
				$(this).css('position', 'relative');
				$(this).css('overflow', 'hidden');
				var ps = new PerfectScrollbar(this, {
					wheelSpeed : 1,
					scrollingThreshold : 1000,
					wheelPropagation : false,
				});

				$(window).on('resize', function() {
					ps.update();
				})
			});
		</script>
		<!--===============================================================================================-->
		<script src="${pageContext.request.contextPath}/views/js/main.js"></script>
</body>
</html>