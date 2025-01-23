package com.cropcart.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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
        HttpSession session = req.getSession(false);

        if (session != null && session.getAttribute("customer") != null) {
            Customer customer = (Customer) session.getAttribute("customer");

            if (req.getParameter("addToCart") != null) {
                try {
                    int productId = Integer.parseInt(req.getParameter("product_id"));
                    String quantity = req.getParameter("quantity");

                    ProductDAO productDAO = new ProductDAOImp();
                    ProductDetails productDetails = productDAO.getProduct(productId);

                    if (productDetails != null) {
                        CartDAO cartDAO = new CartDAOImpl();

                        // Check if the product is already in the cart
                        List<Cart> cartItems = cartDAO.getCartInfo(customer.getCustomer_id());
                        boolean productExists = cartItems.stream()
                                .anyMatch(cart -> cart.getProduct_Title().equals(productDetails.getTitle()));

                        if (!productExists) {
                            // Add new product to cart
                            Cart cart = new Cart();
                            cart.setProduct_Image(productDetails.getImage());
                            cart.setProduct_Title(productDetails.getTitle());
                            cart.setProduct_Category(productDetails.getCategoty());
                            cart.setCustomer_Id(customer.getCustomer_id());
                            cart.setCustomer_Name(customer.getName());
                            cart.setQuantity(quantity);
                            cart.setProduct_Cost(productDetails.getPrice());

                            String status = cartDAO.addToCart(cart);

                            if (!status.equalsIgnoreCase("success")) {
                                req.setAttribute("error", "Failed to add the product to the cart.");
                            }
                        } else {
                            req.setAttribute("error", "Product already exists in the cart.");
                        }
                    } else {
                        req.setAttribute("error", "Product not found.");
                    }

                    // Redirect to the cart page after adding the product
                    resp.sendRedirect("Cart.jsp");
                } catch (NumberFormatException e) {
                    req.setAttribute("error", "Invalid product ID or quantity.");
                    resp.sendRedirect("ViewProductDetails.jsp");
                }
            } else {
                req.setAttribute("error", "Invalid request.");
                resp.sendRedirect("ViewProductDetails.jsp");
            }
        } else {
            resp.sendRedirect("homePage.jsp");
        }
    }
}
