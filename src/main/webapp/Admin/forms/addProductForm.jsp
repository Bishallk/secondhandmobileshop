<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="mbmc.secondhandmobileshop.service.BrandService" %>
<%@ page import="mbmc.secondhandmobileshop.models.Brand" %>
<%@ page import="java.util.ArrayList" %>
<%--java code to show brand list in select menu of addProduct form--%>
<%
    ArrayList<Brand> brandList = new ArrayList<>();
    try {
        brandList = BrandService.getBrandList();
    } catch (Exception e) {
        System.out.println("addProductForm :" + e);
    }
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible"
          content="ie=edge">
    <title>Add Product </title>
    <jsp:include page="/components/common_css_js.jsp"/>
</head>
<body class="bg-info-subtle">

<div class="col-md-6 col-lg-5 col-sm-10 ms-auto me-auto mt-2 bg">
    <div class="card">
        <div class="card-header bg-warning text-white">
            Add Product Form
        </div>
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/addProduct"
                  method="post"
                  enctype="multipart/form-data">
                <div class="d-block">
                    <div class="row d-flex justify-content-around">
                        <div class="mb-3 col-6">
                            <label for="pName"
                                   class="form-label">Product Name</label>
                            <input name="pName"
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
                                        selected
                                        class="text-bg-danger">Select Brand
                                </option>
                                <%--using foreach loop to show brand list--%>
                                <%for (Brand brand : brandList) { %>
                                <option value="<%=brand.getName()%>">
                                    <%--prints brand name--%>
                                    <%=brand.getName()%>
                                </option>
                                <%--closing bracket of for loop--%>
                                <% }%>
                                <%--------------------------------%>
                            </select>
                        </div>
                    </div>
                    <div class="row d-flex justify-content-around">
                        <div class="mb-3 col-6 ">
                            <label for="pColor"
                                   class="form-label">Color</label>
                            <input name="pColor"
                                   type="text"
                                   class="form-control"
                                   id="pColor"
                                   placeholder="Product color"
                                   required>
                        </div>
                        <div class="mb-3 col-6">
                            <label for="pMemory"
                                   class="form-label">Memory</label>
                            <input name="pMemory"
                                   type="text"
                                   class="form-control"
                                   id="pMemory"
                                   placeholder="Eg. 4/128 Gb"
                                   required>
                        </div>
                    </div>

                    <div class="row d-flex justify-content-around">
                        <div class="mb-3 col-6 ">
                            <label for="pOriginalPrice"
                                   class="form-label">Original Price</label>
                            <input name="pOriginalPrice"
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
                            <input name="pDiscountedPrice"
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
                                  required></textarea>
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
                                   multiple
                                   required>
                        </div>
                        <div class="mb-3 col-5">
                            <label for="pQuantity"
                                   class="form-label">Quantity</label>
                            <input name="pQuantity"
                                   type="number"
                                   class="form-control"
                                   min="0"
                                   id="pQuantity"
                                   placeholder="Quantity"
                                   required>
                        </div>
                    </div>
                    <div id="imagePreview">

                    </div>

                    <div class="row m-3 d-flex justify-content-around">
                        <button class="btn btn-danger col-5  ">
                            <a href="/Admin/adminIndex.jsp"
                               class="nav-link">Cancel</a>
                        </button>
                        <button class="btn btn-success col-5"
                                type="submit">
                            Add
                        </button>
                    </div>

                </div>

                <script>
                    // preview image after selecting
                    const pImageInputField = document.getElementById('pImages');
                    const pImagePreview = document.getElementById('imagePreview');

                    pImageInputField.addEventListener("change", function () {
                        pImagePreview.innerHTML = ''; // Clear existing preview

                        const files = Array.from(pImageInputField.files);
                        files.forEach(file => {
                            const img = document.createElement('img');
                            img.src = URL.createObjectURL(file);
                            img.alt = 'Selected Image';
                            img.width = 100; // Set the desired width
                            img.height = 100; // Set the desired height
                            pImagePreview.appendChild(img);
                        });
                    });
                </script>
            </form>

        </div>
    </div>
</div>


</body>
</html>

