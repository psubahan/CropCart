package com.cropcart.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
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
		String query="INSERT INTO CUSTOMER(NAME,PHONE,MAIL,PASSWORD,ADDRESS,STATE,CITY,PINCODE,CUSTOMER_TYPE) VALUES(?,?,?,?,?,?,?,?)";
		int res=0;
		try {
			ps=con.prepareStatement(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public customer getCustomer(int customer_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String deleteCustomer(int customer_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String updateCustomer(int customer_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<customer> getAllCoustomers() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public customer getCustomer(String mail) {
		// TODO Auto-generated method stub
		return null;
	}

}
