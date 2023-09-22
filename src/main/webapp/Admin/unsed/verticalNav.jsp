<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--vertical nav--%>
<aside class="bd-sidebar">
    <nav class="navbar-nav  " style=" width: 250px; background-color:#333333;" id="vertical-nav">
        <ul class="nav flex-column">
            <li class="nav-item m-2 p-1 ">
                <a class="nav-link text-white active" href="#dashboard" id="dashboard-link"
                   onclick="setActive('dashboard')">
                    <img class="m-1" src="../../icons/computer.svg" alt="dashboard" height="25px" width="25px"
                         title="Dashboard">
                    Dashboard
                </a>
            </li>
            <li class="nav-item m-2 p-1">
                <a class="nav-link  text-white" href="#orders" id="orders-link">
                    <img class="m-1" src="../../icons/cart.svg" alt="orders" height="25px" width="25px"
                         title="Orders">
                    Orders
                </a>
            </li>
            <li class="nav-item m-2 p-1">
                <a class="nav-link text-white" href="#products" id="products-link">
                    <img class="m-1" src="../../icons/devices.svg" alt="products" height="25px" width="25px"
                         title="Products">
                    Products
                </a>
            </li>
            <li class="nav-item m-2 p-1">
                <a class="nav-link text-white" href="#users" id="users-link">
                    <img class="m-1" src="../../icons/groups.svg" alt="users" height="25px" width="25px"
                         title="Users">
                    Users
                </a>
            </li>

            <li class="nav-item m-2 p-1">
                <a class="nav-link text-white" href="#inventory" id="inventory-link">
                    <img class="m-1" src="../../icons/inventory.svg" alt="inventory" height="25px" width="25px"
                         title="Inventory">
                    Inventory
                </a>
            </li>
            <li class="nav-item m-2 p-1">
                <a class="nav-link text-white" href="#customerCare" id="customer-link">
                    <img class="m-1" src="../../icons/customerSupport.svg" alt="cs" height="25px" width="25px"
                         title="Customer care">
                    Customer Care
                </a>
            </li>
            <li class="nav-item m-2 p-1">
                <a class="nav-link text-white" href="#forms" id="forms-link">
                    <img class="m-1" src="../../icons/form.svg" alt="form" height="25px" width="25px"
                         title="Forms">
                    Forms
                </a>
            </li>

        </ul>
    </nav>
</aside>
