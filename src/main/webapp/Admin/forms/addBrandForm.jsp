<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible"
          content="ie=edge">
    <title>Add Brand </title>
    <jsp:include page="/components/common_css_js.jsp"/>
</head>
<body class="bg-info-subtle">
<div>
    <div class="col-md-6 col-lg-4 col-sm-10 ms-auto me-auto mt-5 bg">
        <div class="card">
            <div class="card-header bg-warning">
                Add Brand Form
            </div>
            <div class="card-body">
                <form action="${pageContext.request.contextPath}/brandServlet"
                      method="post">
                    <input type="hidden"
                           value="insert"
                           name="operation">
                    <div class="d-block">
                        <div class="m-3">
                            <label for="brandName"
                                   class="form-label">Brand Name</label>
                            <input type="text"
                                   name="brandName"
                                   class="form-control"
                                   placeholder="Enter Brand Name"
                                   id="brandName"
                                   autocomplete="off"
                                   required>

                        </div>
                        <div class="m-3">
                            <label for="brandDesc"
                                   class="form-label">Description</label>
                            <textarea name="brandDesc"
                                      class="form-control h-25"
                                      id="brandDesc"
                                      placeholder="Brand Description"
                                      required></textarea>
                        </div>
                        <div class="row m-3 d-flex justify-content-around">
                            <button class="btn btn-danger col-5">
                                <a href="/Admin/adminIndex.jsp" class="nav-link">Cancel</a>
                            </button>
                            <button class="btn btn-success col-5" type="submit">
                                Add
                            </button>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
