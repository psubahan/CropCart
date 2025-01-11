package com.cropcart.DAO;

import java.util.List;

import com.cropcart.dto.customer;

public interface CustomerDAO 
{
	public String addCustomer(customer c);
	public customer getCustomer(int customer_id,String password); 
	public customer getCustomer(int customer_id);
	public String deleteCustomer(int customer_id);
	public String updateCustomer(customer c);
	public List<customer> getAllCoustomers();
}
