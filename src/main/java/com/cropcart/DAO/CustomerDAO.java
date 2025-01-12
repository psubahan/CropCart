package com.cropcart.DAO;

import java.util.List;

import com.cropcart.dto.Customer;

public interface CustomerDAO 
{
	public String addCustomer(Customer c);
	public Customer getCustomer(int customer_id,String password); 
	public Customer getCustomer(int customer_id);
	public String deleteCustomer(int customer_id);
	public String updateCustomer(Customer c);
	public List<Customer> getAllCoustomers();
}
