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
        <th class="border-2 p-2 text-center">Product Name</th>
        <th class="border-2 p-2 text-center">Product Id</th>
        <th class="border-2 p-2 text-center">Image</th>
        <th class="border-2 p-2 text-center">Quantity</th>
        <th class="border-2 p-2 text-center"
            colspan="">Action
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
        <td class="border-2 p-2"><%=product.getId()%>
        </td>
        <td class="border-2 p-2 text-nowrap">
            <% for (byte[] imageByte : product.getImageBytesList()) { %>
            <img src="data:image/jpeg;base64,<%=new String(Base64.getEncoder().encode(imageByte))%>"
                 alt="Product Image"
                 width=30>
            <% }%>
        </td>
        <td class="border-2 p-2"><%=product.getQuantity() %>
        </td>


        <td class="border-2 p-2 text-center">
            <a class="text-decoration-none" href="${pageContext.request.contextPath}/Admin/forms/updateProductForm.jsp?updateId=<%=product.getId()%>">
               <span class="me-lg-3 link-success">
                        <i class="bi bi-pencil-square"></i>
                           Update
                    </span>
            </a>

        </td>
    </tr>
    <% sn++;
    } %>
</table>
<%--<td class="border-2 p-2 text-center">--%>
<%--    <a href="">--%>
<%--        <img src="${pageContext.request.contextPath}/icons/view.svg"--%>
<%--             alt="edit"--%>
<%--             width="20px"--%>
<%--             title="view">--%>
<%--    </a>--%>
<%--</td>--%>
