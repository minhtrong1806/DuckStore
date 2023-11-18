<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
    <title>Admin - User Detail</title>
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
              <a class="nav-link" href="admin-orders">
                <i class="fa fa-first-order" style="font-size: 1.3rem"></i>
                <span class="nav-item-content">Orders</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" href="admin-users">
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
      <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
	        <%-- navbar --%>
					<%@include file="navbar.jsp"%>
					<%-- end navbar --%>
          <div class="container-fluid px-container">
            <ol class="breadcrumb m mx-5">
              <li class="breadcrumb-item text-uppercase font-weight-bold">
                <a href="admin-users"><span>users</span></a>
              </li>
              <li class="breadcrumb-item active text-uppercase font-weight-bold">
                <span>user detail</span>
              </li>
            </ol>
            <div class="d-flex justify-content-end align-items-xl-center my-3 mx-5">
              <div class="d-flex flex-row justify-content-end justify-content-xl-end"></div>
            </div>
            <div class="row d-flex justify-content-xl-center px-5">
              <div class="col">
                
                <%--info--%>
								<div class="card shadow mb-3">
									<div class="card-header py-3">
										<p class="text-primary m-0 font-weight-bold">Info</p>
									</div>
									<div class="card-body">
										<div class="form-row">
											<div class="col">
												<div class="form-group">
													<label for="username"><strong>Username</strong></label>
													<input class="form-control" type="text" id="username" placeholder="User Name" name="username">
												</div>
											</div>
											<div class="col">
												<div class="form-group">
													<label for="email"><strong>Email Address</strong></label>
													<input class="form-control" type="email" id="email" placeholder="Email Address" name="email">
												</div>
											</div>
										</div>
										<div class="form-row">
											<div class="col">
												<div class="form-group">
													<label for="first_name"><strong>Phone Number</strong></label>
													<input class="form-control" type="text" id="first_name" name="first_name" placeholder="Phone Number" minlength="10">
												</div>
											</div>
											<div class="col">
												<div class="form-group">
													<label for="last_name"><strong>Role</strong></label>
													<select class="form-control">
														<optgroup label="Role">
															<option value="2" selected="">Customer</option>
															<option value="1">Staff</option>
															<option value="0">Manager</option>
														</optgroup>
													</select>
												</div>
											</div>
										</div>
										<div class="form-row">
											<div class="col">
												<div class="form-group">
													<label for="pass"><strong>Password</strong><br></label>
													<input class="form-control" type="password" placeholder="Password">
												</div>
											</div>
											<div class="col">
												<div class="form-group">
													<label for="pass repeat"><strong>Repeat Password</strong><br></label>
															<input class="form-control" type="password" placeholder="Repeat Password">
												</div>
											</div>
										</div>
									</div>
								</div>
								<%--address content--%>
								<div class="card shadow">
									<div class="card-header py-3">
										<p class="text-primary m-0 font-weight-bold">Address</p>
									</div>
									<div class="card-body">
										<div class="form-group">
											<label for="address"><strong>City</strong></label>
											<input class="form-control" type="text" id="address" placeholder="City" name="City">
										</div>
										<div class="form-group">
											<label for="address"><strong>District</strong></label>
											<input class="form-control" type="text" id="address-3" placeholder="District" name="District">
										</div>
										<div class="form-group">
											<label for="address"><strong>Address Line</strong></label>
											<input class="form-control" type="text" id="address-2" placeholder="Address Line" name="addressLine">
										</div>
										<div class="form-group">
											<label for="address"><strong>Unit Number</strong></label>
											<input class="form-control" type="text" id="address-1" placeholder="Unit Number" name="unitNumber">
										</div>
									</div>
								</div>
							<%--  --%>
                <div class="card">
                  <div class="card-header">
                    <p
                      class="text-primary m-0 font-weight-bold pointer"
                      data-target="#reset_password"
                      aria-expanded="false"
                      data-toggle="collapse"
                      aria-controls="reset_password"
                    >
                      Reset password
                    </p>
                  </div>
                  <div class="card-body collapse" id="reset_password">
                    <form id="form-reset-pass">
                      <div class="form-row">
                        <div class="col">
                          <div class="form-group">
                            <label for=""><strong>New Password</strong></label>
                            <input class="form-control" type="password" placeholder="New Password" />
                          </div>
                        </div>
                        <div class="col">
                          <div class="form-group">
                            <label for=""><strong>Repeat Password</strong></label
                            ><input class="form-control" type="password" placeholder="Repeat Password" />
                          </div>
                        </div>
                      </div>
                      <button class="btn btn-primary" type="submit">Save</button>
                    </form>
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
    <script src="${pageContext.request.contextPath}/views/admin/assets/js/bs-init.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js" type="module"></script>
    <script src="${pageContext.request.contextPath}/views/admin/assets/js/theme.js"></script>
  </body>
</html>
