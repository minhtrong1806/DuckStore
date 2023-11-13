<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>Register</title>
    <link rel="icon" type="image/x-icon" href="images/icons/favicon.ico" />
    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="css/login.css" />
  </head>
  <body class="my-login-page">
    <section class="h-100">
      <div class="container h-100">
        <div class="row justify-content-md-center h-100">
          <div class="card-wrapper">
            <div class="brand">
              <img src="images/icons/logo-01.png" alt="bootstrap 4 login page" />
            </div>
            <div class="card fat">
              <div class="card-body">
                <h4 class="card-title">Register</h4>
                <form method="POST" class="my-login-validation" novalidate="">
                  <div class="form-group">
                    <label for="name">Name</label>
                    <input
                      id="name"
                      type="text"
                      class="form-control"
                      name="name"
                      required
                      autofocus
                    />
                    <div class="invalid-feedback">What's your name?</div>
                  </div>
                  <div class="form-group">
                    <label for="email">E-Mail Address</label>
                    <input id="email" type="email" class="form-control" name="email" required />
                    <div class="invalid-feedback">Your email is invalid</div>
                  </div>
                  <div class="form-group">
                    <label for="password">Password</label>
                    <input
                      id="password"
                      type="password"
                      class="form-control"
                      name="password"
                      required
                      data-eye
                    />
                    <div class="invalid-feedback">Password is required</div>
                  </div>
                  <div class="form-group m-0">
                    <button type="submit" class="btn btn-primary btn-block">Register</button>
                  </div>
                  <div class="mt-4 text-center">
                    Already have an account? <a href="login.jsp">Login</a>
                  </div>
                </form>
              </div>
            </div>
            <div class="footer">Copyright &copy; 2017 &mdash; Your Company</div>
          </div>
        </div>
      </div>
    </section>
    <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="js/login.js"></script>
  </body>
</html>
