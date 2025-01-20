package com.cropcart.DAO;

import java.util.ArrayList;

import com.cropcart.dto.ProductCategory;

public interface ProductCatDAO {
	public ArrayList<ProductCategory> getProductCategory();
	public  ProductCategory getProduct(int Product_category_id);	


}
