<%@ page import="mbmc.secondhandmobileshop.service.Service" %><%--cards--%>
<%
    int numOfProduct= Service.rowCount("products");
    int numOfUsers= Service.rowCount("users");
%>
<div class="row card-group">

    <div class="col-md-6 col-lg-3 mb-3">
        <div class="card text-bg-danger h-100">
            <div class="card-header">
                <div class="d-flex">
                    <img src="${pageContext.request.contextPath}/icons/dollar.svg"
                         alt=""
                         width="35px">
                    <h5 class="card-title lh-base ms-1">Total Sales
                        <i class="bi bi-chevron-compact-right"></i>
                    </h5>

                </div>

            </div>
            <div class="card-body text-center">
                <h2 class="">Rs.0</h2>
                <p class="card-text">Total sales till the date</p>
            </div>
        </div>
    </div>
    <div class="col-md-6 col-lg-3 mb-3">
        <div class="card text-bg-success mb-3 h-100">
            <div class="card-header d-flex">
                <div class="text-center">
                    <img src="${pageContext.request.contextPath}/icons/groups.svg"
                         alt=""
                         width="35px">
                </div>
                <h5 class="card-title lh-base ms-1">Customers
                    <i class="bi bi-chevron-compact-right"></i>
                </h5>

            </div>
            <div class="card-body text-center">
                <h2 class="card-title"><%=numOfUsers%></h2>
                <p class="card-text">Total number of registered users.</p>
            </div>
        </div>
    </div>
    <div class="col-md-6 col-lg-3 mb-3">
        <div class="card bg-warning text-white h-100">
            <div class="card-header d-flex">
                <div class="text-center">
                    <img src="${pageContext.request.contextPath}/icons/cart.svg"
                         alt=""
                         width="35px">
                </div>
                <h5 class="card-title lh-base ms-1">Total Orders
                    <i class="bi bi-chevron-compact-right"></i>
                </h5>

            </div>
            <div class="card-body text-center">
                <h2 class="card-title">0</h2>
                <p class="card-text">Total number of orders from the website.</p>
            </div>
        </div>
    </div>
    <div class="col-md-6 col-lg-3 mb-3">
        <div class="card bg-primary  text-white h-100">
            <div class="card-header d-flex">
                <div class="text-center">
                    <img src="${pageContext.request.contextPath}/icons/devices.svg"
                         alt=""
                         width="35px">
                </div>
                <h5 class="card-title lh-base ms-1">Total Products
                    <i class="bi bi-chevron-compact-right"></i></h5>

            </div>
            <div class="card-body text-center">
                <h2 class="card-title"><%=numOfProduct%>
                </h2>
                <p class="card-text">Total number of registered products.</p>
            </div>

        </div>
    </div>
</div>
<%--charts--%>
<div class="row card-group">
    <div class="col-md-6 col-sm-12 mb-2">
        <div class="card h-100">
            <div class="card-header d-flex justify-content-between">
                <span>
                    Sales
                </span>

            </div>
            <div class="card-body">
                <canvas id="myLineChart" class=""></canvas>
                <jsp:include page="charts/salesChart.jsp"/>
            </div>
        </div>
    </div>
    <div class="col-md-6 col-sm-12 mb-2">
        <div class="card h-100">
            <div class="card-header d-flex justify-content-between">
                <span>
                    Brands
                </span>

                <a href="forms/addBrandForm.jsp" class="text-decoration-none">
                    <span class="me-lg-3 link-danger">
                        <i class="bi bi-plus-circle"></i>
                           Brand
                    </span>
                </a>
            </div>
            <div class="card-body">
                <div>
                    <canvas id="myDoughnutChart" class="m-auto">
                    </canvas>
                    <jsp:include page="charts/brandsChart.jsp"/>
                </div>
            </div>
        </div>
    </div>

</div>
