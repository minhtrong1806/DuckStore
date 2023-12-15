<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1" />

<title>Register</title>
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/views/images/icons/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/views/vendor/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/views/css/login.css" />
</head>
<body class="my-login-page">
	<section class="h-100">
		<div class="container h-100">
			<div class="row justify-content-md-center h-100">
				<div class="card-wrapper">
					<div class="brand">
						<img
							src="${pageContext.request.contextPath}/views/images/icons/logo-01.png"
							alt="logo DuckStore" />
					</div>
					<div class="card fat">
						<div class="card-body">
							<h4 class="card-title">Register</h4>
							
							<%--Form register--%>
							<form method="POST" action="${pageContext.request.contextPath}/register" class="my-login-validation">
								
								<div class="form-group">
									<label for="name">Name</label> 
									<input id="name" type="text" class="form-control" name="name" value="${name}" required autofocus />
									<div class="invalid-feedback">What's your name?</div>
								</div>
								
								<div class="form-group">
									<label for="email_address">E-Mail Address</label> 
									<input id="email_address" type="email" class="form-control" name="email_address" value="${email_address}" required />
									<div class="invalid-feedback">Your email is invalid</div>
								</div>
								
								<div class="form-group">
									<label for="phone_number">Phone Number</label> 
									<input id="phone_number" type="text" class="form-control" name="phone_number" value="${phone_number}" required />
									<div class="invalid-feedback">What's your phone number?</div>
								</div>
								
								<div class="form-group">
									<label for="password">Password</label> 
									<input id="password" type="password" class="form-control" name="password" required data-eye/>
									<div class="invalid-feedback">Password is required</div>
								</div>
								
								<div class="form-group">
									<label for="password">Repeat Password</label> 
									<input id="repeat_password" type="password" class="form-control" name="repeat_password" required data-eye />
									<div class="invalid-feedback">Password is required</div>
								</div>
								
								<p class="cl2">${errorString}</p>
								<div class="form-group m-0">
									<button type="submit" class="btn btn-primary btn-block">Register</button>
								</div>
								<div class="mt-4 text-center">
									Already have an account? <a href="login">Login</a>
								</div>
							</form>
						</div>
					</div>
					<div class="footer">Copyright &copy; 2023 &mdash; DuckStore</div>
				</div>
			</div>
		</div>
	</section>
	<script
		src="${pageContext.request.contextPath}/views/vendor/jquery/jquery-3.2.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/views/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/views/js/login.js"></script>
</body>
</html>
