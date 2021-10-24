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
import kr.mdhelp.member.service.SignInServiceInterface;

@Controller
public class SignInController {
	private static final Logger logger = LoggerFactory.getLogger(SignInController.class);
	@Autowired
	SignInServiceInterface signInService;
	/**
	 * 로그인 페이지 호출
	 */
	@RequestMapping(value = "member/signin", method = RequestMethod.GET)
	public ModelAndView signUpPage() {
		ModelAndView mav  = new ModelAndView();
		mav.setViewName("member/signin");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "member/signInProcess.ajax", method = RequestMethod.POST)
	public MemberDTO signUp(HttpServletRequest request, HttpServletResponse response, 
			@RequestParam(defaultValue = "",	name = "reg_idEmail",	required = true)String reg_idEmail
			, @RequestParam(defaultValue = "",	name = "reg_pwd",		required = true)String reg_pwd
			)throws Exception {
		ModelAndView mav  = new ModelAndView();
		String reg_pwdTrim = StringUtils.trimToEmpty(reg_pwd);
		
		MemberDTO memberDto = new MemberDTO();
		memberDto.setId(StringUtils.trimToEmpty(reg_idEmail));
		memberDto.setPassword(reg_pwdTrim);
		
		signInService.signinProcess(memberDto); 
		
		return memberDto;
	}
}
