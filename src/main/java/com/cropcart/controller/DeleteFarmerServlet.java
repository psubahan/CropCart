
package com.cropcart.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.cropcart.DAO.FarmerDAO;
import com.cropcart.DAO.FarmerDAOImp;

@WebServlet("/DeleteFarmerServlet")
public class DeleteFarmerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            // Retrieve the customer ID from the request
            String farmerIdParam = request.getParameter("farmer_id");

            if (farmerIdParam != null && !farmerIdParam.isEmpty()) {
                int farmerId = Integer.parseInt(farmerIdParam);

                // Create a DAO instance
                FarmerDAO farmerDAO = new FarmerDAOImp();

                // Perform the delete operation
                String status = farmerDAO.deleteFarmer(farmerId);

                if ("success".equalsIgnoreCase(status)) {
                    // Redirect to the main page with a success message
                    request.setAttribute("successMessage", "Farmer deleted successfully.");
                } else {
                    // Redirect to the main page with an error message
                    request.setAttribute("errorMessage", "Farmer not found or could not be deleted.");
                }
            } else {
                // Invalid customer ID
                request.setAttribute("errorMessage", "Invalid farmer ID.");
            }

            // Forward back to the customer records page
            request.getRequestDispatcher("FarmerRecords.jsp").forward(request, response);

        } catch (Exception e) {
            // Handle any unexpected exceptions
            e.printStackTrace();
            request.setAttribute("errorMessage", "Unexpected error occurred. Please try again later.");
            request.getRequestDispatcher("FarmerRecords.jsp").forward(request, response);
        }
    }
}
