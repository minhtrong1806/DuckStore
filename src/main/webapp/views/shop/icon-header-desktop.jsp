<%@page import="bean.ShoppingCart"%>
<%@page import="bean.ShoppingCartItem"%>
<%@page import="java.util.Set"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@page import="DAO.ShoppingCartItemDAO"%>
<%@page import="DAO.ShoppingCartDAO"%>
<%@page import="utils.AppUtils"%>
<%@page import="bean.UserAccount"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="wrap-icon-header flex-w flex-r-m">
	<div
		class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
		<i class="zmdi zmdi-search"></i>
	</div>
	
	<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart"
	<%
			ShoppingCartDAO shoppingCartDAO = new ShoppingCartDAO();
			Set<ShoppingCartItem> cartItemList = null;
			ShoppingCart cartOfUser = null;
			
			try {
				UserAccount user = AppUtils.getLoginedUser(request.getSession());
			if(user != null) {
				cartOfUser = shoppingCartDAO.getShoppingCart(user.getUser_id());
			}
			else {
				out.println("data-notify='" + 0 + "'");
			}
			if (cartOfUser != null) {
				cartItemList = shoppingCartDAO.listProductItemByUserID(user.getUser_id());
				out.println("data-notify='" + cartItemList.size() + "'");
				}
			else {
				out.println("data-notify='" + 0 + "'");
			}
			}
			catch(Exception e){out.println("data-notify='" + 0 + "'");}
	%>>
		<i class="zmdi zmdi-shopping-cart"></i>
	</div>
	<a href="info"
		class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11"> 
		<i class="zmdi zmdi-account-circle"></i>
	</a>
</div>