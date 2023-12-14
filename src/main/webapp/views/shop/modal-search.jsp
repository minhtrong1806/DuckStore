<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
	<div class="container-search-header">
		<button
			class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
			<img
				src="${pageContext.request.contextPath}/views/images/icons/icon-close2.png"
				alt="CLOSE" />
		</button>

		<form class="wrap-search-header flex-w p-l-15" action="shop"
			method="POST">
			<button class="flex-c-m trans-04">
				<i class="zmdi zmdi-search"></i>
			</button>
			<input class="plh3" type="text" name="search" placeholder="Search..." />
		</form>
	</div>
</div>