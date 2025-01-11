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
		this.con = dbConnection.getConnection();
	}


	@Override
	public ArrayList<Articles> getArticles() {
		ArrayList<Articles> al = new ArrayList<>();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		
		try {
			ps = con.prepareStatement("SELECT Article_type, DATE_FORMAT(publish_Date, '%d%b %Y'), title, Description, Article_image FROM articles");
			rs = ps.executeQuery();
			while(rs.next()) {
				Articles a = new Articles();
				a.setArticle_type(rs.getString(1));
				a.setPublish_Date(rs.getString(2));
				a.setTitle(rs.getString(3));
				a.setDescription(rs.getString(4));
				a.setArticle_image(rs.getString(5));
				al.add(a);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return al;
	}

}
