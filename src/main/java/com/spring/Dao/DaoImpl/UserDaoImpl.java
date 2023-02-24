package com.spring.Dao.DaoImpl;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import com.spring.Dao.UserDao;
import com.spring.Modal.AddMenuItem;
import com.spring.Modal.Admin;
import com.spring.Modal.BookTable;
import com.spring.Modal.Contactus;
import com.spring.Modal.Login;
import com.spring.Modal.User;
import com.spring.Modal.EmpRegis;
import com.spring.Modal.HelpAndSupport;


@Component
public class UserDaoImpl implements UserDao {
	@Autowired 
	private HibernateTemplate hibernateTemplate;
	
	
	@Transactional
	@Override
	public int CustRegis(User user) {
		int id=(Integer)this.hibernateTemplate.save(user);
		return id;
	}
	
	
	@Transactional
	@Override
	public int logRegis(Login login) {
		int id=(Integer)this.hibernateTemplate.save(login);
		return id;
	}

	
	@Override
	public User getCustRegis(int id) {
		User u=this.hibernateTemplate.get(User.class, id);
		return u;
	}

	
	@Override
	public Login getLoginRegis(int id) {
		Login u=this.hibernateTemplate.get(Login.class, id);
		return u;
	}
	
	
	@Transactional
	@Override
	public int ContactusRegis(Contactus contactus) {
		int id =(Integer)this.hibernateTemplate.save(contactus);
		return id;
	}
	
	
	@Override
	public Contactus getContactus(int id) {
		Contactus c= this.hibernateTemplate.get(Contactus.class,id);
		return c;
	}
	
	
	@Transactional
	@Override
	public void setQidd(Contactus contactus) {
		this.hibernateTemplate.update(contactus);
		
	}
	
	
	@Transactional
	@Override
	public int EmpRegis(EmpRegis empRegis) {
		int id=(Integer)this.hibernateTemplate.save(empRegis);
		return id;
	}
	
	
	@Override
	public EmpRegis getEmpRegis(int id) {
		EmpRegis e=this.hibernateTemplate.get(EmpRegis.class, id);
		return e;
	}
	
	
	@Override
	public List<Login> getLoginRegisAll(Login login) {
		
		return this.hibernateTemplate.loadAll(Login.class);
	}
	
	
	@Override
	public Admin getAdmin(int id) {
		Admin a=this.hibernateTemplate.get(Admin.class, id);
		return a;
	}
	
	
	@Transactional
	@Override
	public String Eupdpw(EmpRegis empRegis, Login login) {
		this.hibernateTemplate.update(login);
		this.hibernateTemplate.update(empRegis);
		return "successfully updated";
	}
	
	
	@Transactional
	@Override
	public String Cupdpw(User user, Login login) {
		 this.hibernateTemplate.update(login);
		 this.hibernateTemplate.update(user);
		 return "successfully updated";
	}
	
	
	@Transactional
	@Override
	public String Aupdpw(Admin admin, Login login) {
		this.hibernateTemplate.update(login);
		 this.hibernateTemplate.update(admin);
		 return "successfully updated";
	}
	
	@Transactional
	@Override
	public int HelpAndSupportRegis(HelpAndSupport sprt) {
		int id =(Integer)this.hibernateTemplate.save(sprt);
		return id;
	}
	
	
	@Override
	public HelpAndSupport getHelpandSupport(int id) {
		HelpAndSupport a=this.hibernateTemplate.get(HelpAndSupport.class, id);
		return a;
	}
	
	@Transactional
	@Override
	public void sethlpsprtId(HelpAndSupport support) {
		this.hibernateTemplate.update(support);
		
	}
	
	
	@Override
	public List<User> getUserRegisAll() {
		return this.hibernateTemplate.loadAll(User.class);
	}
	
	
	@Override
	public List<com.spring.Modal.EmpRegis> getEmpRegisAll(com.spring.Modal.EmpRegis empRegis) {
		return this.hibernateTemplate.loadAll(EmpRegis.class);
	}
	
	
	@Override
	public List<Contactus> getContactRegisAll(Contactus contactus) {
		return this.hibernateTemplate.loadAll(Contactus.class);
	}
	
	
	@Override
	public List<HelpAndSupport> gethlpandsprtRegisAll(HelpAndSupport support) {
		return this.hibernateTemplate.loadAll(HelpAndSupport.class);
		
	}
	


	@Override
	@Transactional
	public int addMenuItem(AddMenuItem item) {
		int i=(Integer)hibernateTemplate.save(item);
		return i;
	}

	@Override
	public List<AddMenuItem> menuItemList() {
		List<AddMenuItem> items=hibernateTemplate.loadAll(AddMenuItem.class);
		return items;
	}

	@Override
	public AddMenuItem getDishImage(int id) {
		AddMenuItem item=hibernateTemplate.get(AddMenuItem.class, id);
		return item;
	}

	@Override
	@Transactional
	public void delMenuItem(AddMenuItem item) {
		hibernateTemplate.delete(item);
	}

	@Override
	@Transactional
	public void updateMenuItem(AddMenuItem item) {
		hibernateTemplate.update(item);		
	}

	@Transactional
	@Override
	public String custProfileDel(User user,Login login) {
		this.hibernateTemplate.delete(login);
		this.hibernateTemplate.delete(user);
		return "Successfull";
	}
	@Transactional
	@Override
	public String EmpProfileDel(EmpRegis empRegis,Login login) {
		this.hibernateTemplate.delete(login);
		this.hibernateTemplate.delete(empRegis);
		return "Successfull";
	}
	@Transactional
	@Override
	public String AdmProfileDel(Admin admin,Login login) {
		this.hibernateTemplate.delete(login);
		this.hibernateTemplate.delete(admin);
		return "Successfull";
	}


	@Override
	public List<com.spring.Modal.EmpRegis> EmpList() {
		List<EmpRegis> items=hibernateTemplate.loadAll(EmpRegis.class);
		return items;
	}


	@Override
	public EmpRegis getEmpresume(int id) {
		EmpRegis item=hibernateTemplate.get(EmpRegis.class, id);
		return item;
	
	}

	@Transactional
	@Override
	public String Delemp(Login login ,EmpRegis empRegis)
	{
		this.hibernateTemplate.delete(login);
		this.hibernateTemplate.delete(empRegis);
		return "Successfull";
	}
	
	
	@Override
	@Transactional
	public void deleteContact(Contactus us) {
		hibernateTemplate.delete(us);
	}

	@Override
	public List<HelpAndSupport> getAllHelpAndSupports() {
		List<HelpAndSupport> hs=hibernateTemplate.loadAll(HelpAndSupport.class);
		return hs;
	}
	@Override
	public List<Contactus> getContactQueries()
	{
		List<Contactus> list=hibernateTemplate.loadAll(Contactus.class);
		return list;
	}
	
	@Override
	@Transactional
	public void delHelpAndSupport(HelpAndSupport hs) {
		hibernateTemplate.delete(hs);
	}

	@Transactional 
	@Override
	public String AdminEmpUpdate(com.spring.Modal.EmpRegis empRegis) {
		this.hibernateTemplate.update(empRegis);
		return "Successfully Updated";
	}


	@Override
	public List<User> CustList() {
		return this.hibernateTemplate.loadAll(User.class);
		
	}	
	
	@Override
	  @Transactional
	  public int bookTable(BookTable table) {
	    int i=(Integer)hibernateTemplate.save(table);
	    return i;
	  }


	  @Override
	  @Transactional
	  public void delTable(BookTable table) 
	  {
	    hibernateTemplate.delete(table);
	  }
	  
	  @Override
	  @Transactional
	  public void UpdTable(BookTable table) {
	    hibernateTemplate.update(table);
	  }


	  @Override
	  public BookTable getTable(int tableId) {
	    return hibernateTemplate.get(BookTable.class, tableId);
	  }


	  @Override
	  public List<BookTable> getAllTables() {
	    List<BookTable> lst=hibernateTemplate.loadAll(BookTable.class);
	    return null;
	  }

	
}
