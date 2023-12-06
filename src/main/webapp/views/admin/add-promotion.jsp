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
												href="${pageContext.request.contextPath}/admin-dashboard"> <i
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
																		href="${pageContext.request.contextPath}/admin-products">Products list</a> <a
																		class="dropdown-item text-white-50 menu-item"
																		href="${pageContext.request.contextPath}/admin-add-product">Add Product</a> <a
																		class="dropdown-item text-white-50 menu-item"
																		href="${pageContext.request.contextPath}/admin-category">Category list</a>
														</div>
												</div>
										</li>
										<li class="nav-item"><a
												class="nav-link"
												href="${pageContext.request.contextPath}/admin-orders"> <i
														class="fa fa-first-order"
														style="font-size: 1.3rem"></i> <span
														class="nav-item-content">Orders</span>
										</a></li>
										<li class="nav-item"><a
												class="nav-link"
												href="${pageContext.request.contextPath}/admin-users"> <i
														class="fa fa-user"
														style="font-size: 1.3rem"></i> <span
														class="nav-item-content">Users</span>
										</a></li>
										<li class="nav-item"><a
												class="nav-link active"
												href="${pageContext.request.contextPath}/admin-promotions"><i
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
										<ol class="breadcrumb m mx-5">
												<li class="breadcrumb-item text-uppercase font-weight-bold"><a
														href="${pageContext.request.contextPath}/admin-promotions 	"><span>promotion</span></a></li>
												<li
														class="breadcrumb-item active text-uppercase font-weight-bold"><span>add
																promotion&nbsp;</span></li>
										</ol>
										<div
												class="d-flex justify-content-end align-items-xl-center my-3 mx-5">
												<div
														class="d-flex flex-row justify-content-end justify-content-xl-end"></div>
										</div>
										<div class="row d-flex justify-content-xl-center px-5">
												<div class="col d-flex justify-content-center">
														<div class="card w-50">
																<div class="card-body">
																		<h4 class="card-title">New Promotion</h4>
																		<form>
																				<div class="border-top">
																						<label class="mt-3"><strong>Promotional Code</strong></label>
																						<input class="form-control" type="text" placeholder="Promotional Code" name="promotionalCode">
																				</div>
																				<div class="border-top">
																						<label class="mt-3"><strong>Percent unit (%)</strong></label>
																						<input class="form-control" type="number" min="0" max="100" step="1">
																				</div>
																				<div
																						class="d-flex justify-content-between flex-wrap border-top">
																						<div class="col-xl-6 pl-0">
																								<label class="mt-3"><strong>Start Date</strong></label>
																								<input class="form-control" type="date">
																						</div>
																						<div class="col-xl-6 pr-0">
																								<label class="mt-3"><strong>End Date</strong></label>
																								<input class="form-control" type="date">
																						</div>
																				</div>
																				<button class="btn btn-primary my-3" type="submit">Save</button>
																		</form>
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
