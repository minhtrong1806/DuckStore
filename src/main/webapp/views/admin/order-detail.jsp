<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
    <title>Admin - Order Detai</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/views/admin/assets/img/icon/favicon.ico" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/assets/fonts/fontawesome-all.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/assets/fonts/font-awesome.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/assets/fonts/fontawesome5-overrides.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/assets/css/admin.css" />
  </head>

  <body id="page-top">
    <div id="wrapper">
    <%--side navbar --%>
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
              <a class="nav-link" href="admin-dashboard">
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
                  <a class="dropdown-item text-white-50 menu-item" href="admin-products">Products list</a>
                  <a class="dropdown-item text-white-50 menu-item" href="admin-add-product">Add Product</a>
                  <a class="dropdown-item text-white-50 menu-item" href="admin-category">Category list</a>
                </div>
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link active" href="admin-orders">
                <i class="fa fa-first-order" style="font-size: 1.3rem"></i>
                <span class="nav-item-content">Orders</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="admin-users">
                <i class="fa fa-user" style="font-size: 1.3rem"></i>
                <span class="nav-item-content">Users</span>
              </a>
            </li>
            <li class="nav-item"><a class="nav-link" href="promotions"><i
							class="fa fa-gift" style="font-size: 1.3rem"></i><span
							class="nav-item-content">Promotions</span></a></li>
          </ul>
          <div class="text-center d-none d-md-inline">
            <button class="btn rounded-circle border-0" id="sidebarToggle" type="button"></button>
          </div>
        </div>
      </nav>
      <a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
      <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
	        <%-- navbar --%>
					<%@include file="navbar.jsp"%>
					<%-- end navbar --%>
          <div class="container-fluid">
            <ol class="breadcrumb m mx-5">
              <li class="breadcrumb-item text-uppercase font-weight-bold">
                <a href="admin-orders"><span>orders</span></a>
              </li>
              <li class="breadcrumb-item active text-uppercase font-weight-bold">
                <span>order detail</span>
              </li>
            </ol>
            <div class="d-flex justify-content-between flex-wrap align-items-xl-center my-3 mx-5">
              <div class="mt-4">
                <h4 class="font-weight-bolder text-dark" style="color: var(--gray-dark)">Order #123</h4>
                <p class="f" style="line-height: 20px">
                  <span style="color: rgb(137, 134, 141); background-color: rgb(244, 245, 250)">22/12/2023</span><br />
                </p>
              </div>
              <div class="d-flex justify-content-end justify-content-xl-end w-50">
                <button
                  class="btn btn-danger text-uppercase font-weight-bold w-auto"
                  type="button"
                  style="border-style: solid; border-color: var(--gray)"
                >
                  DELETE ORDER
                </button>
              </div>
            </div>
            <div class="row d-flex justify-content-xl-center px-5">
              <div class="col">
                <div class="card mb-3">
                  <div class="card-body">
                    <h5 class="font-weight-bold text-dark mb-4">Order detail</h5>
                    <div class="table-responsive">
                      <table class="table">
                        <thead>
                          <tr>
                            <th class="text-uppercase">Products</th>
                            <th class="text-uppercase">Price</th>
                            <th class="text-uppercase">QTY</th>
                            <th class="text-uppercase">Total</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td>ao</td>
                            <td>500</td>
                            <td>1</td>
                            <td>500</td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                    <div class="row">
                      <div class="col d-flex flex-column align-items-end">
                        <div class="d-flex justify-content-between">
                          <span class="mr-5">Subtotal:</span><span>$1000</span>
                        </div>
                        <div class="d-flex justify-content-between">
                          <span class="mr-5">Discount:</span><span>$1000</span>
                        </div>
                        <div class="d-flex justify-content-between">
                          <span class="mr-5">Tax:</span><span>$1000</span>
                        </div>
                        <div class="d-flex justify-content-between">
                          <span class="mr-5">Total:</span><span>$1000</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="card mb-3"></div>
                <div class="card mb-3">
                  <div class="card-body">
                    <h5 class="font-weight-bold text-dark mb-4">Shipping activity</h5>
                  </div>
                </div>
              </div>
              <div class="col-xl-5">
                <div class="card mb-3">
                  <div class="card-body">
                    <h5 class="font-weight-bold text-dark mb-4">Customer detail</h5>
                    <div class="d-flex justify-content-start mb-2">
                      <span>Name:</span><span class="ml-5">Minh Trong</span>
                    </div>
                    <h6 class="font-weight-bold text-dark mb-4">Contact info</h6>
                    <p>Email: sff@dsdff.com</p>
                    <p>Mobile: 09320295</p>
                  </div>
                </div>
                <div class="card">
                  <div class="card-body">
                    <h5 class="font-weight-bold text-dark mb-4">
                      <span style="color: rgb(84, 79, 90)">Shipping and billing address</span>
                      <br />
                    </h5>
                    <div class="card mb-3">
                      <div class="card-header font-weight-bold text-dark">
                        <h4>Address</h4>
                      </div>
                      <div class="card-body">
                        <p class="card-text">
                          Nullam id dolor id nibh ultricies vehicula ut id elit. Cras justo odio, dapibus ac facilisis
                          in, egestas eget quam. Donec id elit non mi porta gravida at eget metus.
                        </p>
                      </div>
                    </div>
                    <div class="card">
                      <div class="card-header">
                        <h4>Billing</h4>
                      </div>
                      <div class="card-body">
                        <p class="card-text">
                          Nullam id dolor id nibh ultricies vehicula ut id elit. Cras justo odio, dapibus ac facilisis
                          in, egestas eget quam. Donec id elit non mi porta gravida at eget metus.
                        </p>
                      </div>
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
    </div>
    <script src="${pageContext.request.contextPath}/views/admin/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/views/admin/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/views/admin/assets/js/bs-init.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js" type="module"></script>
    <script src="${pageContext.request.contextPath}/views/admin/assets/js/theme.js"></script>
  </body>
</html>
