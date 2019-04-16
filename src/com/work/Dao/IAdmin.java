package com.work.Dao;

import java.util.List;

import com.work.Model.Admin;

public interface IAdmin {

	public void Register(Admin admin);
	public  List<Admin> getAllAdmins();
	public void DeleteAdmin(int Id);
	public void UpdateAdmin(Admin admin);
	public boolean Login(String Username, String Password);
	public Admin getAdmin(int id);
}
