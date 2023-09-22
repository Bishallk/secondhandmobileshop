package mbmc.secondhandmobileshop.controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mbmc.secondhandmobileshop.models.Brand;
import mbmc.secondhandmobileshop.service.BrandService;

@WebServlet(name = "BrandServlet", urlPatterns = "/brandServlet")
public class BrandServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)  {
       try {
           String brandName = req.getParameter("brandName").trim();
           String brandDesc = req.getParameter("brandDesc").trim();
           Brand brand = new Brand(brandName, brandDesc);
           String msg= BrandService.insertBrand(brand);
           HttpSession session= req.getSession();
           session.setAttribute("message",msg);
           resp.sendRedirect("/Admin/adminIndex.jsp");
       }catch (Exception exception){
           System.out.println("Brand Servlet : "+exception);
       }
    }
}
