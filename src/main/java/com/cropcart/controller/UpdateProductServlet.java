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

@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("product_id"));
        String title = request.getParameter("title");
        String category = request.getParameter("category");
        String quantity = request.getParameter("quantity");
        String price = request.getParameter("price");
        String description = request.getParameter("description");
        String status = request.getParameter("status");

        ProductDAO pdao = new ProductDAOImp();
        ProductDetails product = new ProductDetails();

        product.setProduct_id(productId);
        product.setTitle(title);
        product.setCategoty(category);
        product.setQuantity(Integer.parseInt(quantity));
        product.setPrice(price);
        product.setDescription(description);
        product.setStatus(status);

        boolean isUpdated = pdao.updateProduct(product);

        if (isUpdated) {
            response.sendRedirect("ViewProductsByFID.jsp");
        } else {
            request.setAttribute("failure", "Failed To Update The Product");
            RequestDispatcher rd=request.getRequestDispatcher("EditProductDetails");
            rd.forward(request, response);
        }
    }
}

