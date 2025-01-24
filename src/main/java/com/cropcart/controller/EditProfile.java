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
import com.cropcart.dto.Farmer;
import com.cropcart.dto.Customer;

@WebServlet("/editProfile")
public class EditProfile extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public EditProfile() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        HttpSession session = request.getSession();

        Farmer farmer = (Farmer) session.getAttribute("farmer");
        Customer customer = (Customer) session.getAttribute("customer");


        if (farmer != null) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String state = request.getParameter("state");
            String city = request.getParameter("city");
            long phone = Long.parseLong(request.getParameter("phone"));
            long pincode = Long.parseLong(request.getParameter("pincode"));
            String bankName = request.getParameter("bank_name");
            String branch = request.getParameter("branch");
            String ifsc = request.getParameter("ifsc");
            long accNo = Long.parseLong(request.getParameter("acc_no"));

            
            farmer.setName(name);
            farmer.setEmail(email);
            farmer.setAddress(address);
            farmer.setState(state);
            farmer.setCity(city);
            farmer.setPhone(phone);
            farmer.setPincode(pincode);
            farmer.setBank_name(bankName);
            farmer.setBranch(branch);
            farmer.setIfsc(ifsc);
            farmer.setAcc_no(accNo);

           
            FarmerDAO farmerDAO = new FarmerDAOImp();
            String status = farmerDAO.updateFarmer(farmer);

            if ("Submitted".equals(status)) {
                request.setAttribute("updated", "Your profile has been updated successfully!");
            } else {
                request.setAttribute("failed", "There was an issue updating your profile.");
            }

            request.getRequestDispatcher("editProfile.jsp").forward(request, response);
        
        } 
       
        else if (customer != null) {
            String name = request.getParameter("name");
            String email = request.getParameter("mail");
            String address = request.getParameter("address");
            String state = request.getParameter("state");
            String city = request.getParameter("city");
            long phone = Long.parseLong(request.getParameter("phone"));
            int pincode = Integer.parseInt(request.getParameter("pincode"));
            String customerType = request.getParameter("customer_type");

           
            customer.setName(name);
            customer.setMail(email);
            customer.setAddress(address);
            customer.setState(state);
            customer.setCity(city);
            customer.setPhone(phone);
            customer.setPincode(pincode);
            customer.setCustomer_type(customerType);

            // Update the customer details in the database
            CustomerDAO customerDAO = new CustomerDAOImp();
            String status = customerDAO.updateCustomer(customer);

            if ("Submitted".equals(status)) {
                request.setAttribute("updated", "Your profile has been updated successfully!");
            } else {
                request.setAttribute("failed", "There was an issue updating your profile.");
            }

            request.getRequestDispatcher("editProfile.jsp").forward(request, response);
        } else {
            // when no user logged in
            response.sendRedirect("login.jsp");
        }
    }
}
