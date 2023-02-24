package com.spring.Controller;

import java.io.OutputStream;
import java.util.Date;
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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.spring.Modal.AddMenuItem;
import com.spring.Service.ServiceDao;

@Controller
public class MenuItemController 
{
	@Autowired
	private ServiceDao dao;
	
//	Deep's methods
	@RequestMapping(path = "/addImageAction",method = RequestMethod.POST,consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public ModelAndView addImage(@ModelAttribute("img") AddMenuItem item,Model m,HttpServletRequest request,HttpSession ses)
	{
		ModelAndView mav=new ModelAndView();
		item.setLastmodified(new Date());
		String dishMsg=dao.addMenuItem(item);
		System.out.println("Controllerrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr ka msg "+dishMsg);
		
		m.addAttribute("qt", "0");
		
		List<AddMenuItem> list=dao.getMenuItems();
	  	ses.setAttribute("menuList", list);
	  	RedirectView redirectView=new RedirectView();
	    redirectView.setUrl(request.getContextPath()+ "/admin");
		mav.setView(redirectView);
		return mav;
	}
	
	
	
	@RequestMapping("/showImg/{id}")
	public void showImg(@PathVariable int id,HttpServletResponse res)
	{
		res.setContentType("image/jpeg");
		byte[] b=dao.getMenuItem(id).getByteImg();
		try {
			OutputStream out=res.getOutputStream();
			out.write(b);
		} catch (Exception e) {
			System.out.println("Exception is "+e);
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/delMenuItem")
	  public String delMenuItem(@RequestParam int id,HttpServletRequest req,HttpSession ses,Model m)
	  {
	    String delmsg=dao.delMenuItem(id);
	    String mydelt="0";
	    m.addAttribute("delmsg", mydelt);
	    List<AddMenuItem> list=dao.getMenuItems();
	    ses.setAttribute("menuList", list);
	    return "redirect:/admin";
	  }
	
	@RequestMapping(path = "/updateImageAction",method = RequestMethod.POST,consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public ModelAndView updateMenuItem(@ModelAttribute AddMenuItem item,Model m,HttpServletRequest request,HttpSession ses)
	{
		ModelAndView mav=new ModelAndView("admin");
		AddMenuItem i=dao.getMenuItem(item.getImgId());
	    item.setByteImg(i.getByteImg());
		item.setLastmodified(new Date());
		
		String updmsg=dao.updateMenuItem(item);
		
		m.addAttribute("dmsg", updmsg);
		List<AddMenuItem> items=dao.getMenuItems();
		
		ses.setAttribute("menuList", items);
		return mav;
	}
	
	@RequestMapping(path = "/updMenu")
	public ModelAndView updMenuItem(@RequestParam int updid,HttpServletRequest req,Model m)
	{
		ModelAndView mav=new ModelAndView("admin");
		System.out.println("Id returned by updMenu "+updid);
		
		AddMenuItem item=dao.getMenuItem(updid);
		System.out.println("item returned by is "+item);
	
		mav.addObject("myitem", item);
		String updT="0";
		m.addAttribute("updT", updT);
		return mav;
	}

}
