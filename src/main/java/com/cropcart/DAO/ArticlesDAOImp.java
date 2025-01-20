package com.cropcart.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.cropcart.db.dbConnection;
import com.cropcart.dto.Articles;

public class ArticlesDAOImp implements ArticlesDAO {
 
	private Connection con;
    
	public ArticlesDAOImp() {
		this.con = dbConnection .getConnection();
	}


	@Override
	public ArrayList<Articles> getArticles() {
		ArrayList<Articles> al = new ArrayList<>();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		
		try {
			ps = con.prepareStatement("SELECT articles_id,Article_type, DATE_FORMAT(publish_Date, '%d%b %Y'), title, Description, Article_image FROM articles");
			rs = ps.executeQuery();
			while(rs.next()) {
				Articles a = new Articles();
				a.setArticle_id(rs.getInt(1));
				a.setArticle_type(rs.getString(2));
				a.setPublish_Date(rs.getString(3));
				a.setTitle(rs.getString(4));
				a.setDescription(rs.getString(5));
				a.setArticle_image(rs.getString(6));
				al.add(a);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return al;
	}


	@Override
	public Articles getArticle(int articles_id) {
		PreparedStatement ps = null;
		ResultSet rs = null;
		Articles a = new Articles();
		
		try {
			ps = con.prepareStatement("SELECT articles_id,Article_type, DATE_FORMAT(publish_Date, '%d%b %Y'), title, Description, Article_image FROM articles WHERE ARTICLES_ID=?");
			ps.setInt(1, articles_id);
			rs=ps.executeQuery();
			while(rs.next()) {
				a.setArticle_id(rs.getInt(1));
				a.setArticle_type(rs.getString(2));
				a.setPublish_Date(rs.getString(3));
				a.setTitle(rs.getString(4));
				a.setDescription(rs.getString(5));
				a.setArticle_image(rs.getString(6));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return a;
	}
	
	public boolean updateArticle(Articles a) {
	    PreparedStatement ps = null;
	    int res = 0;

	    try {
	        String query = "UPDATE articles SET  title = ?, Description = ?, Article_image = ? WHERE ARTICLES_ID = ?";
	        ps = con.prepareStatement(query);

	        ps.setString(1, a.getTitle());
	        ps.setString(2, a.getDescription());
	        ps.setString(3, a.getArticle_image());
	        ps.setInt(4, a.getArticle_id()); 

	        res = ps.executeUpdate();

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    if (res > 0) {
	       return true;
	    } else {
	       return false;
	    }

	}


	@Override
	public boolean addArticles(Articles a) {
		PreparedStatement ps = null;
		ResultSet rs = null;
		int res = 0;
		
		 String query = "INSERT INTO ARTICLES(articles_id,Article_type,publish_Date,title,Description,Article_image) VALUES(0,?,?,?,?,?)";
	     try {
			ps = con.prepareStatement(query);
			
			ps.setString(1,a.getArticle_type());
			ps.setString(2, a.getPublish_Date());
			ps.setString(3, a.getTitle());
			ps.setString(4,a.getDescription());
			ps.setString(5, a.getArticle_image());
			
			res = ps.executeUpdate();
			
			} catch (SQLException e) {
			e.printStackTrace();
		}
	     
	    if(res>0) {
	    	return true;
	    }
	    else {
	    	return false;
	    }
		
	}
	
	




}
