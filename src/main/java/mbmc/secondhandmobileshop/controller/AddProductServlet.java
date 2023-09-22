package mbmc.secondhandmobileshop.controller;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import mbmc.secondhandmobileshop.models.Product;
import mbmc.secondhandmobileshop.service.ImageService;
import mbmc.secondhandmobileshop.service.ProductService;
import jakarta.servlet.http.Part;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@WebServlet(name = "AddProductServlet", urlPatterns = "/addProduct")
@MultipartConfig
public class AddProductServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        try {
            String pName = req.getParameter("pName").trim();
            String pBrand = req.getParameter("pBrand").trim();
            String pColor = req.getParameter("pColor").trim();
            String pMemory = req.getParameter("pMemory").trim();
            int pOriginalPrice = Integer.parseInt(req.getParameter("pOriginalPrice").trim());
            int pDiscountedPrice = Integer.parseInt(req.getParameter("pDiscountedPrice").trim());
            //--------------------------------------------------
            Collection<Part> partCollection = req.getParts();
            //getParts return collection of parts.
            List<Part> imagePartsList = new ArrayList<>();
            /* getting parts from the input field where name="pImages" and then adding
             *  each parts to the imagePartsList
             */
            for (Part part : partCollection) {
                if ("pImages".equals(part.getName())) {
                    imagePartsList.add(part);
                }
            }

            List<byte[]> imageBytesList = new ArrayList<>();
            /*converting parts into bytes and add
             * bytes of each image to imageByesList
             */
            for (Part imagePart : imagePartsList) {
                byte[] imageBytes = imagePart.getInputStream().readAllBytes();
                imageBytesList.add(imageBytes);
            }
            byte[] concatenatedImageBytes = ImageService.concatImageBytes(imageBytesList);
//          ------------------------------------------------------
            int pQuantity = Integer.parseInt(req.getParameter("pQuantity"));
            String pDescription = req.getParameter("pDesc");
            Product product = new Product(pName, pBrand, concatenatedImageBytes, pOriginalPrice, pDiscountedPrice, pQuantity, pMemory, pColor, pDescription);
            String msg = ProductService.insertProduct(product);
            HttpSession session = req.getSession();
            session.setAttribute("message", msg);
            resp.sendRedirect("/Admin/adminIndex.jsp");

        } catch (Exception exception) {
            System.out.println("Add product Servlet : " + exception);
        }
    }
}
