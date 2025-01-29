package com.cropcart.controller;

import java.io.IOException;

import com.cropcart.DAO.OrderDAO;
import com.cropcart.DAO.OrdersDAOIpml;
import com.cropcart.dto.Orders;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/farmeraction")
public class FarmerAction extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String Aaction = req.getParameter("accept");
        String Daction = req.getParameter("decline");
        String orderIdParam = req.getParameter("orderid");
        System.out.println(Daction);
        if (Aaction != null && Aaction.equals("Accept") && orderIdParam != null) {
            try {
                int orderId = Integer.parseInt(orderIdParam);
                OrderDAO odao = new OrdersDAOIpml();
                String result = odao.updateOrderForAccept(orderId);

                if (result.equals("success")) {
                    req.setAttribute("success", "Order updated successfully.");
                } else {
                    req.setAttribute("error", "Failed to update order.");
                }
            } catch (NumberFormatException e) {
                req.setAttribute("error", "Invalid order ID.");
            } catch (Exception e) {
                req.setAttribute("error", "An unexpected error occurred.");
            }
        }
        else if (Daction != null && Daction.equals("Decline") && orderIdParam != null) {
            try {
                int orderId = Integer.parseInt(orderIdParam);
                String declineReason = req.getParameter("declineReason"); // Get decline reason
                OrderDAO odao = new OrdersDAOIpml();
                System.out.println(declineReason);
                // Assuming you update the order status with a reason
                String isDeclined = odao.updateOrderForDecline(orderId, declineReason);

                if (isDeclined.equals("success")) {
                    req.setAttribute("success", "Order declined successfully.");
                } else {
                    req.setAttribute("error", "Failed to decline the order. Please try again.");
                }
            } catch (Exception e) {
                req.setAttribute("error", "Invalid order ID or server issue.");
                e.printStackTrace();
            }
            req.getRequestDispatcher("requestedOrders.jsp").forward(req, resp);
        }

        else {
            req.setAttribute("error", "Invalid action or missing parameters.");
        }

        // Forward back to the requestedOrders.jsp page
        RequestDispatcher rd = req.getRequestDispatcher("reuqestedOrders.jsp");
        rd.forward(req, resp);
    }
}
