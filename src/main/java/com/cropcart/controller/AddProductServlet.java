package com.cropcart.controller;

import java.io.IOException;

import com.cropcart.DAO.ProductDAO;
import com.cropcart.DAO.ProductDAOImp;
import com.cropcart.dto.ProductDetails;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AddProduct")
public class AddProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String category = request.getParameter("category");
        String title = request.getParameter("title");
        String image = request.getParameter("image");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String quantityType = request.getParameter("quantityType");
        String description = request.getParameter("description");
        String price = request.getParameter("price");
        String status = request.getParameter("status");

        try {
            // Store the product in the database (replace with actual database code)
            // Simulated successful storage
        	ProductDAO pdao=new ProductDAOImp();
            ProductDetails po=new ProductDetails();
            po.setCategoty(category);
            po.setTitle(title);
            po.setImage(image);
            po.setQuantity(quantity);
            po.setQuantity_type(quantityType);
            po.setDescription(description);
            po.setPrice(price);
            po.setStatus(status);
            boolean isAdded=pdao.addProduct(po);

            if (isAdded) {
                request.setAttribute("message", "Product added successfully!");
            } else {
                request.setAttribute("message", "Failed to add product.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "An error occurred while adding the product.");
        }

        // Forward back to the same page to display the message
        request.getRequestDispatcher("addProduct.jsp").forward(request, response);
    }
}

