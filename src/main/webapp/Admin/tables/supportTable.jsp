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

<table class="table table-striped border-2 display"
       id="productTable">
    <tr class=" border-2 p-2">
        <th class="border-2 p-2 text-center">SN</th>
        <th class="border-2 p-2 text-center">Username</th>
        <th class="border-2 p-2 text-center">Phone No.</th>
        <th class="border-2 p-2 text-center">Email</th>
        <th class="border-2 p-2 text-center">Message</th>

<%--    </tr>--%>
<%--    <%--%>
<%--        int sn = 1;--%>
<%--        for (Product product : productList) {--%>
<%--    %>--%>

<%--    <tr>--%>
<%--        <td class="border-2 p-2"><%=sn%>--%>
<%--        </td>--%>
<%--        <td class="border-2 p-2"><%=product.getName()%>--%>
<%--        </td>--%>
<%--        <td class="border-2 p-2"><%=product.getId()%>--%>
<%--        </td>--%>
<%--        <td class="border-2 p-2"><%=product.getColor()%>--%>
<%--        </td>--%>
<%--        <td class="border-2 p-2"><%=product.getDesc() %>--%>
<%--        </td>--%>

<%--    </tr>--%>
<%--    <% sn++;--%>
<%--    } %>--%>
</table>
