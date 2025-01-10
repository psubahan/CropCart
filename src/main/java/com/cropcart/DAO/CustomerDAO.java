package com.cropcart.DAO;

import com.cropcart.dto.customer;

public interface CustomerDAO 
{
	public String addCustomer(customer c);
	public customer getCustomer(int customer_id);
	public String deleteCustomer(int customer_id);
	public String updateCustomer(int customer_id);
}
