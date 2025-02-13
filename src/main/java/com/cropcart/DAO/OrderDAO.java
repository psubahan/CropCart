package com.cropcart.DAO;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.cropcart.dto.Orders;

public interface OrderDAO {
	
	public String addOrders(Orders o);
	public ArrayList<Orders> getAllorders();
	public ArrayList<Orders> getAllorders(int farmer_id);
	public ArrayList<Orders>getOrders(int Customer_id);
	public String updateOrderForAccept(int orderid);
	public String updateOrderForDecline(int orderid,String Decline_Reason);
	double getTotalRevenueByFarmer(int farmerId);
	List<Orders> getDeliveredOrders();
	public Map<String, Integer> getOrderCountByCategory(int customerId);
}
