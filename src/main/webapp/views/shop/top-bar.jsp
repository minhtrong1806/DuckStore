<%@	page import="utils.AppUtils"%>
<%@	page import="bean.UserAccount"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="top-bar">
	<div class="content-topbar flex-sb-m h-full container">
		<div class="left-top-bar">
				Free shipping for standard order over $100
		</div>
		<div class="right-top-bar flex-w h-full">
			 
				<%
				UserAccount userCurrent = AppUtils.getLoginedUser(session); 
				if(userCurrent != null){
					out.println("<a href='info' class='flex-c-m trans-04 p-lr-25'>");
					out.println(userCurrent.getName());
					out.println("</a>");
					out.println("<a href='admin-products' class='flex-c-m trans-04 p-lr-25'>");
					out.println("Admin Dashboard");
					out.println("</a>");
				}
				%>
			 
			<a href="login" class="flex-c-m trans-04 p-lr-25"> Login </a> 
			<a href="logout" class="flex-c-m trans-04 p-lr-25"> Logout </a>
		</div>
	</div>
</div>