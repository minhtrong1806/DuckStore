<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Product</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!--===============================================================================================-->
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/views/images/icons/favicon.ico" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/vendor/bootstrap/css/bootstrap.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/fonts/font-awesome-4.7.0/css/font-awesome.min.css"
    />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/fonts/iconic/css/material-design-iconic-font.min.css"
    />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/fonts/linearicons-v1.0.0/icon-font.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/vendor/animate/animate.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/vendor/css-hamburgers/hamburgers.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/vendor/animsition/css/animsition.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/vendor/select2/select2.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/vendor/daterangepicker/daterangepicker.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/vendor/slick/slick.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/vendor/MagnificPopup/magnific-popup.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/vendor/perfect-scrollbar/perfect-scrollbar.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/util.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/main.css" />
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
            <a href="home" class="logo"> <img src="${pageContext.request.contextPath}/views/images/icons/logo-01.png" alt="IMG-LOGO" /> </a>
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
          <a href="home"><img src="${pageContext.request.contextPath}/views/images/icons/logo-01.png" alt="IMG-LOGO" /></a>
        </div>
				<!-- Icon header -->
				<%@include file="icon-header-mobile.jsp" %>
				<!--  -->
        <!-- Button show menu -->
        <div class="btn-show-menu-mobile hamburger hamburger--squeeze">
          <span class="hamburger-box"> <span class="hamburger-inner"></span> </span>
        </div>
      </div>
      <!-- Menu Mobile -->
      <div class="menu-mobile">
        <ul class="topbar-mobile">
          <li>
            <div class="left-top-bar">Free shipping for standard order over $100</div>
          </li>
          <li>
            <div class="right-top-bar flex-w h-full">
              <a href="login" class="flex-c-m p-lr-10 trans-04"> Login </a>
              <a href="logout" class="flex-c-m p-lr-10 trans-04"> Logout </a>
              <a href="info" class="flex-c-m p-lr-10 trans-04"> Account </a>
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
    <!-- Modal Search -->
		<%@include file="modal-search.jsp" %>
    </header>
    
    <!-- breadcrumb -->
    <div class="container">
      <div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
        <a href="info" class="stext-109 cl8 hov-cl1 trans-04">
          My Account <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
        </a>
        <span class="stext-109 cl4"> Edit Info </span>
      </div>
    </div>
    <!-- My Account -->
		<div class="container">
				<div class="my-5">
						<div class="row">
								<div class="col-xl-4">
										<div class="card">
												<div class="card-body">
														<h4 class="ltext-108 cl2 text-center m-tb-20">Minh
																Trong</h4>
														<div class="border-top">
																<div class="list-group">
																		<a class="font-weight-bold list-group-item list-group-item-action border-0 mt-5 active"
																				href="info">Info</a>
																		<a class="font-weight-bold list-group-item list-group-item-action border-0"
																				href="address">Address Book</a>
																		<a  class="font-weight-bold list-group-item list-group-item-action border-0"
																				href="change-password">Change password</a>
																		<a  class="font-weight-bold list-group-item list-group-item-action border-0 mb-5"
																				href="history">History</a>
																</div>
														</div>
												</div>
										</div>
								</div>
								<div class="col">
											<form action="${pageContext.request.contextPath}/edit-info" method="POST">
														<div class="card">
																<div class="m-all-40">
																		<h5 class="text-left mtext-103 cl2">Edit Your Info</h5>
																</div>
																<div class="card-body border-top">
																		<div class="form-row">
																		<div class="col">
																				<div class="form-group w-100">
																					<label for="username"><strong>Username</strong></label>
<%--userName--%>													<input value="<c:if test="${userCurrent.getName() != null }">${userCurrent.getName() }</c:if>" class="form-control size-121" 
																							type="text" id="username" placeholder="User Name" name="userName">
																				</div>
																				<div class="form-group w-100 ">
																					<label class="m-t-10" for="email"><strong>Email Address</strong></label>
<%--emailAddress--%>											<input value="<c:if test="${userCurrent.getEmailAddress() != null}">${userCurrent.getEmailAddress()}</c:if>" class="form-control size-121" 
																							type="email" id="email" placeholder="Email Address" name="emailAddress">
																				</div>
																				<div class="form-group w-100">
																					<label for="first_name"><strong>Phone Number</strong></label>
<%--phoneNumber--%>			     							<input value="<c:if test="${userCurrent.getPhone_number() != null }">${userCurrent.getPhone_number() }</c:if>" class="form-control size-121" 
																							type="text" id="first_name" name="phoneNumber" placeholder="Phone Number">
																				</div>
																				<div class="form-row d-flex flex-column">
																							<c:if test="${userNameMessage != null }">
																									<small style="color: var(--red)" >${userNameMessage}</small>
																							</c:if>
																							<c:if test="${emailMessage != null }">
																									<small style="color: var(--red)" >${emailMessage}</small>
																							</c:if>
																				</div>
																		</div>
																		</div>
																</div>
																<div class="d-xl-flex justify-content-xl-end stext-108 px-4 mb-2">
																		<button class="flex-c-m stext-101 cl0 size-104 bg1 bor1 hov-btn1 p-lr-15 trans-04" type="submit">Save</button>
																</div>
														</div>
											</form>		
								</div>
						</div>
				</div>
		</div>
		<!-- Cart -->
    <%@ include file="cart.jsp" %>
    <!-- Footer -->
    <%@ include file="footer.jsp"%>
    <!-- Back to top -->
    <div class="btn-back-to-top" id="myBtn">
      <span class="symbol-btn-back-to-top">
        <i class="zmdi zmdi-chevron-up"></i>
      </span>
    </div>
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
      $(".js-select2").each(function () {
        $(this).select2({
          minimumResultsForSearch: 20,
          dropdownParent: $(this).next(".dropDownSelect2"),
        })
      })
    </script>
    <!--===============================================================================================-->
    <script src="${pageContext.request.contextPath}/views/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
    <!--===============================================================================================-->
    <script src="${pageContext.request.contextPath}/views/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
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
    <!--===============================================================================================-->
    <script src="${pageContext.request.contextPath}/views/js/main.js"></script>
  </body>
</html>
