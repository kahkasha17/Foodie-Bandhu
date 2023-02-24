package com.spring.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.RedirectView;

import com.spring.Dao.UserDao;
import com.spring.Modal.AddMenuItem;
import com.spring.Modal.Login;
import com.spring.Modal.User;
import com.spring.Service.ServiceDao;

@Controller
public class MainController {
	@Autowired
	private ServiceDao dao;
	
	
	@RequestMapping("/")
	public String Home(Model model)
	{
		System.out.println("This is home controller");
		List<AddMenuItem> list=dao.getMenuItems();
        model.addAttribute("menuList", list);
		return "index";
	}
	@RequestMapping("/regis")
	public String Regis(Model model)
	{
		System.out.println("This is regis controller");
		return "regis";
	}
	@RequestMapping("/empregis")
	public String EmpRegis(Model model)
	{
		System.out.println("This is Employee regis controller");
		return "Empregis";
	}
	@RequestMapping("/cust")
	public String Customer(Model model)
	{
		System.out.println("This is customer controller");
//		model.addAttribute("name", "kahkasha");
		return "customer";
	}
	@RequestMapping("/admin")
	public String Admin(Model model)
	{
		System.out.println("This is Admin controller");
		return "admin";
	}
	@RequestMapping("/employee")
	public String Employee(Model model)
	{
		System.out.println("This is Employee controller");
		return "employee";
	}
	@RequestMapping("/profile")
	public String Profile(Model model)
	{
		System.out.println("This is Employee controller");
		return "profile";
	}
	@RequestMapping("/order")
	public String Order(Model model)
	{
		System.out.println("This is Order controller");
		
		return "order";
	}
	
}
