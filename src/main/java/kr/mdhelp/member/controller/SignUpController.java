package kr.mdhelp.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.mdhelp.member.model.MemberDTO;
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
	
	
	@RequestMapping(value = "member/signupProcess", method = RequestMethod.POST)
	public ModelAndView signUp(HttpServletRequest request, HttpServletResponse response, 
			@RequestParam(defaultValue = "",	name = "reg_idEmail",	required = true)String reg_idEmail
			, @RequestParam(defaultValue = "",	name = "reg_pwd",		required = true)String reg_pwd
			, @RequestParam(defaultValue = "",	name = "reg_username",	required = true)String reg_username
			)throws Exception {
		ModelAndView mav  = new ModelAndView();
		//mav.setViewName("member/signup");
		String reg_pwdTrim = StringUtils.trimToEmpty(reg_pwd);
		String encPassword = signUpService.PasswordEncryptorReturnToNULL(reg_pwdTrim);//회원가입 하면서 입력된 비밀번호 암호화.
		
		
		logger.debug("=[ccvf2.dev]= [reg_idEmail] : [{}]",reg_idEmail);
		logger.debug("=[ccvf2.dev]= [reg_pwd] : [{}]",reg_pwd);
		logger.debug("=[ccvf2.dev]= [reg_pwdTrim] : [{}]",reg_pwdTrim);
		logger.debug("=[ccvf2.dev]= [encPassword] : [{}]",encPassword);
		logger.debug("=[ccvf2.dev]= [reg_username] : [{}]",reg_username);
		MemberDTO memberDto = new MemberDTO();
		memberDto.setId(StringUtils.trimToEmpty(reg_idEmail));
		memberDto.setPassword(encPassword);
		memberDto.setFullName(reg_username);
		signUpService.MemberSignUpProcess1(memberDto); 
		
		return mav;
	}
	
	
}
