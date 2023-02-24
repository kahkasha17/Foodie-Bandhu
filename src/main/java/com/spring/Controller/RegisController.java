package com.spring.Controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.spring.Modal.Contactus;
import com.spring.Modal.Login;
import com.spring.Modal.User;
import com.spring.Modal.EmpRegis;
import com.spring.Service.ServiceDao;

@Controller
public class RegisController

{
	@Autowired
	private ServiceDao dao;
	
	
	
	
	@RequestMapping(value = "/CustRegis" , method = RequestMethod.POST)
	public RedirectView CustomerRegis(@ModelAttribute User user,HttpServletRequest request,Model model,Login login)
	
	{
		
		System.out.println("This is regis controller");
		System.out.println(user);
		System.out.println(login);
		login.setLastmodified(new Date());
		user.setLastmodified(new Date());
		dao.RegisLogin(user,login);
		String t="1";
		model.addAttribute("t",t);	
		RedirectView redirectView=new RedirectView();
	    redirectView.setUrl(request.getContextPath()+ "/");
		return redirectView;
	}
	@RequestMapping(value = "/EmpRegis" , method = RequestMethod.POST,consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public RedirectView EmployeeRegis(@ModelAttribute EmpRegis empRegis,HttpServletRequest request,Model model,Login login)
	
	{
		
		System.out.println("This is Empregis controller");
		System.out.println(empRegis);
		System.out.println(login);
		login.setLastmodified(new Date());
		empRegis.setLastmodified(new Date());
		dao.EmpLogin(empRegis,login);
		String t="1";
		model.addAttribute("t",t);	
		RedirectView redirectView=new RedirectView();
	    redirectView.setUrl(request.getContextPath()+ "/");
		return redirectView;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
