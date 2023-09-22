<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" href="../../icons/favicon.ico" type="image/x-icon">
    <title>Admin Panel - SH mobile shop</title>
    <jsp:include page="../../components/common_css_js.jsp"/>
    <style>
        .active {
            background-color: #D2302D;
        }

        .nav-link:hover {
            background-color: #D2302D;
        }

        .my-bg-1 {
            background-color: #D2302D
        }

        .my-bg-2 {
            background-color: #F7F7F7;
        }
    </style>
</head>
<body id="adminPanel">

<%----------Horizontal nav------- - --%>
<div class="container-fluid p-0 m-0 sticky-top" style="position:fixed">
    <jsp:include page="horizontalNav.jsp"/>
</div>
<%------------------------------------%>
<%-------------Vertical nav | --------%>
<div class="container-fluid d-flex m-0 p-0 h-100 w-100">
    <aside class="">
        <div class="vh-100 m-0 mt-5 pt-5 h-100 " style=" background-color:#333333; position:fixed">
            <jsp:include page="verticalNav.jsp"/>
        </div>
    </aside>
    <%------------------------------------%>

    <%----------Dashboard contents--------%>
    <div class="container h-100 bg-white pt-4" data-bs-smooth-scroll="true"
         style="margin-left: 250px;" data-bs-spy="scroll" data-bs-target="#vertical-nav" tabindex="0">


        <div class="pt-5" id="dashboard">
            <%--------------------alert message---------------------%>
            <div class="mx-4 pt-5">
                <jsp:include page="../../components/alertMessage.jsp"/>
            </div>
            <%------------------------------------------------------%>
            <h4 class="mx-4 text-danger">Dashboard</h4>
            <hr class="text-danger mx-4">
            <jsp:include page="adminDashboard.jsp"/>
        </div>
        <div id="orders" class="pt-5">
            <h4 class="mx-4 pt-5 text-danger">Orders</h4>
            <hr class="text-danger mx-4">
            <jsp:include page="../tables/ordersTable.jsp"/>
        </div>
        <div id="products" class="pt-5">
            <h4 class="mx-4 pt-5 text-danger">Products</h4>
            <hr class="text-danger mx-4">
            <div class="table-responsive overflow-y-auto h-50">
                <jsp:include page="../tables/productsTable.jsp"/>

            </div>
        </div>
        <div id="users" class="pt-5">
            <h4 class="mx-4 pt-5 text-danger">Users</h4>
            <hr class="text-danger mx-4">
            <jsp:include page="../tables/usersTable.jsp"/>
        </div>
        <div id="inventory" class="pt-5">
            <h4 class="mx-4 pt-5 text-danger">Inventory</h4>
            <hr class="text-danger mx-4">
            <jsp:include page="../tables/inventoryTable.jsp"/>
        </div>
        <div id="customerCare" class="pt-5">
            <h4 class="mx-4 mt-5 text-danger">Customer Care</h4>
            <hr class="text-danger mx-4">
            <jsp:include page="../tables/supportTable.jsp"/>
        </div>
        <%------------Forms Section Start-------------%>
        <div id="forms" class="container-fluid pt-5 pb-5">

            <h4 class="mx-4 pt-5 text-danger">Forms</h4>
            <hr class="text-danger mx-4">

            <div class="row d-flex justify-content-around">
                <%-- add product --%>
                <div class="col-6 card h-100 shadow-sm">
                    <div class="container p-2 text-center">
                        <h3 class="card-title">Product Registration</h3>
                        <hr class="text-primary">
                    </div>
                    <jsp:include page="../forms/addProductForm.jsp"/>
                </div>
                <%-- add brand --%>
                <div class="col-4 card h-100 shadow-sm">
                    <div class="container p-2 text-center">
                        <h3 class="card-title">Brand Registration</h3>
                        <hr class="text-primary">
                    </div>
                    <jsp:include page="../forms/addBrandForm.jsp"/>
                </div>
            </div>
            <hr class="text-danger mx-4">
        </div>
        <%------------Forms Section End-------------%>

    </div>

</div>
<%--modals--%>
<jsp:include page="../modals/addProductModal.jsp"/>
<jsp:include page="../modals/addBrandModal.jsp"/>
<jsp:include page="../modals/deleteProductModal.jsp"/>
</body>
</html>
