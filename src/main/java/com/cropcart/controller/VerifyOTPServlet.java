package com.cropcart.controller;

import java.io.IOException;
import java.sql.*;
import java.util.Optional;

import com.cropcart.DAO.OTPService;
import com.cropcart.DAO.OTPServiceImpl;
import com.cropcart.dto.OTPData;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/verifyOTP")
public class VerifyOTPServlet extends HttpServlet {
    private OTPService otpService = new OTPServiceImpl(); // Use interface

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String userEmail = request.getParameter("email");
        String userOTP = request.getParameter("otp");

        Optional<OTPData> otpData = otpService.getLatestOTP(userEmail);
        if (otpData.isPresent()) {
            String storedOTP = otpData.get().getOtpCode();
            Timestamp expiresAt = otpData.get().getExpiresAt();

            if (storedOTP.equals(userOTP) && System.currentTimeMillis() < expiresAt.getTime()) {
                response.getWriter().write("OTP verified successfully!");
            } else {
                response.getWriter().write("Invalid or expired OTP!");
            }
        } else {
            response.getWriter().write("No OTP found for this email!");
        }
    }
}