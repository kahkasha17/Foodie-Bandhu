package com.spring.Controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.Dao.UserDao;
import com.spring.Modal.AddMenuItem;
import com.spring.Modal.AddOrder;
import com.spring.Modal.EmpRegis;
import com.spring.Modal.Login;
import com.spring.Modal.User;
import com.spring.Service.ServiceDao;

@Controller
public class OrderController {
	@Autowired
	private ServiceDao dao;
	@Autowired
	private UserDao userDao;

	@RequestMapping("/Menuorder")
	public ModelAndView Order(Model model, HttpServletRequest request, HttpSession session) {
		String pid = request.getParameter("id");
		String uid = request.getParameter("uid");
		int id = Integer.parseInt(pid);
		System.out.println("uid" + uid);
		int uuid = Integer.parseInt(uid);
		System.out.println(id);
		System.out.println(uid);
		Boolean wel = false;

		try {

			List<AddMenuItem> list = dao.getMenuItems();
			for (Iterator iterator = list.iterator(); iterator.hasNext();) {
				AddMenuItem addMenuItem = (AddMenuItem) iterator.next();
				if (addMenuItem.getImgId() == id) {
					wel = true;
					addMenuItem = dao.getMenuItem(id);
					User user = userDao.getCustRegis(uuid);
					int price = addMenuItem.getPrice();
					System.out.println("Price is" + price);
					session.setAttribute("menu", addMenuItem);
					session.setAttribute("user", user);
					session.setAttribute("dao", dao);
					model.addAttribute("price", price);
					break;
				} else {
					wel = false;
				}

			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		ModelAndView modelAndView = new ModelAndView("order");
		model.addAttribute("order", "0");
		return modelAndView;
	}

	
	
	
	@RequestMapping("/JSToJava")
	public String hii(@RequestParam("uid") String uid, @RequestParam("qty") String qty, @RequestParam("did") String did,
			Model model,HttpSession session) {
		System.out.println("Data from js to java " + did + "  " + qty + " User id is " + uid);
		String order = "1";
		Boolean wel = false;
		model.addAttribute("order", order);
		Set<String> userId = new HashSet<>();
		String idSplit[] = uid.split(":");

		for (int i = 0; i < idSplit.length; i++) {
			String Iuid = idSplit[i];
			userId.add(Iuid);
		}

		System.out.println("User ID is " + userId);

		List<Integer> dishId = new ArrayList<>();
		String sids[] = did.split(":");
		for (int i = 0; i < sids.length; i++) {
			int myid =Integer.parseInt(sids[i]) ;
			dishId.add(myid);
		}

		System.out.println("Dish Ids are " + dishId);

		List<String> qtyList = new ArrayList<>();
		String sqty[] = qty.split(":");
		for (int i = 0; i < sqty.length; i++) {
			String syid = sqty[i];

			qtyList.add(syid);
			
		}
		session.setAttribute("quantity", qtyList);
		System.out.println("Qunaities are " + qtyList);
		
		
		
		
		
		
		/* User id get here */
		Set<Integer> ids = userId.stream().map(s -> Integer.parseInt(s)).collect(Collectors.toSet());
		System.out.println(ids);
		int id = 0;	
		for (int val : ids) {
			id = val;
			break;
		}
		System.out.println(id);
		User user=userDao.getCustRegis(id);
		session.setAttribute("user", user);
		/* User id get ends here  */
		
		
		/* Dish id get here */
		/*
		 * Set<Integer> dids = dishId.stream().map(s ->
		 * Integer.parseInt(s)).collect(Collectors.toSet());
		 */
		
		
		System.out.println(dishId);
		session.setAttribute("dish", dishId);
		List<AddMenuItem> list = dao.getMenuItems();
		session.setAttribute("list", list);
		List<AddMenuItem> menu=new ArrayList<>();
		/* int dishid = 0; */	
		for (int val : dishId)
		{
			
			System.out.println(val);
			List<AddMenuItem> lists = dao.getMenuItems();
			
			for (Iterator iterator = list.iterator(); iterator.hasNext();) {
				AddMenuItem addMenuItem = (AddMenuItem) iterator.next();
				if (addMenuItem.getImgId() == val)
				{
					
					addMenuItem = dao.getMenuItem(val);
					menu.add(addMenuItem);
					session.setAttribute("menu", menu);				
					
				} 

			}
			for(AddMenuItem fruit:menu)  
				  System.out.println("Menu list"+fruit.getDishName());  
			
			
			
			
			
		}

				return "order";
	}
	
	@RequestMapping(value = "/OrderAction" , method = RequestMethod.POST)
	public String OrderAction(@ModelAttribute AddOrder order)
	{
		
		return "order";
	}
	
	

}
