package com.cropcart.dto;

import java.sql.Timestamp;

public class OTPData {
    private String otpCode;
    private Timestamp expiresAt;

    public OTPData(String otpCode, Timestamp expiresAt) {
        this.otpCode = otpCode;
        this.expiresAt = expiresAt;
    }

    // Getters
    public String getOtpCode() { return otpCode; }
    public Timestamp getExpiresAt() { return expiresAt; }
}