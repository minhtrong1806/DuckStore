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
<title>Admin - Product Detail</title>
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
																class="nav-link active"
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
												class="nav-link"
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
				<a
						class="border rounded d-inline scroll-to-top"
						href="#page-top"> <i class="fas fa-angle-up"></i>
				</a>
				<div
						class="d-flex flex-column"
						id="content-wrapper">
						<div id="content">
								<%-- navbar --%>
								<%@include file="navbar.jsp"%>
								<%-- end navbar --%>
								<div class="container-fluid px-container">
										<ol class="breadcrumb mx-5">
												<li class="breadcrumb-item text-uppercase font-weight-bold">
														<a href="admin-products"><span>product</span></a>
												</li>
												<li class="breadcrumb-item text-uppercase font-weight-bold">
														<a href="products"><span>Product list</span></a>
												</li>
												<li
														class="breadcrumb-item active text-uppercase font-weight-bold">
														<span>Product detail</span>
												</li>
										</ol>
										<div class="card mx-5 mb-3">
												<div class="card-body">
														<h5 class="font-weight-bold text-dark mb-4">Quantity
																of each variants</h5>
														<div class="table-responsive">
																<table class="table">
																		<thead>
																				<tr>
																						<th>Size</th>
																						<th>Color</th>
																						<th>Quantity</th>
																						<th class="d-xl-flex justify-content-xl-center">Action</th>
																				</tr>
																		</thead>
																		<tbody>
																				<tr>
																						<td>Cell 1</td>
																						<td>Cell 2</td>
																						<td>Cell 2</td>
																						<td class="d-xl-flex justify-content-xl-center">
																								<button
																										class="btn"
																										type="button"
																										data-target="#change-quantity"
																										data-toggle="modal">
																										<i class="fa fa-edit icon-size"></i>
																								</button>
																						</td>
																				</tr>
																		</tbody>
																</table>
														</div>
												</div>
										</div>
										<form>
												<div class="form-row d-flex justify-content-xl-center px-5">
														<div class="col">
																<div class="card mb-3">
																		<div class="card-body">
																				<h5 class="font-weight-bold text-dark mb-4">Product
																						information</h5>
																				<div class="form-group d-flex align-items-center">
																						<input
																								class="form-control"
																								type="text"
																								name="nameProduct"
																								placeholder="Name"
																								autofocus=""
																								required="" />
																				</div>
																				<div class="form-group d-flex align-items-xl-center">
																						<input
																								class="form-control"
																								type="number"
																								name="sku"
																								placeholder="SKU"
																								min="0" />
																				</div>
																				<div class="form-group d-flex align-items-xl-center">
																						<textarea
																								class="form-control"
																								placeholder="Product Descripition "></textarea>
																				</div>
																				<div class="form-group d-flex align-items-xl-center">
																						<input
																								class="form-control"
																								type="number"
																								id="qtyStock"
																								name="sku"
																								placeholder="Quantity"
																								min="0" />
																				</div>
																		</div>
																</div>
																<div class="card mb-3">
																		<div class="card-body">
																				<h5 class="font-weight-bold text-dark mb-4">
																						<span style="color: rgb(84, 79, 90)">Image</span>
																				</h5>
																				<div
																						class="d-flex d-sm-flex justify-content-start flex-wrap align-items-sm-center">
																						<div>
																								<img class="m-3" />
																						</div>
																						<div
																								class="bg-secondary d-flex d-xl-flex justify-content-center align-items-center justify-content-xl-center upload-img m-3 pointer">
																								<i class="fa fa-plus icon-add-image pointer"></i><input
																										class="custom-file-input"
																										type="file" />
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
																												<option
																														value="1"
																														selected="">Size</option>
																												<option value="2">Color</option>
																										</optgroup>
																								</select>
																						</div>
																						<div class="form-group d-xl-flex w-50">
																								<input
																										class="form-control d-xl-flex"
																										type="text"
																										placeholder="Value"
																										autofocus=""
																										required="" />
																						</div>
																				</div>
																				<div class="d-flex justify-content-between"></div>
																				<button
																						class="btn btn-primary text-uppercase font-weight-bold w-auto"
																						type="button"
																						data-target="option">add another option</button>
																		</div>
																</div>
														</div>
														<div class="col-xl-5">
																<div class="card mb-3">
																		<div class="card-body">
																				<h5 class="font-weight-bold text-dark mb-4">Pricing</h5>
																				<div class="form-group">
																						<input
																								class="form-control"
																								type="number"
																								name="price"
																								placeholder="Best Price"
																								min="0" />
																				</div>
																				<div class="form-group">
																						<input
																								class="form-control"
																								type="number"
																								name="discountedPrice"
																								placeholder="Discounted Price"
																								min="0" />
																				</div>
																				<div class="form-group">
																						<div class="form-check">
																								<input
																										class="form-check-input"
																										type="checkbox"
																										id="taxCheck" /><label
																										class="form-check-label"
																										for="taxCheck"><span
																										style="color: rgb(137, 134, 141)">Charge
																												tax on this product</span> <br /> </label>
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
																				<div
																						class="d-flex mb-3"
																						id="form-edit-product">
																						<select class="form-control">
																								<optgroup label="Category">
																										<option
																												value="1"
																												selected="">Woman</option>
																										<option value="2">Man</option>
																								</optgroup>
																						</select>
																						<button
																								class="btn btn-secondary ml-3"
																								type="button"
																								data-target="#add-category"
																								data-toggle="collapse"
																								aria-expanded="false"
																								aria-controls="add-category">
																								<i class="fa fa-plus"></i>
																						</button>
																				</div>
																				<div
																						id="add-category"
																						class="collapse">
																						<input
																								class="form-control"
																								type="text" />
																				</div>
																		</div>
																</div>
														</div>
														<div class="col">
																<div
																		class="d-flex flex-row justify-content-between flex-wrap align-items-xl-center my-3 mx-5 w-auto">
																		<div class="mt-4"></div>
																		<div
																				class="d-flex flex-row justify-content-end justify-content-xl-end w-50">
																				<button
																						class="btn btn-danger text-uppercase font-weight-bold mr-3 my-2"
																						type="button"
																						style="border-style: solid; border-color: var(--gray)">
																						delete</button>
																				<button
																						class="btn btn-success text-uppercase font-weight-bold my-2"
																						type="submit">save change</button>
																		</div>
																</div>
														</div>
												</div>
										</form>
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
		<div
				class="modal text-uppercase font-weight-bold text-dark"
				role="dialog"
				tabindex="-1"
				id="change-quantity">
				<div
						class="modal-dialog modal-dialog-centered"
						role="document">
						<div class="modal-content">
								<div class="modal-header">
										<h4 class="modal-title">Quantity</h4>
										<button
												type="button"
												class="close"
												data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">×</span>
										</button>
								</div>
								<div class="modal-body">
										<input
												type="number"
												class="w-100" />
								</div>
								<div class="modal-footer">
										<button
												class="btn btn-light"
												type="button"
												data-dismiss="modal">Close</button>
										<button
												class="btn btn-primary"
												type="button">Save</button>
								</div>
						</div>
				</div>
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
