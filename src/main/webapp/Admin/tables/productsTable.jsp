<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="mbmc.secondhandmobileshop.models.Product" %>
<%@ page import="mbmc.secondhandmobileshop.service.ProductService" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Base64" %>
<%
    List<Product> productList = new ArrayList<>();
    try {
        productList = ProductService.getProductList();

    } catch (SQLException | ClassNotFoundException e) {
        System.out.println("Product table :" + e);
    }
%>

<table class="table table-striped border-2 display" id="productTable">
    <tr class=" border-2 p-2">
        <th class="border-2 p-2 text-center">SN</th>
        <th class="border-2 p-2 text-center">Name</th>
        <th class="border-2 p-2 text-center">Brand</th>
        <th class="border-2 p-2 text-center">Original Price</th>
        <th class="border-2 p-2 text-center">Discounted Price</th>
        <th class="border-2 p-2 text-center">Memory</th>
        <th class="border-2 p-2 text-center">Color</th>
        <th class="border-2 p-2 text-center">Images</th>
        <th class="border-2 p-2 text-center">Description</th>

        <th class="border-2 p-2 text-center"
            colspan="3">Action
        </th>
    </tr>
    <%
        int sn = 1;
        for (Product product : productList) {
    %>

    <tr>
        <td class="border-2 p-2"><%=sn%>
        </td>
        <td class="border-2 p-2"><%=product.getName()%>
        </td>
        <td class="border-2 p-2"><%=product.getBrand()%>
        </td>
        <td class="border-2 p-2"><%=product.getOriginalPrice() %>
        </td>
        <td class="border-2 p-2"><%=product.getDiscountedPrice()%>
        </td>
        <td class="border-2 p-2"><%=product.getMemory()%>
        </td>
        <td class="border-2 p-2"><%=product.getColor()%>
        </td>

        <td class="border-2 p-2 text-nowrap">
            <% for (byte[] imageByte : product.getImageBytesList()) { %>
            <img src="data:image/jpeg;base64,<%=new String(Base64.getEncoder().encode(imageByte))%>"
                 alt="Product Image"
                 width=30>
            <% }%>
        </td>
        <td class="border-2 p-2 text-wrap"><%=product.getDesc()%>
        </td>

        <td class="border-2 p-2">
            <a class="link-success" href="${pageContext.request.contextPath}/Admin/forms/updateProductForm.jsp?updateId=<%=product.getId()%>">
                <i class="bi bi-pencil-square"></i>
            </a>
        </td>
        <td class="border-2 p-2">
            <span onclick="passData(<%= product.getId() %>)" class="link-danger" style="cursor: pointer" >
                <i class="bi bi-trash3" ></i>
            </span>

        </td>
        <td class="border-2 p-2">
            <a class="link-info" href="">
                <i class="bi bi-eye" ></i>
            </a>
        </td>
    </tr>
    <% sn++;
    } %>
</table>
<script>
    function passData(id) {
        const deleteModal = new bootstrap.Modal('#deleteProductModal');
        document.querySelector("#idForDelete").value=id;
        deleteModal.show(this);
    }
</script>