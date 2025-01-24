package com.cropcart.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cropcart.db.dbConnection;
import com.cropcart.dto.Cart;

public class CartDAOImpl implements CartDAO{
	
	private Connection con =null;
	public CartDAOImpl() {
		this.con=dbConnection.getConnection();
	}
	@Override
	public String addToCart(Cart c) {
	    String status = "";
	    PreparedStatement ps = null;
	    int res = 0;
	    String query = "INSERT INTO CART(PRODUCT_IMAGE, PRODUCT_TITLE, PRODUCT_CATEGORY, QUANTITY, CUSTOMER_ID, CUSTOMER_NAME,PRODUCT_COST,status,FARMER_ID) VALUES(?, ?, ?, ?, ?, ?,?,?,?)";
	    
	    try {
	        ps = con.prepareStatement(query);
	        ps.setString(1, c.getProduct_Image());
	        ps.setString(2, c.getProduct_Title());
	        ps.setString(3, c.getProduct_Category());
	        ps.setString(4, c.getQuantity());
	        ps.setInt(5, c.getCustomer_Id());
	        ps.setString(6, c.getCustomer_Name());
	        ps.setString(7, c.getProduct_Cost());
	        ps.setString(8, "pending");
	        ps.setString(9, c.getFarmer_Id());
	        res = ps.executeUpdate();
	        if (res > 0) {
	            status = "success";
	        } else {
	            status = "Failed";
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        status = "An error occurred: " + e.getMessage();
	    }
	    return status;
	}
	@Override
	public List<Cart> getCartInfo(int customer_id) {
	    List<Cart> cartList = new ArrayList<>();
	    PreparedStatement ps = null;
	    ResultSet rs = null;
	    String query = "SELECT * FROM CART WHERE CUSTOMER_ID = ? and Status=?";
	    
	    try {
	        ps = con.prepareStatement(query);
	        ps.setInt(1, customer_id);
	        ps.setString(2, "pending");
	        rs = ps.executeQuery();
	        
	        while (rs.next()) {
	            Cart cart = new Cart();
	            cart.setCart_Id(rs.getInt("cart_id"));
	            cart.setProduct_Image(rs.getString("PRODUCT_IMAGE"));
	            cart.setProduct_Title(rs.getString("PRODUCT_TITLE"));
	            cart.setProduct_Category(rs.getString("PRODUCT_CATEGORY"));
	            cart.setQuantity(rs.getString("QUANTITY"));
	            cart.setCustomer_Id(rs.getInt("CUSTOMER_ID"));
	            cart.setCustomer_Name(rs.getString("CUSTOMER_NAME"));
	            cart.setProduct_Cost(rs.getString("PRODUCT_COST"));
	            cart.setFarmer_Id(rs.getString("Farmer_id"));
	            cartList.add(cart);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return cartList;
	}
	@Override
	public int deleteCart(int cart_id) {
	    int status = 0;
	    String qry = "UPDATE cart SET status = 'deleted' WHERE cart_id = ?";
	    PreparedStatement ps = null;

	    try {
	        ps = con.prepareStatement(qry);
	        ps.setInt(1, cart_id);
	        status = ps.executeUpdate(); // Executes the query and returns the number of rows affected
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return status; // Return the number of rows affected (1 if successful, 0 if not)
	}

}
