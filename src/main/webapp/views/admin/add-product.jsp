<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
<title>Admin - Add Product</title>
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
					<ol class="breadcrumb m mx-5">
						<li class="breadcrumb-item text-uppercase font-weight-bold">
							<a href="${pageContext.request.contextPath}/admin-products"> <span>product</span>
						</a>
						</li>
						<li class="breadcrumb-item active text-uppercase font-weight-bold">
							<span>add product</span>
						</li>
					</ol>
					
					<%--form add product --%>
					<form id="form-add-product" enctype="multipart/form-data" action="${pageContext.request.contextPath}/admin-add-product/add" method="POST">
						<div
							class="d-flex justify-content-between flex-wrap align-items-xl-center my-3 mx-5">
							<div class="mt-4">
								<h4 class="font-weight-bolder text-dark"
									style="color: var(--gray-dark)">Add a new Product</h4>
								<p class="f" style="line-height: 20px">
									<span
										style="color: rgb(137, 134, 141); background-color: rgb(244, 245, 250)">Orders
										placed across your store</span><br />
								</p>
								<c:if test="${errorString != null }">
									<p style="color: var(--red)" >${errorString}</p>
								</c:if>
							</div>
					
							<div class="d-flex flex-row justify-content-end justify-content-xl-end w-50">
								<a class="btn btn-danger text-uppercase font-weight-bold mr-3 my-2" 
									role="button"
									style="border-style: solid; border-color: var(--gray);"
									href="${pageContext.request.contextPath}/admin-products">discard</a>
								<button class="btn btn-success text-uppercase font-weight-bold my-2" type="submit">add</button>
							</div>
							
						</div>
						<div class="form-row px-5">
							<div class="col">
								<div class="card mb-3">
								
									<div class="card-body">
										<h5 class="font-weight-bold text-dark mb-4">Product information</h5>
										<div class="form-group">
											<label class="mt-3"><strong>Name</strong></label>
<%-- name --%>				<input class="form-control" type="text" name="name" placeholder="Name" value="<c:if test="${name != null}">${name}</c:if>" />
										</div>
										
										<div class="form-group">
											<label class="mt-3"><strong>Description</strong></label>
<%--description--%>		<input class="form-control" type="text" placeholder="Product Descripition" name="description"  value="<c:if test="${description != null}">${description}</c:if>">
										</div>
										
										<div class="form-group">
											<label class="mt-3"><strong>Category</strong></label>
<%-- Category --%>		<select class="form-control" name="categoryName">
												<optgroup label="Category">
													<c:forEach items="${categoryList}" var="category">
														<option value="${category.getCategoryName()}">${category.getCategoryName()}</option>
													</c:forEach>
												</optgroup>
											</select>
										</div>
									</div>
								</div>
								<div class="card mb-3">
										<div class="card-body">
											<h5 class="font-weight-bold text-dark mb-4">
												<span style="color: rgb(84, 79, 90)">Image For Product</span>
											</h5>
											<div class="d-flex d-sm-flex justify-content-start align-items-center">
												<div id="selectedBanner"></div>
												<div class="bg-secondary d-flex d-xl-flex justify-content-center align-items-center justify-content-xl-center upload-img m-2 pointer">
													<i class="fa fa-plus icon-add-image pointer"></i> 
<%--productImage--%>			<input id="productImage" class="custom-file-input w-100 h-100" type="file" name="productImage"/>
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
					<div class="text-center my-auto copyright">
						<span>Copyright © DuckStore 2023</span>
					</div>
				</div>
			</footer>
		</div>
	</div>
	
	    <!--thẻ div ẩn để chứa thông báo -->
		<div id="message" style="display: none;">
		    <% 
		    // Lấy thông báo từ session attribute
		    String message = (String) session.getAttribute("message");
		    // Kiểm tra nếu có thông báo thành công
		    if (message != null && !message.trim().isEmpty()) {
		        out.println(message);
		        // Xóa thông báo thành công khỏi session attribute sau khi đã lấy thông tin
		        session.removeAttribute("message");
		    }
		    %>
		</div>
		
		<!-- Đoạn mã JavaScript để hiển thị thông báo khi trang tải xong -->
		<script type="text/javascript">
		    // Đợi cho trang tải xong
		    window.onload = function() {
		        var messageDiv = document.getElementById('message');
		        var message = messageDiv.textContent.trim();
		        if (message !== '') {
		            alert(message);
		        }
		    }
		</script>    

	<script src="${pageContext.request.contextPath}/views/admin/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/views/admin/assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/views/admin/assets/js/bs-init.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js" type="module"></script>
	<script src="${pageContext.request.contextPath}/views/admin/assets/js/theme.js"></script>
	<script>
	$(document).ready(function () {
		  var selDiv = $("#selectedBanner");
		  var storedFiles = [];
		  $("#productImage").on("change", function (e) {
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
