package com.cropcart.controller;

import java.io.IOException;
import java.util.Date;

import com.cropcart.DAO.OrdersDAOIpml;
import com.cropcart.dto.Orders;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/RequestServlet")
public class RequestProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Retrieve form data from the request
        String paymentMode = req.getParameter("paymentMode");
        String deliveryAddress = req.getParameter("deliveryAddress");
        String state = req.getParameter("state");
        String city = req.getParameter("city");
        String farmerId = req.getParameter("farmerid");
        String cartId = req.getParameter("cartId");
        String customerId = req.getParameter("customerid");
        String customerName = req.getParameter("customerName");
        String productName=req.getParameter("ProductName");
        String productImage=req.getParameter("productImage");
        
        // Create an Orders object to store the order details
        Orders order = new Orders();
        order.setPaymet_mode(paymentMode);
        order.setOrder_Address(deliveryAddress);
        order.setOrder_State(state);
        order.setOrder_city(city);
        order.setFarmer_id(farmerId);
        order.setCart_Id(Integer.parseInt(cartId));
        order.setCustomer_Id(Integer.parseInt(customerId));
        order.setCustomer_Name(customerName);
        order.setStatus("Pending"); // Set default status for new orders
        order.setProduct_Image(productImage);
        order.setProduct_Name(productName);

        // Save the order to the database using DAO
        OrdersDAOIpml ordersDAO = new OrdersDAOIpml();
        String result = ordersDAO.addOrders(order);

        // Redirect or forward based on the result of the operation
        if ("success".equals(result)) {
            // Redirect to confirmation page if the order was placed successfully
            resp.sendRedirect("RequestedProducts.jsp");
        } else {
            // If the operation failed, display an error message
            req.setAttribute("errorMessage", "Failed to place the order. Please try again.");
            req.getRequestDispatcher("RequestingProducts.jsp").forward(req, resp);
        }
    }
}
