package com.cropcart.DAO;

import java.util.List;

import com.cropcart.dto.Cart;

public interface CartDAO {
	
	public String addToCart(Cart c);
	public List<Cart>getCartInfo(int customer_id);
	public int deleteCart(int cart_id);
}
