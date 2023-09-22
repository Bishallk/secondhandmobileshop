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
    <title>User Login</title>
    <jsp:include page="/components/common_css_js.jsp"/>
</head>
<body class="bg-info-subtle">
<div>
    <div class="col-md-6 col-lg-3 col-sm-10 ms-auto me-auto mt-5 bg">
      <div class="">
        <jsp:include page="/components/alertMessage.jsp"/>
      </div>
        <div class="card">
            <div class="card-header bg-danger text-white">
                User Login
            </div>
            <div class="card-body">
                <jsp:include page="forms/userLoginForm.jsp"/>
            </div>
        </div>
    </div>
</div>

</body>
</html>
