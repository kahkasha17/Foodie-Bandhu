package com.spring.Controller;

import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import com.spring.Dao.UserDao;
import com.spring.Modal.AddMenuItem;
import com.spring.Modal.Admin;
import com.spring.Modal.EmpRegis;
import com.spring.Modal.Login;
import com.spring.Modal.User;
import com.spring.Service.ServiceDao;

@Controller
public class EmpAdminController {
	@Autowired
	private UserDao daoImpl;
	@Autowired
	private ServiceDao dao;
	int lid;
	@RequestMapping("/showResume/{id}")
	public void showImg(@PathVariable int id,HttpServletResponse res)
	{
		res.setContentType("application/pdf");
		byte[] b=dao.getEmpResume(id).getResumee();
		try {
			OutputStream out=res.getOutputStream();
			out.write(b);
		} catch (Exception e) {
			System.out.println("Exception is "+e);
			e.printStackTrace();
		}
	}

	@RequestMapping("/DelEmp")
	  public String delMenuItem(@RequestParam int id,HttpServletResponse response,HttpServletRequest req,HttpSession session,Model model,Login login,EmpRegis empRegis)
	  {
		String uid="EFBID00"+id;
		
		
		boolean wel=false;
		try {	
			List<Login> logins=daoImpl.getLoginRegisAll(login);
			for(Iterator iterator=logins.iterator();iterator.hasNext();)
			{
				Login login2=(Login)iterator.next();
				if(login2.getUid().equals(uid) )
				{
					wel=true;
					lid=login2.getSr();
					break;
				}
				else
				{
					wel=false;
				}
				
			
			}
			if(wel==true)
			{
				dao.delEmp(id, lid);
			}
		
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		
	   String qt="1";
	    model.addAttribute("qt", qt);
	    List<EmpRegis> lists=dao.getEmp();
        session.setAttribute("empList", lists);
	    return "redirect:/admin";
	  }
	
	
	@RequestMapping(value = "/AdmEmpRegis" , method = RequestMethod.POST,consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public RedirectView EmployeeRegis(@ModelAttribute EmpRegis empRegis,HttpServletRequest request,Model model,Login login,HttpSession session)
	
	{
		
		System.out.println("This is Empregis controller");
		System.out.println(empRegis);
		System.out.println(login);
		login.setLastmodified(new Date());
		empRegis.setLastmodified(new Date());
		dao.EmpLogin(empRegis,login);
		
		List<EmpRegis> lists=dao.getEmp();
        session.setAttribute("empList", lists);
        
        
		String qt="2";
		model.addAttribute("qt",qt);	
		RedirectView redirectView=new RedirectView();
	    redirectView.setUrl(request.getContextPath()+ "/admin");
		return redirectView;
	}
	
	@RequestMapping(value = "/AdminUpdEmpRegis" , method = RequestMethod.POST)
	public RedirectView EmployeeRegis(EmpRegis empRegis,Admin admin,@RequestParam("id") int id,
			@RequestParam("fname") String fname,@RequestParam("lname") String lname,@RequestParam("mail") String mail,
			@RequestParam("phn") String phn,@RequestParam("addr") String addr,@RequestParam("salery") String sal,HttpServletRequest request,HttpSession session,HttpServletResponse response,Model model)
	
	{
			System.out.println("This is Update Admin Employee");	
			System.out.println(id);
			empRegis=daoImpl.getEmpRegis(id);
			
			System.out.println(empRegis.getFname());
			byte[] b=dao.getEmpResume(id).getResumee();
			empRegis.setResumee(b);
			empRegis.setFname(fname);
			empRegis.setLname(lname); 
			empRegis.setMail(mail);
			empRegis.setPhn(phn); 
			empRegis.setAddr(addr);
			empRegis.setSalary(sal);
			daoImpl.AdminEmpUpdate(empRegis);
			List<EmpRegis> lists=dao.getEmp();
	        session.setAttribute("empList", lists);
			 
	        String qt="3";
			model.addAttribute("qt",qt);
			
		RedirectView redirectView=new RedirectView();
	    redirectView.setUrl(request.getContextPath()+ "/admin");
		return redirectView;
	}
	
}
