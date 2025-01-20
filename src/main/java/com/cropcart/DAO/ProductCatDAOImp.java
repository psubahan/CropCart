package com.cropcart.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.cropcart.db.dbConnection;
import com.cropcart.dto.Articles;
import com.cropcart.dto.ProductCategory;

public class ProductCatDAOImp implements ProductCatDAO {
	private Connection con;
	
	public ProductCatDAOImp() {
	this.con=dbConnection.getConnection();
	}
	
	
	@Override
	public ArrayList<ProductCategory> getProductCategory(){
		ArrayList<ProductCategory> al = new ArrayList<>();
		PreparedStatement ps = null;
		ResultSet rs = null;
		//productCategory_id, category, image, description, status
		
		try {
			ps=con.prepareStatement("select * from ProductCategory ");
			rs=ps.executeQuery();
			while(rs.next()) {
				ProductCategory pc=new ProductCategory();
				pc.setProductCategory_id(1);
				pc.setCategory(rs.getString(2));
				pc.setImg(rs.getString(3));
				pc.setDescription(rs.getString(4));
				pc.setStatus(rs.getString(5));
				al.add(pc);
		}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return al;
		}
		
		@Override
		public  ProductCategory getProduct(int ProductCategory_id) {
			PreparedStatement ps = null;
			ResultSet rs = null;
			ProductCategory pc=new ProductCategory();

			
			try {
				ps = con.prepareStatement("SELECT * FROM ProductCategory WHERE productCategory_id=?");
				ps.setInt(1, ProductCategory_id);
				rs=ps.executeQuery();
				while(rs.next()) {
					pc.setCategory(rs.getString("Category"));
					pc.setImg(rs.getString("image"));//
					pc.setDescription(rs.getString("Description"));
					pc.setStatus(rs.getString("Status"));
				}
	
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return pc;
		}

	

		


	}


	