<%@page import="bean.VariationOption"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
						</a> <span class="stext-109 cl4"> Shoping Cart </span>
				</div>
		</div>
		<!-- Shoping Cart -->
		<form class="bg0 p-t-75 p-b-85">

  <div class="container h-100 py-5">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col">
        <div class="table-responsive">
          <table class="table">
            <thead>
              <tr>
                <th scope="col" class="h5">Shopping cart</th>
                <th scope="col">Format</th>
                <th scope="col">Quantity</th>
                <th scope="col">Price</th>
                <th scope="col">Action</th>
              </tr>
            </thead>
            <tbody>
              <% Set<ShoppingCartItem> items = (Set<ShoppingCartItem>) request.getAttribute("productItemList"); 
							float sum = 0;
              for(ShoppingCartItem item: items){
            	  	String size = "";
            	  	String color = "";
            	 		sum += item.getProductItem().getPrice();
            	  	Set<VariationOption> variantOptions = item.getProductItem().getVariationOptions();
            	  	for (VariationOption variationOption: variantOptions){
            	  		if(variationOption.getVariation().getName().equals("size")){
            	  			size = variationOption.getValue();
            	  		} else {
            	  			color = variationOption.getValue();
            	  		}
            	  	}
              %>
              <tr>
                <th scope="row">
                  <div class="d-flex align-items-center">
                    <img src="${folder}<%= item.getProductItem().getProduct_image() %>" class="img-fluid rounded-3" style="width: 120px;" alt="Product">
                    <div class="flex-column ms-4">
                      <a href="product-detail?productId=<%=item.getProductItem().getProduct().getProductID() %>" class="mb-2 ml-3 cl3 pointer"><%= item.getProductItem().getProduct().getName() %></a>
                    </div>
                  </div>
                </th>
                <td class="align-middle">
                  <p class="mb-0" style="font-weight: 500;">Color: <%= color %></p>
                  <p class="mb-0" style="font-weight: 500;">Size: <%= size %></p>
                </td>
                <td class="align-middle">
                  <p class="mb-0" style="font-weight: 500;"><%= item.getQty() %></p>
                </td>
                <td class="align-middle">
                  <p class="mb-0" style="font-weight: 500;">$<%= item.getProductItem().getPrice() %></p>
                </td>
                <td class="align-middle">
                  <a href="delete-item-cart?itemId=<%= item.getShoppingCartItemID() %>" class="cl1 mb-0 pointer"  style="font-weight: 500;">Delete</a>
                </td>
              </tr>
              <%} %>
            </tbody>
          </table>
        </div>
        <div class="card shadow-2-strong mb-5 mb-lg-0" style="border-radius: 16px;">
          <div class="card-body p-4">
            <div class="row d-flex justify-content-center">
              <div class="col-lg-12 col-xl-12">
                <div class="d-flex justify-content-between" style="font-weight: 500;">
                  <p class="mb-2">Subtotal</p>
                  <p class="mb-2">$<%= sum %></p>
                </div>

                <hr class="my-4">

                <a type="button" class="btn btn-primary btn-block btn-lg">
                  <div class="d-flex justify-content-center">
                    <span>Checkout</span>
                  </div>
                </a>
              </div>
            </div>
          </div>
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