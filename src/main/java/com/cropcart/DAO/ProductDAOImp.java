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
	            pd.setCategoty(rs.getString("categoty"));
	            pd.setTitle(rs.getString("title"));
	            pd.setImage(rs.getString("image"));
	            pd.setQuantity(rs.getInt("quantity"));
	            pd.setDescription(rs.getString("description"));
	            pd.setQuantity_type(rs.getString("quantity_type"));
	            pd.setPrice(rs.getString("price"));
	            pd.setStatus(rs.getString("status"));
	            pd.setFarmer_id(rs.getInt("farmer_id"));
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
		            pd.setPrice(rs.getString("price"));
		            pd.setStatus(rs.getString("status"));
		            pd.setFarmer_id(rs.getInt("farmer_id"));
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
	        String query = "INSERT INTO product_details (categoty, title, image, quantity, description, quantity_type, price, status,FARMER_ID) "
	                     + "VALUES (?, ?, ?, ?, ?, ?, ?, ?,?)";
	        boolean isProductAdded = false;

	        try {
	            ps = con.prepareStatement(query);
	            ps.setString(1, product.getCategoty());
	            ps.setString(2, product.getTitle());
	            ps.setString(3, product.getImage());
	            ps.setInt(4, product.getQuantity());
	            ps.setString(5, product.getDescription());
	            ps.setString(6, product.getQuantity_type());
	            ps.setString(7, product.getPrice());
	            ps.setString(8, product.getStatus());
	            ps.setInt(9, product.getFarmer_id());
	            int rowsAffected = ps.executeUpdate();

	            
	            if (rowsAffected > 0) {
	                isProductAdded = true;
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	        } 

	        return isProductAdded;
	    }
  
  @Override
	public List<ProductDetails> getProducts(int farmer_id) {
	    PreparedStatement ps = null;
	    ResultSet rs = null;
	    String query = "SELECT * FROM product_details WHERE farmer_id=?";
	    ArrayList<ProductDetails> al = new ArrayList<>();
	    ProductDetails pd = null;

	    try {
	        ps = con.prepareStatement(query);
	        ps.setInt(1, farmer_id);
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
	            pd.setPrice(rs.getString("price"));
	            pd.setStatus(rs.getString("status"));
	            pd.setFarmer_id(rs.getInt("farmer_id"));
	            al.add(pd);	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } 
	    return al; 
	}

  @Override
  public boolean updateProduct(ProductDetails product) {
      PreparedStatement ps = null;
      String query = "UPDATE product_details SET  quantity = ?, description = ? ,price = ?, status = ? WHERE product_id = ?";
      boolean isUpdated = false;

      try {
          ps = con.prepareStatement(query);
         
          ps.setInt(1, product.getQuantity());
          ps.setString(2, product.getDescription());
          ps.setString(3, product.getPrice());
          ps.setString(4, product.getStatus());
          ps.setInt(5, product.getProduct_id());  // The product ID to identify which product to update

          int rowsAffected = ps.executeUpdate();

          if (rowsAffected > 0) {
              isUpdated = true;  // If at least one row was updated, return true
          }
      } catch (SQLException e) {
          e.printStackTrace();
      }

      return isUpdated;  // Return whether the product was successfully updated
  }


@Override
	 public List<ProductDetails> getPurchasedProducts(int customerId) {
	        List<ProductDetails> productList = new ArrayList<>();
	        
	        String query = "SELECT p.id, p.title, p.image, p.category, p.quantity, p.quantity_type, p.price " +
	                       "FROM purchases pu " +
	                       "JOIN products p ON pu.product_id = p.id " +
	                       "WHERE pu.customer_id = ?";
	        
	        try {
	             PreparedStatement ps = con.prepareStatement(query);
	            ps.setInt(1, customerId);
	            ResultSet rs = ps.executeQuery();
	            
	            while (rs.next()) {
	                ProductDetails product = new ProductDetails();
	                product.setProduct_id(rs.getInt("product_id"));
	                product.setTitle(rs.getString("title"));
	                product.setImage(rs.getString("image"));
	                product.setCategoty(rs.getString("category"));
	                product.setQuantity(rs.getInt("quantity"));
	                product.setQuantity_type(rs.getString("quantity_type"));
	                product.setPrice(rs.getString("price"));
	                
	                productList.add(product);
	            }
	        
	        } 
	        catch (Exception e) {
	            e.printStackTrace();
	        }
	        
	        return productList;
}
}

