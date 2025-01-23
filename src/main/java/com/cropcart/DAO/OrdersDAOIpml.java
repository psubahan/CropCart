package com.cropcart.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.cropcart.db.dbConnection;
import com.cropcart.dto.Orders;

public class OrdersDAOIpml implements OrderDAO 
{
	private Connection con=null;
	public OrdersDAOIpml()
	{
		this.con=dbConnection.getConnection();
	}
	@Override
	public String addOrders(Orders o) {
	    PreparedStatement ps = null;
	    PreparedStatement psUpdate = null;
	    int res = 0;
	    String status = "";
	    String query = "INSERT INTO ORDERS ("
	            + "    CART_ID,"
	            + "    CART_COST,"
	            + "    ORDER_ADDRESS,"
	            + "    ORDER_STATE,"
	            + "    ORDER_CITY,"
	            + "    CUSTOMER_ID,"
	            + "    CUSTOMER_NAME,"
	            + "    FARMER_ID,"
	            + "    ORDER_DATE,"
	            + "    STATUS,"
	            + "    PAYMENT,"
	            + "    PRODUCT_IMAGE,"
	            + "    PRODUCT_NAME"
	            + ") "
	            + "SELECT "
	            + "    CART_ID,"
	            + "    (PRODUCT_COST * QUANTITY) AS CART_COST,"
	            + "    ? AS ORDER_ADDRESS,"
	            + "    ? AS ORDER_STATE,"
	            + "    ? AS ORDER_CITY,"
	            + "    CUSTOMER_ID,"
	            + "    ? AS CUSTOMER_NAME,"
	            + "    FARMER_ID,"
	            + "    SYSDATE() AS ORDER_DATE,"
	            + "    'Pending' AS STATUS,"
	            + "    ? AS PAYMENT,"
	            + "    PRODUCT_IMAGE,"
	            + "    PRODUCT_TITLE AS PRODUCT_NAME "
	            + "FROM CART "
	            + "WHERE CUSTOMER_ID = ? "
	            + "  AND STATUS = 'Pending';";

	    String updateQuery = "UPDATE CART "
	            + "SET STATUS = 'Requested' "
	            + "WHERE CUSTOMER_ID = ? "
	            + "  AND STATUS = 'Pending';";

	    try {
	        // Execute the insert query
	        ps = con.prepareStatement(query);
	        ps.setString(1, o.getOrder_Address()); // Order address
	        ps.setString(2, o.getOrder_State());   // Order state
	        ps.setString(3, o.getOrder_city());    // Order city
	        ps.setString(4, o.getCustomer_Name()); // Customer name
	        ps.setString(5, o.getPaymet_mode());   // Payment mode
	        ps.setInt(6, o.getCustomer_Id());      // Customer ID

	        res = ps.executeUpdate();

	        // If insert is successful, update the CART table
	        if (res > 0) {
	            // Update status in the CART table
	            psUpdate = con.prepareStatement(updateQuery);
	            psUpdate.setInt(1, o.getCustomer_Id()); // Customer ID
	            int updateRes = psUpdate.executeUpdate();

	            // Check if the update was successful
	            if (updateRes > 0) {
	                status = "success";
	            } else {
	                status = "Failed to update CART status.";
	            }
	        } else {
	            status = "Failed to insert into ORDERS table.";
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        status = "Error: " + e.getMessage();
	    }
	    return status;
	}


	@Override
	public ArrayList<Orders> getAllorders() {
	    ArrayList<Orders> orderList = new ArrayList<>();
	    PreparedStatement ps = null;
	    ResultSet rs = null;
	    String query = "SELECT * FROM ORDERS";
	    
	    try {
	        ps = con.prepareStatement(query);
	        rs = ps.executeQuery();
	        
	        while (rs.next()) {
	            Orders o = new Orders();
	            o.setOrder_Id(rs.getInt("Order_id"));
	            o.setCart_Id(rs.getInt("Cart_id"));
	            o.setCart_Cost(rs.getInt("Cart_cost"));
	            o.setOrder_Address(rs.getString("Order_address"));
	            o.setOrder_State(rs.getString("Order_state"));
	            o.setOrder_city(rs.getString("Order_city"));
	            o.setCustomer_Id(rs.getInt("Customer_id"));
	            o.setCustomer_Name(rs.getString("Customer_name"));
	            o.setFarmer_id(rs.getString("Farmer_id"));
	            o.setOrder_date(rs.getDate("Order_date"));
	            o.setStatus(rs.getString("Status"));
	            o.setPaymet_mode(rs.getString("payment"));
	            o.setProduct_Image(rs.getString("product_image"));
	            o.setProduct_Name(rs.getString("product_name"));
	            orderList.add(o);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return orderList;
	}

	@Override
	public ArrayList<Orders> getAllorders(int farmer_id) {
		 ArrayList<Orders> orderList = new ArrayList<>();
		    PreparedStatement ps = null;
		    ResultSet rs = null;
		    String query = "SELECT * FROM ORDERS WHERE FARMER_ID=?";
		    
		    try {
		        ps = con.prepareStatement(query);
		        ps.setInt(1, farmer_id);
		        rs = ps.executeQuery();
		        
		        while (rs.next()) {
		            Orders o = new Orders();
		            o.setOrder_Id(rs.getInt("Order_id"));
		            o.setCart_Id(rs.getInt("Cart_id"));
		            o.setCart_Cost(rs.getInt("Cart_cost"));
		            o.setOrder_Address(rs.getString("Order_address"));
		            o.setOrder_State(rs.getString("Order_state"));
		            o.setOrder_city(rs.getString("Order_city"));
		            o.setCustomer_Id(rs.getInt("Customer_id"));
		            o.setCustomer_Name(rs.getString("Customer_name"));
		            o.setFarmer_id(rs.getString("Farmer_id"));
		            o.setOrder_date(rs.getDate("Order_date"));
		            o.setStatus(rs.getString("Status"));
		            o.setPaymet_mode(rs.getString("payment"));
		            o.setProduct_Image(rs.getString("product_image"));
		            o.setProduct_Name(rs.getString("product_name"));
		            orderList.add(o);
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return orderList;

	}
	@Override
	public ArrayList<Orders> getOrders(int Customer_id) {
		 ArrayList<Orders> orderList = new ArrayList<>();
		    PreparedStatement ps = null;
		    ResultSet rs = null;
		    String query = "SELECT * FROM ORDERS WHERE Customer_Id=?";
		    
		    try {
		        ps = con.prepareStatement(query);
		        ps.setInt(1, Customer_id);
		        rs = ps.executeQuery();
		        
		        while (rs.next()) {
		            Orders o = new Orders();
		            o.setOrder_Id(rs.getInt("Order_id"));
		            o.setCart_Id(rs.getInt("Cart_id"));
		            o.setCart_Cost(rs.getInt("Cart_cost"));
		            o.setOrder_Address(rs.getString("Order_address"));
		            o.setOrder_State(rs.getString("Order_state"));
		            o.setOrder_city(rs.getString("Order_city"));
		            o.setCustomer_Id(rs.getInt("Customer_id"));
		            o.setCustomer_Name(rs.getString("Customer_name"));
		            o.setFarmer_id(rs.getString("Farmer_id"));
		            o.setOrder_date(rs.getDate("Order_date"));
		            o.setStatus(rs.getString("Status"));
		            o.setPaymet_mode(rs.getString("payment"));
		            o.setProduct_Image(rs.getString("product_image"));
		            o.setProduct_Name(rs.getString("product_name"));
		            orderList.add(o);
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return orderList;
	}
	
}
