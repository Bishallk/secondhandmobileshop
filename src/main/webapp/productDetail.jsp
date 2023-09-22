<%@ page import="java.util.Base64" %>
<%@ page import="mbmc.secondhandmobileshop.service.ProductService" %>
<%@ page import="java.util.List" %>
<%@ page import="mbmc.secondhandmobileshop.models.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    int pId = Integer.parseInt(request.getParameter("productId"));
    Product myProduct = new Product();
    List<byte[]> productImageList = new ArrayList<>();
    List<Product> sameBrandList = new ArrayList<>();
    try {
        myProduct = ProductService.getProductById(pId);
        productImageList = myProduct.getImageBytesList();
        sameBrandList = ProductService.getProductListByBrand(myProduct.getBrand());
    } catch (Exception ex) {
        System.out.println("Product Detail:" + ex);
    } %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <jsp:include page="components/common_css_js.jsp"/>
    <title><%=myProduct.getName()%>
    </title>
</head>
<body>
<section class="container-lg">
    <div class="w-100 navbar-nav-scroll sticky-top overflow-visible">
        <jsp:include page="components/navbar.jsp"/>
    </div>
    <div class="row">
        <div class="col-lg-9 p-0 h-100">
            <div class="card rounded-0">
                <div class="card-body d-md-flex">
                    <div class="col-md-6 border-bottom" id="image-div">
                        <%--                        <% for (byte[] images : productImageList) { %>--%>
                        <%--                        <img src="data:image/jpeg;base64,<%=new String(Base64.getEncoder().encode(images))%>"--%>
                        <%--                             alt="Product Image" class="w-100">--%>
                        <%--                        <% }%>--%>
                        <%byte[] firstImage = myProduct.getImageBytesList().get(0); %>
                        <img src="data:image/jpeg;base64,<%=new String(Base64.getEncoder().encode(firstImage))%>"
                             alt="Product Image"
                             class="w-100">
                    </div>
                    <div class="col-md-6 p-0" id="details-div">
                        <div class="card border-0 ms-1 h-100">
                            <div class="card-header bg-white border-0">
                                <h4 class="card-title">
                                    <%=myProduct.getName()%>
                                    <span class="fs-6 text-muted">(<%=myProduct.getBrand()%>)</span>
                                </h4>
                                <h6 class="card-title text-muted">
                                    Description
                                </h6>
                                <p class="card-text fs-5">
                                    <%=myProduct.getDesc()%>
                                </p>
                            </div>
                            <div class="card-body">
                                <h6 class="card-title text-muted">
                                    Specifications
                                </h6>
                                <p>Name: <%=myProduct.getName()%>
                                </p>
                                <p>Brand: <%=myProduct.getBrand()%>
                                </p>
                                <p>Storage: <%=myProduct.getMemory()%>
                                </p>
                                <p>Color: <%=myProduct.getColor()%>
                                </p>
                                <p>Stock: <%=myProduct.getQuantity()%>
                                </p>
                                <div class="d-flex justify-content-between mt-5">
                                    <div>
                                        <h4 class="card-text mb-1">
                                            <strong>
                                                Rs. <%=myProduct.getDiscountedPrice()%>
                                            </strong>
                                            <span class="text-muted fs-6 lh-base text-decoration-line-through">
                                            Rs.<%=myProduct.getOriginalPrice()%></span>
                                        </h4>
                                    </div>
                                    <a class="text-decoration-none">
                                        <button class="btn btn-danger text-nowrap">Order Now</button>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 d-md-flex" id="similar-brands">
            <div class="card rounded-0 w-100">
                <h6 class="card-title m-1">Similar brands</h6>
                <% for (Product p : sameBrandList) {%>
                <a href="productDetail.jsp?productId=<%=p.getId()%>"
                   class="text-decoration-none" style="cursor:default !important;">
                    <div class="card border-0 mb-3 product-card">
                        <div class="row card-body d-md-block d-lg-flex">
                            <div class="col-md-5">
                                <%byte[] firstImg = p.getImageBytesList().get(0); %>
                                <img src="data:image/jpeg;base64,<%=new String(Base64.getEncoder().encode(firstImg))%>"
                                     alt="Product Image"
                                     class="img-fluid h-100">
                            </div>
                            <div class="col-md-7">
                                <h6 class="card-title">
                                    <%=p.getName()%>
                                </h6>
                                <p class="card-text mb-1">
                                    Rs.<%=p.getDiscountedPrice()%>
                                </p>
                            </div>
                        </div>
                    </div>
                </a>
                <%}%>
            </div>

        </div>
    </div>

</section>
</body>
</html>
