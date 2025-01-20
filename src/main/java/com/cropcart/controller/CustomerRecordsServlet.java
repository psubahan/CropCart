package com.cropcart.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.cropcart.DAO.CustomerDAO;
import com.cropcart.DAO.CustomerDAOImp;
import com.cropcart.dto.Customer;

@WebServlet("/CustomerRecordsServlet")

public class CustomerRecordsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");

        try {
            // Retrieve parameters from the request
            String customerIdParam = request.getParameter("customer_id");
            String customerName = request.getParameter("name");

            if (customerIdParam != null && !customerIdParam.isEmpty() && customerName != null && !customerName.isEmpty()) {
                int customerId = Integer.parseInt(customerIdParam);

                // DAO instance
                CustomerDAO customerDAO = new CustomerDAOImp();

                // Get customer details
                Customer customer = customerDAO.getCustomer1(customerId, customerName);

                // Check if customer exists
                if (customer != null) {
                    // Set the customer object as an attribute to the request
                    request.setAttribute("customer", customer);
                } else {
                    request.setAttribute("errorMessage", "No customer found with the provided ID and name.");
                }
            } else {
                // Invalid or missing parameters
                request.setAttribute("errorMessage", "Invalid input. Please provide a valid customer ID and name.");
            }

            // Forward the request to the JSP page
            RequestDispatcher dispatcher = request.getRequestDispatcher("customerrecords.jsp");
            dispatcher.forward(request, response);

        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error: Invalid customer ID format.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("customerrecords.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Unexpected error occurred. Please try again later.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("customerrecords.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}