package com.cropcart.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.cropcart.DAO.CustomerDAO;
import com.cropcart.DAO.CustomerDAOImp;

@WebServlet("/DeleteCustomerServlet")
public class DeleteCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            // Retrieve the customer ID from the request
            String customerIdParam = request.getParameter("customer_id");

            if (customerIdParam != null && !customerIdParam.isEmpty()) {
                int customerId = Integer.parseInt(customerIdParam);

                // Create a DAO instance
                CustomerDAO customerDAO = new CustomerDAOImp();

                // Perform the delete operation
                String status = customerDAO.deleteCustomer(customerId);

                if ("success".equalsIgnoreCase(status)) {
                    // Redirect to the main page with a success message
                    request.setAttribute("successMessage", "Customer deleted successfully.");
                } else {
                    // Redirect to the main page with an error message
                    request.setAttribute("errorMessage", "Customer not found or could not be deleted.");
                }
            } else {
                // Invalid customer ID
                request.setAttribute("errorMessage", "Invalid customer ID.");
            }

            // Forward back to the customer records page
            request.getRequestDispatcher("customerrecords.jsp").forward(request, response);

        } catch (Exception e) {
            // Handle any unexpected exceptions
            e.printStackTrace();
            request.setAttribute("errorMessage", "Unexpected error occurred. Please try again later.");
            request.getRequestDispatcher("customerrecords.jsp").forward(request, response);
        }
    }
}
