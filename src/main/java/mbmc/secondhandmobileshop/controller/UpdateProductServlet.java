package mbmc.secondhandmobileshop.controller;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import mbmc.secondhandmobileshop.models.Product;
import mbmc.secondhandmobileshop.service.ImageService;
import mbmc.secondhandmobileshop.service.ProductService;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@WebServlet(name = "UpdateProductServlet", urlPatterns = "/updateProduct")
@MultipartConfig
public class UpdateProductServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        try {
            int pId = Integer.parseInt(req.getParameter("pId"));
            String pName = req.getParameter("pName").trim();
            String pBrand = req.getParameter("pBrand").trim();
            String pColor = req.getParameter("pColor").trim();
            String pMemory = req.getParameter("pMemory").trim();
            int pOriginalPrice = Integer.parseInt(req.getParameter("pOriginalPrice").trim());
            int pDiscountedPrice = Integer.parseInt(req.getParameter("pDiscountedPrice").trim());
            //---------------image section--------------------------
            Collection<Part> partCollection = req.getParts();
            List<Part> imagePartsList = new ArrayList<>();
            byte[] concatenatedImageBytes;
            //getting parts from the input field and then adding each parts to the imagePartsList
            for (Part part : partCollection) {
                if ("pImages".equals(part.getName())) {
                    imagePartsList.add(part);
                }
            }
            //using 10 because update form has 10 input fields
            if (partCollection.size() >= 11) {
                List<byte[]> imageBytesList = new ArrayList<>();
                // converting parts into bytes and add bytes of each image to imageByesList
                for (Part imagePart : imagePartsList) {
                    byte[] imageBytes = imagePart.getInputStream().readAllBytes();
                    imageBytesList.add(imageBytes);
                }
                concatenatedImageBytes = ImageService.concatImageBytes(imageBytesList);
            } else {
                concatenatedImageBytes = ProductService.getProductById2(pId).getAllImageBytes();
            }
            //------------------------------------------------------
            int pQuantity = Integer.parseInt(req.getParameter("pQuantity"));
            String pDescription = req.getParameter("pDesc");
            Product product = new Product(pId,pName, pBrand, concatenatedImageBytes, pOriginalPrice, pDiscountedPrice, pQuantity, pMemory, pColor, pDescription);
            String msg = ProductService.updateProduct(product);
            HttpSession session = req.getSession();
            session.setAttribute("message", msg);
            resp.sendRedirect("/Admin/adminIndex.jsp");

        } catch (Exception ex) {
            System.out.println("Update product" + ex);
        }
    }
}
