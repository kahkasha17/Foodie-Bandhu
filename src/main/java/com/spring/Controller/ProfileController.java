package com.spring.Controller;


import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import com.spring.Dao.UserDao;
import com.spring.Modal.Admin;
import com.spring.Modal.EmpRegis;
import com.spring.Modal.Login;
import com.spring.Modal.User;


@Controller
public class ProfileController
{
	@Autowired
	private UserDao userDao;
	
	
	int sr;
	
	@RequestMapping(value = "/UserProfile" , method = RequestMethod.POST)
	public RedirectView custProfile(User user,Login login,EmpRegis empRegis,Admin admin,@RequestParam("id") int id,@RequestParam("uc") String ucode,
			@RequestParam("fname") String fname,@RequestParam("lname") String lname,@RequestParam("mail") String mail,
			@RequestParam("phn") String phn,@RequestParam("addr") String addr,HttpServletRequest request,HttpSession session,HttpServletResponse response)
	{
		String lid=ucode+"ID00"+id;
		Boolean wel=false;
		try {
			
			List<Login> logins=userDao.getLoginRegisAll(login);
			for(Iterator iterator=logins.iterator();iterator.hasNext();)
			{
				 login=(Login)iterator.next();
				if(login.getUid().equals(lid))
				{
					sr=login.getSr();
					wel=true;
					break;
				}
				else
				{
					wel=false;
				}
				
			
			}
			if(wel==true)
			{
				login=userDao.getLoginRegis(sr);
				login.setUsername(fname+" "+lname);
				login.setLastmodified(new Date());
				
				 if(ucode.startsWith("C"))
				 {
					 user=userDao.getCustRegis(id);
					 user.setFname(fname);
					 user.setLname(lname);
					 user.setMail(mail);
					 user.setPhn(phn);
					 user.setAddr(addr);
					 
					 userDao.Cupdpw(user, login);
					 session.setAttribute("user",user); 
				 }
				 else if(ucode.startsWith("E"))
				 {
					 empRegis=userDao.getEmpRegis(id);
					 empRegis.setFname(fname);
					 empRegis.setLname(lname);
					 empRegis.setMail(mail);
					 empRegis.setPhn(phn);
					 empRegis.setAddr(addr);
					 
					 userDao.Eupdpw(empRegis, login);
					 session.setAttribute("user",empRegis); 
				 }
				 else if(ucode.startsWith("A"))
				 {
					 admin=userDao.getAdmin(id);
					 admin.setFname(fname);
					 admin.setLname(lname);
					 admin.setMail(mail);
					 admin.setPhn(phn);
					 admin.setAddr(addr);
					 
					 userDao.Aupdpw(admin, login);
					 session.setAttribute("user",admin); 
				 }
				 
				 
				 
				
			}
					 }catch (Exception e) {
						// TODO: handle exception
					}
		session.setAttribute("i", "0");
		RedirectView redirectView=new RedirectView();
		redirectView.setUrl(request.getContextPath()+ "/profile");
		return redirectView;
	}
	
	@RequestMapping(value = "/UserProfilePwupd" , method = RequestMethod.POST)
	public RedirectView custProfilePw(User user,Login login,EmpRegis empRegis,Admin admin,@RequestParam("id") int id,@RequestParam("uc") String ucode,@RequestParam("pw") String pw,
			HttpServletRequest request,HttpSession session,HttpServletResponse response)
	{
		 
		String lid=ucode+"ID00"+id;
		 Boolean wel=false;
		 try {
					
				List<Login> logins=userDao.getLoginRegisAll(login);
				for(Iterator iterator=logins.iterator();iterator.hasNext();)
				{
					 login=(Login)iterator.next();
					if(login.getUid().equals(lid))
					{
						sr=login.getSr();
						wel=true;
						break;
					}
					else
					{
						wel=false;
					}
					
				
				}
if(wel==true)
{
	login=userDao.getLoginRegis(sr);
	login.setPw(pw);
	login.setLastmodified(new Date());
	 if(ucode.startsWith("C"))
	 {
		 user=userDao.getCustRegis(id);
		 user.setPw(pw);
		 userDao.Cupdpw(user, login);
		 session.setAttribute("user",user);
		 
	 }
	 else if(ucode.startsWith("E"))
	 {
		 empRegis=userDao.getEmpRegis(id);
		 empRegis.setPw(pw);
		 empRegis.setLastmodified(new Date());
		 userDao.Eupdpw(empRegis, login);
		 session.setAttribute("user",empRegis); 
	 }
	 else if(ucode.startsWith("A"))
	 {
		 admin=userDao.getAdmin(id);
		 admin.setPw(pw);
		 userDao.Aupdpw(admin, login);
		 session.setAttribute("user",admin); 
	 }
}
		 }catch (Exception e) {
			// TODO: handle exception
		}
session.setAttribute("i", "1");
RedirectView redirectView=new RedirectView();
redirectView.setUrl(request.getContextPath()+ "/profile");
return redirectView;
	}
	

	@RequestMapping(value = "/UserProfileDel" , method = RequestMethod.POST)
	public RedirectView custProfilePw(User user,Login login,Model model,EmpRegis empRegis,Admin admin,@RequestParam("id") int id,@RequestParam("uc") String ucode,HttpServletRequest request,HttpSession session,HttpServletResponse response)
	{
		 
		String lid=ucode+"ID00"+id;
		 Boolean wel=false;
		 try {
					
				List<Login> logins=userDao.getLoginRegisAll(login);
				for(Iterator iterator=logins.iterator();iterator.hasNext();)
				{
					 login=(Login)iterator.next();
					if(login.getUid().equals(lid))
					{
						sr=login.getSr();
						wel=true;
						break;
					}
					else
					{
						wel=false;
					}
					
				
				}
if(wel==true)
{
	login=userDao.getLoginRegis(sr);
	 if(ucode.startsWith("C"))
	 {
		 user=userDao.getCustRegis(id);
		 userDao.custProfileDel(user, login);
		 
		 
	 }
	 else if(ucode.startsWith("E"))
	 {
		 empRegis=userDao.getEmpRegis(id);
		 userDao.EmpProfileDel(empRegis, login);
		  
	 }
	 else if(ucode.startsWith("A"))
	 {
		 admin=userDao.getAdmin(id);
		 userDao.AdmProfileDel(admin, login);
		 
	 }
} }catch (Exception e) {
			System.out.println("Exception is:-"+e);
		}
String t="2";		 
model.addAttribute("t", t);
RedirectView redirectView=new RedirectView();
redirectView.setUrl(request.getContextPath()+ "/");
return redirectView;
}
	

	
	
	
	
	
	
	
	
	
	
	
	
	

}
