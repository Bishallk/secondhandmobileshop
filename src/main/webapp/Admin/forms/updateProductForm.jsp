<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="mbmc.secondhandmobileshop.service.BrandService" %>
<%@ page import="mbmc.secondhandmobileshop.models.Brand" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mbmc.secondhandmobileshop.models.Product" %>
<%@ page import="mbmc.secondhandmobileshop.service.ProductService" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Base64" %>
<%
    int id = Integer.parseInt(request.getParameter("updateId"));
    ArrayList<Brand> brandList = new ArrayList<>();
    Product product = new Product();
    List<byte[]> imageBytesList = new ArrayList<>();
    try {
        brandList = BrandService.getBrandList();
        product = ProductService.getProductById(id);
        imageBytesList = product.getImageBytesList();
    } catch (SQLException | ClassNotFoundException e) {
        System.out.println("updateProductForm :" + e);
    }
%>
<%--java code to show brand list in select menu of addProduct form--%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible"
          content="ie=edge">
    <title>Update Product </title>
    <jsp:include page="/components/common_css_js.jsp"/>
</head>
<body class="bg-info-subtle">
<div>
    <div class="col-md-6 col-lg-5 col-sm-10 ms-auto me-auto mt-2 bg">
        <div class="card">
            <div class="card-header bg-warning text-white">
                Update Product Form
            </div>
            <div class="card-body">
                <form action="${pageContext.request.contextPath}/updateProduct"
                      method="post"
                      enctype="multipart/form-data">
                    <div class="d-block">
                        <input type="hidden"
                               name="pId"
                               value="<%=product.getId()%>">
                        <%--        value="<%=request.getParameter("updateId")%>"--%>
                        <div class="row d-flex justify-content-around">
                            <div class="mb-3 col-6">
                                <label for="pName"
                                       class="form-label">Product Name</label>
                                <input name="pName"
                                       value="<%=product.getName()%>"
                                       type="text"
                                       class="form-control"
                                       id="pName"
                                       placeholder="Product Name"
                                       required>
                            </div>
                            <div class="mb-3 col-6">

                                <label for="pBrand"
                                       class="form-label">Brand</label>
                                <select name="pBrand"
                                        class="form-select"
                                        aria-label="Default select example"
                                        id="pBrand">
                                    <option disabled
                                            class="text-bg-danger">Select Brand
                                    </option>
                                    <%--using foreach loop to show brand list--%>
                                    <%for (Brand brand : brandList) { %>
                                    <option value="<%=brand.getName()%>">
                                        <%--prints brand name--%>
                                        <%=brand.getName()%>
                                    </option>
                                    <% }%>
                                    <%--------------------------------%>
                                </select>
                                <script>
                                    let brandSelect = document.getElementById('pBrand');
                                    let brandOpt = "<%=product.getBrand()%>";
                                    for (let i = 0; i < brandSelect.options.length; i++) {
                                        const option = brandSelect.options[i];
                                        if (option.value === brandOpt) {
                                            option.setAttribute("selected", "selected")
                                            break;
                                        }
                                    }

                                </script>
                            </div>
                        </div>
                        <div class="row d-flex justify-content-around">
                            <div class="mb-3 col-6 ">
                                <label for="pColor"
                                       class="form-label">Color</label>
                                <input value="<%=product.getColor()%>"
                                       name="pColor"
                                       type="text"
                                       class="form-control"
                                       id="pColor"
                                       placeholder="Product color"
                                       required>
                            </div>
                            <div class="mb-3 col-6">
                                <label for="pMemory"
                                       class="form-label">Memory</label>
                                <input value="<%=product.getMemory()%>"
                                       name="pMemory"
                                       type="text"
                                       class="form-control"
                                       id="pMemory"
                                       placeholder="Storage capacity"
                                       required>
                            </div>
                        </div>

                        <div class="row d-flex justify-content-around">
                            <div class="mb-3 col-6 ">
                                <label for="pOriginalPrice"
                                       class="form-label">Original Price</label>
                                <input value="<%=product.getOriginalPrice()%>"
                                       name="pOriginalPrice"
                                       type="number"
                                       class="form-control"
                                       id="pOriginalPrice"
                                       placeholder="Rs."
                                       min="0"
                                       required>
                            </div>
                            <div class="mb-3 col-6">
                                <label for="pDiscountedPrice"
                                       class="form-label">Discounted Price</label>
                                <input value="<%=product.getDiscountedPrice()%>"
                                       name="pDiscountedPrice"
                                       type="number"
                                       class="form-control"
                                       min="0"
                                       id="pDiscountedPrice"
                                       placeholder="Rs."
                                       required>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="pDescription"
                                   class="form-label">Description</label>
                            <textarea name="pDesc"
                                      class="form-control h-25"
                                      placeholder="Description of Product"
                                      id="pDescription"
                                      maxlength="150"
                                      required><%=product.getDesc()%></textarea>
                        </div>
                        <div class="row d-flex justify-content-around">
                            <div class="mb-3 col-7">
                                <label for="pImages"
                                       class="form-label">Image</label>
                                <input name="pImages"
                                       type="file"
                                       class="form-control"
                                       id="pImages"
                                       accept="image/*"
                                       multiple>

                            </div>
                            <div class="mb-3 col-5">
                                <label for="pQuantity"
                                       class="form-label">Quantity</label>
                                <input name="pQuantity"
                                       type="number"
                                       class="form-control"
                                       min="0"
                                       value="<%=product.getQuantity()%>"
                                       id="pQuantity"
                                       placeholder="Quantity"
                                       required>
                            </div>
                        </div>

                        <div id="imagePreview">
                            <% for (byte[] imageByte : imageBytesList) { %>
                            <img src="data:image/jpeg;base64,<%=new String(Base64.getEncoder().encode(imageByte))%>"
                                 alt="Product Image"
                                 width=100
                                 height="100">
                            <% }%>

                        </div>
                        <div class="row m-3 d-flex justify-content-around">
                            <button class="btn btn-danger col-5  ">
                                <a href="/Admin/adminIndex.jsp" class="nav-link">Cancel</a>
                            </button>
                            <button class="btn btn-success col-5" type="submit">
                                Update
                            </button>
                        </div>
                    </div>
                    <script>
                        const imageInput = document.getElementById('pImages');
                        const selectedImagesContainer = document.getElementById('imagePreview');

                        imageInput.addEventListener("change", function () {
                            selectedImagesContainer.innerHTML = ''; // Clear existing preview

                            const files = Array.from(imageInput.files);
                            files.forEach(file => {
                                const img = document.createElement('img');
                                img.src = URL.createObjectURL(file);
                                img.alt = 'Selected Image';
                                img.width = 100;
                                img.height = 100;
                                selectedImagesContainer.appendChild(img);
                            });
                        });

                    </script>

                </form>

            </div>
        </div>
    </div>
</div>

</body>
</html>


