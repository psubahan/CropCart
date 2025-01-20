package com.cropcart.controller;

import java.io.IOException;

import com.cropcart.DAO.CustomerDAO;
import com.cropcart.DAO.CustomerDAOImp;
import com.cropcart.DAO.FarmerDAO;
import com.cropcart.DAO.FarmerDAOImp;
import com.cropcart.dto.Customer;
import com.cropcart.dto.Farmer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String message;

        try {
            if ("farmer".equals(request.getParameter("farmer"))) {
                message = FarmerRegistration(request);
            } else if ("customer".equals(request.getParameter("customer"))) {
                message = CustomerRegistration(request);
            } else {
                message = "Invalid user type.";
            }
        } catch (NumberFormatException e) {
            message = "Invalid input format for numeric fields.";
            e.printStackTrace();
        } catch (Exception e) {
            message = "An error occurred during registration. Please try again.";
            e.printStackTrace();
        }

        request.setAttribute("message", message);
        RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
        rd.forward(request, response);
    }

    private String FarmerRegistration(HttpServletRequest request) throws Exception {
        // Extract farmer-specific fields
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm-password");
        String address = request.getParameter("address");
        String state = request.getParameter("state");
        String city = request.getParameter("city");
        String pincodeStr = request.getParameter("pincode");
        String mobileStr = request.getParameter("mobile");
        String bankName = request.getParameter("bank-name");
        String branch = request.getParameter("branch");
        String ifsc = request.getParameter("ifsc");
        String accountNumberStr = request.getParameter("account-number");

        if (!password.equals(confirmPassword)) {
            return "Passwords do not match.";
        }

        // Validate and parse numeric fields
        long phone = Long.parseLong(mobileStr);
        int pincode = Integer.parseInt(pincodeStr);
        long accountNumber = Long.parseLong(accountNumberStr);

        // Create Farmer object
        Farmer farmer = new Farmer();
        farmer.setName(name);
        farmer.setEmail(email);
        farmer.setPhone(phone);
        farmer.setPassword(password);
        farmer.setAddress(address);
        farmer.setState(state);
        farmer.setCity(city);
        farmer.setPincode(pincode);
        farmer.setBank_name(bankName);
        farmer.setBranch(branch);
        farmer.setIfsc(ifsc);
        farmer.setAcc_no(accountNumber);

        // Save to database
        FarmerDAO farmerDAO = new FarmerDAOImp();
        return farmerDAO.addFarmer(farmer);
    }

    private String CustomerRegistration(HttpServletRequest request) throws Exception {
        // Extract customer-specific fields
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String address = request.getParameter("address");
        String state = request.getParameter("state");
        String city = request.getParameter("city");
        String pincodeStr = request.getParameter("pincode");
        String mobileStr = request.getParameter("contactNumber");
        String customerType = request.getParameter("customerType");

        if (!password.equals(confirmPassword)) {
            return "Passwords do not match.";
        }

        // Validate and parse numeric fields
        long phone = Long.parseLong(mobileStr);
        int pincode = Integer.parseInt(pincodeStr);

        // Create Customer object
        Customer customer = new Customer();
        customer.setName(name);
        customer.setMail(email);
        customer.setPhone(phone);
        customer.setPassword(password);
        customer.setAddress(address);
        customer.setState(state);
        customer.setCity(city);
        customer.setPincode(pincode);
        customer.setCustomer_type(customerType);

        // Save to database
        CustomerDAO customerDAO = new CustomerDAOImp();
        return customerDAO.addCustomer(customer);
    }
}
