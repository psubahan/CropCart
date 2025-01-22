package com.cropcart.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cropcart.db.dbConnection;
import com.cropcart.dto.ProductDetails;

public class ProductDAOImp implements ProductDAO 
{
	private Connection con=null;
	
	public ProductDAOImp() {
		this.con = dbConnection.getConnection();
	}

	@Override
	public ProductDetails getProduct(int product_id) {
	    PreparedStatement ps = null;
	    ResultSet rs = null;
	    String query = "SELECT * FROM product_details WHERE product_id=?";
	    ProductDetails pd = null;

	    try {
	        ps = con.prepareStatement(query);
	        ps.setInt(1, product_id);
	        rs = ps.executeQuery();

	        if (rs.next()) {
	            pd = new ProductDetails();
	            pd.setProduct_id(rs.getInt("product_id")); 
	            pd.setCategoty(rs.getString("category"));
	            pd.setTitle(rs.getString("title"));
	            pd.setImage(rs.getString("image"));
	            pd.setQuantity(rs.getInt("quantity"));
	            pd.setDescription(rs.getString("description"));
	            pd.setQuantity_type(rs.getString("quantity_type"));
	            pd.setPrice(rs.getLong("price"));
	            pd.setStatus(rs.getString("status"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } 
	    return pd; 
	}


	@Override
	public List<ProductDetails> getAllproducts() {
		ArrayList<ProductDetails>pdl=new ArrayList<ProductDetails>();
		 PreparedStatement ps = null;
		    ResultSet rs = null;
		    String query = "SELECT * FROM product_details";
		    ProductDetails pd = null;

		    try {
		        ps = con.prepareStatement(query);
		        rs = ps.executeQuery();

		        while (rs.next()) {
		            pd = new ProductDetails();
		            pd.setProduct_id(rs.getInt("product_id")); 
		            pd.setCategoty(rs.getString("categoty"));
		            pd.setTitle(rs.getString("title"));
		            pd.setImage(rs.getString("image"));
		            pd.setQuantity(rs.getInt("quantity"));
		            pd.setDescription(rs.getString("description"));
		            pd.setQuantity_type(rs.getString("quantity_type"));
		            pd.setPrice(rs.getLong("price"));
		            pd.setStatus(rs.getString("status"));
		            pdl.add(pd);
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } 
		    return pdl; 
	}
	
  @Override
   public boolean addProduct(ProductDetails product) {
	        PreparedStatement ps = null;
	        String query = "INSERT INTO product_details (categoty, title, image, quantity, description, quantity_type, price, status) "
	                     + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
	        boolean isProductAdded = false;

	        try {
	            ps = con.prepareStatement(query);
	            ps.setString(1, product.getCategoty());
	            ps.setString(2, product.getTitle());
	            ps.setString(3, product.getImage());
	            ps.setInt(4, product.getQuantity());
	            ps.setString(5, product.getDescription());
	            ps.setString(6, product.getQuantity_type());
	            ps.setLong(7, product.getPrice());
	            ps.setString(8, product.getStatus());

	            int rowsAffected = ps.executeUpdate();

	            
	            if (rowsAffected > 0) {
	                isProductAdded = true;
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	        } 

	        return isProductAdded;
	    }
	}

	
	
	

