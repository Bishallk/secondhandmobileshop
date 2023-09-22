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
        <th class="border-2 p-2 text-center">User Id</th>
        <th class="border-2 p-2 text-center">Username</th>
        <th class="border-2 p-2 text-center">Address</th>
        <th class="border-2 p-2 text-center">Mobile No.</th>
        <th class="border-2 p-2 text-center">Email</th>
        <th class="border-2 p-2 text-center">Date</th>
        <th class="border-2 p-2 text-center" colspan="3">Action
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

        <td class="border-2 p-2 text-center">
            <a href="${pageContext.request.contextPath}/Admin/forms/updateProductForm.jsp?updateId=<%=product.getId()%>">
                <img src="${pageContext.request.contextPath}/icons/edit.svg"
                     alt="edit"
                     width="20px"
                     title="edit">
            </a>
        </td>
        <td class="border-2 p-2 text-center">

            <img src="${pageContext.request.contextPath}/icons/delete.svg"
                 alt="delete"
                 width="20px"
                 title="delete"
                 onclick="passData(<%= product.getId() %>)">

        </td>
        <td class="border-2 p-2 text-center">
            <a href="">
                <img src="${pageContext.request.contextPath}/icons/view.svg"
                     alt="edit"
                     width="20px"
                     title="view">
            </a>
        </td>
    </tr>
    <% sn++;
    } %>
</table>