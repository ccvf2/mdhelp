package kr.mdhelp.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SignUpController {
	private static final Logger logger = LoggerFactory.getLogger(SignUpController.class);
	
	
	/**
	 * 회원가입 페이지 호출
	 */
	@RequestMapping(value = "member/signup", method = RequestMethod.GET)
	public ModelAndView signUpPage() {
		ModelAndView mav  = new ModelAndView();
		mav.setViewName("member/signup");
		return mav;
	}
	
}
