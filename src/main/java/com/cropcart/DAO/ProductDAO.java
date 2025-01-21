package com.cropcart.DAO;

import java.util.List;

import com.cropcart.dto.ProductDetails;

public interface ProductDAO {
	public ProductDetails getProduct(int product_id);
	public List<ProductDetails> getAllproducts();
	boolean addProduct(ProductDetails product);
}
