package com.cropcart.DAO;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.cropcart.dto.ProductDetails;

public interface ProductDAO {
	public ProductDetails getProduct(int product_id);
	public List<ProductDetails> getAllproducts();
	boolean addProduct(ProductDetails product);
	public List<ProductDetails> getProducts(int farmer_id);
	public boolean updateProduct(ProductDetails p);
    public Map<String, Integer> getProductsBoughtByCategory(int customerId);
}
