package com.spring.Controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import com.spring.Dao.UserDao;
import com.spring.Modal.AddMenuItem;
import com.spring.Modal.Admin;
import com.spring.Modal.Contactus;
import com.spring.Modal.EmpRegis;
import com.spring.Modal.HelpAndSupport;
import com.spring.Modal.Login;
import com.spring.Modal.User;
import com.spring.Modal.UserLogin;
import com.spring.Service.ServiceDao;



@Controller
public class LoginController {
	
	@Autowired
	private UserDao daoImpl;
	@Autowired
	private ServiceDao dao;
	String name=null;
	
	
	
	
	@RequestMapping(value = "/UserLogin" , method = RequestMethod.POST)
	public ModelAndView UloginController(@ModelAttribute UserLogin userlogin,Model model,HttpServletRequest request,HttpServletResponse response,HttpSession session,Login login)
	{
		ModelAndView mav= new ModelAndView();
		String uid=userlogin.getEmail();
		String pw=userlogin.getPassword();
		String ids=uid.substring(5);
		int id=Integer.parseInt(ids);
		session=request.getSession();
		boolean wel=false;
		
		try {
			PrintWriter out =response.getWriter();	
			List<Login> logins=daoImpl.getLoginRegisAll(login);
			for(Iterator iterator=logins.iterator();iterator.hasNext();)
			{
				Login login2=(Login)iterator.next();
				if(login2.getUid().equals(uid) && login2.getPw().equals(pw))
				{
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
				
				if(uid.startsWith("C"))
				{
					User u=daoImpl.getCustRegis(id);
					session.setAttribute("user", u);
					List<AddMenuItem> list=dao.getMenuItems();
	                session.setAttribute("menuList", list);
					mav.setViewName("customer");
				}
				else if(uid.startsWith("E"))
				{	
					
				EmpRegis u=daoImpl.getEmpRegis(id);
				String ecode= u.getUcode();
				session.setAttribute("user", u);
				session.setAttribute("ecode", ecode);
				mav.setViewName("employee");
				}
				else if(uid.startsWith("A"))
				{
					Admin u=daoImpl.getAdmin(id);
					String acode=u.getUcode();
					session.setAttribute("acode", acode);
					session.setAttribute("user", u);

			          List<AddMenuItem> list=dao.getMenuItems();
			          session.setAttribute("menuList", list);
			          List<EmpRegis> lists=dao.getEmp();
			          session.setAttribute("empList", lists);
			          List<User> user=daoImpl.getUserRegisAll();
			          session.setAttribute("custlist", user);
			          List<Contactus> contact=dao.getContactQueries();
			          session.setAttribute("contactList",contact);
			          List<HelpAndSupport> hs=dao.getAllHhelpNSupprt();
			          session.setAttribute("helpAndSupportList",hs);
			          List<User> cust=daoImpl.CustList();
			          model.addAttribute("cust", cust);
			          session.setAttribute("helpAndSupportList",hs);
			          mav.setViewName("admin");

					
					
				}
			}
			else {
				System.out.println("else block");
			//	out.println("<script>alert('Sorry invalid id pw');</script>");	
				String t="2";
				model.addAttribute("t", t);
				mav.setViewName("index");
				
			}
			} catch (IOException e) 
			{
			System.out.println("catch block "+e);
		
			}
			System.out.println("This is Login controller");
			return mav;
		}
@RequestMapping("/logoutControler")		
public ModelAndView logOut(Model model,HttpSession session,HttpServletRequest request)
{
	ModelAndView mav=new ModelAndView();
	String t="3";
	model.addAttribute("t",t);
	List<AddMenuItem> list=dao.getMenuItems();
    model.addAttribute("menuList", list);
	mav.setViewName("index");
	session = request.getSession();
	session.invalidate();
	return mav;
}
	

	
	
	
	
	
	
	}	
	
	
	
	
	
	
	
	
	
	
	
	

		
		
		
		
	
	
	
	
	
	
	
	
	
	
	
	
	
