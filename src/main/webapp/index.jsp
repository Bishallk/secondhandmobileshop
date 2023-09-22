<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="icon" href="icons/favicon.ico" type="image/x-icon">
    <title>SH mobile shop - get your dream phone</title>

    <%@include file="components/common_css_js.jsp" %>
</head>
<body>
<section class="container-lg">
    <div class="w-100 navbar-nav-scroll sticky-top overflow-visible">
        <jsp:include page="components/navbar.jsp"/>
    </div>

    <div>
        <jsp:include page="displayProductsList.jsp"/>
    </div>


</section>
<jsp:include page="components/footer.jsp"/>
</body>
</html>

