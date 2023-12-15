<%@page import="jakarta.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="bean.ShoppingCart"%>
<%@page import="utils.AppUtils"%>
<%@page import="bean.UserAccount"%>
<%@page import="java.util.Set"%>
<%@page import="DAO.ShoppingCartItemDAO"%>
<%@page import="bean.ShoppingCartItem"%>
<%@page import="DAO.ShoppingCartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="wrap-header-cart js-panel-cart">
	<div class="s-full js-hide-cart"></div>
	<div class="header-cart flex-col-l p-l-65 p-r-25">
		<div class="header-cart-title flex-w flex-sb-m p-b-8">
			<span class="mtext-103 cl2"> Your Cart </span>
			<div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
				<i class="zmdi zmdi-close"></i>
			</div>
		</div>
		<div class="header-cart-content flex-w js-pscroll">
			<ul class="header-cart-wrapitem w-full">

<!------------------------------------------ CARD ITEM ------------------------------------------------------>	
				
				
				<%
					ShoppingCartDAO cartDAO = new ShoppingCartDAO();
					ShoppingCartItemDAO cartItemDAO = new ShoppingCartItemDAO();
					String folderStore = request.getContextPath()+ "\\views\\images\\products\\";
					Set<ShoppingCartItem> itemList = null;
					ShoppingCart cartOfUserCurrent = null;
					
					try {
						UserAccount user = AppUtils.getLoginedUser(request.getSession());
					if(user != null) {
						cartOfUserCurrent = cartDAO.getShoppingCart(user.getUser_id());
					}
					if (cartOfUserCurrent != null) {
						itemList = cartDAO.listProductItemByUserID(user.getUser_id());
					}
					for (ShoppingCartItem item : itemList) {
						out.println("<li class='header-cart-item flex-w flex-t m-b-12'>");
						out.println("<div class='header-cart-item-img'>");
						out.println("<img src='" + folderStore + item.getProductItem().getProduct_image() +"' alt='IMG' />");
						out.println("</div>");
						out.println("<div class='header-cart-item-txt p-t-8'>");
						out.println("<a href='#' class='header-cart-item-name m-b-18 hov-cl1 trans-04'>");
						out.println(item.getProductItem().getProduct().getName());
						out.println("</a>");
						out.println("<span class='header-cart-item-info'>");
						out.println(item.getQty() + " x $" + item.getProductItem().getPrice());
						out.println("</span>");
						out.println("</div>");
						out.println("</li>");
					}
				} catch (Exception e) {
					e.getStackTrace();
				}
				
				
				%>

				<!-- ------------------------------------------------------------------------------------------- -->	

			</ul>
			<div class="w-full">
				<div class="header-cart-total w-full p-tb-40">
				<%
					try {
						if(itemList != null) {
							float total = 0;
							for (ShoppingCartItem item : itemList) {
								total += item.getProductItem().getPrice()*item.getQty();
							}
							out.println("Total: $" + total);
						}
						
						
					} catch (Exception e){
						e.getStackTrace();
					}
				%>	
				</div>
				<div class="header-cart-buttons flex-w w-full">
				
					<a href="shopping-cart" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
						View Cart 
					</a> 
						
					<a href="payment" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10">
						Check Out
					</a>
					
				</div>
			</div>
		</div>
	</div>
</div>


