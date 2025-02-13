package com.cropcart.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cropcart.db.dbConnection;
import com.cropcart.dto.Customer;

public class CustomerDAOImp implements CustomerDAO
{
	private Connection con=null;
	public CustomerDAOImp()
	{
		this.con=dbConnection.getConnection();
	}
	@Override
	public String addCustomer(Customer c) {
	    PreparedStatement ps = null;
	    int res = 0;
	    ResultSet rs = null;
	    String status = "";

	    String queryCheckMailPhone = "SELECT * FROM CUSTOMER WHERE MAIL = ? AND PHONE = ?";
	    String queryCheckPassword = "SELECT * FROM CUSTOMER WHERE PASSWORD = ?";
	    
	    try {
	        // Check if email and phone already exist
	        ps = con.prepareStatement(queryCheckMailPhone);
	        ps.setString(1, c.getMail());
	        ps.setLong(2, c.getPhone());
	        rs = ps.executeQuery();
	        
	        if (rs.next()) {
	            status = "Existed";
	        } else {
	            // Check if the password already exists
	            ps = con.prepareStatement(queryCheckPassword);
	            ps.setString(1, c.getPassword());
	            rs = ps.executeQuery();
	            
	            if (rs.next()) {
	                status = "PasswordAlreadyExists";
	            } else {
	                // Insert new customer
	                String queryInsert = "INSERT INTO CUSTOMER(NAME, PHONE, MAIL, PASSWORD, ADDRESS, STATE, CITY, PINCODE, CUSTOMER_TYPE,ACCOUNT) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	                ps = con.prepareStatement(queryInsert);
	                ps.setString(1, c.getName());
	                ps.setLong(2, c.getPhone());
	                ps.setString(3, c.getMail());
	                ps.setString(4, c.getPassword());
	                ps.setString(5, c.getAddress());
	                ps.setString(6, c.getState());
	                ps.setString(7, c.getCity());
	                ps.setLong(8, c.getPincode());
	                ps.setString(9, c.getCustomer_type());
	                ps.setString(10, c.getAccount_number());
	                
	                res = ps.executeUpdate();
	                if (res > 0) {
	                    status = "Submitted";
	                } else {
	                    status = "Failed";
	                }
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } 

	    return status;
	}

	@Override
	public Customer getCustomer(int customer_id) {
		// TODO Auto-generated method stub
		PreparedStatement ps=null;
		ResultSet rs=null;
		Customer c=null;
		String query="SELECT * FROM CUSTOMER WHERE CUSTOMER_ID=?";
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, customer_id);
			rs=ps.executeQuery();
			boolean b=rs.next();
			if(b)
			{
				c=new Customer();
				c.setCustomer_id(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setPhone(rs.getLong(3));
				c.setMail(rs.getString(4));
				c.setAddress(rs.getString(6));
				c.setState(rs.getString(7));
				c.setCity(rs.getString(8));
				c.setPincode(rs.getInt(9));
				c.setCustomer_type(rs.getString(10));
				
			}
			else
			{
				c=null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return c;
	}
	
	@Override
	public Customer getCustomer(int customer_id,String password)
	{
		PreparedStatement ps=null;
		ResultSet rs=null;
		Customer c=null;
		String query="SELECT * FROM CUSTOMER WHERE CUSTOMER_ID=?";
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, customer_id);
			rs=ps.executeQuery();
			boolean b=rs.next();
			if(b)
			{
				c=new Customer();
				c.setCustomer_id(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setPhone(rs.getLong(3));
				c.setMail(rs.getString(4));
				c.setAddress(rs.getString(6));
				c.setState(rs.getString(7));
				c.setCity(rs.getString(8));
				c.setPincode(rs.getInt(9));
				c.setCustomer_type(rs.getString(10));
				
			}
			else
			{
				c=null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return c;
	}
	@Override
	public String deleteCustomer(int customer_id) {
		// TODO Auto-generated method stub
		PreparedStatement ps=null;
		int res=0;
		String status="";
		String query="DELETE FROM CUSTOMER WHERE CUSTOMER_ID=?";
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, customer_id);
			res=ps.executeUpdate();
			if(res>0)
			{
				status="success";
			}
			else
			{
				status="failure";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}
	
	@Override
	public String updateCustomer(Customer c) {
		// TODO Auto-generated method stub
		PreparedStatement ps=null;
		String status="";
		int res=0;
		String query="UPDATE CUSTOMER SET NAME=?,PHONE=?,MAIL=?,ADDRESS=?,STATE=?,CITY=?,PINCODE=?,CUSTOMER_TYPE=? WHERE CUSTOMER_ID=?";
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, c.getName());
			ps.setLong(2, c.getPhone());
			ps.setString(3, c.getMail());
			ps.setString(4, c.getAddress());
			ps.setString(5, c.getState());
			ps.setString(6, c.getCity());
			ps.setLong(7,c.getPincode());
			ps.setString(8, c.getCustomer_type());
			ps.setInt(9, c.getCustomer_id());
			res=ps.executeUpdate();
			if(res>0)
			{
				status="Submitted";
			}
			else
			{
				status="Failed";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}

	@Override
	public List<Customer> getAllCoustomers() {
		// TODO Auto-generated method stub
		ArrayList<Customer> cl=new ArrayList<>();
		PreparedStatement ps=null;
		ResultSet rs=null;
		String query="SELECT * FROM CUSTOMER";
		try {
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			while(rs.next())
			{
				Customer c=new Customer();
				c.setCustomer_id(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setPhone(rs.getLong(3));
				c.setMail(rs.getString(4));
				c.setAddress(rs.getString(6));
				c.setState(rs.getString(7));
				c.setCity(rs.getString(8));
				c.setPincode(rs.getInt(9));
				c.setCustomer_type(rs.getString(10));
				cl.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cl;
	}
	@Override
	public Customer getCustomer(String mail, String password) {
		PreparedStatement ps=null;
		ResultSet rs=null;
		Customer c=null;
		String query="SELECT * FROM CUSTOMER WHERE mail=? and password=?";
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, mail);
			ps.setString(2, password);
			rs=ps.executeQuery();
			boolean b=rs.next();
			if(b)
			{
				c=new Customer();
				c.setCustomer_id(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setPhone(rs.getLong(3));
				c.setMail(rs.getString(4));
				c.setAddress(rs.getString(6));
				c.setState(rs.getString(7));
				c.setCity(rs.getString(8));
				c.setPincode(rs.getInt(9));
				c.setCustomer_type(rs.getString(10));
				
			}
			else
			{
				c=null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return c;
	}

	@Override
	public Customer getCustomer1(int customer_id,String name) {
		String query="SELECT * FROM CUSTOMER WHERE CUSTOMER_ID=? AND NAME=?";
		Customer c=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1,customer_id);
			ps.setString(2,name);
			rs=ps.executeQuery();
			while(rs.next()) {
				c=new Customer();
				c.setCustomer_id(rs.getInt("customer_id"));
				c.setName(rs.getString("name"));
				
			}
		
		} 
			catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return c;
	}
	
	@Override
	public String updatePassword(String email, String oldPassword, String newPassword) {

	    String queryCheckEmail = "SELECT * FROM CUSTOMER WHERE MAIL = ?";
	    String queryCheckOldPassword = "SELECT * FROM CUSTOMER WHERE MAIL = ? AND PASSWORD = ?";
	    String queryUpdatePassword = "UPDATE CUSTOMER SET PASSWORD = ? WHERE MAIL = ?";
	    
	    PreparedStatement ps = null;
	    ResultSet rs = null;
	    String status = "";

	    try {
	        // Check if email exists
	        ps = con.prepareStatement(queryCheckEmail);
	        ps.setString(1, email);
	        rs = ps.executeQuery();

	        if (rs.next()) {
	            // Email exists, now check if old password is correct
	            ps = con.prepareStatement(queryCheckOldPassword);
	            ps.setString(1, email);
	            ps.setString(2, oldPassword);
	            rs = ps.executeQuery();
	            
	            if (rs.next()) {
	                // Old password is correct, proceed to update with the new password
	                ps = con.prepareStatement(queryUpdatePassword);
	                ps.setString(1, newPassword);  // New password
	                ps.setString(2, email);        // Identifying customer by email

	                int res = ps.executeUpdate();
	                if (res > 0) {
	                    status = "PasswordUpdated";
	                } else {
	                    status = "UpdateFailed";
	                }
	            } else {
	                status = "IncorrectOldPassword";
	            }
	        } else {
	            status = "EmailNotFound";
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        status = "Error";
	    }

	    return status;
	}
	
	@Override
	public Customer getCustomerByAccountNumber(int accountNumber) {
	    PreparedStatement ps = null;
	    ResultSet rs = null;
	    Customer c = null;
	    String query = "SELECT * FROM CUSTOMER WHERE ACCOUNT = ?";
	    
	    try {
	        ps = con.prepareStatement(query);
	        ps.setInt(1, accountNumber);
	        rs = ps.executeQuery();
	        
	        if (rs.next()) {
	            c = new Customer();
	            c.setCustomer_id(rs.getInt("customer_id"));
	            c.setName(rs.getString("name"));
	            c.setPhone(rs.getLong("phone"));
	            c.setMail(rs.getString("mail"));
	            c.setAddress(rs.getString("address"));
	            c.setState(rs.getString("state"));
	            c.setCity(rs.getString("city"));
	            c.setPincode(rs.getInt("pincode"));
	            c.setCustomer_type(rs.getString("customer_type"));
	            c.setAccount_number(rs.getString("account"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return c;
	}



}
