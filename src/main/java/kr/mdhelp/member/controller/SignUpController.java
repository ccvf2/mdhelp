package kr.mdhelp.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.mdhelp.member.service.SignUpServiceInterface;

@Controller
public class SignUpController {
	private static final Logger logger = LoggerFactory.getLogger(SignUpController.class);
	
	@Autowired
	SignUpServiceInterface signUpService;
	/**
	 * 회원가입 페이지 호출
	 */
	@RequestMapping(value = "member/signup", method = RequestMethod.GET)
	public ModelAndView signUpPage() {
		ModelAndView mav  = new ModelAndView();
		mav.setViewName("member/signup");
		return mav;
	}
	
	
	@RequestMapping(value = "member/signup", method = RequestMethod.POST)
	public ModelAndView signUp(HttpServletRequest request, HttpServletResponse response, 
			@RequestParam String id, @RequestParam String pw, @RequestParam String name ) {
		ModelAndView mav  = new ModelAndView();
		//mav.setViewName("member/signup");
		
		String encPassword = signUpService.PasswordEncryptorReturnToNULL(pw);//회원가입 하면서 입력된 비밀번호 암호화.
		
		
		return mav;
	}
	
	
}
