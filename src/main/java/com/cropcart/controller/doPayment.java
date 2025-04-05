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

@WebServlet("/doPayment2")
public class doPayment extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public doPayment() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int account_number = Integer.parseInt(request.getParameter("customerAccNo"));
        int farmerId = Integer.parseInt(request.getParameter("id"));
        int customerId = Integer.parseInt(request.getParameter("cid"));
        int cost = Integer.parseInt(request.getParameter("cost"));

        CustomerDAO cdao = new CustomerDAOImp();
        Customer c = cdao.getCustomerByAccountNumber(account_number);

        request.setAttribute("id", farmerId);
        request.setAttribute("cid", customerId);
        request.setAttribute("cost", cost);

        if (c != null) {
            request.setAttribute("success", "Payment Successful! ₹" + cost + " has been paid.");
        } else {
            request.setAttribute("failure", "Payment Failed! Please enter a valid account number.");
        }

        RequestDispatcher rd = request.getRequestDispatcher("doPayment.jsp");
        rd.forward(request, response);
    }
}
