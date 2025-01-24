package com.cropcart.controller;

import java.io.IOException;

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
                    String former_id=req.getParameter("farmer_id");
                    ProductDAO productDAO = new ProductDAOImp();
                    ProductDetails productDetails = productDAO.getProduct(productId);

                    if (productDetails != null) {
                        // Add the product to the cart
                        Cart cart = new Cart();
                        cart.setProduct_Image(productDetails.getImage());
                        cart.setProduct_Title(productDetails.getTitle());
                        cart.setProduct_Category(productDetails.getCategoty());
                        cart.setCustomer_Id(customer.getCustomer_id());
                        cart.setCustomer_Name(customer.getName());
                        cart.setQuantity(quantity);
                        cart.setProduct_Cost(productDetails.getPrice());
                        cart.setFarmer_Id(former_id);
                        CartDAO cartDAO = new CartDAOImpl();
                        String status = cartDAO.addToCart(cart);

                        if (status.equalsIgnoreCase("success")) {
                            // Store a flag in the session to track the added product
                            session.setAttribute("lastAddedProductId", productId);
                        } else {
                            req.setAttribute("error", "Failed to add the product to the cart.");
                        }
                    } else {
                        req.setAttribute("error", "Product not found.");
                    }

                    // Redirect to the cart page to prevent resubmission
                    resp.sendRedirect("Cart.jsp");
                } catch (NumberFormatException e) {
                    req.setAttribute("error", "Invalid product ID or quantity.");
                    resp.sendRedirect("ViewProductDetails.jsp");
                }
            } 
            else if (req.getParameter("delete") != null) {
                try {
                    CartDAO cartDAO = new CartDAOImpl();
                    int cartId = Integer.parseInt(req.getParameter("cart_id"));
                    int status = cartDAO.deleteCart(cartId); // Delete item from cart

                    if (status > 0) {
                        // Redirect to Cart.jsp after successful deletion
                        resp.sendRedirect("Cart.jsp");
                    } else {
                        // Handle deletion failure
                        req.setAttribute("error", "Failed to delete item from cart.");
                        RequestDispatcher rd = req.getRequestDispatcher("Cart.jsp");
                        rd.forward(req, resp);
                    }
                } catch (NumberFormatException e) {
                    req.setAttribute("error", "Invalid cart ID.");
                    RequestDispatcher rd = req.getRequestDispatcher("Cart.jsp");
                    rd.forward(req, resp);
                }
            }

            else {
                req.setAttribute("error", "Invalid request.");
                resp.sendRedirect("ViewProductDetails.jsp");
            }
        } else {
            resp.sendRedirect("homePage.jsp");
        }
    }
}
