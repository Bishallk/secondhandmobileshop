<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%------------------------------first row---------------------------------%>

<div class="row d-flex justify-content-evenly mt-4 flex-wrap">
    <%--  total sales  --%>
    <div class="col-lg-2 col-md-4 col-sm-12 d-block bg-danger h-25 rounded-1 card">
        <div class="container text-white text-center card-body">
            <img src="../../icons/dollar.svg" alt="sales">
        </div>
        <div class="container text-center text-white card-body">
            <p class="card-title fst-normal fs-5">Rs.12,00,00</p>
            <p class="card-title fs-6">Total Sales</p>
        </div>
    </div>
    <%--   total customers --%>
    <div class="col-lg-2 col-md-4 col-sm-5 d-block bg-primary h-25 rounded-1 card">
        <div class="container text-white text-center card-body">
            <img src="../../icons/groups.svg" alt="users">
        </div>
        <div class="container text-center text-white card-body">
            <p class="card-title fst-normal fs-4">5973</p>
            <p class="card-title fs-6">Total Customers</p>
        </div>
    </div>
    <%-- total products   --%>
    <div class="col-lg-2 col-md-4 col-sm-5 d-block bg-warning h-25 rounded-1 card">
        <div class="container text-white text-center card-body">
            <img src="../../icons/devices.svg" alt="products">
        </div>
        <div class="container text-center text-white card-body">
            <p class="card-title fst-normal fs-4">5973</p>
            <p class="card-title fs-6">Total Products</p>
        </div>
    </div>
    <%-- total brands   --%>
    <div class="col-lg-2 col-md-4 col-sm-5 d-block bg-info h-25 rounded-1 card">
        <div class="container text-white text-center card-body">
            <img src="../../icons/tablet.svg" alt="brands">
        </div>
        <div class="container text-center text-white card-body">
            <p class="card-title fst-normal fs-4">0032</p>
            <p class="card-title fst-normal fs-6">Total Brands</p>
        </div>

    </div>
    <%-- total orders   --%>
    <div class="col-lg-2 col-md-4  col-sm-5 d-block bg-success h-25 rounded-1 card">
        <div class="container text-white text-center card-body">
            <img src="../../icons/cart.svg" alt="orders" width="68px" height="68px">
        </div>
        <div class="container text-center text-white card-body">
            <p class="card-title fst-normal fs-4">3466</p>
            <p class="card-title fs-6">Total Orders</p>
        </div>
    </div>


</div>
<%------------------------------second row---------------------------------%>

<div class="row d-flex justify-content-evenly mt-4">
    <%--  manage orders  --%>
    <div class="col-2 d-flex  h-25 rounded-1 card bg-primary">
        <a href="#orders" class="page-link">

            <div class="container text-white text-center card-body">
                <img src="../../icons/local_shipping.svg" alt="orders" width="68px" height="68px">
            </div>
            <div class="container text-center text-white card-body">
                <p class="card-title fs-6">Manage Order</p>
            </div>
        </a>
    </div>

    <%--  add product  --%>
    <div class="col-2 d-flex  h-25 rounded-1  card bg-info" data-bs-toggle="modal" data-bs-target="#addProductModal">
        <a href="#" class="page-link">

            <div class="container text-white text-center card-body">
                <img src="../../icons/add_icon.svg" alt="orders" width="68px" height="68px">
            </div>
            <div class="container text-center text-white card-body">
                <p class="card-title fs-6">Add Product</p>
            </div>
        </a>
    </div>

    <%--add brands--%>
    <div class="col-2 d-flex  h-25 rounded-1 card bg-warning" data-bs-toggle="modal" data-bs-target="#addBrandModal">
        <a href="#" class="page-link">

            <div class="container text-white text-center card-body">
                <img src="../../icons/add_icon.svg" alt="brands" width="68px" height="68px">
            </div>
            <div class="container text-center text-white card-body">
                <p class="card-title fs-6">Add Brand</p>

            </div>
        </a>
    </div>
    <%--  manage inventory  --%>
    <div class="col-2 d-flex h-25 rounded-1  card bg-success">
        <a href="#inventory" class="page-link">
            <div class="container text-white text-center card-body">
                <img src="../../icons/inventory.svg" alt="orders" width="68px" height="68px">
            </div>
            <div class="container text-center text-white card-body">
                <p class="card-title fs-6">Manage Inventory </p>
            </div>
        </a>
    </div>
    <%-- cusotmer care--%>
    <div class="col-2 d-flex  h-25 rounded-1 card bg-danger">
        <a href="#customerCare" class="page-link">

            <div class="container text-white text-center card-body">
                <img src="../../icons/customerSupport.svg" alt="orders" width="68px" height="68px">
            </div>
            <div class="container text-center text-white card-body">
                <p class="card-title fs-6">Customer Care</p>
            </div>
        </a>
    </div>

</div>
