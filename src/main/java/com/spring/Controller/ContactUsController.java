package com.spring.Controller;

import java.util.Date;
import java.util.List;

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
import org.springframework.web.servlet.view.RedirectView;

import com.spring.Modal.Contactus;
import com.spring.Service.ServiceDao;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

@Controller
public class ContactUsController {
	@Autowired
	private ServiceDao dao;
	
	
	@RequestMapping(value = "/Contact_Us" , method = RequestMethod.POST)
	public RedirectView ContactusRegis(@ModelAttribute Contactus contactus,HttpServletRequest request,Model model)
	
	{
		ModelAndView mav=new ModelAndView();
		System.out.println("This is Contact_us controller");
		System.out.println(contactus);
		contactus.setLastmodified(new Date());
		dao.Contactus(contactus);
		String t="0";
		model.addAttribute("t",t);
		RedirectView redirectView=new RedirectView();
	    redirectView.setUrl(request.getContextPath()+ "/");
		return redirectView;
	}
	
//	deep-1
	  @RequestMapping(path = "/contactUsReply",method = RequestMethod.POST) 
	  public String contactUsReply(@ModelAttribute Contactus contact,@RequestParam("reply") String reply,HttpSession hsn,Model m) 
	  { 
		ModelAndView mav=new ModelAndView();
		Contactus con=dao.getContactus(contact.getSr());
		contact.setQid(con.getQid());
		contact.setMobile(con.getMobile());
		contact.setOptions(con.getOptions());
		contact.setLastmodified(new Date());
	  	contact.setStatus(true);
	  	dao.updContact(contact);
	  	 try{
             String tomail=contact.getEmail();
             String BCC="kaksha17820virtual@gmail.com";
          Properties pr=new Properties();
          pr.setProperty("mail.smtp.host","smtp.gmail.com");
          pr.setProperty("mail.smtp.port","465");
          pr.setProperty("mail.smtp.auth","true");
          pr.setProperty("mail.smtp.starttls.enable","true");
          pr.put("mail.smtp.SocketFactory.port", "465");
          pr.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
          
          
          //getting Session
       Session ses=Session.getInstance(pr, new Authenticator() 
       {
    	   	protected PasswordAuthentication getPasswordAuthentication(){
    	   		return new PasswordAuthentication("kaksha17820virtual@gmail.com","lqfejnrpnfkaqmbg");
       }  
       });
       
       ses.setDebug(true);
       Message msg=new MimeMessage(ses);   
       InternetAddress inrt=new InternetAddress("kaksha17820virtual@gmail.com");
         msg.setFrom(inrt);
       msg.setRecipient(Message.RecipientType.TO, new InternetAddress(tomail));
       msg.setRecipient(Message.RecipientType.BCC,new InternetAddress(BCC));
      msg.setSubject("Contact us Reply");
 
      msg.setText("Dear "+contact.getName()+",\n\nThis is your query reply main.\nYou so glad to hear that you show the interest in our website.\nYou put some query on our website's through contact us form.\n So we got your qoery and there is the details of your query and the solution of your query: \n\tQuery ID: "+contact.getQid()+"\n\t Query: "+contact.getQta()+"\n\nSolution:\n\t"+reply);
           Transport.send(msg);   
           
           
      }catch(Exception ex){
          System.out.println("Here is the position!!!!"+ex);  
      }
	  	 List<Contactus> cl=dao.getContactQueries();
	  	 hsn.setAttribute("contactList", cl);
	  	 String rmsg="0";
	  	 m.addAttribute("rmsg",rmsg);
	  	return "redirect:/admin";
	  }
//	  deep-2
	  @RequestMapping(path = "/delContact")
	  public String delContact(@RequestParam("id") int id,HttpServletRequest req, HttpSession ses, Model m)
	  {
		  dao.deleteContact(id);
		  String conDel = "0";
		  m.addAttribute("conDel", conDel);
		  List<Contactus> list = dao.getContactQueries();
		  ses.setAttribute("contactList", list);
		return "redirect:/admin";
	  }


}
