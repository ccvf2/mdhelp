package kr.mdhelp.member.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SearchController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "member/search/naver", method = RequestMethod.GET)
	public ModelAndView naverSearchPage() {
		logger.info("============================= naverSearchPage get");
		
		ModelAndView mav  = new ModelAndView();
		Authentication auth =  SecurityContextHolder.getContext().getAuthentication();
		
		mav.setViewName("member/search/naver");
		return mav;
	}

	@ResponseBody
	@RequestMapping(value = "member/search/naverSearch", method=RequestMethod.POST)
	public String naverSearch(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="searchList[]") List<String> searchList) {
		logger.info("=============================naverSearch POST");		
		logger.info("============================= searchList : [{}]", searchList);
		
		
		
		
		return null;
	}
}
