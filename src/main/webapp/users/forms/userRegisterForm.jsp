<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form method="post" action="/userRegister" class="" id="register-form">
    <div class="mb-2">
        <label for="name" class="form-label">
            <i class="bi bi-person-fill"></i> Username
        </label>
        <input type="text" name="name" id="name" class="form-control" placeholder="Your Name" required/>
    </div>
    <div class="mb-2">
        <label for="email" class="form-label">
            <i class="bi bi-envelope-fill"></i> Email</label>
        <input class="form-control" type="email" name="email" id="email" placeholder="Your Email" required/>
    </div>
    <div class="mb-2">
        <label for="pass" class="form-label"><i class="bi bi-lock-fill"></i> Password</label>
        <input class="form-control" type="password" name="pass" id="pass" placeholder="Password" required/>
    </div>
    <div class="mb-2">
        <label class="form-label" for="re_pass">
            <i class="bi bi-lock-fill"></i> Confirm Password</label>
        <input class="form-control" type="password" name="re_pass" id="re_pass" placeholder="Repeat your password" required/>
    </div>
    <div class="mb-2">
        <label class="form-label" for="contact">
            <i class="bi bi-telephone-fill"></i> Contact No.
        </label>
        <input class="form-control" type="text" name="contact" id="contact" placeholder="Contact no" required/>
    </div>
    <div class="mb-2">
        <label class="form-label" for="address">
            <i class="bi bi-house-fill"></i> Address
        </label>
        <input class="form-control" type="text" name="address" id="address" placeholder="Address" required/>
    </div>
    <div class="mb-2">
        <input type="checkbox" name="agree-term" id="agree-term" class="form-check-input" required/>
        <label for="agree-term" class="form-check-label">I
            agree all statements in <a href="#" class="term-service">Terms of service</a></label>
    </div>
    <div class="row m-3 d-flex justify-content-around">
        <button class="btn btn-outline-danger col-5  ">
            <a href="${pageContext.request.contextPath}/users/userLogin.jsp" class="nav-link">Login</a>
        </button>
        <button class="btn btn-success col-6" type="submit">
            Register
        </button>
    </div>
</form>

