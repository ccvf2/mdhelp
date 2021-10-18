package kr.mdhelp.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SignInController {
	private static final Logger logger = LoggerFactory.getLogger(SignInController.class);
	/**
	 * 로그인 페이지 호출
	 */
	@RequestMapping(value = "member/signin", method = RequestMethod.GET)
	public ModelAndView signUpPage() {
		ModelAndView mav  = new ModelAndView();
		mav.setViewName("member/signin");
		return mav;
	}
}
