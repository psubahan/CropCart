package com.cropcart.DAO;

import java.util.List;

import com.cropcart.dto.Farmer;

public interface FarmerDAO 
{
	public String addFarmer(Farmer f);
	public Farmer getFarmer(int farmer_id,String password);
	public Farmer getFarmer(String mail,String password);
	public Farmer getFarmer(int farmer_id);
	public String deleteFarmer(int farmer_id);
	public String updateFarmer(Farmer f);
	public List<Farmer> getAllFarmer();
}
