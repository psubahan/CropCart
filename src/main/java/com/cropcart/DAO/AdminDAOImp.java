package com.cropcart.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.cropcart.db.dbConnection;
import com.cropcart.dto.Admin;

public class AdminDAOImp implements AdminDAO {

	private Connection con=null;
	public AdminDAOImp()
	{
		this.con=dbConnection.getConnection();
	}
	@Override
	public String addAdmin(Admin a) {
	    PreparedStatement ps = null;
	    ResultSet rs = null;
	    int res = 0;
	    String status = "";

	    String queryCheckEmailPhone = "SELECT * FROM ADMIN WHERE MAIL = ? OR PHONE = ?";
	    String queryCheckPassword = "SELECT * FROM ADMIN WHERE PASSWORD = ?";
	    String queryInsertAdmin = "INSERT INTO ADMIN(NAME, MAIL, PHONE, PASSWORD) VALUES(?, ?, ?, ?)";

	    try {
	        // Check if email or phone already exists
	        ps = con.prepareStatement(queryCheckEmailPhone);
	        ps.setString(1, a.getMail());
	        ps.setLong(2, a.getPhone());
	        rs = ps.executeQuery();

	        if (rs.next()) {
	            status = "EmailOrPhoneAlreadyExists";
	        } else {
	            // Check if password already exists
	            ps = con.prepareStatement(queryCheckPassword);
	            ps.setString(1, a.getPassword());
	            rs = ps.executeQuery();

	            if (rs.next()) {
	                status = "PasswordAlreadyExists";
	            } else {
	                // Insert new admin
	                ps = con.prepareStatement(queryInsertAdmin);
	                ps.setString(1, a.getName());
	                ps.setString(2, a.getMail());
	                ps.setLong(3, a.getPhone());
	                ps.setString(4, a.getPassword());
	                res = ps.executeUpdate();

	                if (res > 0) {
	                    con.commit();
	                    status = "Success";
	                } else {
	                    con.rollback();
	                    status = "Failed";
	                }
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        try {
	            con.rollback();
	        } catch (SQLException rollbackEx) {
	            rollbackEx.printStackTrace();
	        }
	    }

	    return status;
	}

	@Override
	public Admin getAdmin(String mail,String password) {
		String query="SELECT * FROM ADMIN WHERE MAIL=? AND PASSWORD=?";
		PreparedStatement ps=null;
		ResultSet rs=null;
		Admin a=null;
		
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, mail);
			ps.setString(2, password);
			rs=ps.executeQuery();
			while(rs.next())
			{
				a=new Admin();
				a.setAdmin_id(rs.getInt(1));
				a.setName(rs.getString(2));
				a.setMail(rs.getString(3));
				a.setPhone(rs.getLong(4));
				a.setPassword(rs.getString(5));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return a;
	}
//	@Override
//	public Admin getAdmin(String mail, String Password) {
//		String query="SELECT * FROM ADMIN WHERE MAIL=? AND PASSWORD=?";
//		PreparedStatement ps=null;
//		ResultSet rs=null;
//		Admin a=null;
//		
//		try {
//			ps=con.prepareStatement(query);
//			ps.setString(1, mail);
//			ps.setString(2, Password);
//			rs=ps.executeQuery();
//			while(rs.next())
//			{
//				a=new Admin();
//				a.setAdmin_id(rs.getInt(1));
//				a.setName(rs.getString(2));
//				a.setMail(rs.getString(3));
//				a.setPhone(rs.getLong(4));
//				a.setPassword(rs.getString(5));
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return a;
//	}

}
