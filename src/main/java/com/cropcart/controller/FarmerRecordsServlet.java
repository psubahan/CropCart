package com.cropcart.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.cropcart.DAO.FarmerDAO;
import com.cropcart.DAO.FarmerDAOImp;
import com.cropcart.dto.Farmer;

@WebServlet("/FarmerRecordsServlet")

public class FarmerRecordsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");

        try {
            // Retrieve parameters from the request
            String farmerIdParam = request.getParameter("farmer_id");
            String farmerName = request.getParameter("name");

            if (farmerIdParam != null && !farmerIdParam.isEmpty() && farmerName != null && !farmerName.isEmpty()) {
                int farmerId = Integer.parseInt(farmerIdParam);

                // DAO instance
                FarmerDAO farmerDAO = new FarmerDAOImp();

                // Get customer details
                Farmer farmer = farmerDAO.getFarmer1(farmerId, farmerName); 

                // Check if customer exists
                if (farmer != null) {
                    // Set the customer object as an attribute to the request
                    request.setAttribute("farmer", farmer);
                } else {
                    request.setAttribute("errorMessage", "No customer found with the provided ID and name.");
                }
                }
            else {
                // Invalid or missing parameters
                request.setAttribute("errorMessage", "Invalid input. Please provide a valid customer ID and name.");
            }

            // Forward the request to the JSP page
            RequestDispatcher dispatcher = request.getRequestDispatcher("farmerrecords.jsp");
            dispatcher.forward(request, response);

        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error: Invalid customer ID format.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("farmerrecords.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Unexpected error occurred. Please try again later.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("farmerrecords.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}