package com.cropcart.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.cropcart.DAO.FarmerDAO;
import com.cropcart.DAO.FarmerDAOImp;
import com.cropcart.DAO.CustomerDAO;
import com.cropcart.DAO.CustomerDAOImp;
import com.cropcart.DAO.AdminDAO;
import com.cropcart.DAO.AdminDAOImp;
import com.cropcart.dto.Admin;
import com.cropcart.dto.Customer;
import com.cropcart.dto.Farmer;

@WebServlet("/changePassword")
public class ChangePassword extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ChangePassword() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        Farmer farmer = (Farmer) session.getAttribute("farmer");
        Customer customer = (Customer) session.getAttribute("customer");
        Admin admin = (Admin) session.getAttribute("Admin");

        // Ensure at least one user is logged in
        if (farmer == null && customer == null && admin == null) {
            request.setAttribute("passwordFailed", "You must be logged in to change your password.");
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
            return;
        }

        String email = request.getParameter("email");
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        // Validate form input
        if (email == null || oldPassword == null || newPassword == null || confirmPassword == null) {
            request.setAttribute("passwordFailed", "All fields are required.");
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
            return;
        }

        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("passwordFailed", "New password and confirmation do not match.");
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
            return;
        }

        String status = "";
        
        // Check which user is logged in and call the respective DAO
        if (farmer != null) {
            FarmerDAO farmerDAO = new FarmerDAOImp();
            status = farmerDAO.updatePassword(email, oldPassword, newPassword);
        } else if (customer != null) {
            CustomerDAO customerDAO = new CustomerDAOImp();
            status = customerDAO.updatePassword(email, oldPassword, newPassword);
        } else if (admin != null) {
            AdminDAO adminDAO = new AdminDAOImp();
            status = adminDAO.updatePassword(email, oldPassword, newPassword);
        }

        // Handle the status message from the DAO
        if ("PasswordUpdated".equals(status)) {
            request.setAttribute("passwordUpdated", "Your password has been updated successfully.");
        } else if ("IncorrectOldPassword".equals(status)) {
            request.setAttribute("passwordFailed", "Old password is incorrect.");
        } else if ("EmailNotFound".equals(status)) {
            request.setAttribute("passwordFailed", "Email not found.");
        } else {
            request.setAttribute("passwordFailed", "An error occurred while updating the password.");
        }

        // Forward to the JSP page
        request.getRequestDispatcher("changePassword.jsp").forward(request, response);
    }
   }

