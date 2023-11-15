<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
    <title>Admin - Add Product</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/views/admin/assets/img/icon/favicon.ico" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/assets/bootstrap/css/bootstrap.min.css?h=bb600b08233db870ce64e59b11416ef9" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/assets/fonts/fontawesome-all.min.css?h=13bea3cde590997c1094f9bba14d719a" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/assets/fonts/font-awesome.min.css?h=13bea3cde590997c1094f9bba14d719a" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/assets/fonts/fontawesome5-overrides.min.css?h=13bea3cde590997c1094f9bba14d719a" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/assets/css/admin.css?h=542a0b5a250a67ab9a0ed1dbb563dd9c" />
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
              <a class="nav-link " href="admin-dashboard">
                <i class="fa fa-dashboard" style="font-size: 1.3rem"></i>
                <span class="nav-item-content">Dashboard</span>
              </a>
            </li>
            <li class="nav-item text-white-50">
              <div class="nav-item dropdown" style="margin-bottom: 0px">
                <a aria-expanded="false" data-toggle="dropdown" class="nav-link active" href="#">
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
              <a class="nav-link" href="admin-orders">
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
            <li class="nav-item"></li>
            <li class="nav-item"></li>
          </ul>
          <div class="text-center d-none d-md-inline">
            <button class="btn rounded-circle border-0" id="sidebarToggle" type="button"></button>
          </div>
        </div>
      </nav>
      <a class="border rounded d-inline scroll-to-top" href="#page-top">
        <i class="fas fa-angle-up"></i>
      </a>
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
                  <a class="dropdown-toggle nav-link" aria-expanded="false" data-toggle="dropdown" href="#">
                    <i class="fas fa-search"></i>
                  </a>
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
                        src="${pageContext.request.contextPath}/views/admin/assets/img/avatars/anh.jpg?h=d233e08feddcdd2a8275c132af92e075"
                      />
                    </a>
                    <div class="dropdown-menu shadow dropdown-menu-right animated--grow-in">
                      <a class="dropdown-item" href="#">
                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp; Profile
                      </a>
                      <a class="dropdown-item" href="#">
                        <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp; Settings
                      </a>
                      <a class="dropdown-item" href="#">
                        <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp; Activity log
                      </a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="logout">
                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp; Logout
                      </a>
                    </div>
                  </div>
                </li>
              </ul>
            </div>
          </nav>
          <div class="container-fluid px-container">
            <ol class="breadcrumb m mx-5">
              <li class="breadcrumb-item text-uppercase font-weight-bold">
                <a href="admin-products">
                  <span>product</span>
                </a>
              </li>
              <li class="breadcrumb-item active text-uppercase font-weight-bold">
                <span>add product</span>
              </li>
            </ol>
            <form id="form-add-product">
              <div class="d-flex justify-content-between flex-wrap align-items-xl-center my-3 mx-5">
                <div class="mt-4">
                  <h4 class="font-weight-bolder text-dark" style="color: var(--gray-dark)">Add a new Product</h4>
                  <p class="f" style="line-height: 20px">
                    <span style="color: rgb(137, 134, 141); background-color: rgb(244, 245, 250)"
                      >Orders placed across your store</span
                    ><br />
                  </p>
                </div>
                <div class="d-flex flex-row justify-content-end justify-content-xl-end w-50">
                  <a
                    class="btn btn-danger text-uppercase font-weight-bold mr-3 my-2"
                    role="button"
                    style="border-style: solid; border-color: var(--gray)"
                    href="products"
                    >discard
                  </a>
                  <button class="btn btn-success text-uppercase font-weight-bold my-2" type="submit">save&nbsp;</button>
                </div>
              </div>
              <div class="form-row d-flex justify-content-xl-center px-5">
                <div class="col">
                  <div class="card mb-3">
                    <div class="card-body">
                      <h5 class="font-weight-bold text-dark mb-4">Product information</h5>
                      <div class="form-group d-flex align-items-center">
                        <input
                          class="form-control"
                          type="text"
                          name="nameProduct"
                          placeholder="Name"

                        />
                      </div>
                      <div class="form-group d-flex align-items-xl-center">
                        <input class="form-control" type="number" name="sku" placeholder="SKU" min="0" />
                      </div>
                      <div class="form-group d-flex align-items-xl-center">
                        <textarea class="form-control" placeholder="Product Descripition "></textarea>
                      </div>
                      <div class="form-group d-flex align-items-xl-center">
                        <input
                          class="form-control"
                          type="number"
                          id="qtyStock"
                          name="sku"
                          placeholder="Quantity"
                          min="0"
                        />
                      </div>
                    </div>
                  </div>
                  <div class="card mb-3">
                    <div class="card-body">
                      <h5 class="font-weight-bold text-dark mb-4">
                        <span style="color: rgb(84, 79, 90)">Image</span>
                      </h5>
                      <div class="d-flex d-sm-flex justify-content-start">
                        <div>
                          <img class="m-2" />
                        </div>
                        <div
                          class="bg-secondary d-flex d-xl-flex justify-content-center align-items-center justify-content-xl-center upload-img m-2 pointer"
                        >
                          <i class="fa fa-plus icon-add-image pointer"></i>
                          <input class="custom-file-input" type="file" />
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="card mb-3">
                    <div class="card-body">
                      <h5 class="font-weight-bold text-dark mb-4">Variants</h5>
                      <div class="d-flex justify-content-between">
                        <div class="form-group d-xl-flex w-50 pr-5">
                          <select class="form-control d-xl-flex">
                            <optgroup label="Options">
                              <option value="1" selected="">Size</option>
                              <option value="2">Color</option>
                            </optgroup>
                          </select>
                        </div>
                        <div class="form-group d-xl-flex w-50">
                          <input
                            class="form-control d-xl-flex"
                            type="text"
                            placeholder="Value"
                          
                          />
                        </div>
                      </div>
                      <div class="d-flex justify-content-between"></div>
                      <button
                        class="btn btn-primary text-uppercase font-weight-bold w-auto"
                        type="button"
                        data-target="option"
                      >
                        add another option
                      </button>
                    </div>
                  </div>
                </div>
                <div class="col-xl-5">
                  <div class="card mb-3">
                    <div class="card-body">
                      <h5 class="font-weight-bold text-dark mb-4">Pricing</h5>
                      <div class="form-group">
                        <input class="form-control" type="number" name="price" placeholder="Best Price" min="0" />
                      </div>
                      <div class="form-group">
                        <input
                          class="form-control"
                          type="number"
                          name="discountedPrice"
                          placeholder="Discounted Price"
                          min="0"
                        />
                      </div>
                      <div class="form-group">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="taxCheck" />
                          <label class="form-check-label" for="taxCheck">
                            <span style="color: rgb(137, 134, 141)">Charge tax on this product</span>
                            <br />
                          </label>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="card">
                    <div class="card-body">
                      <h5 class="font-weight-bold text-dark mb-4">
                        <span style="color: rgb(84, 79, 90)">Category</span>
                        <br />
                      </h5>
                      <div class="d-flex mb-3">
                        <select class="form-control">
                          <optgroup label="Category">
                            <option value="1" selected="">Woman</option>
                            <option value="2">Man</option>
                          </optgroup>
                        </select>
                        <button
                          class="btn btn-secondary ml-3"
                          type="button"
                          data-target="#add-category"
                          data-toggle="collapse"
                          aria-expanded="false"
                          aria-controls="add-category"
                        >
                          <i class="fa fa-plus"></i>
                        </button>
                      </div>
                      <div id="add-category" class="collapse"><input class="form-control" type="text" /></div>
                    </div>
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>
        <footer class="bg-white sticky-footer">
          <div class="container my-auto">
            <div class="text-center my-auto copyright"><span>Copyright © DuckStore 2023</span></div>
          </div>
        </footer>
      </div>
    </div>
    <script src="${pageContext.request.contextPath}/views/admin/assets/js/jquery.min.js?h=89312d34339dcd686309fe284b3f226f"></script>
    <script src="${pageContext.request.contextPath}/views/admin/assets/bootstrap/js/bootstrap.min.js?h=2504f2315ca47ea4d62e67e20a5551d7"></script>
    <script src="${pageContext.request.contextPath}/views/admin/assets/js/bs-init.js?h=24944136186a01ba6322da1c4ad1dfbe"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js" type="module"></script>
    <script src="${pageContext.request.contextPath}/views/admin/assets/js/theme.js?h=6d33b44a6dcb451ae1ea7efc7b5c5e30"></script>
  </body>
</html>
