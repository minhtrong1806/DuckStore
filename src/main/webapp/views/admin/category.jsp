<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
    <title>Admin - Category List</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/views/admin/assets/img/icon/favicon.ico" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/assets/fonts/fontawesome-all.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/assets/fonts/font-awesome.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/assets/fonts/fontawesome5-overrides.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/assets/css/admin.css" />
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
              <a class="nav-link " href="${pageContext.request.contextPath}/admin-dashboard">
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
      <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
					<%-- navbar --%>
					<%@include file="navbar.jsp"%>
					<%-- end navbar --%>
          <div class="container-fluid">
            <ol class="breadcrumb">
              <li class="breadcrumb-item text-uppercase font-weight-bold">
                <a href="${pageContext.request.contextPath}/admin-products">
                  <span>product</span>
                </a>
              </li>
              <li class="breadcrumb-item active text-uppercase font-weight-bold">
                <span>Category List</span>
              </li>
            </ol>
            <div class="card shadow">
              <div class="card-body" style="padding-top: 0px">
                <div class="row m-3 d-xl-flex justify-content-xl-end ">
                  <div class="my-2">
                    <a href="${pageContext.request.contextPath}/admin-category/showAdd" class="btn btn-info btn-sm">ADD</a>
                  </div>
                </div>
                <div class="table-responsive table mt-2" id="dataTable-1" role="grid" aria-describedby="dataTable_info">
                  <table class="table my-0" id="dataTable">
                    <thead>
                      <tr>
                      	<th class="text-uppercase"></th>
                        <th class="text-uppercase">category</th>
                        <th class="text-uppercase">total products</th>
                        <th class="text-uppercase">total earning</th>
                        <th class="text-uppercase text-center d-xl-flex justify-content-xl-center">actions</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${categoryList}" var="category" varStatus="i">
                      <tr>
                      	<td>${i.index + 1 }</td>
                        <td>${category.getCategoryName() }</td>
                        <td>
                       	${qty.get(category.getProductCategoryID()) }												
												</td>
                        <td>10</td>
                        <td>
                          <div class="border rounded-0 border-white d-flex justify-content-center text-center">  
                            <a class="btn" href="${pageContext.request.contextPath}/admin-category/showEdit?CategoryName=${category.getCategoryName() }">
                            	<i class="fa fa-edit icon-size"></i>
                          	</a>
                          </div>
                        </td>
                      </tr>
                     </c:forEach>
                    </tbody>
                  </table>
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
    
    <!-- thẻ div ẩn để chứa thông báo -->
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
   
		<script src="${pageContext.request.contextPath}/views/admin/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/views/admin/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/views/admin/assets/js/bs-init.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js" type="module"></script>
    <script src="${pageContext.request.contextPath}/views/admin/assets/js/theme.js"></script>   
    

  </body>
</html>
