<%@page import="java.math.BigDecimal"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="utils.CalUtils"%>
<%@page import="bean.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

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
                <li class="active-menu"><a href="shop?category=All+Products">Shop</a></li>
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

<!-- PRODUCT LIST -->
    <div class="bg0 m-t-23 p-b-140">
      <div class="container">
        <div class="flex-w flex-sb-m p-b-52">

<!-- FILTER BY CATEGORY -->
          <div class="flex-w flex-l-m filter-tope-group m-tb-10">
            <a class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5">
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
              <form class="size-114" action="shop" method="POST">
              		<input class="mtext-107 cl2 size-114 plh2 p-r-15" type="search" name="search" placeholder="Search"/>
              </form>
              
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

	                <a href="product-detail?productId=${product.getProductID()}" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04">
	                  Add to cart
	                </a>
	              </div>
	              <div class="block2-txt flex-w flex-t p-t-14">
	                <div class="block2-txt-child1 flex-col-l">
	                  <a href="product-detail?productId=${product.getProductID()}" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
	                    ${product.getName()}
	                  </a>
	                  <span class="stext-105 cl3">
	                  <%
	                  
	                  	Product product = (Product) pageContext.getAttribute("product");
	                  	float price = 0;
	                  	try{
	                  		if(product != null) {
	                  				price = CalUtils.getMinPrice(product.getProductID());
	                  		}
	                  	}
	                  	catch (Exception e){}
	                  	DecimalFormat decimalFormat = new DecimalFormat("#,##0.00");
	                    String formattedPrice = decimalFormat.format(price);
	                    
	                  	out.println("$" + formattedPrice);
	                  	
	                  %>
	                  </span>
	                </div>
	              </div>
	            </div>
	          </div>
					</c:forEach>   
<!-- END LIST PRODUCT -->  
        </div>
        <!-- Load more -->
        <div class="flex-c-m flex-w w-full p-t-45">
          <nav aria-label="Page navigation example">
					  <ul class="pagination">
								<%
								int numberOfPages = (int) request.getAttribute("numberOfPages");
								for (int i = 1; i <= numberOfPages; i++)
								{
								%>
								<li class="page-item">
					    		<a class="page-link"><%= i %></a>
					    	</li>
					    	<%} %>
					  </ul>
					</nav>
        </div>
      </div>
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
		<script>
		document.addEventListener('DOMContentLoaded', function() {
		    var categoryLinks = document.querySelectorAll('.filter-tope-group a');
		    var currentPage = window.location.pathname;
		    var urlParams = new URLSearchParams(window.location.search);
		    var categoryParam = urlParams.get('category');
		
		    // Kiểm tra nếu ở trang DuckStore/shop và có tham số category trong URL
		    if (currentPage === '/DuckStore/shop' && categoryParam) {
		        categoryLinks.forEach(function(link) {
		            var categoryText = link.innerText.trim();
		
		            if (categoryText === categoryParam) {
		                link.classList.add('how-active1');
		                sessionStorage.setItem('selectedCategory', categoryParam);
		            }
		        });
		    } else {
		        sessionStorage.removeItem('selectedCategory');
		    }
		
		    categoryLinks.forEach(function(link) {
		        link.addEventListener('click', function(event) {
		            event.preventDefault();
		            var selectedCategory = link.innerText.trim();
		            sessionStorage.setItem('selectedCategory', selectedCategory);
		
		            var currentURL = window.location.href;
		            var url = new URL(currentURL);
		            url.searchParams.set('category', selectedCategory);
		
		            // Xóa các tham số khác trước khi thêm tham số category mới
		            url.searchParams.forEach(function(value, key) {
		                if (key !== 'category') {
		                    url.searchParams.delete(key);
		                }
		            });
		
		            history.pushState(null, null, url);
		            location.reload();
		        });
		    });
		});
		
		</script>
   
    <!--===============================================================================================-->
<script>
    const pageLinks = document.querySelectorAll('.pagination .page-link');

    pageLinks.forEach(link => {
        link.addEventListener('click', function(event) {
            event.preventDefault();

            const pageNumber = this.textContent;

            const urlParams = new URLSearchParams(window.location.search);
            urlParams.set('pageNumber', pageNumber);

            // Tạo URL mới với tham số pageNumber
            const newUrl = window.location.pathname + '?' + urlParams.toString();

            // Thay đổi URL và load lại trang
            window.location.href = newUrl;
        });
    });
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
