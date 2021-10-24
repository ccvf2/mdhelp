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
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	
	@ResponseBody
	@RequestMapping(value = "member/signupProcess.ajax", method = RequestMethod.POST)
	public MemberDTO signUp(HttpServletRequest request, HttpServletResponse response, 
			@RequestParam(defaultValue = "",	name = "reg_idEmail",	required = true)String reg_idEmail
			, @RequestParam(defaultValue = "",	name = "reg_pwd",		required = true)String reg_pwd
			, @RequestParam(defaultValue = "",	name = "reg_username",	required = true)String reg_username
			)throws Exception {
		ModelAndView mav  = new ModelAndView();
		String reg_pwdTrim = StringUtils.trimToEmpty(reg_pwd);
		
		MemberDTO memberDto = new MemberDTO();
		//memberDto.setUserNumber(0);
		memberDto.setId(StringUtils.trimToEmpty(reg_idEmail));
		memberDto.setPassword(reg_pwdTrim);
		memberDto.setFullName(reg_username);
		//memberDto.setRegistrationDate();
		//memberDto.setModifiedDate();
		//memberDto.setSubEmail(reg_idEmail);
		//memberDto.setContactNumber1();
		//memberDto.setContactNumber2();
		//memberDto.setContactAddress();
		//memberDto.setContactFild1();
		//memberDto.setContactFild2();
		memberDto.setLevel("USERLEV1");
		memberDto.setAuthenticat("UAUTH00");
		memberDto.setActive("NOACTIVE");
		
		signUpService.MemberSignUpProcess1(memberDto); 
		
		return memberDto;
	}
	
	
}
