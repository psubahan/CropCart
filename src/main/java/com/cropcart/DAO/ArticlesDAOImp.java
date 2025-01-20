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
				a.setArticle_id(1);
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
			ps = con.prepareStatement("SELECT * FROM ARTICLES WHERE ARTICLES_ID=?");
			ps.setInt(1, articles_id);
			rs=ps.executeQuery();
			while(rs.next()) {
				a.setDescription(rs.getString("Description"));
				a.setTitle(rs.getString("title"));
				a.setArticle_image(rs.getString("Article_image"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return a;
	}

}
