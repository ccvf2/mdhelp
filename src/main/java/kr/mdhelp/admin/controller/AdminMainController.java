package kr.mdhelp.admin.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.servlet.ModelAndView;

import kr.mdhelp.member.controller.HomeController;

@Controller
public class AdminMainController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	/*
	 * @RequestMapping(value = "/admin", method = RequestMethod.GET) public
	 * ModelAndView adminMainPageIndex() {
	 * logger.info("=-=-=-=-=-=-=-=-= 관리자메인 리다이렉트"); ModelAndView mav= new
	 * ModelAndView("redirect:/admin/main"); return mav; }
	 */
	@RequestMapping(value = "/admin/main", method = RequestMethod.GET)
	public String adminMainPage(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		return "admin/adminMain";
	}
	@RequestMapping(value = "/admin/login", method = RequestMethod.GET)
	public String adminLoginPage(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		return "admin/adminLogin";
	}
}
