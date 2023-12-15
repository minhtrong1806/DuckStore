<%@ page
		language="java"
		contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta
		name="author"
		content="Kodinger" />
<meta
		name="viewport"
		content="width=device-width,initial-scale=1" />
<title>Login</title>
<link
		rel="icon"
		type="image/x-icon"
		href="${pageContext.request.contextPath}/views/images/icons/favicon.ico" />
<link
		rel="stylesheet"
		type="text/css"
		href="${pageContext.request.contextPath}/views/vendor/bootstrap/css/bootstrap.min.css" />
<link
		rel="stylesheet"
		type="text/css"
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
														alt="logo" />
										</div>
										<div class="card fat">
												<div class="card-body">
														<h4 class="card-title">Login</h4>
														<%-- Form Login --%>
														<form
																method="POST"
																action="${pageContext.request.contextPath}/login"
																class="my-login-validation"
																>
																<input type="hidden" name="redirectId" value="${param.redirectId}" />
																<div class="form-group">
																		<label for="email">E-Mail Address</label> <input
																				id="email"
																				type="email"
																				class="form-control"
																				name="emailAddress"
																				value= "${user.emailAddress}"
																				required
																				autofocus />
																		<div class="invalid-feedback">Email is invalid</div>
																</div>
																<div class="form-group">
																		<label for="password">Password <a
																				href="forgot"
																				class="float-right"> Forgot Password? </a>
																		</label> <input
																				id="password"
																				type="password"
																				class="form-control"
																				name="password"
																				value= "${user.password}"
																				required
																				data-eye />
																		<div class="invalid-feedback">Password is
																				required</div>
																</div>
																<div class="form-group m-0">
																		<button
																				type="submit"
																				class="btn btn-primary btn-block">Login</button>
																</div>
																<div class="mt-4 text-center">
																		Don't have an account? <a href="register">Create
																				One</a>
																</div>
														</form>
														<p style="color: red;">${errorString}</p>
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
				src="${pageContext.request.contextPath}/views/vendor/bootstrap/js/popper.js"></script>
		<script
				src="${pageContext.request.contextPath}/views/vendor/bootstrap/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/views/js/login.js"></script>
</body>
</html>
