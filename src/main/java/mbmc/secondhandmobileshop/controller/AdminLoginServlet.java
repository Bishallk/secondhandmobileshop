package mbmc.secondhandmobileshop.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mbmc.secondhandmobileshop.models.Brand;
import mbmc.secondhandmobileshop.service.BrandService;

import java.io.IOException;
@WebServlet(name = "adminLogin",urlPatterns = "/adminLogin")
public class AdminLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String adminUsername = req.getParameter("adminUsername").trim();
            String adminPassword = req.getParameter("adminPassword").trim();
            HttpSession session= req.getSession();
            session.setAttribute("aUsername",adminUsername);
            if(adminUsername.equals("Admin")&&(adminPassword.equals("admin"))){
                resp.sendRedirect("/Admin/adminIndex.jsp");
            }else {
                resp.sendRedirect("/Admin/forms/adminLoginForm.jsp");
            }
        }catch (Exception exception){
            System.out.println("Brand Servlet : "+exception);
        }
    }
}
