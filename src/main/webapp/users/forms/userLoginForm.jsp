<form method="get" action="${pageContext.request.contextPath}/userLogin" class="" id="login-form">
    <div class="mb-2">
        <label for="userEmail" class="form-label">
            <i class="bi bi-envelope-fill"></i> Email</label>
        <input class="form-control" type="email" name="userEmail" id="userEmail" placeholder="Your Email"
               required="required"/>
    </div>
    <div class="mb-2">
        <label for="password" class="form-label">
            <i class="bi bi-lock-fill"></i>Password</label>
        <input class="form-control" type="password" name="userPass" id="password" placeholder="Password"
               required="required"/>
    </div>
    <div class="mb-2">
        <a href="" class="text-decoration-none text-black"> Forgot Password? </a>
    </div>
    <div class="row m-2 mt-2 d-flex justify-content-around">
        <button class="btn btn-outline-danger col-5 ">
            <a href="${pageContext.request.contextPath}/users/userRegistration.jsp" class="nav-link">Register</a>
        </button>
        <button class="btn btn-success col-6" type="submit">
            Login
        </button>
    </div>
</form>
