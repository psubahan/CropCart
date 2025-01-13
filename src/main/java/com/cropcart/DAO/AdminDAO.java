package com.cropcart.DAO;

import com.cropcart.dto.Admin;

public interface AdminDAO 
{
	public String addAdmin(Admin a);
	public Admin getAdmin(String mail,String Password);
	
}
