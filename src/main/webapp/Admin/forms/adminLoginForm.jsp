<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible"
          content="ie=edge">
    <title>Admin Login</title>
    <jsp:include page="/components/common_css_js.jsp"/>
</head>
<body class="bg-info-subtle">
<div>
    <div class="col-md-5 col-lg-3 col-sm-10 ms-auto me-auto mt-5">
        <div class="card">
            <div class="card-header text-white bg-danger">
              Admin Login
            </div>
            <div class="card-body">
                <form action="${pageContext.request.contextPath}/adminLogin"
                      method="post">
                    <div class="d-block">
                        <div class="m-3">
                            <label for="adminUsername"
                                   class="form-label">Username</label>
                            <input type="text"
                                   name="adminUsername"
                                   class="form-control"
                                   placeholder="Enter Username"
                                   id="adminUsername"
                                   autocomplete="off"
                                   required>

                        </div>
                        <div class="m-3">
                            <label for="adminPassword"
                                   class="form-label">Password</label>
                            <input type="password"
                                   name="adminPassword"
                                   class="form-control"
                                   id="adminPassword"
                                   placeholder="Enter Password"
                                   required></input>
                        </div>
                        <div class="row m-3 d-flex justify-content-around">
                            <button class="btn btn-danger text-white col-5" type="submit">
                                Login
                            </button>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
