package kr.mdhelp.member.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		Authentication auth =  SecurityContextHolder.getContext().getAuthentication();
		logger.debug("++++++++++++++++++++++++++++++직접 찾은 세션정보 Name[{}] - ROOT ",auth.getName());
		logger.debug("++++++++++++++++++++++++++++++직접 찾은 세션정보 Credentials[{}] - ROOT ",auth.getCredentials());
		logger.debug("++++++++++++++++++++++++++++++직접 찾은 세션정보 Details[{}] - ROOT ",auth.getDetails());
		logger.debug("++++++++++++++++++++++++++++++직접 찾은 세션정보 Authorities[{}] - ROOT ",auth.getAuthorities());
		return "home";
	}
	
	
	
	@RequestMapping(value = "member/main", method = RequestMethod.GET)
	public ModelAndView signUpPage() {
		ModelAndView mav  = new ModelAndView();
		
		
		Authentication auth =  SecurityContextHolder.getContext().getAuthentication();
		logger.debug("++++++++++++++++++++++++++++++직접 찾은 세션정보 Name[{}] - ROOT ",auth.getName());
		logger.debug("++++++++++++++++++++++++++++++직접 찾은 세션정보 Credentials[{}] - ROOT ",auth.getCredentials());
		logger.debug("++++++++++++++++++++++++++++++직접 찾은 세션정보 Details[{}] - ROOT ",auth.getDetails());
		logger.debug("++++++++++++++++++++++++++++++직접 찾은 세션정보 Authorities[{}] - ROOT ",auth.getAuthorities());


		
		
		mav.setViewName("member/main/main");
		return mav;
	}
}
