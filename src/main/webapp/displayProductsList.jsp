<%@ page import="mbmc.secondhandmobileshop.models.Product" %>
<%@ page import="java.util.Base64"%>
<%@ page import="mbmc.secondhandmobileshop.service.ProductService" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="container-lg">
    <div class="row d-block d-md-flex justify-content-start h-25">
    <%
        List<Product> productList = null;
        try {
            productList = ProductService.getProductList();
        } catch (Exception exception) {
            System.out.println("display product" + exception);
        }
        assert productList != null;
        for (Product product : productList) {
    %>
        <div class="col-sm-12 col-md-3 col-lg-2 pb-2 pt-2">
            <a href="productDetail.jsp?productId=<%=product.getId()%>"
                class="text-decoration-none" style="cursor:default !important;">
            <div class="card rounded-0 border-0 product-card h-100">
                <div class="card-header p-0 border-1 h-100">
                <%byte[] firstImg = product.getImageBytesList().get(0); %>
                <img src="data:image/jpeg;base64,<%=new String(Base64.getEncoder().encode(firstImg))%>"
                     alt="Product Image"
                     class="card-img-top h-100">
                </div>
                <div class="card-body p-1">
                    <h5 class="card-title text-wrap"><%=product.getName()%></h5>
                    <p class="card-text mb-1 fs-5">
                        Rs. <%=product.getDiscountedPrice()%>
                    </p>
                    <p class="text-muted text-decoration-line-through fs-6">
                        Rs.<%=product.getOriginalPrice()%></p>
                </div>
            </div>
            </a>
        </div>

    <% } %>
    </div>

</div>
