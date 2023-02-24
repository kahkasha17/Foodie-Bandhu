package com.spring.Service.ServiceImpl;

import java.util.List;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.Dao.UserDao;
import com.spring.Modal.AddMenuItem;
import com.spring.Modal.Admin;
import com.spring.Modal.BookTable;
import com.spring.Modal.EmpRegis;
import com.spring.Modal.HelpAndSupport;
import com.spring.Modal.Login;
import com.spring.Modal.User;
import com.spring.Modal.UserLogin;
import com.spring.Service.ServiceDao;

@Service
public class ServiceDaoImpl implements ServiceDao
{
	@Autowired
	private UserDao UserDaoImpl;
	
	
	
	
	@Override
	public String RegisLogin(User user, Login login) 
	{
		int i=UserDaoImpl.CustRegis(user);
		User u=UserDaoImpl.getCustRegis(i);
		login.setUsername(u.getFname()+" "+u.getLname());
		login.setCid(u.getUcode()+"ID00"+u.getId());
		login.setMail(u.getMail());
		login.setPw(u.getPw());
		int j=UserDaoImpl.logRegis(login);
		
		
		  try{
	            	                       
			  
                  
	               String tomail=user.getMail();
	               String BCC="kaksha17820virtual@gmail.com";
	        
	            
	            Properties pr=new Properties();
	            pr.setProperty("mail.smtp.host","smtp.gmail.com");
	            pr.setProperty("mail.smtp.port","465");
	            pr.setProperty("mail.smtp.auth","true");
	            pr.setProperty("mail.smtp.starttls.enable","true");
	            pr.put("mail.smtp.SocketFactory.port", "465");
	            pr.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
	            
	            
	            //getting Session
	         Session ses=Session.getInstance(pr, new Authenticator() {

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
	        msg.setSubject("User Email Verification");
	   
	        msg.setText("Hey "+user.getFname()+" "+user.getLname()+"!!\n\nYou are successfully Registered To Foodie Bandhu.\n"
                    + "Welcome to Foodie Bandhu where you can eat with your Bandhu's and  feel happiness with them...\n\nHere is your Login ID : "+login.getUid()+"\n"
                            + "Here is Your Password "+user.getPw()+"\n\n\t\t ....Happy Eating....");
	             Transport.send(msg);          
	        }catch(Exception ex){
	            System.out.println("Here is the position!!!!"+ex);  
	        }

			return"Successfully Inserted in both login and regis table"+j;
		
	}




	@Override
	public String Contactus(com.spring.Modal.Contactus contactus) {
		int i=UserDaoImpl.ContactusRegis(contactus);
		UserDaoImpl.getCustRegis(i);
		contactus.setQid("QUERY00"+contactus.getSr());
		UserDaoImpl.setQidd(contactus);
		
		
		
		try{
            
            String tomail=contactus.getEmail();
            String BCC="kaksha17820virtual@gmail.com";
     
         
         Properties pr=new Properties();
         pr.setProperty("mail.smtp.host","smtp.gmail.com");
         pr.setProperty("mail.smtp.port","465");
         pr.setProperty("mail.smtp.auth","true");
         pr.setProperty("mail.smtp.starttls.enable","true");
         pr.put("mail.smtp.SocketFactory.port", "465");
         pr.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
         
         
         //getting Session
      Session ses=Session.getInstance(pr, new Authenticator() {

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
     msg.setSubject("User Email Verification");

     msg.setText("Hey "+contactus.getName()+"!!\n\nYour Query are successfully Registered To Foodie Bandhu.\n"
                 + "Our Foodie Bandhu executive will resolve your query within 48 hours...\n\nHere is your Query ID : "+"QUERY100"+contactus.getSr()+"\n"
                         +"\n\n\t\t ....Happy Eating....");
          Transport.send(msg);          
     }catch(Exception ex){
         System.out.println("Here is the position!!!!"+ex);  
     }

		return"Successfully Inserted in both login and regis table"+i;

	}




	@Override
	public String EmpLogin(EmpRegis empregis, Login login) {
		
		/* EmpRegis e=UserDaoImpl.getEmpRegis(empregis.getId()); */
		 
		int i=UserDaoImpl.EmpRegis(empregis);
		EmpRegis u=UserDaoImpl.getEmpRegis(i);
		login.setUsername(u.getFname()+" "+u.getLname());
		login.setCid(u.getUcode()+"ID00"+u.getId());
		login.setMail(u.getMail());
		login.setPw(u.getPw());
		int j=UserDaoImpl.logRegis(login);
		
		
		  try{
	            	                       
	               String tomail=empregis.getMail();
	               String BCC="kaksha17820virtual@gmail.com";
	        
	            
	            Properties pr=new Properties();
	            pr.setProperty("mail.smtp.host","smtp.gmail.com");
	            pr.setProperty("mail.smtp.port","465");
	            pr.setProperty("mail.smtp.auth","true");
	            pr.setProperty("mail.smtp.starttls.enable","true");
	            pr.put("mail.smtp.SocketFactory.port", "465");
	            pr.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
	            
	            
	            //getting Session
	         Session ses=Session.getInstance(pr, new Authenticator() {

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
	        msg.setSubject("User Email Verification");
	   
	        msg.setText("Hey "+empregis.getFname()+" "+empregis.getLname()+"!!\n\nYou are successfully Registered To Foodie Bandhu.\n"
	                    + "Welcome to Foodie Bandhu where you can eat with your Bandhu's and  feel happiness with them...\n\nHere is your Login ID : "+login.getUid()+"\n"
	                            + "Here is Your Password "+empregis.getPw()+"\n\n\t\t ....Happy Eating....");
	             Transport.send(msg);          
	        }catch(Exception ex){
	            System.out.println("Here is the position!!!!"+ex);  
	        }

			return"Successfully Inserted in both login and regis table"+j;

		
	}




	@Override
	public User custlogin(Login login, UserLogin userLogin) {
		List<Login> l=UserDaoImpl.getLoginRegisAll(login);
		if(userLogin.getEmail() !=null && !userLogin.getEmail().equals("") && userLogin.getEmail().equals(login.getUid())&&
				userLogin.getPassword() !=null && !userLogin.getPassword().equals("") && userLogin.getPassword().equals(login.getPw()))
		{
			String s=userLogin.getEmail().substring(6);
			int i=Integer.parseInt(s);
			User u=UserDaoImpl.getCustRegis(i);
			return u;
		}
		return null;
	}




	@Override
	public Admin getAdmininfo(int id) {
		Admin a=UserDaoImpl.getAdmin(id);
		return a;
	}




	@Override
	public String sendOtp(String otp, String email,String name)
	{
		  try{
              
              String tomail=email;
              String BCC="kaksha17820virtual@gmail.com";
       
           
           Properties pr=new Properties();
           pr.setProperty("mail.smtp.host","smtp.gmail.com");
           pr.setProperty("mail.smtp.port","465");
           pr.setProperty("mail.smtp.auth","true");
           pr.setProperty("mail.smtp.starttls.enable","true");
           pr.put("mail.smtp.SocketFactory.port", "465");
           pr.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
           
           
           //getting Session
        Session ses=Session.getInstance(pr, new Authenticator() {

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
       msg.setSubject("User Email Verification");
  
       msg.setText("Hey "+name+"!!\n\n" +otp +" is the otp for your Forget password.\n"
               + "otp is valid for 10 mins. pls do not share with anyone "
                       + "\n\n\t\t ....Happy Eating....");
            Transport.send(msg);          
       }catch(Exception ex){
           System.out.println("Here is the position!!!!"+ex);  
       }


		return "otp is successfully send ";
	}




	@Override
	public String HelpandSupport(HelpAndSupport helpAndSupport)
	
	{
		int i=UserDaoImpl.HelpAndSupportRegis(helpAndSupport);
		
		try{
            
			  
            
            String tomail=helpAndSupport.getEmail();
            String BCC="kaksha17820virtual@gmail.com";
     
         
         Properties pr=new Properties();
         pr.setProperty("mail.smtp.host","smtp.gmail.com");
         pr.setProperty("mail.smtp.port","465");
         pr.setProperty("mail.smtp.auth","true");
         pr.setProperty("mail.smtp.starttls.enable","true");
         pr.put("mail.smtp.SocketFactory.port", "465");
         pr.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
         
         
         //getting Session
      Session ses=Session.getInstance(pr, new Authenticator() {

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
     msg.setSubject("User Email Verification");

     msg.setText("Hey "+helpAndSupport.getFname()+" "+helpAndSupport.getLname()+"!!\n\nYour ticket is successfully Registered To Foodie Bandhu.\n"
    		 +"Our Foodie Bandhu executive will resolve your ticket within 48 hours...\n\nHere is your Ticket ID : "+helpAndSupport.getHlpsprtid()+"\n"
             +"\n\n\t\t ....Happy Eating....");
          Transport.send(msg);          
     }catch(Exception ex){
         System.out.println("Here is the position!!!!"+ex);  
     }

		return"Successfully Inserted in both login and regis table"+i;
	

	}

	



	/* Deep 1 */
	@Override
	public String addMenuItem(AddMenuItem item) {
		int i=UserDaoImpl.addMenuItem(item);
		return "Item is Added in Menu successfully with ID FBDID0"+i;
	}

	/* Deep 2 */
	@Override
	public List<AddMenuItem> getMenuItems() {
		List<AddMenuItem> items=UserDaoImpl.menuItemList();
		return items;
	}
	/* Deep 3 */
	@Override
	public AddMenuItem getMenuItem(int id) {
		AddMenuItem item=UserDaoImpl.getDishImage(id);
		return item;
	}
	/* Deep 4 */
	@Override
	public String delMenuItem(int id) {
		AddMenuItem item=UserDaoImpl.getDishImage(id);
		UserDaoImpl.delMenuItem(item);
		return "ID FBDID0"+id+" Dish is removed from Menu";
	}
	/* Deep 5 */
	@Override
	public String updateMenuItem(AddMenuItem item) {
		UserDaoImpl.updateMenuItem(item);
		return "Menu Item FBDID0"+item.getImgId()+"'s details are updated successfully";
	}




	@Override
	public List<EmpRegis> getEmp() {
		List<EmpRegis> items=UserDaoImpl.EmpList();
		return items;
	}




	@Override
	public EmpRegis getEmpResume(int id) {
		EmpRegis item=UserDaoImpl.getEmpresume(id);
		return item;
	}




	@Override
	public String delEmp(int id ,int lid) {
		Login login=UserDaoImpl.getLoginRegis(lid);
		EmpRegis empRegis=UserDaoImpl.getEmpRegis(id);
		UserDaoImpl.Delemp(login, empRegis);
		return "Successfully Deleted";
	}
	



	// deep-1
		@Override
		public List<com.spring.Modal.Contactus> getContactQueries() {
			List<com.spring.Modal.Contactus> list=UserDaoImpl.getContactQueries();
			return list;
		}

	// deep-2
		@Override
		public void deleteContact(int id) {
			com.spring.Modal.Contactus cont=UserDaoImpl.getContactus(id);
			UserDaoImpl.deleteContact(cont);
		}


		@Override
		public List<HelpAndSupport> getAllHhelpNSupprt() {
			// TODO Auto-generated method stub
			return UserDaoImpl.getAllHelpAndSupports();
		}


		@Override
		public HelpAndSupport getHelpNSuprt(int id) {
			// TODO Auto-generated method stub
			return UserDaoImpl.getHelpandSupport(id);
		}


		@Override
		public void updHelpNSprt(HelpAndSupport hs) {
			UserDaoImpl.sethlpsprtId(hs);
		}


		@Override
		public void delHelpNSprt(int id) {
			// TODO Auto-generated method stub
			HelpAndSupport hs=getHelpNSuprt(id);
			UserDaoImpl.delHelpAndSupport(hs);
		}	
		
		
		
		public void updContact(com.spring.Modal.Contactus us)
		{
			UserDaoImpl.setQidd(us);
		}
		
		public com.spring.Modal.Contactus getContactus(int id)
		{
			com.spring.Modal.Contactus us=UserDaoImpl.getContactus(id);
			return us;
		}
		
		@Override
	    public int bookTable(BookTable table) {
	      int i=UserDaoImpl.bookTable(table);
	      return i;
	    }

	    @Override
	    public String delTable(BookTable table) 
	    {
	      UserDaoImpl.delTable(table);
	      return "Table is deleted";
	    }
	    @Override
	    public String UpdTable(BookTable table) {
	      
	      UserDaoImpl.UpdTable(table);
	      return "Table is updated";
	      
	    }

	    @Override
	    public BookTable getTable(int tableId) {
	      return UserDaoImpl.getTable(tableId);
	    }
	    @Override
	    public List<BookTable> getAllTables() {
	      // TODO Auto-generated method stub
	      return UserDaoImpl.getAllTables();
	    }		
		
	
	
	
	
	
	
	
	
	
	
	}
