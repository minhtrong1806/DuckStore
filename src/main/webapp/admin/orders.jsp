<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
    <title>Admin - Order List</title>
    <link rel="icon" type="image/x-icon" href="../images/icons/favicon.ico" />
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css?h=bb600b08233db870ce64e59b11416ef9" />
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css?h=13bea3cde590997c1094f9bba14d719a" />
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css?h=13bea3cde590997c1094f9bba14d719a" />
    <link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css?h=13bea3cde590997c1094f9bba14d719a" />
    <link rel="stylesheet" href="assets/css/admin.css?h=542a0b5a250a67ab9a0ed1dbb563dd9c" />
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
              <a class="nav-link" href="dashboard.jsp">
                <i class="fa fa-dashboard" style="font-size: 1.3rem"></i><span class="nav-item-content">Dashboard</span>
              </a>
            </li>
            <li class="nav-item text-white-50">
              <div class="nav-item dropdown" style="margin-bottom: 0px">
                <a aria-expanded="false" data-toggle="dropdown" class="nav-link" href="#">
                  <i class="fa fa-inbox" style="font-size: 1.3rem"></i>
                  <span class="nav-item-content active-dropdown">Product</span>
                </a>
                <div class="dropdown-menu">
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item text-white-50 menu-item" href="products.jsp">Products list</a>
                  <a class="dropdown-item text-white-50 menu-item" href="add-product.jsp">Add Product</a>
                  <a class="dropdown-item text-white-50 menu-item" href="category.jsp">Category list</a>
                </div>
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link active" href="orders.jsp">
                <i class="fa fa-first-order" style="font-size: 1.3rem"></i><span class="nav-item-content">Orders</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="users.jsp"
                ><i class="fa fa-user" style="font-size: 1.3rem"></i><span class="nav-item-content">Users</span></a
              >
            </li>
            <li class="nav-item"></li>
            <li class="nav-item"></li>
          </ul>
          <div class="text-center d-none d-md-inline">
            <button class="btn rounded-circle border-0" id="sidebarToggle" type="button"></button>
          </div>
        </div>
      </nav>
      <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
          <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
            <div class="container-fluid">
              <button class="btn btn-link d-md-none rounded-circle mr-3" id="sidebarToggleTop" type="button">
                <i class="fas fa-bars"></i>
              </button>
              <form class="form-inline d-none d-sm-inline-block mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                <div class="input-group">
                  <input class="bg-light form-control border-0 small" type="text" placeholder="Search for ..." />
                  <div class="input-group-append">
                    <button class="btn btn-primary py-0" type="button">
                      <i class="fas fa-search"></i>
                    </button>
                  </div>
                </div>
              </form>
              <ul class="navbar-nav flex-nowrap ml-auto">
                <li class="nav-item dropdown d-sm-none no-arrow">
                  <a class="dropdown-toggle nav-link" aria-expanded="false" data-toggle="dropdown" href="#"
                    ><i class="fas fa-search"></i
                  ></a>
                  <div class="dropdown-menu dropdown-menu-right p-3 animated--grow-in" aria-labelledby="searchDropdown">
                    <form class="form-inline mr-auto navbar-search w-100">
                      <div class="input-group">
                        <input class="bg-light form-control border-0 small" type="text" placeholder="Search for ..." />
                        <div class="input-group-append">
                          <button class="btn btn-primary py-0" type="button">
                            <i class="fas fa-search"></i>
                          </button>
                        </div>
                      </div>
                    </form>
                  </div>
                </li>
                <li class="nav-item dropdown no-arrow mx-1"></li>
                <li class="nav-item dropdown no-arrow">
                  <div class="nav-item dropdown no-arrow">
                    <a class="dropdown-toggle nav-link" aria-expanded="false" data-toggle="dropdown" href="#">
                      <span class="d-none d-lg-inline mr-2 text-gray-600 small">Minh Trong</span>
                      <img
                        class="border rounded-circle img-profile"
                        src="assets/img/avatars/anh.jpg?h=d233e08feddcdd2a8275c132af92e075"
                      />
                    </a>
                    <div class="dropdown-menu shadow dropdown-menu-right animated--grow-in">
                      <a class="dropdown-item" href="#"
                        ><i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Profile</a
                      >
                      <a class="dropdown-item" href="#"
                        ><i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Settings</a
                      >
                      <a class="dropdown-item" href="#"
                        ><i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Activity log</a
                      >
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="#"
                        ><i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Logout</a
                      >
                    </div>
                  </div>
                </li>
              </ul>
            </div>
          </nav>
          <div class="container-fluid">
            <ol class="breadcrumb">
              <li class="breadcrumb-item active text-uppercase font-weight-bold">
                <span>orders</span>
              </li>
            </ol>
            <div class="card my-3">
              <div class="card-body d-flex justify-content-between flex-wrap">
                <div class="d-flex justify-content-between align-items-center overview-order">
                  <div>
                    <h3 class="font-weight-bold text-dark">56</h3>
                    <p class="text-nowrap">Pending payment</p>
                  </div>
                  <div class="icon-wraper"><i class="fa fa-calendar"></i></div>
                </div>
                <div class="d-flex justify-content-between align-items-center overview-order">
                  <div>
                    <h3 class="font-weight-bold text-dark">56</h3>
                    <p class="text-nowrap">Completed</p>
                  </div>
                  <div class="icon-wraper"><i class="fa fa-check"></i></div>
                </div>
                <div class="d-flex justify-content-between align-items-center overview-order">
                  <div>
                    <h3 class="font-weight-bold text-dark">56</h3>
                    <p class="text-nowrap">Refunded</p>
                  </div>
                  <div class="icon-wraper">
                    <i class="fa fa-rotate-left"></i>
                  </div>
                </div>
                <div class="d-flex justify-content-between align-items-center overview-order">
                  <div>
                    <h3 class="font-weight-bold text-dark">56</h3>
                    <p class="text-nowrap">failded</p>
                  </div>
                  <div class="icon-wraper"><i class="fa fa-bug"></i></div>
                </div>
              </div>
            </div>
            <div class="card shadow">
              <div class="card-body" style="padding-top: 0px">
                <div class="row mb-3 my-2">
                  <div class="col-md-6 col-xl-4 d-flex d-xl-flex align-items-xl-center my-2">
                    <div class="text-md-right d-xl-flex dataTables_filter" id="dataTable_filter" style="width: 70%">
                      <input
                        class="d-xl-flex form-control form-control-sm w-75"
                        type="search"
                        aria-controls="dataTable"
                        placeholder="Search"
                      />
                    </div>
                  </div>
                  <div class="col-md-6 col-xl-4 text-nowrap">
                    <div
                      class="d-flex d-xl-flex justify-content-xl-center align-items-xl-center dataTables_length my-2"
                      id="dataTable_length"
                      aria-controls="dataTable"
                    >
                      <select class="d-xl-flex form-control form-control-sm custom-select custom-select-sm w-50">
                        <option value="10" selected="">10</option>
                        <option value="25">25</option>
                        <option value="50">50</option>
                        <option value="100">100</option>
                      </select>
                    </div>
                  </div>
                  <div class="col-xl-4 d-xl-flex justify-content-xl-end my-2"></div>
                </div>
                <div class="table-responsive table mt-2" id="dataTable-1" role="grid" aria-describedby="dataTable_info">
                  <table class="table my-0" id="dataTable">
                    <thead>
                      <tr>
                        <th class="text-uppercase">order</th>
                        <th class="text-uppercase">date</th>
                        <th class="text-uppercase">customers</th>
                        <th class="text-uppercase">payment</th>
                        <th class="text-uppercase">status</th>
                        <th class="text-uppercase">method</th>
                        <th class="text-uppercase text-center d-xl-flex justify-content-xl-center">actions</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>1</td>
                        <td>22/22/33</td>
                        <td>do minh trong</td>
                        <td>pending</td>
                        <td>
                          <span style="color: rgb(22, 177, 255); background-color: rgb(220, 243, 255)">delivered</span>
                        </td>
                        <td>momo</td>
                        <td class="d-xl-flex justify-content-xl-center">
                          <div class="border rounded-0 border-white d-flex justify-content-around btn-group">
                            <button class="btn" type="button" aria-expanded="false" data-toggle="dropdown">
                              <i class="fa fa-ellipsis-v icon-size"></i>
                            </button>
                            <div
                              class="dropdown-menu dropdown-menu-right"
                              style="background: var(--white); position: static"
                            >
                              <a class="btn dropdown-item" role="button" href="order-detail.jsp">Detail</a
                              ><button class="btn dropdown-item" type="button">Delete</button>
                            </div>
                          </div>
                        </td>
                      </tr>
                    </tbody>
                    <tfoot>
                      <tr></tr>
                    </tfoot>
                  </table>
                </div>
                <div class="row">
                  <div class="col-md-6 col-xl-12 d-xl-flex justify-content-xl-center">
                    <nav class="d-lg-flex justify-content-lg-end dataTables_paginate paging_simple_numbers">
                      <ul class="pagination">
                        <li class="page-item disabled">
                          <a class="page-link" aria-label="Previous" href="#"><span aria-hidden="true">«</span></a>
                        </li>
                        <li class="page-item active">
                          <a class="page-link" href="#">1</a>
                        </li>
                        <li class="page-item">
                          <a class="page-link" href="#">2</a>
                        </li>
                        <li class="page-item">
                          <a class="page-link" href="#">3</a>
                        </li>
                        <li class="page-item">
                          <a class="page-link" aria-label="Next" href="#"><span aria-hidden="true">»</span></a>
                        </li>
                      </ul>
                    </nav>
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
    <script src="assets/js/jquery.min.js?h=89312d34339dcd686309fe284b3f226f"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js?h=2504f2315ca47ea4d62e67e20a5551d7"></script>
    <script src="assets/js/bs-init.js?h=24944136186a01ba6322da1c4ad1dfbe"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js" type="module"></script>
    <script src="assets/js/theme.js?h=6d33b44a6dcb451ae1ea7efc7b5c5e30"></script>
  </body>
</html>
