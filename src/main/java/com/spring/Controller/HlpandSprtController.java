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

import com.spring.Dao.UserDao;
import com.spring.Modal.HelpAndSupport;
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

public class HlpandSprtController {
	@Autowired
	private ServiceDao dao;
	
	@RequestMapping(value = "/HelpandSupport",method = RequestMethod.POST)
	public ModelAndView hlpsprtController(@RequestParam("id")int id, @ModelAttribute HelpAndSupport sprtController,Model model,HttpServletRequest request)
	{
		System.out.println(sprtController);
		sprtController.setHlpsprtid("FBTICKETHS00"+id);
		sprtController.setUid("CFBID00"+id);
		sprtController.setLastmodified(new Date());
		dao.HelpandSupport(sprtController);
		ModelAndView mav=new ModelAndView();
		RedirectView redirectView=new RedirectView();
		redirectView.setUrl(request.getContextPath()+ "/cust");
		model.addAttribute("t","0");
		mav.setView(redirectView);
		return mav;
	}
	
//	deep - 1
	 @RequestMapping(path = "/HnSreplyAction",method = RequestMethod.POST) 
	  public String hnSReply(@ModelAttribute HelpAndSupport help,@RequestParam("hreply") String hreply,HttpSession hsn,Model m) 
	  { 
		ModelAndView mav=new ModelAndView();
		HelpAndSupport con=dao.getHelpNSuprt(help.getSr());
		help.setHlpsprtid(con.getHlpsprtid());
		help.setFname(con.getFname());
		help.setLname(con.getLname());
		help.setMob(con.getMob());
		help.setLastmodified(new Date());
		help.setUid(con.getUid());
		help.setStatus(true);
	  	dao.updHelpNSprt(help);
	  	 try{
            String tomail=help.getEmail();
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

     msg.setText("Dear "+help.getFname()+",\n\nThis is your query reply main.\nYou so glad to hear that you show the interest in our website.\nYou put some query on our website's through contact us form.\n So we got your qoery and there is the details of your query and the solution of your query: \n\tQuery ID: "+help.getHlpsprtid()+"\n\t Query: "+help.getQta()+"\n\nSolution:\n\t"+hreply);
          Transport.send(msg);   
          
          
     }catch(Exception ex){
         System.out.println("Here is the position!!!!"+ex);  
     }
	  	 List<HelpAndSupport> cl=dao.getAllHhelpNSupprt();
	  	 hsn.setAttribute("helpAndSupportList", cl);
	  	 String hmsg="0";
	  	 m.addAttribute("hmsg",hmsg);
	  	 
	  	return "redirect:/admin";
	  }
//		deep - 2
	  @RequestMapping(path = "/delHelp")
	  public String delHelp(@RequestParam("hid") int hid,HttpServletRequest req, HttpSession ses, Model m)
	  {
		  dao.delHelpNSprt(hid);
		  String helpDel = "0";
		  m.addAttribute("helpDel", helpDel);
		  List<HelpAndSupport> list = dao.getAllHhelpNSupprt();
		  ses.setAttribute("helpAndSupportList", list);
		return "redirect:/admin";
	  }

	
	
	
}
