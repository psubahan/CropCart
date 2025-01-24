package com.cropcart.DAO;

import java.util.ArrayList;

import com.cropcart.dto.Orders;

public interface OrderDAO {
	
	public String addOrders(Orders o);
	public ArrayList<Orders> getAllorders();
	public ArrayList<Orders> getAllorders(int farmer_id);
	public ArrayList<Orders>getOrders(int Customer_id);
}
