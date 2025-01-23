package com.cropcart.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.cropcart.DAO.CartDAO;
import com.cropcart.DAO.CartDAOImpl;
import com.cropcart.DAO.ProductDAO;
import com.cropcart.DAO.ProductDAOImp;
import com.cropcart.dto.Cart;
import com.cropcart.dto.Customer;
import com.cropcart.dto.ProductDetails;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addToCart")
public class AddToCart extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Retrieve the existing session
        HttpSession session = req.getSession(false);
        
        // Ensure the session and customer object are valid
        if (session != null && session.getAttribute("customer") != null) {
            Customer customer = (Customer) session.getAttribute("customer");
            
            // Check if "addtocart" parameter exists
            if (req.getParameter("addToCart") != null) {
                try {
                    int productId = Integer.parseInt(req.getParameter("product_id"));
                    String quantity = req.getParameter("quantity");
                    // Fetch product details using the ProductDAO
                    ProductDAO productDAO = new ProductDAOImp();
                    ProductDetails productDetails = productDAO.getProduct(productId);
                      if (productDetails != null) {
                        // Populate Cart object
                        Cart cart = new Cart();
                        cart.setProduct_Image(productDetails.getImage());
                        cart.setProduct_Title(productDetails.getTitle());
                        cart.setProduct_Category(productDetails.getCategoty());
                        cart.setCustomer_Id(customer.getCustomer_id());
                        cart.setCustomer_Name(customer.getName());
                        cart.setQuantity(quantity);
                        cart.setProduct_Cost(productDetails.getPrice());
                        
                        // Add cart item to the database
                        CartDAO cartDAO = new CartDAOImpl();
                        String status = cartDAO.addToCart(cart);
                        
                        // Redirect based on the operation result
                        if (status.equalsIgnoreCase("success")) {
                            RequestDispatcher dispatcher = req.getRequestDispatcher("Cart.jsp");
                            dispatcher.forward(req, resp);
                        } else {
                            req.setAttribute("error", "Failed to add the product to the cart.");
                            RequestDispatcher dispatcher = req.getRequestDispatcher("ViewProductDetails.jsp");
                            dispatcher.forward(req, resp);
                        }
                    } else {
                        // Product not found
                        req.setAttribute("error", "Product not found.");
                        RequestDispatcher dispatcher = req.getRequestDispatcher("ViewProductDetails.jsp");
                        dispatcher.forward(req, resp);
                    }
                } catch (NumberFormatException e) {
                    req.setAttribute("error", "Invalid product ID or quantity.");
                    RequestDispatcher dispatcher = req.getRequestDispatcher("ViewProductDetails.jsp");
                    dispatcher.forward(req, resp);
                }
            } else {
                // No "addtocart" parameter present
                req.setAttribute("error", "Invalid request.");
                RequestDispatcher dispatcher = req.getRequestDispatcher("ViewProductDetails.jsp");
                dispatcher.forward(req, resp);
            }
        } else {
            // If session is invalid or customer is not logged in
            resp.sendRedirect("homePage.jsp");
        }
    }
}
