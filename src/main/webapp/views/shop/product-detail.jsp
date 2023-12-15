<%@page import="java.text.DecimalFormat"%>
<%@page import="utils.CalUtils"%>
<%@page import="servlets.admin.ProductDetailServlet"%>
<%@page import="bean.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>		

<!DOCTYPE html>
<html lang="en">
<head>
<title>Product Detail</title>
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
		href="${pageContext.request.contextPath}/views/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link
		rel="stylesheet"
		type="text/css"
		href="${pageContext.request.contextPath}/views/vendor/slick/slick.css">
<!--===============================================================================================-->
<link
		rel="stylesheet"
		type="text/css"
		href="${pageContext.request.contextPath}/views/vendor/MagnificPopup/magnific-popup.css">
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
														<li><a href="shop?category=All+Products">Shop</a></li>
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
								<li><a href="shop?category=All+Products">Shop</a></li>
								<li><a href="about">About</a></li>
								<li><a href="contact">Contact</a></li>
						</ul>
				</div>
      </div>
   	<!-- Modal Search -->
		<%@include file="modal-search.jsp" %>
		</header>
	
		<!-- breadcrumb -->
		<div class="container">
				<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
						<a
								href="home"
								class="stext-109 cl8 hov-cl1 trans-04"> Home <i
								class="fa fa-angle-right m-l-9 m-r-10"
								aria-hidden="true"></i>
						</a> <a
								href="shop?category=${product.getProductCategory().getCategoryName()}"
								class="stext-109 cl8 hov-cl1 trans-04"> ${product.getProductCategory().getCategoryName()} <i
								class="fa fa-angle-right m-l-9 m-r-10"
								aria-hidden="true"></i>
						</a> <span class="stext-109 cl4"> ${product.getName()} </span>
				</div>
		</div>
		<!-- Product Detail -->
		<section class="sec-product-detail bg0 p-t-65 p-b-60">
				<div class="container">
						<div class="row">
								<div class="col-md-6 col-lg-7 p-b-30">
										<div class="p-l-25 p-r-30 p-lr-0-lg">
												<div class="wrap-slick3 flex-sb flex-w">
														<div class="wrap-slick3-dots"></div>
														<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>
														<div class="slick3 gallery-lb">
																<!-- ẢNH PRODUCT-->
																
																<div class="item-slick3" data-thumb="${folder}${product.getProduct_image()}">
																		<div class="wrap-pic-w pos-relative">
																				<img src="${folder}${product.getProduct_image()}" alt="IMG-PRODUCT" class="responsive-image"> 
																				<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
																						href="${folder}${product.getProduct_image()}"> 
																						<i class="fa fa-expand"></i>
																				</a>
																		</div>
																</div>
																<c:forEach items="${imageList}" var="image">
																	<div class="item-slick3" data-thumb="${folder}${image}">
																			<div class="wrap-pic-w pos-relative">
																					<img src="${folder}${image}" alt="IMG-PRODUCT" class="responsive-image"> 
																					<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
																							href="${folder}${image}"> 
																							<i class="fa fa-expand"></i>
																					</a>
																			</div>
																	</div>
																</c:forEach>
																
																<!--  -->
														</div>
												</div>
										</div>
								</div>
								<div class="col-md-6 col-lg-5 p-b-30">
									<form action="add-to-cart">
										<div class="p-r-50 p-t-5 p-lr-0-lg">
												<h4 class="mtext-105 cl2 js-name-detail p-b-14">
														${product.getName()}
												</h4>
												<c:if test="${message != null }">
													<p style="color: red;	">${message}</p>
												</c:if>
												<span class="mtext-106 cl2">$${price} </span>
												<!--  -->
												<div class="p-t-33">
														<div class="flex-w flex-r-m p-b-10">
																<div class="size-203 flex-c-m respon6">Size</div>
																<div class="size-204 respon6-next">
																		<div class="bor8 bg0">
																				<select class="form-control" id="size" name="size" onchange="reloadPage()">
																					<c:forEach items="${sizeList}" var="size">
																						<option value="${size}">Size ${size}</option>
																					</c:forEach>
																				</select>
																				<div class="dropDownSelect2"></div>
																		</div>
																</div>
														</div>
														<div class="flex-w flex-r-m p-b-10">
																<div class="size-203 flex-c-m respon6">Color</div>
																<div class="size-204 respon6-next">
																		<div class="bor8 bg0">
																				<select class="form-control" id="color" name="color" onchange="reloadPage()">
																					<c:forEach items="${colorList}" var="color">
																						<option value="${color}">${color}</option>
																					</c:forEach>
																				</select>
																				<div class="dropDownSelect2"></div>
																		</div>
																</div>
														</div>
														<div class="flex-w flex-r-m p-b-10">
																<div class="size-204 flex-w flex-m respon6-next">
																		<div class="wrap-num-product flex-w m-r-20 m-tb-10">
																				<div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
																						<i class="fs-16 zmdi zmdi-minus"></i>
																				</div>
																				<input class="mtext-104 cl3 txt-center num-product"
																						type="number" name="numProduct" value="1" max="${quantity}">
																				<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
																						<i class="fs-16 zmdi zmdi-plus"></i>
																				</div>
																		</div>
																		<input type="hidden" name="productId" value="${product.getProductID()}">
																		<button class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04" type="submit">
																				Add to cart
																		</button>
																</div>
														</div>
														<div class="flex-w flex-r-m">
																<div class="size-203 flex-c-m respon6"></div>
																<div class="size-204 respon6-next">
																		<p>${quantity} products available.</p>
																		<span style="color: Red;"><c:if test="${quantity == 0}"> Please choose another size or color!</c:if></span>
																</div>
														</div>
												</div>
										</div>
									</form>
								</div>
						</div>
						<div class="bor10 m-t-50 p-t-43 p-b-40">
								<!-- Tab01 -->
								<div class="tab01">
										<!-- Nav tabs -->
										<ul class="nav nav-tabs" role="tablist">
												<li class="nav-item p-b-10">
													<a class="nav-link active" role="tab">Description</a>
												</li>
										</ul>
										<!-- Tab panes -->
										<div class="tab-content p-t-43">
												<!-- - -->
												<div class="tab-pane fade show active"  id="description" role="tabpanel">
														<div class="how-pos2 p-lr-15-md">
																<p class="stext-102 cl6">
																	${product.getDescription()}
																</p>
														</div>
												</div>												
										</div>
								</div>
						</div>
				</div>
				<div class="bg6 flex-c-m flex-w size-302 m-t-73 p-tb-15">
						<span class="stext-107 cl6 p-lr-25"> SKU: ${sku} </span> 
						<span class="stext-107 cl6 p-lr-25"> Categories: ${product.getProductCategory().getCategoryName()}</span>
				</div>
		</section>
	
		
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
		<!-- Thẻ div ẩn để chứa thông báo -->
		<div id="message" style="display: none;">
		    <% 
		    // Lấy thông báo từ session attribute
		    String message = (String) session.getAttribute("message");
		    // Kiểm tra nếu có thông báo thành công
		    if (message != null && !message.trim().isEmpty()) {
		        out.println(message);
		        // Xóa thông báo thành công khỏi session attribute sau khi đã lấy thông tin
		        session.removeAttribute("message");
		    }
		    %>
		</div>
		
		<!-- Đoạn mã JavaScript để hiển thị thông báo khi trang tải xong -->
		<script type="text/javascript">
		    // Sử dụng window.onload để đảm bảo thông báo chỉ hiển thị khi trang đã load hoàn toàn
		    window.onload = function() {
		        var messageDiv = document.getElementById('message');
		        var message = messageDiv.textContent.trim();
		        if (message !== '') {
		            alert(message); // Thay đổi từ 'alter' thành 'alert' để hiển thị thông báo
		        }
		    };
		</script>



		<!--===============================================================================================-->
		<script src="${pageContext.request.contextPath}/views/vendor/jquery/jquery-3.2.1.min.js"></script>
		<!--===============================================================================================-->
		<script src="${pageContext.request.contextPath}/views/vendor/animsition/js/animsition.min.js"></script>
		<!--===============================================================================================-->
		<script src="${pageContext.request.contextPath}/views/vendor/bootstrap/js/popper.js"></script>
		<script src="${pageContext.request.contextPath}/views/vendor/bootstrap/js/bootstrap.min.js"></script>
		<!--===============================================================================================-->
		<script src="${pageContext.request.contextPath}/views/vendor/select2/select2.min.js"></script>
		<script>
			$(".js-select2").each(function() {
				$(this).select2({
					minimumResultsForSearch : 20,
					dropdownParent : $(this).next('.dropDownSelect2')
				});
			})
		</script>
		<!--===============================================================================================-->
		<script src="${pageContext.request.contextPath}/views/vendor/daterangepicker/moment.min.js"></script>
		<script src="${pageContext.request.contextPath}/views/vendor/daterangepicker/daterangepicker.js"></script>
		<!--===============================================================================================-->
		<script src="${pageContext.request.contextPath}/views/vendor/slick/slick.min.js"></script>
		<script src="${pageContext.request.contextPath}/views/js/slick-custom.js"></script>
		<!--===============================================================================================-->
		<script src="${pageContext.request.contextPath}/views/vendor/parallax100/parallax100.js"></script>
		<script>
			$('.parallax100').parallax100();
		</script>
		<!--===============================================================================================-->
		<script src="${pageContext.request.contextPath}/views/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
		<script>
			$('.gallery-lb').each(function() { // the containers for all your galleries
				$(this).magnificPopup({
					delegate : 'a', // the selector for gallery item
					type : 'image',
					gallery : {
						enabled : true
					},
					mainClass : 'mfp-fade'
				});
			});
		</script>
		<!--===============================================================================================-->
		<script src="${pageContext.request.contextPath}/views/vendor/isotope/isotope.pkgd.min.js"></script>
		<!--===============================================================================================-->
		<script src="${pageContext.request.contextPath}/views/vendor/sweetalert/sweetalert.min.js"></script>
		<!--===============================================================================================-->
		<script src="${pageContext.request.contextPath}/views/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
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
		<script>
		    document.addEventListener('DOMContentLoaded', function() {
		        var selectedSize = sessionStorage.getItem('selectedSize');
		        var selectedColor = sessionStorage.getItem('selectedColor');
		
		        var sizeDropdown = document.querySelector('select[name="size"]');
		        var colorDropdown = document.querySelector('select[name="color"]');
		
		        Array.from(sizeDropdown.options).forEach(function(option) {
		            if (option.value === selectedSize) {
		                option.setAttribute('selected', 'selected');
		            }
		        });
		
		        Array.from(colorDropdown.options).forEach(function(option) {
		            if (option.value === selectedColor) {
		                option.setAttribute('selected', 'selected');
		            }
		        });
		
		        sizeDropdown.addEventListener('change', function() {
		            updateSelection();
		            updateURL();
		            reloadPage(); // Tải lại trang khi dropdown thay đổi
		        });
		
		        colorDropdown.addEventListener('change', function() {
		            updateSelection();
		            updateURL();
		            reloadPage(); // Tải lại trang khi dropdown thay đổi
		        });
		
		        function updateSelection() {
		            var selectedSize = document.querySelector('select[name="size"]').value;
		            var selectedColor = document.querySelector('select[name="color"]').value;
		
		            sessionStorage.setItem('selectedSize', selectedSize);
		            sessionStorage.setItem('selectedColor', selectedColor);
		        }
		
		        function updateURL() {
		            var selectedSize = document.querySelector('select[name="size"]').value;
		            var selectedColor = document.querySelector('select[name="color"]').value;
		
		            var currentURL = window.location.href;
		            var url = new URL(currentURL);
		
		            url.searchParams.set('size', selectedSize);
		            url.searchParams.set('color', selectedColor);
		
		            history.pushState(null, null, url);
		        }
		
		        function reloadPage() {
		            location.reload(); // Tải lại trang
		        }
		    });
		</script>

		<!--===============================================================================================-->
		<script src="${pageContext.request.contextPath}/views/js/main.js"></script>
</body>
</html>