package com.cropcart.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cropcart.db.dbConnection;
import com.cropcart.dto.Customer;
import com.cropcart.dto.Farmer;

public class FarmerDAOImp implements FarmerDAO
{
	private Connection con=null;
	public FarmerDAOImp() 
	{
		this.con=dbConnection.getConnection();
	}
	@Override
	public String addFarmer(Farmer f) {
		// TODO Auto-generated method stub
		PreparedStatement ps= null;
		ResultSet rs=null;
		int res=0;
		String status="";
		String query="SELECT * FROM FARMER WHERE EMAIL=? AND PHONE=?";
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, f.getEmail());
			ps.setLong(2, f.getPhone());
			rs=ps.executeQuery();
			boolean b=rs.next();
			if(b)
			{
				status="Existed";
			}
			else {
				String query1="INSERT INTO FARMER(NAME,PHONE,EMAIL,PASSWORD,ADDRESS,STATE,CITY,PINCODE,BANK_NAME,BRANCH,IFSC,ACC_NO) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
				ps=con.prepareStatement(query1);
				ps.setString(1, f.getName());
				ps.setLong(2, f.getPhone());
				ps.setString(3, f.getEmail());
				ps.setString(4, f.getPassword());
				ps.setString(5, f.getAddress());
				ps.setString(6, f.getState());
				ps.setString(7, f.getCity());
				ps.setLong(8, f.getPincode());
				ps.setString(9, f.getBank_name());
				ps.setString(10, f.getBranch());
				ps.setString(11, f.getIfsc());
				ps.setLong(12, f.getAcc_no());
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
	public Farmer getCustomer(int farmer_id, String password) {
		// TODO Auto-generated method stub
		PreparedStatement ps=null;
		ResultSet rs=null;
		Farmer f=null;
		String query="SELECT * FROM FARMER WHERE FARMER_ID=? and PASSWORD=?";
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, farmer_id);
			ps.setString(2, password);
			rs=ps.executeQuery();
			boolean b=rs.next();
			if(b)
			{
				f=new Farmer();
				f.setFarmer_id(rs.getInt(1));
				f.setName(rs.getString(2));
				f.setEmail(rs.getString(3));
				f.setAddress(rs.getString(5));
				f.setState(rs.getString(6));
				f.setCity(rs.getString(7));
				f.setPhone(rs.getLong(8));
				f.setPincode(rs.getInt(9));
				f.setBank_name(rs.getString(10));
				f.setBranch(rs.getString(11));
				f.setIfsc(rs.getString(12));
				f.setAcc_no(rs.getLong(13));
				
			}
			else
			{
				f=null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public Farmer getCustomer(int farmer_id) {
		PreparedStatement ps=null;
		ResultSet rs=null;
		Farmer f=null;
		String query="SELECT * FROM FARMER WHERE FARMER_ID=?";
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, farmer_id);
			rs=ps.executeQuery();
			boolean b=rs.next();
			if(b)
			{
				f=new Farmer();
				f.setFarmer_id(rs.getInt(1));
				f.setName(rs.getString(2));
				f.setEmail(rs.getString(3));
				f.setAddress(rs.getString(5));
				f.setState(rs.getString(6));
				f.setCity(rs.getString(7));
				f.setPhone(rs.getLong(8));
				f.setPincode(rs.getInt(9));
				f.setBank_name(rs.getString(10));
				f.setBranch(rs.getString(11));
				f.setIfsc(rs.getString(12));
				f.setAcc_no(rs.getLong(13));
				
			}
			else
			{
				f=null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public String deleteCustomer(int farmer_id) {
		PreparedStatement ps=null;
		int res=0;
		String status="";
		String query="DELETE FROM FARMER WHERE FARMER_ID=?";
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, farmer_id);
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
	public String updateCustomer(Farmer f) {
		// TODO Auto-generated method stub
		PreparedStatement ps=null;
		String status="";
		int res=0;
		String query="UPDATE FARMER SET NAME=?,PHONE=?,EMAIL=?,PASSWORD=?,ADDRESS=?,STATE=?,CITY=?,PINCODE=?,BANK_NAME=?,BRANCH=?,IFSC=?,ACC_NO=? WHERE FARMER_ID=?";
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, f.getName());
			ps.setLong(2, f.getPhone());
			ps.setString(3, f.getEmail());
			ps.setString(4, f.getPassword());
			ps.setString(5, f.getAddress());
			ps.setString(6, f.getState());
			ps.setString(7, f.getCity());
			ps.setLong(8, f.getPincode());
			ps.setString(9, f.getBank_name());
			ps.setString(10, f.getBranch());
			ps.setString(11, f.getIfsc());
			ps.setLong(12, f.getAcc_no());
			ps.setInt(13, f.getFarmer_id());
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
	public List<Farmer> getAllCoustomers() {
		// TODO Auto-generated method stub
		ArrayList<Farmer> lf=new ArrayList<Farmer>();
		PreparedStatement ps=null;
		ResultSet rs=null;
		Farmer f=null;
		String query="SELECT * FROM FARMER";
		try {
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			while(rs.next())
			{
				f=new Farmer();
				f.setFarmer_id(rs.getInt(1));
				f.setName(rs.getString(2));
				f.setEmail(rs.getString(3));
				f.setAddress(rs.getString(5));
				f.setState(rs.getString(6));
				f.setCity(rs.getString(7));
				f.setPhone(rs.getLong(8));
				f.setPincode(rs.getInt(9));
				f.setBank_name(rs.getString(10));
				f.setBranch(rs.getString(11));
				f.setIfsc(rs.getString(12));
				f.setAcc_no(rs.getLong(13));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lf;
	}
	@Override
	public Farmer getCustomer(String mail, String password) {
		PreparedStatement ps=null;
		ResultSet rs=null;
		Farmer f=null;
		String query="SELECT * FROM FARMER WHERE EMAIL=? and PASSWORD=?";
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, mail);
			ps.setString(2, password);
			rs=ps.executeQuery();
			boolean b=rs.next();
			if(b)
			{
				f=new Farmer();
				f.setFarmer_id(rs.getInt(1));
				f.setName(rs.getString(2));
				f.setEmail(rs.getString(3));
				f.setAddress(rs.getString(5));
				f.setState(rs.getString(6));
				f.setCity(rs.getString(7));
				f.setPhone(rs.getLong(8));
				f.setPincode(rs.getInt(9));
				f.setBank_name(rs.getString(10));
				f.setBranch(rs.getString(11));
				f.setIfsc(rs.getString(12));
				f.setAcc_no(rs.getLong(13));
				
			}
			else
			{
				f=null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return f;
	}

}
