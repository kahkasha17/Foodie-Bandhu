package com.spring.Controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import com.spring.Service.ServiceDao;

@Controller
public class ForgetpwController {
	
	@Autowired
	private UserDao daoImpl;
	@Autowired
	private ServiceDao dao;
	String fbid=null;
	String email=null;
	String uname=null;
	int sr;
	String otp;
	
	
	
	@RequestMapping(value = "/forgetpwAction" , method = RequestMethod.POST)
	public RedirectView SendOtp(@RequestParam("uid") String uid,HttpServletRequest request,Login login,Model model)
	{
		System.out.println("forget pw controller");
		System.out.println(uid);
		boolean index=false;
		boolean wel=false;
		String s="1";
		fbid =uid;
		model.addAttribute("s", s);
		String u=uid.toUpperCase();
		
		RedirectView redirectView = new RedirectView();
		List<Login> logins=daoImpl.getLoginRegisAll(login);
		for(Iterator iterator=logins.iterator();iterator.hasNext();)
		{
			Login login2=(Login)iterator.next();
			if(login2.getUid().equals(u))
			{
				wel=true;
				email=login2.getMail();
				uname=login2.getUsername();
				sr=login2.getSr();
				break;
				
			}
			else
			{
			index=true;
			}
		}
		
		
			if(wel==true)
			{
				System.out.println(email); 
				System.out.println(uname); 
				 int randomPin   =(int) (Math.random()*9000)+1000;
			     otp  = String.valueOf(randomPin);
			     dao.sendOtp(otp, email, uname);
			     System.out.println("otp is:- "+otp);
				
			}
			else
			{
				redirectView.setUrl(request.getContextPath()+ "/");
				s="2";//for invalid id
				model.addAttribute("s", s);
				
			}
		
		
		
		redirectView.setUrl(request.getContextPath()+ "/");
		return redirectView;
	}
	
	@RequestMapping(value = "/otpMatch" , method = RequestMethod.POST)
	public RedirectView OtpMatch(@RequestParam("otp") String uotp,HttpServletRequest request,Login login,Model model)
	{
		System.out.println(otp);
		System.out.println(email);
		System.out.println(fbid);
		System.out.println(uname);
		RedirectView redirectView = new RedirectView();
		String s="0"; //for invalid otp
		model.addAttribute("s", s);
		System.out.println(sr);
		
		
		if(otp.equals(uotp))
		{
			 s="3";
			 model.addAttribute("s", s);
			 System.out.println("OTP match");
			 redirectView.setUrl(request.getContextPath()+ "/");
			 return redirectView;
			
		}
		
		 System.out.println("string= "+s);
		 redirectView.setUrl(request.getContextPath()+ "/");
		 return redirectView;
	}
	
	@RequestMapping(value = "/updPW" , method = RequestMethod.POST)
	public RedirectView updPW(@RequestParam("pw") String pw,HttpServletRequest request,Login login,User user,EmpRegis empRegis,Model model)
	{
		System.out.println(pw);
		String str=fbid.substring(5);
		int id=Integer.parseInt(str);
		System.out.println(id);
		String s="5";
		model.addAttribute("s", s);
		login=daoImpl.getLoginRegis(id);
		RedirectView redirectView = new RedirectView();
		System.out.println(fbid);
		System.out.println(sr);
		String uid=fbid.toUpperCase();
		if(uid.startsWith("C"))
		{
			System.out.println("update employee pw");
			User u=daoImpl.getCustRegis(id);
			u.setPw(pw);
			login=daoImpl.getLoginRegis(sr);
			login.setPw(pw);
			daoImpl.Cupdpw(u,login);
			s="6";
			model.addAttribute("s", s);
		
		}
		 if(uid.startsWith("E"))
		 {
			 System.out.println("update employee pw");
			EmpRegis e= daoImpl.getEmpRegis(id);
			e.setPw(pw);
			login= daoImpl.getLoginRegis(sr);
			login.setPw(pw);
			daoImpl.Eupdpw(e,login);
			s="6";
			model.addAttribute("s", s);
			
		 }
		 if(uid.startsWith("A"))
		 {
			 System.out.println("update employee pw");
			Admin a=daoImpl.getAdmin(id);
			a.setPw(pw);
			login=daoImpl.getLoginRegis(sr);
			login.setPw(pw);
			daoImpl.Aupdpw(a,login);
			s="6";
			model.addAttribute("s", s);
			
		 }
		 System.out.println("hello");
		 redirectView.setUrl(request.getContextPath()+ "/");
		 return redirectView;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
