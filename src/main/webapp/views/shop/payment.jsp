<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="DAO.AddressDAO"%>
<%@page import="java.util.HashSet"%>
<%@page import="bean.Address"%>
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
						</a>
						<a
								href="shopping-cart"
								class="stext-109 cl8 hov-cl1 trans-04"> Shoping Cart <i
								class="fa fa-angle-right m-l-9 m-r-10"
								aria-hidden="true"></i>
						</a> <span class="stext-109 cl4"> Checkout </span>
				</div>
		</div>
		<!-- payment -->
		<%
		try {
		UserAccount userC = AppUtils.getLoginedUser(request.getSession());
		%>
		<form class="bg0 p-t-75 p-b-85" action="process-payment" method="POST">
				<div class="container">
						<div class="row">
								<div class="col-lg-10 col-xl-8">
		                <div class="card">

		                    <div class="card-body">
		                        <span class="my-5 mtext-103 cl2">Shipping address</span>
		                        <hr>
		                            <div class="form-group mt-5">
		                            		<input value="<%= userC.getName() %>" class="form-control size-121" type="text" name="name" placeholder="Name">
		                            </div>
		                            <div class="form-group">
		                            		<input value="<%= userC.getPhone_number() %>" class="form-control size-121" type="text" name="phone" placeholder="Phone">
		                            </div>
		                            <div class="form-group">
		                            		<input value="${selectedAddress.toString()}" class="form-control size-121" type="text" placeholder="address">
		                            		<input value="${selectedAddress.getAddressID()}" type="hidden" name="addressId">
		                            </div>
		                            <a data-toggle="collapse" href="#address" role="button" aria-expanded="false" aria-controls="address">Change address</a>
		                            <div class="collapse mt-2" id="address">
															<div class="card">
																		<div class="card-body d-flex flex-wrap">
																				<%
																					Address selectAddress = (Address) request.getAttribute("selectedAddress");
																					AddressDAO addrDAO = new AddressDAO();
																					Set<Address> addresses = addrDAO.listAddressByUser(userC.getUser_id());
																					for(Address address:addresses){
																						if(address.getAddressID() == selectAddress.getAddressID())
																						{continue;}
																				%>
																					<div class="w-50 p-lr-5">
																						<div class="card">	
																								<div class="card-body d-flex justify-content-between align-items-center">
																									<p class="card-text"><%=address.toString() %></p>
																									<a href="payment?addressId=<%= address.getAddressID()%>"> Choose </a>
																								</div>
																							</div>
																					</div>
																					<%}%>
																		</div>
																</div>
																</div>
		                            <div class="form-group my-5 cl2">
		                            		<label>Payment methods</label>
		                                <div class="d-flex flex-row justify-content-between w-50 mt-3">
		                                    <div class="form-check">
		                                    		<input class="form-check-input" type="radio" id="formCheck-1" value="1" name="paymentMethod" checked>
		                                    		<label class="form-check-label" for="formCheck-1">COD</label>
		                                    </div>
		                                    <div class="form-check">
		                                    		<input class="form-check-input" type="radio" id="formCheck-2" value="2"  name="paymentMethod">
		                                    		<label class="form-check-label" for="formCheck-2">PAYPAL</label>
		                                    </div>
		                                    <div class="form-check">
		                                    		<input class="form-check-input" type="radio" id="formCheck-3" value="3" name="paymentMethod">
		                                    		<label class="form-check-label" for="formCheck-3">VISA</label>
		                                    </div>
		                                </div>
		                            </div>
		                            <div class="form-group mb-5 cl2">
		                            <label>Shipping methods</label>
		                                <div class="d-flex justify-content-between w-75 mt-3">
		                                    <div class="form-check">
		                                    		<input data-price="3" class="form-check-input" type="radio" id="formCheck-4" value="1" name="shippingMethod" checked>
		                                    		<label class="form-check-label" for="formCheck-4">Express</label>
		                                    </div>
		                                    <div class="form-check">
		                                    		<input data-price="2" class="form-check-input" type="radio" id="formCheck-5" value="2" name="shippingMethod">
		                                    		<label class="form-check-label" for="formCheck-5">Fast</label>
		                                    </div>
		                                    <div class="form-check">
		                                    		<input data-price="1.2" class="form-check-input" type="radio" id="formCheck-6" value="3" name="shippingMethod">
		                                    		<label class="form-check-label" for="formCheck-6">Normal</label>
		                                    </div>
		                                    <div class="form-check">
		                                   			<input data-price="0.8" class="form-check-input" type="radio" id="formCheck-7" value="4" name="shippingMethod">
		                                   			<label class="form-check-label" for="formCheck-7">Economical</label>
		                                   	</div>
		                                </div>
		                            </div>
		                            <div class="form-group"><button class="btn btn-info w-100" type="submit"><i class="zmdi zmdi-shopping-cart"></i>&nbsp; COMPLETE PURCHASE</button></div>
		                    </div>
		                </div>
		            </div>
		            <div class="col">
		                <div class="card">
		                    <div class="card-body">
		                        <span class="my-5 mtext-103 cl2">YOUR ODER</span>
		                        <hr>
		                        	<%
									            ShoppingCartDAO shoppingCartDao = new ShoppingCartDAO();
									           	Set<ShoppingCartItem> listShoppingItem = null;
									           	listShoppingItem = shoppingCartDao.listProductItemByUserID(userC.getUser_id());
									           	float tong = 0;
									           	for(ShoppingCartItem product:listShoppingItem){
									           		tong += product.getProductItem().getPrice()*product.getQty();
									            %>
		                        	<div class="d-flex justify-content-between cl2">
		                        	<span><%=product.getProductItem().getProduct().getName()%></span>
		                        	<span><%=product.getQty() %> x $<%= product.getProductItem().getPrice() %></span>
		                        	</div>
		                        	<%} %>
		                        <hr>
		                        <div class="d-flex justify-content-between cl2 mb-3"><span>Total Purchases:</span>
		                        <span id="totalPurchases">$<%= tong %></span></div>
		                        <div class="d-flex justify-content-between cl2 mb-3">
		                        	<span>Transport Fee:</span>
		                        	<span id="transportFee"></span></div>
		                        <hr>
		                        <div class="d-flex justify-content-between">
		                            <h4 class="d-inline-block mtext-103 cl2">Total:</h4>
		                            <h4 id="totalAmount" class="d-inline-block mtext-103 cl2"></h4>
		                        </div>
		                    </div>
		                </div>
		            </div>
						</div>
				</div>
		</form>
		<%} catch (Exception e) {} %>
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

		<!--===============================================================================================-->
		<script>
		    document.addEventListener('DOMContentLoaded', function() {
		        const transportFeeDisplay = document.getElementById('transportFee');
		        const totalDisplay = document.getElementById('totalAmount');
		        const totalPurchases = parseFloat(document.getElementById('totalPurchases').textContent.replace('$', ''));
		
		        const checkedRadioButton = document.querySelector('input[name="shippingMethod"]:checked');
		        const initialPrice = parseFloat(checkedRadioButton.getAttribute('data-price'));
		        transportFeeDisplay.textContent = '$' + initialPrice;
		
		        const initialTotal = totalPurchases + initialPrice;
		        totalDisplay.textContent = '$' + initialTotal;
		        const radioButtons = document.querySelectorAll('input[name="shippingMethod"]');
		        radioButtons.forEach(radioButton => {
		            radioButton.addEventListener('change', function() {
		                const price = parseFloat(this.getAttribute('data-price'));
		                transportFeeDisplay.textContent = '$' + price;
		                
		                const currentTotal = totalPurchases + price;
		                totalDisplay.textContent = '$' + currentTotal;
		            });
		        });
		    });
		</script>

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