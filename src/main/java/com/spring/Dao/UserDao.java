package com.spring.Dao;

import java.util.List;

import com.spring.Modal.AddMenuItem;
import com.spring.Modal.Admin;
import com.spring.Modal.BookTable;
import com.spring.Modal.Contactus;
import com.spring.Modal.Login;
import com.spring.Modal.User;
import com.spring.Modal.EmpRegis;
import com.spring.Modal.HelpAndSupport;

public interface UserDao {
	public int CustRegis(User user);
	public int EmpRegis(EmpRegis empRegis);
	public int logRegis(Login login);
	public int ContactusRegis(Contactus contactus);
	public int  HelpAndSupportRegis(HelpAndSupport sprt);
	
	public User getCustRegis(int id);
	public EmpRegis getEmpRegis(int id);
	public Admin getAdmin(int id);
	public Login getLoginRegis(int id);
	public Contactus getContactus(int id);
	public HelpAndSupport getHelpandSupport(int id);
	
	public void setQidd(Contactus contactus );
	public void sethlpsprtId(HelpAndSupport support);
	
	public List<Login> getLoginRegisAll(Login login);
	public List<User> getUserRegisAll();
	public List<EmpRegis> getEmpRegisAll(EmpRegis empRegis);
	public List<Contactus> getContactRegisAll(Contactus contactus);
	public List<HelpAndSupport> gethlpandsprtRegisAll(HelpAndSupport support);
	
	public String Eupdpw(EmpRegis empRegis,Login login);
	public String Cupdpw(User user,Login login);
	public String Aupdpw(Admin a,Login login);
	
public int addMenuItem(AddMenuItem item);
public List<AddMenuItem> menuItemList();
public AddMenuItem getDishImage(int id);
public void delMenuItem(AddMenuItem item);
public void updateMenuItem(AddMenuItem item);
	
	
public String custProfileDel(User user,Login login);
public String EmpProfileDel(EmpRegis empRegis,Login login);
public String AdmProfileDel(Admin admin,Login login);


public List<EmpRegis> EmpList();
public EmpRegis getEmpresume(int id);
public String Delemp(Login login ,EmpRegis empRegis);




public List<Contactus> getContactQueries();
public void deleteContact(Contactus us);
public List<HelpAndSupport> getAllHelpAndSupports();
public void delHelpAndSupport(HelpAndSupport hs);

public String AdminEmpUpdate(EmpRegis empRegis);
public List<User> CustList();


public int bookTable(BookTable table);
public void delTable(BookTable table);
public void UpdTable(BookTable table);
public BookTable getTable(int tableId);
public List<BookTable> getAllTables();


}
