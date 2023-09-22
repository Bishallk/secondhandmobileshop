<%@ page import="mbmc.secondhandmobileshop.models.Brand" %>
<%@ page import="mbmc.secondhandmobileshop.service.BrandService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.io.PrintWriter" %>
<%----------Java code for show brands in brand dropdown of navbar--%>
<%
    ArrayList<Brand> brandList = new ArrayList<>();

    try {
        brandList = BrandService.getBrandList();
    } catch (Exception e) {
        System.out.println("addProductForm :" + e);
    }
%>
<%----------------------end of java code--------------------%>
<%-----------------------nav bar starts---------------------%>
<nav class="navbar navbar-expand-lg bg-white d-md-flex justify-content-md-around
 justify-content-lg-between p-2">

    <button class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="col-md-3 col-lg-3">
        <a class="navbar-brand fw-bold"
           href="${pageContext.request.contextPath}/index.jsp">
            SH MOBILE SHOP
        </a>
    </div>

    <div class="col-12 col-md-7 col-lg-7 mt-2 ">
        <form role="search" class="w-100">
            <div class="input-group my-lg-0">
                <input type="text"
                       class="form-control"
                       placeholder="Search"
                       aria-label="Search"
                       aria-describedby="search-btn">
                <button class="btn btn-danger"
                        type="submit"
                        id="search-btn">
                    <i class="bi bi-search"></i>
                </button>
            </div>
        </form>
    </div>


    <div class="collapse navbar-collapse col-md-2 col-lg-2"
         id="navbarSupportedContent">
        <ul class="navbar-nav  mb-2 mb-lg-0 ms-auto">
            <li class="nav-item dropdown">

                <a class="nav-link dropdown-toggle "
                   href="#"
                   role="button"
                   data-bs-toggle="dropdown"
                   aria-expanded="false">
                    <i class="bi bi-person-fill"></i>
                </a>
                <ul class="dropdown-menu dropdown-menu-end">
                    <li class="dropdown-item bold">
                        <%if (session.getAttribute("name") != null) {%>
                        <%=  session.getAttribute("name")%>
                        <%}%>
                    </li>
                    <li><a class="dropdown-item"
                           href="../users/userLogin.jsp">
                        <%if (session.getAttribute("name") == null) {%>
                        Login
                        <%}%>
                    </a></li>

                    <li><a class="dropdown-item">
                        <%if (session.getAttribute("name") != null) {%>
                        Account Settings
                        <%}%>
                    </a></li><li><a class="dropdown-item"
                           href="${pageContext.request.contextPath}/logout">
                        <%if (session.getAttribute("name") != null) {%>
                        Logout
                        <%}%>
                    </a></li>
                </ul>
            </li>
        </ul>
    </div>
</nav>