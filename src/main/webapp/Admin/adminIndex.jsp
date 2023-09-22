<%@ page import="com.mysql.cj.Session" %>
<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Admin Panel</title>
    <jsp:include page="../components/common_css_js.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/charts.min.css">

    <style>
        .nav-item .nav-link:hover {
            background-color: #494949;

        }

        .active {
            background: #D2302D !important;
        }

        #my-chart.line {
            height: 200px;
            max-width: 400px;
            margin: 0 auto;
        }
    </style>
</head>
<body data-bs-spy="scroll" data-bs-target="#side-navbar">
<header class="fixed-top">
    <jsp:include page="adminNavbar.jsp"/>
</header>
<aside>
    <jsp:include page="adminSideNav.jsp"/>
</aside>

<main class="container-lg pt-3" id="admin-main">
    <div class="mx-4 pt-5">
        <jsp:include page="/components/alertMessage.jsp"/>
    </div>
    <div class="container-fluid pt-2 ">

        <div class="row">
            <div class="col-md-12 fw-bold fs-5 text-muted">
                Dashboard
                <hr class="text-danger mt-0">
            </div>

        </div>
        <div>
            <jsp:include page="dashboardCards.jsp"/>
        </div>


        <%--orders table--%>
        <div class="row mt-2" id="orders-table">
            <div class="col-md-12 fw-bold fs-5 text-muted">
                Orders
                <hr class="text-danger mt-0">
            </div>
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        Order Management
                    </div>
                    <div class="card-body overflow-scroll">
<%--                        <jsp:include page="tables/ordersTable.jsp"/>--%>
                    </div>
                </div>
            </div>
        </div>
        <%--product tables--%>
        <div class="row mt-2" id="products-table">
            <div class="col-md-12 fw-bold fs-5 text-muted">
                Products
                <hr class="text-danger mt-0">
            </div>
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between">
                        <span>
                            Product Management
                        </span>

                        <a href="forms/addProductForm.jsp" class="text-decoration-none">
                            <span class="me-lg-3 link-danger">
                                <i class="bi bi-plus-circle"></i>
                                 Product
                            </span>
                        </a>
                    </div>
                    <div class="card-body overflow-scroll">
                        <jsp:include page="tables/productsTable.jsp"/>
                    </div>
                </div>
            </div>
        </div>
        <%--users tables--%>
        <div class="row mt-2" id="users-table">
            <div class="col-md-12 fw-bold fs-5 text-muted">
                Users
                <hr class="text-danger mt-0">
            </div>
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">

                        Users Management
                    </div>
                    <div class="card-body overflow-scroll">
<%--                        <jsp:include page="tables/usersTable.jsp"/>--%>
                    </div>
                </div>
            </div>
        </div>
        <%--Inventory Management--%>
        <div class="row mt-2" id="inventory-table">
            <div class="col-md-12 fw-bold fs-5 text-muted">
                Inventory
                <hr class="text-danger mt-0">
            </div>
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        Inventory Management
                    </div>
                    <div class="card-body overflow-scroll">
                        <jsp:include page="tables/inventoryTable.jsp"/>
                    </div>
                </div>
            </div>
        </div>
        <%--Customer Support--%>
        <div class="row mt-2 pb-5" id="support-table">
            <div class="col-md-12 fw-bold fs-5 text-muted">
                Customer Support
                <hr class="text-danger mt-0">
            </div>
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        Customer Support
                    </div>
                    <div class="card-body overflow-scroll">
                        <jsp:include page="tables/supportTable.jsp"/>
                    </div>
                </div>
            </div>
        </div>
    </div>

</main>
<footer class="bg-dark text-center w-100 text-white p-1">
    <p>&copy; 2023 <strong>SH Mobile Pvt. Ltd.</strong> All rights reserved.</p>
</footer>
<jsp:include page="modals/deleteProductModal.jsp"/>
</body>
</html>

}%>