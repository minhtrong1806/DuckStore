<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
            <li class="nav-item text-white-50" style="margin-top: 70%;">
              <div class="nav-item dropdown" style="margin-bottom: 0px">
                <a aria-expanded="false" data-toggle="dropdown" class="nav-link" href="#">
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
              <a class="nav-link active" href="${pageContext.request.contextPath}/admin-users">
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
                <a href="${pageContext.request.contextPath}/admin-users"><span>users</span></a>
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
									<form action="${pageContext.request.contextPath}/admin-user/edit?userId=${user.getUser_id()}" method="POST">
									<div class="card-body">
										<div class="form-row">
											<div class="col">
												<div class="form-group">
													<label for="username"><strong>User Name</strong></label>
													<input class="form-control" type="text" placeholder="User Name" 
																name="newUsername" value="<c:if test="${user.getName() != null}">${user.getName()}</c:if>">
												</div>
											</div>
											<div class="col">
												<div class="form-group">
													<label for="email"><strong>Email Address</strong></label>
													<input class="form-control" type="email" placeholder="Email Address"
													 name="newEmail" value="<c:if test="${user.getEmailAddress() != null}">${user.getEmailAddress()}</c:if>">
												</div>
											</div>
										</div>
										<div class="form-row">
											<div class="col">
												<div class="form-group">
													<label for="first_name"><strong>Phone Number</strong></label>
													<input class="form-control" type="text" placeholder="Phone Number" minlength="10"
													 name="newPhoneNumber" value="<c:if test="${user.getPhone_number() != null}">${user.getPhone_number()}</c:if>">
												</div>
											</div>
											<div class="col">
												<div class="form-group">
													<label><strong>Role</strong></label>
													<div class="d-flex justify-content-between mb-3">
															<input disabled="" class="form-control" type="text" placeholder="Role" value="<c:if test="${role != null}">${role}</c:if>">
															<button class="btn btn-secondary ml-3" type="button" data-target="#change-role" data-toggle="collapse" aria-expanded="false" aria-controls="change-role">Change</button>
													</div>
													<div id="change-role" class="collapse">
		<%-- Role --%>				<select class="form-control" name="newRole">
																<optgroup label="Role">
																		<option value="" disabled selected hidden></option>
																		<option value="2">Customer</option>
																		<option value="1">Staff</option>
																		<option value="0">Manager</option>
																</optgroup>
													</select>
													</div>
												</div>
											</div>
										</div>
										<div class="form-row d-flex flex-column">
													<c:if test="${userNameMessage != null }">
															<small style="color: var(--red)" >${userNameMessage}</small>
													</c:if>
													<c:if test="${emailMessage != null }">
															<small style="color: var(--red)" >${emailMessage}</small>
													</c:if>
										</div>
										<button class="btn btn-primary" type="submit">Save</button>
									</div>
									</form>
								</div>

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
                   	<div class="form-row d-flex flex-column">
													<c:if test="${passwordMessage != null }">
															<small style="color: var(--red)" >${passwordMessage}</small>
													</c:if>
										</div>
                  </div>
                  <div class="card-body collapse" id="reset_password">
                    <form action="${pageContext.request.contextPath}/admin-user/reset-password?userId=${user.getUser_id()}" method="POST">
                    	<input class="form-control" type="hidden" 
												name="oldEmail" value="<c:if test="${user.getEmailAddress() != null}">${user.getEmailAddress()}</c:if>">
                      <div class="form-row">
                        <div class="col">
                          <div class="form-group">                          
                            <label for=""><strong>New Password</strong></label>
                            <div class="d-flex justify-content-between">
                            		<input id="NewPassword" name="newPassword" class="form-control" type="password" placeholder="New Password"/>
                            		<button class="btn btn-dark " type="button" onclick="togglePassword('NewPassword')">Show</button>
                            </div>
                          </div>
                        </div>
                        <div class="col">
                          <div class="form-group">
                            <label for=""><strong>Repeat Password</strong></label>
                            <div class="d-flex justify-content-between">
                            		<input id="RepeatPassword" name="repeatPassword" class="form-control" type="password" placeholder="Repeat Password" />
                            		<button class="btn btn-dark " type="button" onclick="togglePassword('RepeatPassword')">Show</button>
                            </div>
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
    
		<script>
		function togglePassword(fieldId) {
		    var field = document.getElementById(fieldId);
		    field.type = (field.type === "password") ? "text" : "password";
		}
		</script>
    <script src="${pageContext.request.contextPath}/views/admin/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/views/admin/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/views/admin/assets/js/bs-init.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js" type="module"></script>
    <script src="${pageContext.request.contextPath}/views/admin/assets/js/theme.js"></script>
  </body>
</html>
