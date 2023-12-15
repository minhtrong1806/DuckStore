<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="utf-8" />
<meta
		name="viewport"
		content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
<title>Admin - User List</title>
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/views/admin/assets/img/icon/favicon.ico" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/assets/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/assets/fonts/fontawesome-all.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/assets/fonts/font-awesome.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/assets/fonts/fontawesome5-overrides.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/assets/css/admin.css" />
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
				<ul class="navbar-nav text-light" id="accordionSidebar">
					<li class="nav-item text-white-50" style="margin-top: 70%;">
						<div class="nav-item dropdown" style="margin-bottom: 0px">
							<a aria-expanded="false" data-toggle="dropdown"
								class="nav-link active" href="#"> <i class="fa fa-inbox"
								style="font-size: 1.3rem"></i> <span class="nav-item-content">Product</span>
							</a>
							<div class="dropdown-menu">
								<div class="dropdown-divider"></div>
								<a class="dropdown-item text-white-50 menu-item"
									href="${pageContext.request.contextPath}/admin-products">Products list</a> <a
									class="dropdown-item text-white-50 menu-item"
									href="${pageContext.request.contextPath}/admin-add-product">Add Product</a> <a
									class="dropdown-item text-white-50 menu-item"
									href="${pageContext.request.contextPath}/admin-category">Category list</a>
							</div>
						</div>
					</li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin-orders">
							<i class="fa fa-first-order" style="font-size: 1.3rem"></i> <span
							class="nav-item-content">Orders</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin-users">
							<i class="fa fa-user" style="font-size: 1.3rem"></i> <span
							class="nav-item-content">Users</span>
					</a></li>
				</ul>
				<div class="text-center d-none d-md-inline">
					<button class="btn rounded-circle border-0" id="sidebarToggle"
						type="button"></button>
				</div>
			</div>
		</nav>
		<%--End Side Navbar--%>
		<a class="border rounded d-inline scroll-to-top" href="#page-top">
			<i class="fas fa-angle-up"></i>
		</a>
		<div class="d-flex flex-column" id="content-wrapper">
			<div id="content">
				<%-- navbar --%>
				<%@include file="navbar.jsp"%>
				<%-- end navbar --%>
				<div class="container-fluid px-container">
					<ol class="breadcrumb m mb-5">
						<li class="breadcrumb-item text-uppercase font-weight-bold">
							<a href="${pageContext.request.contextPath}/admin-products"> <span>product</span>
						</a>
						</li>
						<li class="breadcrumb-item active text-uppercase font-weight-bold">
							<span>add variant</span>
						</li>
					</ol>
<%--Form --%> <form id="form-add-variant" action="${pageContext.request.contextPath}/admin-add-variant" method="POST" enctype="multipart/form-data">
                        <div class="form-row d-flex justify-content-xl-center px-5">
                            <div class="col d-xl-flex justify-content-xl-center">
                                <div class="w-50">
                                    <div class="card mb-3">
                                        <div class="card-body">
                                            <h5 class="font-weight-bold text-dark mb-4">Variant information</h5>
                                            <div class="form-group align-items-center"><label class="font-weight-bold">Color</label><select class="form-control" name="color">
                                                    <optgroup label="Choose Color">
                                                        <option value="Blue" selected="">Blue</option>
                                                        <option value="Red">Red</option>
                                                        <option value="White">White</option>
                                                        <option value="Black">Black</option>
                                                    </optgroup>
                                                </select></div>
                                            <div class="form-group align-items-xl-center"><label class="font-weight-bold">Size</label><select class="form-control" name="size">
                                                    <optgroup label="Choose Size">
                                                        <option value="S" selected="">S</option>
                                                        <option value="M">M</option>
                                                        <option value="L">L</option>
                                                        <option value="XL">XL</option>
                                                    </optgroup>
                                                </select></div>
                                            <div class="form-group align-items-xl-center"><label class="font-weight-bold">Price</label><input class="form-control" type="number" min="0" step="0.1" placeholder="Price" name="price"></div>
                                            <div class="form-group align-items-xl-center"><label class="font-weight-bold">Quantity</label><input class="form-control" type="number" name="qty_in_stock" min="0" step="1" placeholder="Quantity"></div>
                                        </div>
                                    </div>
                                    <div class="card mb-3">
                                        <div class="card-body">
                                            <h5 class="font-weight-bold text-dark mb-4"><span style="color: rgb(84, 79, 90);">Image</span></h5>
                                            <div class="d-flex d-sm-flex justify-content-start align-items-center">
		                                            <div id="selectedBanner"></div>
																								<div class="bg-secondary d-flex d-xl-flex justify-content-center align-items-center justify-content-xl-center upload-img m-2 pointer">
																										<i class="fa fa-plus icon-add-image pointer"></i> 
			<%--itemImage--%>															<input id="itemImage" class="custom-file-input w-100 h-100" type="file" name="itemImage"/>
																								</div>
																						</div>
		                                            <div class="d-flex justify-content-end">
		                                            		<button class="btn btn-primary my-3" type="submit">Save</button>
		                                            </div>
                                        </div>
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
<script src="${pageContext.request.contextPath}/views/admin/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/assets/js/bs-init.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js" type="module"></script>
<script src="${pageContext.request.contextPath}/views/admin/assets/js/theme.js"></script>
<script>
	$(document).ready(function () {
		  var selDiv = $("#selectedBanner");
		  var storedFiles = [];
		  $("#itemImage").on("change", function (e) {
		    handleFileSelect(e, selDiv, storedFiles);
		  });
		});
	
		function handleFileSelect(e, selDiv, storedFiles) {
		  var files = e.target.files;
		  var filesArr = Array.prototype.slice.call(files);
		  filesArr.forEach(function (f) {
		    if (!f.type.match("image.*")) {
		      return;
		    }
		    storedFiles.push(f);

		    var reader = new FileReader();
		    reader.onload = function (e) {
		      var html =
		        '<img src="' +
		        e.target.result +
		        "\" data-file='" +
		        f.name +
		        "' class='avatar rounded lg' alt='Category Image' height='auto' width='200px'>";
		      selDiv.html(html);
		    };
		    reader.readAsDataURL(f);
		  });
		}
		  		    
  </script>
 </body>
</html>
