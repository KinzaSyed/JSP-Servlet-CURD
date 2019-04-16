package com.work.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.work.Model.Admin;
import com.work.Util.DBUtil;

public class AdminImpl implements IAdmin {

	private Connection con;
	public AdminImpl() {
		con = DBUtil.getConnection();
	}
	@Override
	public void Register(Admin admin) {
		try {
		String query ="INSERT INTO Admin (FirstName, LastName, UserName, Password, DateCreated) VALUES (?,?,?,?,NOW())";
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, admin.getFirstName());
		ps.setString(2, admin.getLastName());
		ps.setString(3, admin.getUserName());
		ps.setString(4,admin.getPassword());
		
		ps.executeUpdate();
		ps.close();
		}
		
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public List<Admin> getAllAdmins() {
		List<Admin> list = new ArrayList<>();
		try {
			String query = "SELECT * FROM Admin";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				Admin admin = new Admin();
				admin.setId(rs.getInt("Id"));
				admin.setFirstName(rs.getString("FirstName"));
				admin.setLastName(rs.getString("LastName"));
				admin.setUserName(rs.getString("UserName"));
				admin.setDateCreated(rs.getDate("DateCreated"));
				list.add(admin);
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public void DeleteAdmin(int Id) {
		try {
			String query = "DELETE FROM Admin Where Id=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1,Id);
			ps.executeUpdate();
			
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
	}
	@Override
	public void UpdateAdmin(Admin admin) {
		try {
			String query = "UPDATE Admin SET FirstName=?, LastName=?, UserName=?, Password=?, DateCreated=NOW() WHERE Id=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, admin.getFirstName());
			ps.setString(2, admin.getLastName());
			ps.setString(3, admin.getUserName());
			ps.setString(4, admin.getPassword()); 
			ps.setInt(5, admin.getId());
			ps.executeUpdate();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
	}
	@Override
	public boolean Login(String Username, String Password) {
		try {
			String query = "SELECT UserName AND Password FROM Admin WHERE UserName =? AND Password=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, Username);
			ps.setString(2,Password);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				return true;
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	@Override
	public Admin getAdmin(int id) {
		Admin admin = new Admin(); 
		
		try {
			String query = "SELECT * FROM Admin WHERE Id=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				admin.setFirstName(rs.getString("FirstName"));
				admin.setLastName(rs.getString("LastName"));
				admin.setUserName(rs.getString("UserName"));
				admin.setPassword(rs.getString("Password"));
				admin.setId(rs.getInt("Id"));
			}
			
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return admin;
	}
}
