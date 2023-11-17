<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/views/fonts/font-awesome-4.7.0/css/font-awesome.min.css"
    />
    <!--===============================================================================================-->
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/views/fonts/iconic/css/material-design-iconic-font.min.css"
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
        <div class="top-bar">
          <div class="content-topbar flex-sb-m h-full container">
            <div class="left-top-bar">Free shipping for standard order over $100</div>
            <div class="right-top-bar flex-w h-full">
              <a href="login" class="flex-c-m trans-04 p-lr-25"> Login </a>
              <a href="logout" class="flex-c-m trans-04 p-lr-25"> Logout </a>
            </div>
          </div>
        </div>
        <div class="wrap-menu-desktop how-shadow1">
          <nav class="limiter-menu-desktop container">
            <!-- Logo desktop -->
            <a href="#" class="logo"> <img src="${pageContext.request.contextPath}/views/images/icons/logo-01.png" alt="IMG-LOGO" /> </a>
            <!-- Menu desktop -->
            <div class="menu-desktop">
              <ul class="main-menu">
                <li><a href="home">Home</a></li>
                <li class="active-menu"><a href="shop">Shop</a></li>
                <li><a href="about">About</a></li>
                <li><a href="contact">Contact</a></li>
              </ul>
            </div>
            <!-- Icon header -->
            <div class="wrap-icon-header flex-w flex-r-m">
              <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
                <i class="zmdi zmdi-search"></i>
              </div>
              <div
                class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart"
                data-notify="2"
              >
                <i class="zmdi zmdi-shopping-cart"></i>
              </div>
              <%--
              <a
                href="#"
                class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti"
                data-notify="0"
              >
                <i class="zmdi zmdi-favorite-outline"></i>
              </a>
               --%>
              <a
                href="my-account"
                class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11"
                data-notify="0"
              >
                <i class="zmdi zmdi-account-circle"></i>
              </a>
            </div>
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
        <div class="wrap-icon-header flex-w flex-r-m m-r-15">
          <div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
            <i class="zmdi zmdi-search"></i>
          </div>
          <div
            class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart"
            data-notify="2"
          >
            <i class="zmdi zmdi-shopping-cart"></i>
          </div>
          <%--
          <a
            href="#"
            class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti"
            data-notify="0"
          >
            <i class="zmdi zmdi-favorite-outline"></i>
          </a>
           --%>
        </div>
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
              <a href="my-account" class="flex-c-m p-lr-10 trans-04"> Account </a>
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
      <div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
        <div class="container-search-header">
          <button class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
            <img src="${pageContext.request.contextPath}/views/images/icons/icon-close2.png" alt="CLOSE" />
          </button>
          <form class="wrap-search-header flex-w p-l-15">
            <button class="flex-c-m trans-04">
              <i class="zmdi zmdi-search"></i>
            </button>
            <input class="plh3" type="text" name="search" placeholder="Search..." />
          </form>
        </div>
      </div>
    </header>
    
    <!-- breadcrumb -->
    <div class="container">
      <div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
        <a href="home" class="stext-109 cl8 hov-cl1 trans-04">
          Home <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
        </a>
        <span class="stext-109 cl4"> My Account </span>
      </div>
    </div>
    <!-- My Account -->
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
																		<a
																				class="font-weight-bold list-group-item list-group-item-action border-0 mt-5 active"
																				href="#info"
																				data-toggle="list">Info</a><a
																				class="font-weight-bold list-group-item list-group-item-action border-0"
																				href="#address-book"
																				data-toggle="list">Address Book</a><a
																				class="font-weight-bold list-group-item list-group-item-action border-0"
																				href="#change-pass"
																				data-toggle="list">Change password</a><a
																				class="font-weight-bold list-group-item list-group-item-action border-0 mb-5"
																				href="#history"
																				data-toggle="list">History</a>
																</div>
														</div>
												</div>
										</div>
								</div>
								<div class="col">
										<div class="tab-content">
												<div
														id="info"
														class="tab-pane fade active show">
														<div class="card">
																<div class="m-all-40">
																		<h5 class="text-left mtext-103 cl2">Your Info</h5>
																</div>
																<div
																		class="card-body d-flex flex-row justify-content-xl-start border-top">
																		<div class="col-xl-4 mtext-107">
																				<p class="m-t-30">Name:</p>
																				<p class="m-t-20">Email:</p>
																				<p class="m-t-20">Phone number:</p>
																				<p class="m-t-20">Defautl address:</p>
																		</div>
																		<div
																				class="col-xl-8 d-flex flex-column align-items-xl-start mtext-107">
																				<p class="m-t-30">Minh Trong</p>
																				<p class="m-t-20">minhtrong@gmail.com</p>
																				<p class="m-t-20">0123456789</p>
																				<p class="m-t-20">HCM</p>
																		</div>
																</div>
																<div
																		class="d-xl-flex justify-content-xl-end stext-108 px-4 mb-2">
																		<a
																				href="#edit-info"
																				data-toggle="list">Edit</a>
																</div>
														</div>
												</div>
												<div
														id="edit-info"
														class="tab-pane fade">
														<div class="card">
																<div class="m-all-40">
																		<h5 class="text-left mtext-103 cl2">Edit Info</h5>
																</div>
																<div
																		class="card-body d-flex flex-row justify-content-xl-start border-top mtext-107">
																		<div class="col-xl-4">
																				<p class="m-t-35">Name:</p>
																				<p class="m-t-30">Email:</p>
																				<p class="m-t-30">Phone number:</p>
																				<p class="m-t-30">Defautl address:</p>
																		</div>
																		<div class="col-xl-8 align-items-xl-start">
																				<form>
																						<input
																								class="form-control form-control m-t-30"
																								type="text"
																								name="name"
																								value="Minh Trong"><input
																								class="form-control form-control m-t-20"
																								type="text"
																								name="email"
																								inputmode="email"
																								value="minhtrong@gmail.com"><input
																								class="form-control form-control m-t-20"
																								type="text"
																								inputmode="tel"
																								name="phoneNumber"
																								value="0123456"><select
																								class="form-control m-t-20">
																								<optgroup label="Adresss">
																										<option
																												value="12"
																												selected="">HCM</option>
																										<option value="13">Ca Mau</option>
																										<option value="14">BRVT</option>
																								</optgroup>
																						</select>
																						<div class="d-xl-flex justify-content-xl-end">
																								<button
																										class="btn btn-primary btn-sm my-3"
																										type="submit">Save</button>
																						</div>
																				</form>
																		</div>
																</div>
																<div class="d-xl-flex justify-content-xl-end px-4 mb-2"></div>
														</div>
												</div>
												<div
														id="address-book"
														class="tab-pane fade">
														<div class="card">
																<div
																		class="d-flex justify-content-between mtext-103 cl2 m-all-40">
																		<h5 class="d-inline ">Address Book</h5>
																		<a
																				class="btn btn-link"
																				role="button"
																				data-toggle="list"
																				href="#add-address">Add</a>
																</div>
																<div class="card-body d-flex flex-wrap border-top">
																		<div class="card w-50">
																				<div class="card-body">
																						<div class="d-flex justify-content-between">
																								<h6 class="text-muted mb-2 d-inline">Default</h6>
																								<a href="#"><svg
																												xmlns="http://www.w3.org/2000/svg"
																												width="1em"
																												height="1em"
																												fill="currentColor"
																												viewBox="0 0 16 16"
																												class="bi bi-x-lg">
                                                        <path
																														fill-rule="evenodd"
																														d="M13.854 2.146a.5.5 0 0 1 0 .708l-11 11a.5.5 0 0 1-.708-.708l11-11a.5.5 0 0 1 .708 0Z"></path>
                                                        <path
																														fill-rule="evenodd"
																														d="M2.146 2.146a.5.5 0 0 0 0 .708l11 11a.5.5 0 0 0 .708-.708l-11-11a.5.5 0 0 0-.708 0Z"></path>
                                                    </svg></a>
																						</div>
																						<p class="card-text">HCM</p>
																						<div class="d-xl-flex justify-content-xl-end"></div>
																				</div>
																		</div>
																		<div class="card w-50">
																				<div class="card-body">
																						<div class="d-flex justify-content-between">
																								<h6 class="text-muted mb-2 d-inline">Default</h6>
																								<a href="#"><svg
																												xmlns="http://www.w3.org/2000/svg"
																												width="1em"
																												height="1em"
																												fill="currentColor"
																												viewBox="0 0 16 16"
																												class="bi bi-x-lg">
                                                        <path
																														fill-rule="evenodd"
																														d="M13.854 2.146a.5.5 0 0 1 0 .708l-11 11a.5.5 0 0 1-.708-.708l11-11a.5.5 0 0 1 .708 0Z"></path>
                                                        <path
																														fill-rule="evenodd"
																														d="M2.146 2.146a.5.5 0 0 0 0 .708l11 11a.5.5 0 0 0 .708-.708l-11-11a.5.5 0 0 0-.708 0Z"></path>
                                                    </svg></a>
																						</div>
																						<p class="card-text">HCM</p>
																						<div class="d-xl-flex justify-content-xl-end"></div>
																				</div>
																		</div>
																</div>
														</div>
												</div>
												<div
														id="add-address"
														class="tab-pane fade">
														<div class="card">
																<div
																		class="d-flex justify-content-between mtext-103 cl2 m-all-40">
																		<h5 class="d-inline">Add Address</h5>
																</div>
																<div class="card-body border-top mtext-107">
																		<form>
																				<div>
																						<label>Address</label><input
																								class="form-control"
																								type="text"
																								placeholder="Address "
																								name="adress">
																				</div>
																				<div class="mt-3">
																						<label>Address 2</label><input
																								class="form-control"
																								type="text"
																								placeholder="Address 2"
																								name="adress">
																				</div>
																				<div class="d-xl-flex justify-content-xl-end mt-3">
																						<button
																								class="btn btn-primary btn-sm"
																								type="submit">Save</button>
																				</div>
																		</form>
																</div>
														</div>
												</div>
												<div
														id="change-pass"
														class="tab-pane fade">
														<div class="card">
																<div class="mtext-103 cl2 m-all-40">
																		<h5>Change password</h5>
																</div>
																<div class="card-body border-top">
																		<form class="d-flex flex-column">
																				<div class="d-flex align-items-xl-center m-b-30">
																						<label class="w-25 mtext-107">Old
																								password:</label><input
																								class="form-control"
																								type="password"
																								placeholder="Old Password"
																								name="oldPassword">
																				</div>
																				<div class="d-flex align-items-xl-center m-b-30">
																						<label class="w-25 mtext-107">New
																								password:</label><input
																								class="form-control"
																								type="password"
																								placeholder="New Password"
																								name="newPassword">
																				</div>
																				<div class="d-flex align-items-xl-center m-b-30">
																						<label class="w-25 mtext-107">Repeat:</label><input
																								class="form-control"
																								type="password"
																								placeholder="Repeat Password"
																								name="repeatPassword">
																				</div>
																				<button
																						class="btn btn-link align-self-end"
																						type="submit">Save</button>
																		</form>
																</div>
														</div>
												</div>
												<div
														id="history"
														class="tab-pane fade">
														<div class="card">
																<div class="m-all-40 mtext-103 cl2">
																		<h5>History</h5>
																</div>
																<div class="card-body border-top">
																		<div class="table-responsive">
																				<table class="table">
																						<thead>
																								<tr>
																										<th>Id</th>
																										<th>Date</th>
																										<th>Price</th>
																										<th>Status</th>
																								</tr>
																						</thead>
																						<tbody>
																								<tr>
																										<td>1</td>
																										<td>2023</td>
																										<td>1000</td>
																										<td>Pending</td>
																								</tr>
																						</tbody>
																				</table>
																		</div>
																</div>
														</div>
												</div>
										</div>
								</div>
						</div>
				</div>
		</div>
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
