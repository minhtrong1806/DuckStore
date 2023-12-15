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
                <li class="active-menu"><a href="contact">Contact</a></li>
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
                  01 Vo Van Ngan, Linh Chieu, Thu Duc, TP. Ho Chi Minh
                </p>
              </div>
            </div>
            <div class="flex-w w-full p-b-42">
              <span class="fs-18 cl5 txt-center size-211">
                <span class="lnr lnr-phone-handset"></span>
              </span>
              <div class="size-212 p-t-2">
                <span class="mtext-110 cl2"> Lets Talk </span>
                <p class="stext-115 cl1 size-213 p-t-18">(+84) 123 456 789</p>
              </div>
            </div>
            <div class="flex-w w-full">
              <span class="fs-18 cl5 txt-center size-211">
                <span class="lnr lnr-envelope"></span>
              </span>
              <div class="size-212 p-t-2">
                <span class="mtext-110 cl2"> Sale Support </span>
                <p class="stext-115 cl1 size-213 p-t-18">duckstore@gmail.com</p>
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
    <!-- Cart -->
    <%@ include file="cart.jsp" %>
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
