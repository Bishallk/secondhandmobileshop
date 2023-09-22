<nav class=" navbar navbar-dark navbar-expand-lg bg-dark"
     style="background-color: #D2302D !important;">
    <div class="container-fluid">
        <%--offcanvas toggler--%>
        <button class="navbar-toggler me-1 d-lg-block"
                type="button"
                data-bs-toggle="offcanvas"
                data-bs-target="#side-navbar"
                aria-controls="side-navbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand fw-bold me-auto ms-lg-5 ps-lg-1"
           href="#">
            SH MOBILE SHOP
        </a>

        <button class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent"
                aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse"
             id="navbarSupportedContent">
            <form class="d-flex ms-auto me-lg-5 pe-lg-3"
                  role="search">
                <div class="input-group my-3 my-lg-0">
                    <input type="text"
                           class="form-control"
                           placeholder="Search"
                           aria-label="Search"
                           aria-describedby="search-btn">
                    <button class="btn btn-success"
                            type="submit"
                            id="search-btn">
                        <i class="bi bi-search"></i>
                    </button>
                </div>
            </form>
            <ul class="navbar-nav  mb-2 mb-lg-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle "
                       href="#"
                       role="button"
                       data-bs-toggle="dropdown"
                       aria-expanded="false">
                        <i class="bi bi-person-fill"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end">


                        <li><a class="dropdown-item text-danger"
                               href="../index.jsp">www.shmobileshop.com</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item"
                               href="index.jsp">logout</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>