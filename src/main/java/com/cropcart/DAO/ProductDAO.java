package com.cropcart.DAO;

import java.util.ArrayList;
import java.util.List;

import com.cropcart.dto.ProductDetails;

public interface ProductDAO {
	public ProductDetails getProduct(int product_id);
	public List<ProductDetails> getAllproducts();
	boolean addProduct(ProductDetails product);
	public ArrayList<ProductDetails> getProducts(int farmer_id);
}
