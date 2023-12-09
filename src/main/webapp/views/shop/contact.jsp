<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Contact</title>
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
                <li><a href="shop">Shop</a></li>
                <li><a href="about">About</a></li>
                <li class="active-menu"><a href="contact">Contact</a></li>
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
                href="shoping-cart"
                class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10"
              >
                View Cart
              </a>
              <a
                href="shoping-cart"
                class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10"
              >
                Check Out
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Title page -->
    <section
      class="bg-img1 txt-center p-lr-15 p-tb-92"
      style="background-image: url('${pageContext.request.contextPath}/views/images/bg-01.jpg')"
    >
      <h2 class="ltext-105 cl0 txt-center">Contact</h2>
    </section>
    <!-- Content page -->
    <section class="bg0 p-t-104 p-b-116">
      <div class="container">
        <div class="flex-w flex-tr">
          <div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md">
            <form>
              <h4 class="mtext-105 cl2 txt-center p-b-30">Send Us A Message</h4>
              <div class="bor8 m-b-20 how-pos4-parent">
                <input
                  class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30"
                  type="text"
                  name="email"
                  placeholder="Your Email Address"
                />
                <img class="how-pos4 pointer-none" src="${pageContext.request.contextPath}/views/images/icons/icon-email.png" alt="ICON" />
              </div>
              <div class="bor8 m-b-30">
                <textarea
                  class="stext-111 cl2 plh3 size-120 p-lr-28 p-tb-25"
                  name="msg"
                  placeholder="How Can We Help?"
                ></textarea>
              </div>
              <button
                class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer"
              >
                Submit
              </button>
            </form>
          </div>
          <div class="size-210 bor10 flex-w flex-col-m p-lr-93 p-tb-30 p-lr-15-lg w-full-md">
            <div class="flex-w w-full p-b-42">
              <span class="fs-18 cl5 txt-center size-211">
                <span class="lnr lnr-map-marker"></span>
              </span>
              <div class="size-212 p-t-2">
                <span class="mtext-110 cl2"> Address </span>
                <p class="stext-115 cl6 size-213 p-t-18">
                  Coza Store Center 8th floor, 379 Hudson St, New York, NY 10018 US
                </p>
              </div>
            </div>
            <div class="flex-w w-full p-b-42">
              <span class="fs-18 cl5 txt-center size-211">
                <span class="lnr lnr-phone-handset"></span>
              </span>
              <div class="size-212 p-t-2">
                <span class="mtext-110 cl2"> Lets Talk </span>
                <p class="stext-115 cl1 size-213 p-t-18">+1 800 1236879</p>
              </div>
            </div>
            <div class="flex-w w-full">
              <span class="fs-18 cl5 txt-center size-211">
                <span class="lnr lnr-envelope"></span>
              </span>
              <div class="size-212 p-t-2">
                <span class="mtext-110 cl2"> Sale Support </span>
                <p class="stext-115 cl1 size-213 p-t-18">contact@example.com</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Map -->
    <div class="map">
      <div
        class="size-303"
        id="google_map"
        data-map-x="10.850689163596106"
        data-map-y="106.77190758669154"
        data-pin="views\images\icons/pin.png"
        data-scrollwhell="0"
        data-draggable="1"
        data-zoom="11"
      ></div>
    </div>
    <!-- Footer -->
    <%@ include file="footer.jsp"%>
    <!-- Back to top -->
    <div class="btn-back-to-top" id="myBtn">
      <span class="symbol-btn-back-to-top"> <i class="zmdi zmdi-chevron-up"></i> </span>
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
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAKFWBqlKAGCeS1rMVoaNlwyayu0e0YRes"></script>
    <script src="${pageContext.request.contextPath}/views/js/map-custom.js"></script>
    <!--===============================================================================================-->
    <script src="${pageContext.request.contextPath}/views/js/main.js"></script>
  </body>
</html>
