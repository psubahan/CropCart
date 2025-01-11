package com.cropcart.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cropcart.db.dbConnection;
import com.cropcart.dto.customer;

public class CustomerDAOImp implements CustomerDAO
{
	private Connection con=null;
	public CustomerDAOImp()
	{
		this.con=dbConnection.getConnection();
	}
	@Override
	public String addCustomer(customer c) {
		// TODO Auto-generated method stub
		PreparedStatement ps=null;
		int res=0;
		ResultSet rs=null;
		String status="";
		String query="SELECT * FROM CUSTOMER WHERE MAIL=? AND PHONE=?";
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, c.getMail());
			ps.setLong(2, c.getPhone());
			rs=ps.executeQuery();
			boolean b=rs.next();
			if(b)
			{
				status="Existed";
			}
			else {
				String query1="INSERT INTO CUSTOMER(NAME,PHONE,MAIL,PASSWORD,ADDRESS,STATE,CITY,PINCODE,CUSTOMER_TYPE) VALUES(?,?,?,?,?,?,?,?)";
				ps=con.prepareStatement(query1);
				ps.setString(1, c.getName());
				ps.setLong(2, c.getPhone());
				ps.setString(3, c.getMail());
				ps.setString(4, c.getPassword());
				ps.setString(5, c.getAddress());
				ps.setString(6, c.getState());
				ps.setString(7, c.getCity());
				ps.setLong(8, c.getPincode());
				ps.setString(9, c.getCustomer_type());
				res=ps.executeUpdate();
				if(res>0)
				{
					status="Submitted";
				}
				else
				{
					status="Failed";
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return status;
	}

	@Override
	public customer getCustomer(int customer_id) {
		// TODO Auto-generated method stub
		PreparedStatement ps=null;
		ResultSet rs=null;
		customer c=null;
		String query="SELECT * FROM CUSTOMER WHERE CUSTOMER_ID=?";
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, customer_id);
			rs=ps.executeQuery();
			boolean b=rs.next();
			if(b)
			{
				c=new customer();
				c.setCustomer_id(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setPhone(rs.getLong(3));
				c.setMail(rs.getString(4));
				c.setAddress(rs.getString(6));
				c.setState(rs.getString(7));
				c.setPincode(rs.getInt(8));
				c.setCustomer_type(rs.getString(9));
				
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
	public customer getCustomer(int customer_id,String password)
	{
		PreparedStatement ps=null;
		ResultSet rs=null;
		customer c=null;
		String query="SELECT * FROM CUSTOMER WHERE CUSTOMER_ID=?";
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, customer_id);
			rs=ps.executeQuery();
			boolean b=rs.next();
			if(b)
			{
				c=new customer();
				c.setCustomer_id(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setPhone(rs.getLong(3));
				c.setMail(rs.getString(4));
				c.setAddress(rs.getString(6));
				c.setState(rs.getString(7));
				c.setPincode(rs.getInt(8));
				c.setCustomer_type(rs.getString(9));
				
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
	public String updateCustomer(customer c) {
		// TODO Auto-generated method stub
		PreparedStatement ps=null;
		String status="";
		int res=0;
		String query="UPDATE CUSTOMER SET NAME=?,PHONE=?,MAIL=?,PASSWORD=?,ADDRESS=?,STATE=?,CITY=?,PINCODE=?,CUSTOMER_TYPE=? WHERE CUSTOMER_ID=?";
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, c.getName());
			ps.setLong(2, c.getPhone());
			ps.setString(3, c.getMail());
			ps.setString(4, c.getPassword());
			ps.setString(5, c.getAddress());
			ps.setString(6, c.getState());
			ps.setString(7, c.getCity());
			ps.setLong(8, c.getPincode());
			ps.setString(9, c.getCustomer_type());
			ps.setInt(10, c.getCustomer_id());
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
	public List<customer> getAllCoustomers() {
		// TODO Auto-generated method stub
		ArrayList<customer> cl=new ArrayList<>();
		PreparedStatement ps=null;
		ResultSet rs=null;
		String query="SELECT * FROM CUSTOMER";
		try {
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			while(rs.next())
			{
				customer c=new customer();
				c.setCustomer_id(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setPhone(rs.getLong(3));
				c.setMail(rs.getString(4));
				c.setAddress(rs.getString(6));
				c.setState(rs.getString(7));
				c.setPincode(rs.getInt(8));
				c.setCustomer_type(rs.getString(9));
				cl.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cl;
	}


}
