<%@ page
		language="java"
		contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="utf-8" />
<meta
		name="viewport"
		content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
<title>Admin - User List</title>
<link
		rel="icon"
		type="image/x-icon"
		href="${pageContext.request.contextPath}/views/admin/assets/img/icon/favicon.ico" />
<link
		rel="stylesheet"
		href="${pageContext.request.contextPath}/views/admin/assets/bootstrap/css/bootstrap.min.css" />
<link
		rel="stylesheet"
		href="${pageContext.request.contextPath}/views/admin/assets/fonts/fontawesome-all.min.css" />
<link
		rel="stylesheet"
		href="${pageContext.request.contextPath}/views/admin/assets/fonts/font-awesome.min.css" />
<link
		rel="stylesheet"
		href="${pageContext.request.contextPath}/views/admin/assets/fonts/fontawesome5-overrides.min.css" />
<link
		rel="stylesheet"
		href="${pageContext.request.contextPath}/views/admin/assets/css/admin.css" />
</head>
<body id="page-top">
		<div id="wrapper">
				<%--Side Navbar--%>
				<nav
						class="navbar navbar-dark bg-primary align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0">
						<div class="container-fluid d-flex flex-column p-0">
								<a
										class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0"
										href="#">
										<div class="sidebar-brand-icon rotate-n-15">
												<i class="fas fa-shopping-cart"></i>
										</div>
										<div class="sidebar-brand-text mx-3">
												<span style="font-size: 20px">DuckStore</span>
										</div>
								</a>
								<hr class="sidebar-divider my-0" />
								<ul
										class="navbar-nav text-light"
										id="accordionSidebar">
										<li
												class="nav-item"
												style="margin-top: 35%"><a
												class="nav-link"
												href="admin-dashboard"> <i
														class="fa fa-dashboard"
														style="font-size: 1.3rem"></i> <span
														class="nav-item-content">Dashboard</span>
										</a></li>
										<li class="nav-item text-white-50">
												<div
														class="nav-item dropdown"
														style="margin-bottom: 0px">
														<a
																aria-expanded="false"
																data-toggle="dropdown"
																class="nav-link"
																href="#"> <i
																class="fa fa-inbox"
																style="font-size: 1.3rem"></i> <span
																class="nav-item-content">Product</span>
														</a>
														<div class="dropdown-menu">
																<div class="dropdown-divider"></div>
																<a
																		class="dropdown-item text-white-50 menu-item"
																		href="admin-products">Products list</a> <a
																		class="dropdown-item text-white-50 menu-item"
																		href="admin-add-product">Add Product</a> <a
																		class="dropdown-item text-white-50 menu-item"
																		href="admin-category">Category list</a>
														</div>
												</div>
										</li>
										<li class="nav-item"><a
												class="nav-link"
												href="admin-orders"> <i
														class="fa fa-first-order"
														style="font-size: 1.3rem"></i> <span
														class="nav-item-content">Orders</span>
										</a></li>
										<li class="nav-item"><a
												class="nav-link"
												href="admin-users"> <i
														class="fa fa-user"
														style="font-size: 1.3rem"></i> <span
														class="nav-item-content">Users</span>
										</a></li>
										<li class="nav-item"><a
												class="nav-link active"
												href="promotions"><i
														class="fa fa-gift"
														style="font-size: 1.3rem"></i><span
														class="nav-item-content">Promotions</span></a></li>
								</ul>
								<div class="text-center d-none d-md-inline">
										<button
												class="btn rounded-circle border-0"
												id="sidebarToggle"
												type="button"></button>
								</div>
						</div>
				</nav>
				<%--End Side Navbar--%>
				<div
						class="d-flex flex-column"
						id="content-wrapper">
						<div id="content">
								<%-- navbar --%>
								<%@include file="navbar.jsp"%>
								<%-- end navbar --%>
								<%--content--%>
								<div class="container-fluid px-container">
										<ol class="breadcrumb">
												<li
														class="breadcrumb-item active text-uppercase font-weight-bold"><span>promotion</span></li>
										</ol>
										<div
												class="d-flex justify-content-end align-items-xl-center my-3 mx-5">
												<div
														class="d-flex flex-row justify-content-end justify-content-xl-end"></div>
										</div>
										<div class="row">
												<div class="col">
														<div class="card">
																<div class="d-flex justify-content-between mx-3 mt-3">
																		<h3 class="text-uppercase d-inline">List
																				Promotions</h3>
																		<a
																				class="btn btn-primary"
																				role="button"
																				href="add-promotion">ADD</a>
																</div>
																<div class="card-body">
																		<div class="table-responsive">
																				<table class="table">
																						<thead>
																								<tr>
																										<th class="text-uppercase">code&nbsp;</th>
																										<th class="text-uppercase">Percent</th>
																										<th class="text-uppercase">Start date</th>
																										<th class="text-uppercase">end date</th>
																								</tr>
																						</thead>
																						<tbody>
																								<tr>
																										<td>GIAMGIA</td>
																										<td>10</td>
																										<td>11/11/2022</td>
																										<td>11/11/2023</td>
																								</tr>
																								<tr></tr>
																						</tbody>
																				</table>
																		</div>
																</div>
														</div>
												</div>
										</div>
								</div>
								<%--end-content--%>
						</div>
						<footer class="bg-white sticky-footer">
								<div class="container my-auto">
										<div class="text-center my-auto copyright">
												<span>Copyright © DuckStore 2023</span>
										</div>
								</div>
						</footer>
				</div>
				<a
						class="border rounded d-inline scroll-to-top"
						href="#page-top"><i class="fas fa-angle-up"></i></a>
		</div>
		<script
				src="${pageContext.request.contextPath}/views/admin/assets/js/jquery.min.js"></script>
		<script
				src="${pageContext.request.contextPath}/views/admin/assets/bootstrap/js/bootstrap.min.js"></script>
		<script
				src="${pageContext.request.contextPath}/views/admin/assets/js/bs-init.js"></script>
		<script
				src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"
				type="module"></script>
		<script
				src="${pageContext.request.contextPath}/views/admin/assets/js/theme.js"></script>
</body>
</html>
