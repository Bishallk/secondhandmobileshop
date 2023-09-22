package mbmc.secondhandmobileshop.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mbmc.secondhandmobileshop.models.User;
import mbmc.secondhandmobileshop.service.UserService;

import java.io.IOException;

@WebServlet(name = "userRegisterServlet", urlPatterns = "/userRegister")
public class AddUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uName = request.getParameter("name");
        String uEmail = request.getParameter("email");
        String uPass = request.getParameter("pass");
        long uContact = Long.parseLong(request.getParameter("contact"));
        String uAddress = request.getParameter("address");
        String msg;
        try {
            User user = new User(uName, uEmail, uPass, uContact, uAddress);
            msg = UserService.insertUser(user);
            HttpSession session = request.getSession();
            session.setAttribute("message", msg);
            response.sendRedirect("/users/userLogin.jsp");

        } catch (Exception e) {
            System.out.println("Add user servlet: " + e);
        }

    }

}

