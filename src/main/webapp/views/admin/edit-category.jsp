<%@page import="bean.ProductCategory"%>
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
            <li class="nav-item text-white-50" style="margin-top: 70%;">
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

				<div class="container-fluid px-container">
					<ol class="breadcrumb m mx-5">
						<li class="breadcrumb-item text-uppercase font-weight-bold">
							<a href="${pageContext.request.contextPath}/admin-products"><span>product</span></a></li>
						<li class="breadcrumb-item text-uppercase font-weight-bold">
							<a href="${pageContext.request.contextPath}/admin-category"><span>category list</span></a></li>
						<li class="breadcrumb-item active text-uppercase font-weight-bold">
							<span>edit</span></li>
					</ol>
					
					<form id="form-add-user" action="edit" method="POST">
						<div
							class="d-flex justify-content-between flex-wrap align-items-xl-center my-3 mx-5">
							<div class="mt-4">
								<h4 class="font-weight-bolder text-dark"
									style="color: var(--gray-dark);">Edit category</h4>
							</div>
							<div
								class="d-flex flex-row justify-content-end justify-content-xl-end w-50">
								<a
									class="btn btn-danger text-uppercase font-weight-bold mr-3 my-2"
									role="button"
									style="border-style: solid; border-color: var(--gray);"
									href="${pageContext.request.contextPath}/admin-category">discard</a>
								<button
									class="btn btn-success text-uppercase font-weight-bold my-2"
									type="submit">Save</button>
							</div>
						</div>
						<div class="form-row d-flex justify-content-xl-center px-5">
							<div class="col">
								<div class="card shadow">
									<div class="card-body">
										<div class="form-group">
											<label for="address">
												<strong>Category name</strong>
											</label>
											<c:if test="${CategoryName != null}">
           							<input type="hidden" name="OldCategoryName" value="<c:out value='${CategoryName}' />" />
          						</c:if>  
											<input 
														class="form-control" 
														type="text" 
														placeholder="Category Name" 
														name="NewCategoryName" 
														value="${CategoryName}">
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
      <a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
    </div>



	<script src="${pageContext.request.contextPath}/views/admin/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/views/admin/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/views/admin/assets/js/bs-init.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js" type="module"></script>
    <script src="${pageContext.request.contextPath}/views/admin/assets/js/theme.js"></script>    
  </body>
</html>
