<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
    <title>Admin - Dashboard</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/views/admin/assets/img/icon/favicon.ico" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/assets/fonts/fontawesome-all.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/assets/fonts/font-awesome.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/assets/fonts/fontawesome5-overrides.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/assets/css/admin.css" />
  </head>

  <body id="page-top">
    <div id="wrapper">
      <nav
        class="navbar navbar-dark bg-primary align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0"
      >
        <div class="container-fluid d-flex flex-column p-0">
          <a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
            <div class="sidebar-brand-icon rotate-n-15">
              <i class="fas fa-shopping-cart"></i>
            </div>
            <div class="sidebar-brand-text mx-3">
              <span style="font-size: 20px">DuckStore</span>
            </div>
          </a>
          <hr class="sidebar-divider my-0" />
          <ul class="navbar-nav text-light" id="accordionSidebar">
            <li class="nav-item" style="margin-top: 35%">
              <a class="nav-link active" href="${pageContext.request.contextPath}/admin-dashboard">
                <i class="fa fa-dashboard" style="font-size: 1.3rem"></i>
                <span class="nav-item-content">Dashboard</span>
              </a>
            </li>
            <li class="nav-item text-white-50">
              <div class="nav-item dropdown" style="margin-bottom: 0px">
                <a aria-expanded="false" data-toggle="dropdown" class="nav-link" href="#">
                  <i class="fa fa-inbox" style="font-size: 1.3rem"></i>
                  <span class="nav-item-content">Product</span>
                </a>
                <div class="dropdown-menu">
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item text-white-50 menu-item" href="${pageContext.request.contextPath}/admin-products">Products list</a>
                  <a class="dropdown-item text-white-50 menu-item" href="${pageContext.request.contextPath}/admin-add-product">Add Product</a>
                  <a class="dropdown-item text-white-50 menu-item" href="${pageContext.request.contextPath}/admin-category">Category list</a>
                </div>
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/admin-orders">
                <i class="fa fa-first-order" style="font-size: 1.3rem"></i>
                <span class="nav-item-content">Orders</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/admin-users">
                <i class="fa fa-user" style="font-size: 1.3rem"></i>
                <span class="nav-item-content">Users</span>
              </a>
            </li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin-promotions"><i
							class="fa fa-gift" style="font-size: 1.3rem"></i><span
							class="nav-item-content">Promotions</span></a></li>
          </ul>
          <div class="text-center d-none d-md-inline">
            <button class="btn rounded-circle border-0" id="sidebarToggle" type="button"></button>
          </div>
        </div>
      </nav>
      <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
					<%-- navbar --%>
					<%@include file="navbar.jsp"%>
					<%-- end navbar --%>
          <div class="container-fluid px-container">
            <!-- BREADCRUMB -->
            <ol class="breadcrumb">
              <li class="breadcrumb-item active text-uppercase font-weight-bold">
                <span>dashboard</span>
              </li>
            </ol>
            <div class="row">
              <div class="col">
                <div class="d-flex flex-row justify-content-center flex-wrap justify-content-xl-center">
                  <div class="card dashboard-card">
                    <div class="card-body pb-0">
                      <h2
                        class="font-weight-bold text-center text-primary d-flex d-xl-flex flex-grow-1 justify-content-center align-items-xl-center"
                      >
                        50&nbsp;
                        <i class="far fa-user custom-icon"></i>
                      </h2>
                      <p class="text-nowrap text-uppercase font-weight-bold text-center text-dark">customers</p>
                    </div>
                  </div>
                  <div class="card dashboard-card">
                    <div class="card-body pb-0">
                      <h2
                        class="font-weight-bold text-center text-danger d-flex d-xl-flex flex-grow-1 justify-content-center align-items-xl-center"
                      >
                        50&nbsp;
                        <i class="far fa-user custom-icon"></i>
                      </h2>
                      <p class="text-nowrap text-uppercase font-weight-bold text-center text-dark">total sale</p>
                    </div>
                  </div>
                  <div class="card dashboard-card">
                    <div class="card-body pb-0">
                      <h2
                        class="font-weight-bold text-center text-info d-flex d-xl-flex flex-grow-1 justify-content-center align-items-xl-center"
                      >
                        50&nbsp;
                        <i class="far fa-user custom-icon"></i>
                      </h2>
                      <p class="text-nowrap text-uppercase font-weight-bold text-center text-dark">revenue</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12">
                <div class="card chart-card">
                  <div class="card-header chart-card-header">
                    <div
                      class="d-flex justify-content-start align-content-start align-items-xl-center header-char-today"
                    >
                      <span>TODAY</span>
                      <i class="fa fa-usd icon-dola"></i>
                      <span>100</span>
                    </div>
                    <div
                      class="d-flex justify-content-start align-content-start align-items-xl-center header-char-yesterday"
                    >
                      <span>YESTERDAY</span>
                      <i class="fa fa-usd icon-dola"></i>
                      <span>100</span>
                    </div>
                  </div>
                  <div class="card-body" style="border-left-color: rgba(201, 204, 227, 0.7); margin-top: 10px">
                    <div class="chart-area" style="border-radius: 10px; border-bottom-width: 5px; font-weight: bold">
                      <canvas
                        data-bss-chart='{"type":"line","data":{"labels":["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug"],"datasets":[{"label":"Earnings","fill":true,"data":["0","10000","5000","15000","10000","20000","15000","25000"],"backgroundColor":"rgba(78, 115, 223, 0.05)","borderColor":"rgba(78, 115, 223, 1)"}]},"options":{"maintainAspectRatio":false,"legend":{"display":false,"labels":{"fontStyle":"normal","fontColor":"#666","fontSize":20,"fontFamily":"Nunito, sans-serif"},"position":"top","reverse":false},"title":{"fontStyle":"normal","fontColor":"#ffffff"},"scales":{"xAxes":[{"gridLines":{"color":"#eaecf4","zeroLineColor":"#eaecf4","drawBorder":true,"drawTicks":false,"borderDash":["0"],"zeroLineBorderDash":["0"],"drawOnChartArea":true},"ticks":{"fontColor":"#ffffff","fontFamily":"Nunito, sans-serif","fontSize":"14","lineHeight":"-0.8","fontStyle":"bold","beginAtZero":false,"padding":12}}],"yAxes":[{"gridLines":{"color":"#eaecf4","zeroLineColor":"#eaecf4","drawBorder":true,"drawTicks":false,"borderDash":["0"],"zeroLineBorderDash":["0"],"drawOnChartArea":false},"ticks":{"fontColor":"#ffffff","fontFamily":"Nunito, sans-serif","fontSize":"14","lineHeight":"-0.8","fontStyle":"bold","beginAtZero":false,"padding":12}}]}}}'
                      >
                      </canvas>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <footer class="bg-white sticky-footer">
          <div class="container my-auto">
            <div class="text-center my-auto copyright">
              <span>Copyright © DuckStore 2023</span>
            </div>
          </div>
        </footer>
      </div>
      <a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
    </div>
    <script src="${pageContext.request.contextPath}/views/admin/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/views/admin/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/views/admin/assets/js/chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/views/admin/assets/js/bs-init.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js" type="module"></script>
    <script src="${pageContext.request.contextPath}/views/admin/assets/js/theme.js"></script>
  </body>
</html>
