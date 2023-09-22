package mbmc.secondhandmobileshop.controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mbmc.secondhandmobileshop.models.Product;
import mbmc.secondhandmobileshop.service.ProductService;

import java.util.List;

@WebServlet(name = "displayProduct", urlPatterns = "/displayProduct")
public class DisplayProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
        try {
            List<Product> productsList = ProductService.getProductList();
            req.setAttribute("productsList", productsList);
            req.getRequestDispatcher("displayProductsList.jsp").forward(req, resp);
        } catch (Exception ex) {
            System.out.println("Display product servlet" + ex);
        }
    }
}
