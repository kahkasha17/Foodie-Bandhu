package com.spring.Service;

import com.spring.Modal.Login;
import com.spring.Modal.User;
import com.spring.Modal.UserLogin;
import com.spring.Modal.EmpRegis;
import com.spring.Modal.HelpAndSupport;

import java.util.List;

import com.spring.Modal.AddMenuItem;
import com.spring.Modal.Admin;
import com.spring.Modal.BookTable;
import com.spring.Modal.Contactus;

public interface ServiceDao {
	public String RegisLogin(User user,Login login);//for customer regis
	public String EmpLogin(EmpRegis empregis,Login login);// for employee regis
	public String Contactus(Contactus contactus);// for contact us regis
	public String HelpandSupport(HelpAndSupport helpAndSupport);// for contact us regis
	public User custlogin(Login login,UserLogin userLogin);
	public Admin getAdmininfo(int id);
	public String sendOtp(String otp,String email,String name);
	
public String addMenuItem(AddMenuItem item);
public List<AddMenuItem> getMenuItems();
public AddMenuItem getMenuItem(int id);
public String delMenuItem(int id);
public String updateMenuItem(AddMenuItem item);


public List<EmpRegis> getEmp();
public EmpRegis getEmpResume(int id);
public String delEmp(int id, int lid);

	public List<Contactus> getContactQueries();
	public void updContact(Contactus us);
	public Contactus getContactus(int id);
	public void deleteContact(int id);
	public List<HelpAndSupport> getAllHhelpNSupprt();
	public HelpAndSupport getHelpNSuprt(int id);
	public void updHelpNSprt(HelpAndSupport hs);
	public void delHelpNSprt(int id);



public int bookTable(BookTable table);
public String delTable(BookTable table);
public String UpdTable(BookTable table);
public BookTable getTable(int tableId);
public List<BookTable> getAllTables();

	
	




}
