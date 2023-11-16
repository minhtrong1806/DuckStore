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
    <!-- Cart -->
    <div class="wrap-header-cart js-panel-cart">
      <div class="s-full js-hide-cart"></div>
      <div class="header-cart flex-col-l p-l-65 p-r-25">
        <div class="header-cart-title flex-w flex-sb-m p-b-8">
          <span class="mtext-103 cl2"> Your Cart </span>
          <div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
            <i class="zmdi zmdi-close"></i>
          </div>
        </div>
        <div class="header-cart-content flex-w js-pscroll">
          <ul class="header-cart-wrapitem w-full">
            <li class="header-cart-item flex-w flex-t m-b-12">
              <div class="header-cart-item-img">
                <img src="${pageContext.request.contextPath}/views/images/item-cart-01.jpg" alt="IMG" />
              </div>
              <div class="header-cart-item-txt p-t-8">
                <a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
                  White Shirt Pleat
                </a>
                <span class="header-cart-item-info"> 1 x $19.00 </span>
              </div>
            </li>
            <li class="header-cart-item flex-w flex-t m-b-12">
              <div class="header-cart-item-img">
                <img src="${pageContext.request.contextPath}/views/images/item-cart-02.jpg" alt="IMG" />
              </div>
              <div class="header-cart-item-txt p-t-8">
                <a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
                  Converse All Star
                </a>
                <span class="header-cart-item-info"> 1 x $39.00 </span>
              </div>
            </li>
            <li class="header-cart-item flex-w flex-t m-b-12">
              <div class="header-cart-item-img">
                <img src="${pageContext.request.contextPath}/views/images/item-cart-03.jpg" alt="IMG" />
              </div>
              <div class="header-cart-item-txt p-t-8">
                <a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
                  Nixon Porter Leather
                </a>
                <span class="header-cart-item-info"> 1 x $17.00 </span>
              </div>
            </li>
          </ul>
          <div class="w-full">
            <div class="header-cart-total w-full p-tb-40">Total: $75.00</div>
            <div class="header-cart-buttons flex-w w-full">
              <a
                href="shoping-cart.html"
                class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10"
              >
                View Cart
              </a>
              <a
                href="shoping-cart.html"
                class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10"
              >
                Check Out
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
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
    <div class="container my-account">
      <div class="row flex-row flex-c m-t-40">
        <!-- Menu account -->
        <div class="col-lg-3 m-b-30">
          <div class="w-full bg2 rounded">
            <div class="m-tb-40 m-lr-16 flex-col-c line-b">
              <h4 class="m-tb-30 clblack">Minh Trong</h4>
            </div>
            <div class="list-group list-group-flush p-b-30">
              <button
                class="list-group-item list-group-item-action bg2 active"
                data-toggle="list"
                href="#account-detail"
                role="tab"
              >
                Account
              </button>
              <button
                class="list-group-item list-group-item-action bg2"
                data-toggle="list"
                href="#address"
                role="tab"
              >
                Address
              </button>
              <button
                class="list-group-item list-group-item-action bg2"
                data-toggle="list"
                href="#orders"
                role="tab"
              >
                Orders
              </button>
            </div>
          </div>
        </div>
        <!-- content account -->
        <div class="col-lg-8 clback">
          <div class="w-full">
            <div class="m-tb-40 m-lr-30 flex-col-t clback">
              <div class="tab-content fs-14">
                <div class="tab-pane active" id="account-detail" role="tabpanel">
                  <h5 class="m-b-40">ACCOUNT DETAILS</h5>
                  <form>
                    <div class="form-group m-b-35">
                      <label for="firstName">First name</label>
                      <input
                        type="text"
                        class="form-control"
                        id="firstName"
                        placeholder="First name"
                      />
                    </div>
                    <div class="form-group m-b-35">
                      <label for="lastName">Last name</label>
                      <input
                        type="text"
                        class="form-control"
                        id="lastName"
                        placeholder="Last name"
                      />
                    </div>
                    <div class="form-group m-b-35">
                      <label for="exampleInputEmail1">Email address</label>
                      <input
                        type="email"
                        class="form-control"
                        id="email"
                        aria-describedby="emailHelp"
                        placeholder="name@example.com"
                      />
                      <small id="emailHelp" class="form-text text-muted"
                        >We'll never share your email with anyone else.</small
                      >
                    </div>
                    <div class="form-group m-b-35">
                      <label for="phoneNumber">Phone number</label>
                      <input
                        type="text"
                        class="form-control"
                        id="phoneNumber"
                        placeholder="Phone number"
                      />
                    </div>
                    <h5 class="m-b-30">PASSWORD</h5>
                    <div class="form-group m-b-35">
                      <label for="oldPassword">Old password</label>
                      <input
                        type="password"
                        class="form-control"
                        id="oldPassword"
                        placeholder="Old password"
                      />
                    </div>
                    <div class="form-group m-b-35">
                      <label for="newPassword">New password</label>
                      <input
                        type="password"
                        class="form-control"
                        id="newPassword"
                        placeholder="New Password"
                      />
                    </div>
                    <div class="form-group m-b-35">
                      <label for="repeatPassword">Repeat password</label>
                      <input
                        type="password"
                        class="form-control"
                        id="repeatPassword"
                        placeholder="Repeat Password"
                      />
                    </div>
                    <button type="submit" class="btn btn-primary">Save Change</button>
                  </form>
                </div>
                <div class="tab-pane" id="address" role="tabpanel">
                  <h5>Address</h5>
                </div>
                <div class="tab-pane" id="orders" role="tabpanel">
                  <h5 class="m-b-50">ORDERS</h5>
                  <div>
                    <table class="table">
                      <thead>
                        <tr>
                          <th scope="col">Id</th>
                          <th scope="col">Date</th>
                          <th scope="col">Status</th>
                          <th scope="col">Price</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <th scope="row">1</th>
                          <td>22-11</td>
                          <td>Delivered</td>
                          <td>15</td>
                        </tr>
                        <tr>
                          <th scope="row">2</th>
                          <td>23-11</td>
                          <td>Delivered</td>
                          <td>5</td>
                        </tr>
                        <tr>
                          <th scope="row">3</th>
                          <td>30-11</td>
                          <td>Delivered</td>
                          <td>23</td>
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
