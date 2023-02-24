package com.spring.Controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.spring.Modal.BookTable;
import com.spring.Service.ServiceDao;

@Controller
public class TableController 
{
	@Autowired
	private ServiceDao dao;
	
	@RequestMapping(path = "/BookTable",method = RequestMethod.POST)
	public ModelAndView bookTable(@ModelAttribute("table") BookTable table,Model modal,HttpServletRequest req)
	{
		ModelAndView mav=new ModelAndView();
		System.out.println("date is "+table.getBookingDate()+"  Time is "+table.getBookingSlot());
		table.setBookingTime(new Date());
		int id=dao.bookTable(table);
		BookTable tbl=dao.getTable(id);
		 try{
	            String tomail=tbl.getUserMail();
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
	     msg.setSubject("Table Booking Confirmation");

	     msg.setText("Dear "+tbl.getUserName()+",\n\n\tWelcome to Foodie Bandhu.\nYour table has been successfully booked. We are so happy to see you.\n Your all details Regard table booking are given below. Please check them and save them for later. Details will be check when you check in the Restaurent.\n\n\t Table Booked by : "+tbl.getUserName()+"\n\tTable Ticket FBTABLE00 : "+tbl.getTableid()+"\n\tDate : "+tbl.getBookingDate()+"\n\tTiming Slot : "+tbl.getBookingTime()+"\n\tBookting Time : "+tbl.getBookingTime());
	          Transport.send(msg);   
	          
	          
	     }catch(Exception ex){
	         System.out.println("Here is the position!!!!"+ex);  
	     }
		
		String bk="booked";
		modal.addAttribute("bookMsg", bk);
		RedirectView rv=new RedirectView();
		rv.setUrl(req.getContextPath()+"/cust");
		mav.setView(rv);
		return mav;
	}
}
