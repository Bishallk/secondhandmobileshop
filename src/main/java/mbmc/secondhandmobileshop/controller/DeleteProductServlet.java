package mbmc.secondhandmobileshop.controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mbmc.secondhandmobileshop.service.ProductService;
@WebServlet(name = "DeleteProductServlet",urlPatterns = "/deleteProduct")
public class DeleteProductServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        try {
            int deleteId = Integer.parseInt(req.getParameter("deleteIdInput"));
            String msg = ProductService.deleteProduct(deleteId);
            HttpSession session = req.getSession();
            session.setAttribute("message", msg);
            resp.sendRedirect("/Admin/adminIndex.jsp");
        } catch (Exception ex) {
            System.out.println("DeleteProduct Servlet" + ex);
        }
    }
}
