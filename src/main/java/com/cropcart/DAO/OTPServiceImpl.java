package com.cropcart.DAO;

import java.sql.*;
import java.util.Optional;

import com.cropcart.db.dbConnection;
import com.cropcart.dto.OTPData;

public class OTPServiceImpl implements OTPService 
{
	private Connection conn=null;
	
	public OTPServiceImpl()
	{
		this.conn=dbConnection.getConnection();
	}
    @Override
    public Optional<OTPData> getLatestOTP(String userEmail) {
        String query = "SELECT otp_code, expires_at FROM otp_data WHERE user_email = ? ORDER BY created_at DESC LIMIT 1";
        try (
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, userEmail);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                String otpCode = rs.getString("otp_code");
                Timestamp expiresAt = rs.getTimestamp("expires_at");
                return Optional.of(new OTPData(otpCode, expiresAt));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Optional.empty();
    }
    @Override
    public void storeOTP(String userEmail, String otp) {
        String query = "INSERT INTO otp_data (user_email, otp_code, expires_at) VALUES (?, ?, ?)";
        try (
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, userEmail);
            pstmt.setString(2, otp);
            pstmt.setTimestamp(3, new Timestamp(System.currentTimeMillis() + 5 * 60 * 1000)); // 5-minute expiry
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    @Override
    public void deleteExpiredOTPs() {
        String query = "DELETE FROM otp_data WHERE expires_at < NOW()";
        try (
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}