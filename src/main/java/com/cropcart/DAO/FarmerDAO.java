package com.cropcart.DAO;

import java.util.List;

import com.cropcart.dto.Farmer;

public interface FarmerDAO 
{
	public String addFarmer(Farmer f);
	public Farmer getCustomer(int farmer_id,String password);
	public Farmer getCustomer(String mail,String password);
	public Farmer getCustomer(int farmer_id);
	public String deleteCustomer(int farmer_id);
	public String updateCustomer(Farmer f);
	public List<Farmer> getAllCoustomers();
}
