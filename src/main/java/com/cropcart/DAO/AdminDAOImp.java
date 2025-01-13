package com.cropcart.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.cropcart.db.dbConnection;
import com.cropcart.dto.Admin;

public class AdminDAOImp implements AdminDAO {

	private Connection con=null;
	public AdminDAOImp()
	{
		this.con=dbConnection.getConnection();
	}
	@Override
	public String addAdmin(Admin a) {
		PreparedStatement ps=null;
		int rs=0;
		String status="";
		String query="INSERT INTO ADMIN(NAME,MAIL,PHONE,PASSWORD) VALUES(?,?,?,?)";
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, a.getName());
			ps.setString(2, a.getMail());
			ps.setLong(3, a.getPhone());
			ps.setString(4, a.getPassword());
			rs=ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(rs>0)
        {
            try {
                con.commit();
                status="Success";
            } catch (SQLException ex) {
                throw new RuntimeException(ex);
            }
        }
        else {
            try {
                con.rollback();
                status="failed";
            } catch (SQLException ex) {
                throw new RuntimeException(ex);
            }
            
        }
		return status;
	}
	@Override
	public Admin getAdmin(String mail,String password) {
		String query="SELECT * FROM ADMIN WHERE MAIL=? AND PASSWORD=?";
		PreparedStatement ps=null;
		ResultSet rs=null;
		Admin a=null;
		
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, mail);
			ps.setString(2, password);
			rs=ps.executeQuery();
			while(rs.next())
			{
				a=new Admin();
				a.setAdmin_id(rs.getInt(1));
				a.setName(rs.getString(2));
				a.setMail(rs.getString(3));
				a.setPhone(rs.getLong(4));
				a.setPassword(rs.getString(5));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return a;
	}

}
