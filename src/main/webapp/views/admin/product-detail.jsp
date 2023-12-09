<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
    <title>Admin - Product Detail</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/views/admin/assets/img/icon/favicon.ico" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/assets/fonts/fontawesome-all.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/assets/fonts/font-awesome.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/assets/fonts/fontawesome5-overrides.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/assets/css/admin.css" />
  </head>

  <body id="page-top">
    <div id="wrapper">
    <%--side navbar--%>
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
              <a class="nav-link" href="${pageContext.request.contextPath}/admin-dashboard">
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
      <a class="border rounded d-inline scroll-to-top" href="#page-top">
        <i class="fas fa-angle-up"></i>
      </a>
      <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
	        <%-- navbar --%>
					<%@include file="navbar.jsp"%>
					<%-- end navbar --%>
          <div class="container-fluid px-container">
            <ol class="breadcrumb mx-5">
              <li class="breadcrumb-item text-uppercase font-weight-bold">
                <a href="${pageContext.request.contextPath}/admin-products"><span>product</span></a>
              </li>
              <li class="breadcrumb-item text-uppercase font-weight-bold">
                <a href="${pageContext.request.contextPath}/admin-products"><span>Product list</span></a>
              </li>
              <li class="breadcrumb-item active text-uppercase font-weight-bold">
                <span>Product detail</span>
              </li>
            </ol>
            <div class="card mx-5 mb-3">
              <div class="card-body">
              	<div class="d-flex justify-content-between">
              			<h5 class="font-weight-bold text-dark mb-4">Information of each variant</h5>
              			<a class="btn btn-info text-center mb-4" href="admin-add-variant?productId=${product.getProductID()}">ADD</a>
              	</div>
                
                <c:if test="${listItems != null }">
	                <div class="table-responsive">
	                  <table class="table">
	                    <thead>
	                      <tr>
	                      	<th class="text-uppercase">Id</th>
	                        <th class="text-uppercase">Size</th>
	                        <th class="text-uppercase">Color</th>
	                        <th class="text-uppercase">SKU</th>
	                        <th class="text-uppercase">Price</th>
	                        <th class="text-uppercase">Quantity</th>
	                        <th class="text-uppercase">Image</th>
	                        <th class="text-uppercase d-xl-flex justify-content-xl-center">Action</th>
	                      </tr>
	                    </thead>
	                    <tbody>
	                    	<c:forEach items="${listItems}" var="item" varStatus="i">
			                     <tr>
						                   <th>${i.index + 1 }</th>
						                   <td>${variationList.get(item.getProductItemID()).get("size") }</td>
						                   <td>${variationList.get(item.getProductItemID()).get("color") }</td>
						                   <td>${item.getSku() }</td>
						                   <td>${item.getPrice() }</td>
						                   <td>${item.getQty_in_stock() }</td>
						                   <th>
						                      <c:choose>
																			<c:when test="${item.getProduct_image() != null}">
																				   <img class="mr-2 avatar rounded" width="auto" height="80" src="${pageContext.request.contextPath}/views/images/productItem/${item.getProduct_image()}"/> 
																			</c:when>
																			<c:otherwise>
																				   <img class="mr-2" width="auto" height="80" src="${pageContext.request.contextPath}/views/images/default_image.jpg"/>
																			</c:otherwise>
																	</c:choose>
																</th>
						                    <td>
						                    		<div class="d-flex justify-content-center">                           
					                              <a class="btn btn-success mx-2" role="button " href="${pageContext.request.contextPath}/admin-product-detail/variant-detail?itemId=${item.getProductItemID()}">Detail</a>
					                              <a class="btn btn-danger mx-2" role="button " onclick="deleteConfirm(${item.getProductItemID()});">Delete</a>
					                          </div>
						                    </td>
				                    </tr>
			                    </c:forEach>
	                    </tbody>
	                  </table>
	                </div>
                </c:if>
              </div>
            </div>
            <%--form edit product --%>
					<form id="form-add-product" enctype="multipart/form-data" action="${pageContext.request.contextPath}/admin-add-product/add" method="POST">
						<c:if test="${product.getName() != null}">
           			<input type="hidden" name="productId" value="<c:out value='${product.getProductID()}' />" />
          	</c:if> 
						<div class="d-flex justify-content-between flex-wrap align-items-xl-center my-3 mx-5">
							<div class="mt-4">
								<h4 class="font-weight-bolder text-dark" style="color: var(--gray-dark)">Edit Product</h4>
							</div>
							<div
								class="d-flex flex-row justify-content-end justify-content-xl-end w-50">
								<a
									class="btn btn-danger text-uppercase font-weight-bold mr-3 my-2"
									role="button"
									style="border-style: solid; border-color: var(--gray)"
									href="${pageContext.request.contextPath}/admin-products">discard </a>
								<button
									class="btn btn-success text-uppercase font-weight-bold my-2"
									type="submit">save&nbsp;</button>
							</div>
						</div>
						<div class="form-row d-flex justify-content-xl-center px-5">
							<div class="col">
								<div class="card mb-3">
								
									<div class="card-body">
										<h5 class="font-weight-bold text-dark mb-4">Product information</h5>
										<div class="form-group">
											<label class="mt-3"><strong>Name</strong></label>
											<c:if test="${product.getName() != null}">
           							<input type="hidden" name="oldName" value="<c:out value='${product.getName()}' />" />
          						</c:if> 
<%-- name --%>				<input class="form-control" type="text" name="newName" placeholder="Name" 
														value="<c:if test="${product.getName() != null}">${product.getName()}</c:if>" />
										</div>
										
										<div class="form-group">
											<label class="mt-3"><strong>Description</strong></label>
											<c:if test="${product.getDescription() != null}">
           							<input type="hidden" name="oldDescription" value="<c:out value='${product.getDescription()}' />" />
          						</c:if> 
<%--description--%>		<input class="form-control" type="text" placeholder="Product Descripition" name="newDescription"  
														value="<c:if test="${product.getDescription() != null}">${product.getDescription()}</c:if>">
										</div>
										
										<div class="form-group">
											<label class="mt-3"><strong>Category</strong></label>
											<div class="d-flex justify-content-between mb-3">
													<input disabled="" class="form-control" type="text" placeholder="Category" name="oldCategory"  
																value="<c:if test="${product.getProductCategory() != null}">${product.getProductCategory().getCategoryName()}</c:if>">
													<button class="btn btn-secondary ml-3" type="button" data-target="#change-category" data-toggle="collapse" aria-expanded="false" aria-controls="change-category">Change</button>
											</div>
											<div id="change-category" class="collapse">
<%-- Category --%>				<select class="form-control" name="newCategory">
														<optgroup label="Category">
															<c:forEach items="${categoryList}" var="category">
																<option value="${category.getCategoryName()}">${category.getCategoryName()}</option>
															</c:forEach>
														</optgroup>
													</select>
											</div>
										</div>
									</div>
								</div>
								<div class="card mb-3">
										<div class="card-body">
											<h5 class="font-weight-bold text-dark mb-4">
												<span style="color: rgb(84, 79, 90)">Image For Product</span>
											</h5>
											<div class="d-flex d-sm-flex justify-content-start align-items-center">
												<c:if test="${product.getProduct_image() != null}">
           										<input type="hidden" name="olPproductImage" value="<c:out value='${product.getProduct_image()}' />" />
          							</c:if> 
												<div id="selectedBanner">
														<c:if test="${product.getProduct_image() != null}">
															<img class="mr-2 avatar rounded" width="200px" height="auto" src="${pageContext.request.contextPath}/views/images/product/${product.getProduct_image()}"/>
														</c:if>
												</div>
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
		<div id="successMessage" style="display: none;">
		    <% 
		    // Lấy thông báo từ session attribute
		    String successMessage = (String) session.getAttribute("successMessage");
		    // Kiểm tra nếu có thông báo thành công
		    if (successMessage != null && !successMessage.trim().isEmpty()) {
		        out.println(successMessage);
		        // Xóa thông báo thành công khỏi session attribute sau khi đã lấy thông tin
		        session.removeAttribute("successMessage");
		    }
		    %>
		</div>
		
		<!-- Đoạn mã JavaScript để hiển thị thông báo khi trang tải xong -->
		<script type="text/javascript">
		    // Đợi cho trang tải xong
		    window.onload = function() {
		        var successMessageDiv = document.getElementById('successMessage');
		        var successMessage = successMessageDiv.textContent.trim();
		        if (successMessage !== '') {
		            alert(successMessage);
		        }
		    }
		</script>    
		
		<script type="text/javascript">
				function deleteConfirm(id){
					var result = confirm("Are you sure you want to delete this product?");
					if(result){
						window.location.href = "deleteProduct?itemId="+id;
					} 
					else {
						return false;
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
