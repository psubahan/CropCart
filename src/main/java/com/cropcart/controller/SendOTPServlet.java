package com.cropcart.controller;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;

import com.cropcart.DAO.OTPService;
import com.cropcart.DAO.OTPServiceImpl;
import com.cropcart.dto.EmailUtil;
import com.cropcart.dto.OTPUtil;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/sendOTP")
public class SendOTPServlet extends HttpServlet {
    private OTPService otpService = new OTPServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String userEmail = request.getParameter("email");
        String name = request.getParameter("name");
        System.out.println(name);
        // Generate OTP
        String otp = OTPUtil.generateOTP();
        otpService.storeOTP(userEmail, otp);

        // Get the absolute path of the email template
        ServletContext context = getServletContext();
        String filePath = context.getRealPath("/otp_email_template.html");

        // Check if file exists
        File file = new File(filePath);
        if (!file.exists()) {
            response.getWriter().write("Error: Email template file not found!");
            return;
        }

        // Read the template content
        String emailTemplate = new String(Files.readAllBytes(Paths.get(filePath)), StandardCharsets.UTF_8);

        // Replace placeholders with actual values
        emailTemplate = emailTemplate.replace("[App Name]", "CropCart")
                .replace("[Recipient Name]", userEmail)
                .replace("{Insert OTP}", otp)
                .replace("{Email Adress}", userEmail)
                .replace("[Company Name]", "CropCart")
                .replace("[Name]", "CropCart Support")
                .replace("[Address]", "123 Street, City, State")
                .replace("[Zip Code/Pin Code]", "123456")
                .replace("[Country Name]", "India");

        // Send email using the template
        String subject = "Your OTP Code for CropCart Registration";
        EmailUtil.sendEmail(userEmail, subject, emailTemplate,true);

        // Respond to the client
        response.getWriter().write("OTP sent to your email!");
    }
}
