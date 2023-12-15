<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>About</title>
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
                <li class="active-menu"><a href="about">About</a></li>
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

    <!-- Title page -->
    <section
      class="bg-img1 txt-center p-lr-15 p-tb-92"
      style="background-image: url('${pageContext.request.contextPath}/views/images/bg-01.jpg')"
    >
      <h2 class="ltext-105 cl0 txt-center">About</h2>
    </section>
    <!-- Content page -->
    <section class="bg0 p-t-75 p-b-120">
      <div class="container">
        <div class="row p-b-148">
          <div class="col-md-7 col-lg-8">
            <div class="p-t-7 p-r-85 p-r-15-lg p-r-0-md">
              <h3 class="mtext-111 cl2 p-b-16">Our Story</h3>
              <p class="stext-113 cl6 p-b-26">
                Welcome to DuckStore, your ultimate destination for trendy and fashionable clothing! 
                Located in the heart of the city, DuckStore offers a wide range of stylish apparel 
                that caters to every individual's unique taste and preference. From casual daywear 
                to elegant evening attire, we have something for everyone. Our collection showcases 
                the latest fashion trends, curated with meticulous attention to quality and design. 
                With a team of knowledgeable and friendly staff, we provide personalized assistance 
                to ensure a delightful shopping experience.
              </p>
              <p class="stext-113 cl6 p-b-26">
                At DuckStore, we believe in the power of fashion to empower and express one's individuality. 
                Step into our store and immerse yourself in a world of fashion-forward choices. 
                Discover your personal style and make a statement with the latest pieces from renowned 
                brands. Whether you're seeking a wardrobe update or a special outfit for a memorable 
                occasion, DuckStore is here to fulfill your fashion desires. Join us at DuckStore and 
                let us redefine your fashion journey with our exceptional collection and unparalleled 
                service.
              </p>
              <p class="stext-113 cl6 p-b-26">
                Any questions? Let us know in store at 01 Vo Van Ngan, Linh Chieu, Thu Duc, TP. Ho Chi Minh
                or call us on (+84) 123 456 789
              </p>
            </div>
          </div>
          <div class="col-11 col-md-5 col-lg-4 m-lr-auto">
            <div class="how-bor1">
              <div class="hov-img0">
                <img src="${pageContext.request.contextPath}/views/images/about-01.jpg" alt="IMG" />
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="order-md-2 col-md-7 col-lg-8 p-b-30">
            <div class="p-t-7 p-l-85 p-l-15-lg p-l-0-md">
              <h3 class="mtext-111 cl2 p-b-16">Our Mission</h3>
              <p class="stext-113 cl6 p-b-26">
                At DuckStore, our mission is to inspire confidence and self-expression through fashion. 
                We offer a diverse range of high-quality clothing that caters to various styles and 
                sizes. With exceptional customer service and a commitment to sustainability, we aim 
                to provide a welcoming and inclusive shopping experience. Our goal is to help individuals
                 find their unique voice and feel empowered in their fashion choices. Join us at 
                 DuckStore and let us be a part of your journey towards stylish self-confidence.
              </p>
              <div class="bor16 p-l-29 p-b-9 m-t-22">
                <p class="stext-114 cl6 p-r-40 p-b-11">
                  Creativity is just connecting things. When you ask creative people how they did
                  something, they feel a little guilty because they didn't really do it, they just
                  saw something. It seemed obvious to them after a while.
                </p>
                <span class="stext-111 cl8"> - Steve Job’s </span>
              </div>
            </div>
          </div>
          <div class="order-md-1 col-11 col-md-5 col-lg-4 m-lr-auto p-b-30">
            <div class="how-bor2">
              <div class="hov-img0">
                <img src="${pageContext.request.contextPath}/views/images/about-02.jpg" alt="IMG" />
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
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
    <script src="${pageContext.request.contextPath}/views/js/main.js"></script>
  </body>
</html>
