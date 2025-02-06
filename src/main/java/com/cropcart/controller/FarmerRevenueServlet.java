package com.cropcart.controller;
import com.cropcart.DAO.OrderDAO;
import com.cropcart.DAO.OrdersDAOIpml;
import com.cropcart.db.dbConnection;
import com.cropcart.dto.Farmer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/FarmerRevenueServlet")
public class FarmerRevenueServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        int farmerId = Integer.parseInt(request.getParameter("farmerId"));
        OrderDAO orderDAO = new OrdersDAOIpml();
        
        double revenue = orderDAO.getTotalRevenueByFarmer(farmerId);
        
        request.setAttribute("revenue", revenue);
        request.getRequestDispatcher("FarmerRevenue.jsp").forward(request, response);
    }
}