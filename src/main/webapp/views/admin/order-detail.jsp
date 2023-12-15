<%@page import="bean.Address"%>
<%@page import="java.util.Set"%>
<%@page import="bean.OrderLine"%>
<%@page import="bean.ShopOrder"%>
<%@page import="DAO.ShopOrderDAO"%>
<%@page import="java.util.List"%>
<%@page import="bean.OrderStatus"%>
<%@page import="DAO.OrderStatusDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
    <title>Admin - Order Detai</title>
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
              <a class="nav-link active" href="${pageContext.request.contextPath}/admin-orders">
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
          </ul>
          <div class="text-center d-none d-md-inline">
            <button class="btn rounded-circle border-0" id="sidebarToggle" type="button"></button>
          </div>
        </div>
      </nav>
      <a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
      <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
	        <%-- navbar --%>
					<%@include file="navbar.jsp"%>
					<%-- end navbar --%>
          <div class="container-fluid">
            <ol class="breadcrumb m mx-5">
              <li class="breadcrumb-item text-uppercase font-weight-bold">
                <a href="${pageContext.request.contextPath}/admin-orders"><span>orders</span></a>
              </li>
              <li class="breadcrumb-item active text-uppercase font-weight-bold">
                <span>order detail</span>
              </li>
            </ol>
            <div class="d-flex justify-content-between flex-wrap align-items-xl-center my-3 mx-5">
              <div class="mt-4">
                <h4 class="font-weight-bolder text-dark" style="color: var(--gray-dark)">Order #123</h4>
                <p class="f" style="line-height: 20px">
                  <span style="color: rgb(137, 134, 141); background-color: rgb(244, 245, 250)">22/12/2023</span><br />
                </p>
              </div>
            </div>
            <div class="row d-flex justify-content-xl-center px-5">
              <div class="col">
                <div class="card mb-3">
                  <div class="card-body">
                    <h5 class="font-weight-bold text-dark mb-4">Order detail</h5>
                    <div class="table-responsive">
                      <table class="table">
                        <thead>
                          <tr>
                            <th class="text-uppercase">Products</th>
                            <th class="text-uppercase">Price</th>
                            <th class="text-uppercase">QTY</th>
                            <th class="text-uppercase">Total</th>
                          </tr>
                        </thead>
                        <tbody>
                        <%
                        ShopOrder order = null;
                        Address address = null;
                        UserAccount user = null;
                        float total = 0;
                        try{
                        	order = (ShopOrder) request.getAttribute("shopOrder");
                        	address = order.getAddress();
                        	user = order.getUserAccount();
                        	Set<OrderLine> orderLines = order.getOrderLines();
                        	for(OrderLine orderLine:orderLines){
                        		total += orderLine.getPrice() * orderLine.getSerialversionuid();
                        %>
                          <tr>
                            <td><%= orderLine.getProductItem().getProduct().getName() %></td>
                            <td>$<%= orderLine.getPrice() %></td>
                            <td><%= orderLine.getQty() %></td>
                            <td>$<%= orderLine.getPrice() * orderLine.getSerialversionuid() %></td>
                          </tr>
                         <%}
                        	} catch(Exception e){} 
                        	%>
                        </tbody>
                      </table>
                    </div>
                    <div class="row">
                      <div class="col d-flex flex-column align-items-end">
                        <div class="d-flex justify-content-between">
                          <span class="mr-5">Total:</span><span>$<%=total %></span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="card mb-3">
                <form action="admin-order-update?orderId=<%=order.getShopOrderID() %>" method="POST">
                  <div class="card-body">
                  	<div class="d-flex justify-content-between mb-5">
                  		<h5 class="font-weight-bold text-dark mb-4">Order Status</h5>
			                <button type="submit" class="btn btn-success">Update</button>
			              </div>
                    
                    <div class="form-group">
											<div class="d-flex justify-content-between mb-3">
													<input readonly class="form-control" type="text" placeholder="Status"  
																value="<%= order.getOrderStatus().getStatus() %>"> 
													<button class="btn btn-secondary ml-3" type="button" data-target="#change-category" data-toggle="collapse" aria-expanded="false" aria-controls="change-category">Status</button>
											</div>
											<div id="change-category" class="collapse">
													<select class="form-control" name="newStatus">
														<optgroup label="Status">
																<option value="" disabled selected hidden>Choose Status</option>
																<%
																OrderStatusDAO orderStatusDAO = new OrderStatusDAO();
																List<OrderStatus> listStatus = orderStatusDAO.getOrderStatusList();
																for(OrderStatus status: listStatus){
																%>
																<option value="<%= status.getOrderStatusID() %>"><%= status.getStatus() %></option>
																<%} %>
														</optgroup>
													</select>
											</div>
										</div>
                  </div>
                </form>
                </div>
              </div>
              <div class="col-xl-5">
                <div class="card mb-3">
                  <div class="card-body">
                    <h5 class="font-weight-bold text-dark mb-4">Customer detail</h5>
										<p>Name: <%= user.getName() %></p>
                    <p>Email: <%= user.getEmailAddress() %></p>
                    <p>Mobile: <%= user.getPhone_number() %></p>
                  </div>
                </div>
                <div class="card">
                  <div class="card-body">
                    <h5 class="font-weight-bold text-dark mb-3">
                      <span style="color: rgb(84, 79, 90)">Shipping address</span>
                      <br />
	                  </h5>
											<div class="card">
												<div class="card-body">
													<p class="card-text"><%= address.toString() %></p>
												</div>
											</div>
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
    </div>
    <script src="${pageContext.request.contextPath}/views/admin/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/views/admin/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/views/admin/assets/js/bs-init.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js" type="module"></script>
    <script src="${pageContext.request.contextPath}/views/admin/assets/js/theme.js"></script>
  </body>
</html>
