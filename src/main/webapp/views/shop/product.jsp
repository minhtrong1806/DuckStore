<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- SHOPP -->

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
                href="info"
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
              <a href="info" class="flex-c-m p-lr-10 trans-04"> Account </a>
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

<!-- CARD PANE -->
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

<!-- CARD ITEM -->   
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
            
            
          </ul>
          <div class="w-full">
            <div class="header-cart-total w-full p-tb-40">Total: $75.00</div>
            <div class="header-cart-buttons flex-w w-full">
              <a href="shoping-cart" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10" >
                View Cart
              </a>
              <a href="shoping-cart" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10" >
                Check Out
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
    
<!-- PRODUCT LIST -->
    <div class="bg0 m-t-23 p-b-140">
      <div class="container">
        <div class="flex-w flex-sb-m p-b-52">

<!-- FILTER BY CATEGORY -->
          <div class="flex-w flex-l-m filter-tope-group m-tb-10">
            <a class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1">
              All Products
            </a>
            <c:forEach items="${categoryList}" var="category">
            		 <a class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5">
		              ${category.getCategoryName()}
		           	 </a>								
						</c:forEach>

          </div>
<!-- ////////////////// -->
          <div class="flex-w flex-c-m m-tb-10">
            <div class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-filter" >
              <i class="icon-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-filter-list"></i>
              <i class="icon-close-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
              Filter
            </div>
            <div class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search" >
              <i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
              <i class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
              Search
            </div>
          </div>
<!-- SEARCH PRODUCT -->
          <div class="dis-none panel-search w-full p-t-10 p-b-15">
            <div class="bor8 dis-flex p-l-15">
              <button class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04">
                <i class="zmdi zmdi-search"></i>
              </button>
              <input class="mtext-107 cl2 size-114 plh2 p-r-15" type="text" name="search-product" placeholder="Search"/>
            </div>
          </div>
          
<!-- FILTER -->
          <div class="dis-none panel-filter w-full p-t-10">
            <div class="wrap-filter flex-w bg6 w-full p-lr-40 p-t-27 p-lr-15-sm">
              <div class="filter-col1 p-r-15 p-b-27">
                <div class="mtext-102 cl2 p-b-15">Sort By</div>
                <ul>
                  <li class="p-b-6">
                    <a href="#" class="filter-link stext-106 trans-04"> Price: Low to High </a>
                  </li>
                  <li class="p-b-6">
                    <a href="#" class="filter-link stext-106 trans-04"> Price: High to Low </a>
                  </li>
                </ul>
              </div>
              <div class="filter-col2 p-r-15 p-b-27">
                <div class="mtext-102 cl2 p-b-15">Price</div>
                <ul>
                  <li class="p-b-6">
                    <a href="#" class="filter-link stext-106 trans-04 filter-link-active"> All </a>
                  </li>
                  <li class="p-b-6">
                    <a href="#" class="filter-link stext-106 trans-04 filter-link-active"> 50 - 100 </a>
                  </li>
                  <li class="p-b-6">
                    <a href="#" class="filter-link stext-106 trans-04 filter-link-active"> 100 -200 </a>
                  </li>
                </ul>
              </div>
              <div class="filter-col3 p-r-15 p-b-27">
                <div class="mtext-102 cl2 p-b-15">Color</div>
                <ul>
                  <li class="p-b-6">
                    <span class="fs-15 lh-12 m-r-6" style="color: #222">
                      <i class="zmdi zmdi-circle"></i>
                    </span>
                    <a href="#" class="filter-link stext-106 trans-04"> Black </a>
                  </li>
                  <li class="p-b-6">
                    <span class="fs-15 lh-12 m-r-6" style="color: #4272d7">
                      <i class="zmdi zmdi-circle"></i>
                    </span>
                    <a href="#" class="filter-link stext-106 trans-04 filter-link-active"> Blue </a>
                  </li>
                  <li class="p-b-6">
                    <span class="fs-15 lh-12 m-r-6" style="color: #b3b3b3">
                      <i class="zmdi zmdi-circle"></i>
                    </span>
                    <a href="#" class="filter-link stext-106 trans-04"> Grey </a>
                  </li>
                  <li class="p-b-6">
                    <span class="fs-15 lh-12 m-r-6" style="color: #00ad5f">
                      <i class="zmdi zmdi-circle"></i>
                    </span>
                    <a href="#" class="filter-link stext-106 trans-04"> Green </a>
                  </li>
                  <li class="p-b-6">
                    <span class="fs-15 lh-12 m-r-6" style="color: #fa4251">
                      <i class="zmdi zmdi-circle"></i>
                    </span>
                    <a href="#" class="filter-link stext-106 trans-04"> Red </a>
                  </li>
                  <li class="p-b-6">
                    <span class="fs-15 lh-12 m-r-6" style="color: #aaa">
                      <i class="zmdi zmdi-circle-o"></i>
                    </span>
                    <a href="#" class="filter-link stext-106 trans-04"> White </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="row isotope-grid">
<!-- LIST PRODUCT -->
					<c:forEach items="${listProduct}" var="product">
						<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women">
	            <div class="block2">
	              <div class="block2-pic hov-img0">

									   <img class="product-image" src="${productFolder}${product.getProduct_image()}" alt="IMG-PRODUCT" />

	                <a href="#" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-addcart-detail">
	                  Add to cart
	                </a>
	              </div>
	              <div class="block2-txt flex-w flex-t p-t-14">
	                <div class="block2-txt-child1 flex-col-l">
	                  <a href="product-detail?productId=${product.getProductID()}" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
	                    ${product.getName()}
	                  </a>
	                  <span class="stext-105 cl3"> $16.64 </span>
	                </div>
	              </div>
	            </div>
	          </div>
					</c:forEach>   
<!-- END LIST PRODUCT -->  
        </div>
        <!-- Load more -->
        <div class="flex-c-m flex-w w-full p-t-45">
          <a href="#" class="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04">
            Load More
          </a>
        </div>
      </div>
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
    <script src="${pageContext.request.contextPath}/views/vendor/daterangepicker/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/views/vendor/daterangepicker/daterangepicker.js"></script>
    <!--===============================================================================================-->
    <script src="${pageContext.request.contextPath}/views/vendor/slick/slick.min.js"></script>
    <script src="${pageContext.request.contextPath}/views/js/slick-custom.js"></script>
		<!--===============================================================================================-->
    <script src="${pageContext.request.contextPath}/views/vendor/lightbox2/js/lightbox.min.js"></script>
    <script>
		    // Activate Lightbox for images with the "product-image" class
		    lightbox.option({
		      'resizeDuration': 200,
		      'wrapAround': true
		    });
		</script>
    <!--===============================================================================================-->
    <script src="${pageContext.request.contextPath}/views/vendor/parallax100/parallax100.js"></script>
    <script>
      $(".parallax100").parallax100()
    </script>
    <!--===============================================================================================-->
    <script src="${pageContext.request.contextPath}/views/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
    <script>
      $(".gallery-lb").each(function () {
        // the containers for all your galleries
        $(this).magnificPopup({
          delegate: "a", // the selector for gallery item
          type: "image",
          gallery: {
            enabled: true,
          },
          mainClass: "mfp-fade",
        })
      })
    </script>
    <!--===============================================================================================-->
    <script src="${pageContext.request.contextPath}/views/vendor/isotope/isotope.pkgd.min.js"></script>
    <!--===============================================================================================-->
    <script src="${pageContext.request.contextPath}/views/vendor/sweetalert/sweetalert.min.js"></script>
		<script>
		  $(".js-addcart-detail").on("click", function() {
		    var parentBlock = $(this).closest('.block2');
		    var productName = parentBlock.find('.js-name-b2').text().trim();
		    swal(productName, "is added to cart !", "success");
		  });
		</script>

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
