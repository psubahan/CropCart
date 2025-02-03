package com.cropcart.DAO;

import java.util.Optional;

import com.cropcart.dto.OTPData;

public interface OTPService {
    // Fetch the latest OTP for a user
    Optional<OTPData> getLatestOTP(String userEmail);
    
    // Store a new OTP for a user
    void storeOTP(String userEmail, String otp);
    
    // Delete expired OTPs (optional)
    void deleteExpiredOTPs();
}