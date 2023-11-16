<nav
		class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
		<div class="container-fluid">
				<button
						class="btn btn-link d-md-none rounded-circle mr-3"
						id="sidebarToggleTop"
						type="button">
						<i class="fas fa-bars"></i>
				</button>
				<form
						class="form-inline d-none d-sm-inline-block mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
						<div class="input-group">
								<input
										class="bg-light form-control border-0 small"
										type="text"
										placeholder="Search for ..." />
								<div class="input-group-append">
										<button
												class="btn btn-primary py-0"
												type="button">
												<i class="fas fa-search"></i>
										</button>
								</div>
						</div>
				</form>
				<ul class="navbar-nav flex-nowrap ml-auto">
						<li class="nav-item dropdown d-sm-none no-arrow"><a
								class="dropdown-toggle nav-link"
								aria-expanded="false"
								data-toggle="dropdown"
								href="#"> <i class="fas fa-search"></i>
						</a>
								<div
										class="dropdown-menu dropdown-menu-right p-3 animated--grow-in"
										aria-labelledby="searchDropdown">
										<form class="form-inline mr-auto navbar-search w-100">
												<div class="input-group">
														<input
																class="bg-light form-control border-0 small"
																type="text"
																placeholder="Search for ..." />
														<div class="input-group-append">
																<button
																		class="btn btn-primary py-0"
																		type="button">
																		<i class="fas fa-search"></i>
																</button>
														</div>
												</div>
										</form>
								</div></li>
						<li class="nav-item dropdown no-arrow mx-1"></li>
						<li class="nav-item dropdown no-arrow">
								<div class="nav-item dropdown no-arrow">
										<a
												class="dropdown-toggle nav-link"
												aria-expanded="false"
												data-toggle="dropdown"
												href="#"> <span
												class="d-none d-lg-inline mr-2 text-gray-600 small">Minh
														Trong</span> <img
												class="border rounded-circle img-profile"
												src="${pageContext.request.contextPath}/views/admin/assets/img/avatars/anh.jpg?h=d233e08feddcdd2a8275c132af92e075" />
										</a>
										<div
												class="dropdown-menu shadow dropdown-menu-right animated--grow-in">
												<a
														class="dropdown-item"
														href="${pageContext.request.contextPath}/home"> <i
														class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Home
												</a>
												<div class="dropdown-divider"></div>
												<a
														class="dropdown-item"
														href="logout"> <i
														class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Logout
												</a>
										</div>
								</div>
						</li>
				</ul>
		</div>
</nav>