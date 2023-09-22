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

<table class="table table-responsive table-striped border-2 display" id="productTable">
  <tr class=" border-2 p-2">
    <th class="border-2 p-2 text-center">SN</th>
    <th class="border-2 p-2 text-center">Order Id</th>
    <th class="border-2 p-2 text-center">Customer Name</th>
    <th class="border-2 p-2 text-center">Product</th>
    <th class="border-2 p-2 text-center">Delivery Address</th>
    <th class="border-2 p-2 text-center">Mobile No.</th>
    <th class="border-2 p-2 text-center">Email</th>
    <th class="border-2 p-2 text-center">Status</th>
    <th class="border-2 p-2 text-center">Payment</th>
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
    <td class="border-2 p-2 text-wrap">
      <%=product.getDesc()%>
    </td>

    <td class="border-2 p-2">
      <a class="text-decoration-none" href="${pageContext.request.contextPath}/Admin/forms/updateProductForm.jsp?updateId=<%=product.getId()%>">
        <span class="text-success">
          <i class="bi bi-pencil-square"></i>
        </span>
      </a>
    </td>
    <td class="border-2 p-2">

      <img src="${pageContext.request.contextPath}/icons/delete.svg"
           alt="delete"
           width="20px"
           title="delete"
           onclick="passData(<%= product.getId() %>)">

    </td>
    <td class="border-2 p-2">
      <a href="">
         <span class="text-success">
          <i class="bi bi-eye"></i>
        </span>
      </a>
    </td>
  </tr>
  <% sn++;
  } %>
</table>
