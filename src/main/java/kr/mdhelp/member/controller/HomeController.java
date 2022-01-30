package kr.mdhelp.member.controller;

import java.text.DateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.mdhelp.common.model.CustomUserDetails;
import kr.mdhelp.common.model.MailDTO;
import kr.mdhelp.common.utils.MailSender;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Value("${service.mode}")
	private String SERVICE_MODE;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.debug("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		Authentication auth =  SecurityContextHolder.getContext().getAuthentication();
		String loginName = "";
		if( StringUtils.equals(auth.getName(), "anonymousUser") || StringUtils.equals(auth.getName(), "") ) {
			loginName = "";
		}else {
			loginName = auth.getName();
		}
		
		String authorities ="";
		StringBuffer sb = new StringBuffer();
			boolean adminFlag = false;
			boolean anonymousFlag = true;
			Collection<? extends GrantedAuthority> ga =auth.getAuthorities();
			Iterator<?> it = ga.iterator();
			while(it.hasNext()) {
				String keyString = it.next().toString();
				sb.append(keyString);sb.append(",");
				if(StringUtils.equals(keyString, "USERLEV2")) {
					adminFlag = true;
				}else if(StringUtils.equals(keyString, "ROLE_ANONYMOUS")) {
					anonymousFlag = true;
				}else {
					anonymousFlag = false;
				}
			}
			if(adminFlag) {
				authorities = "administor";
			}else{
				if(anonymousFlag) {
					authorities ="anonymous";
				}else {
					authorities = "normalUser";
				}
			}
			
		model.addAttribute("serviceMode", SERVICE_MODE );
		model.addAttribute("loginName", loginName );
		model.addAttribute("authorities", authorities );
		model.addAttribute("authoritiesDetail", sb.toString() );
		
		return "home";
	}
	
	@RequestMapping(value = "member/main", method = RequestMethod.GET)
	public ModelAndView memberMainPage(Locale locale, Model model) {
		ModelAndView mav  = new ModelAndView();
		mav.setViewName("member/main/main");
		return mav;
	}
	@RequestMapping(value = "member/main", method = RequestMethod.POST)
	public ModelAndView memberMainPageTarget(HttpServletRequest request, HttpServletResponse response
			,@RequestParam(value="goTarget", defaultValue = "") String goTarget) {
		ModelAndView mav  = new ModelAndView();
		mav.addObject("goTarget", goTarget);
		mav.setViewName("member/main/main");
		return mav;
	}
	@RequestMapping(value = "member/gomail", method = RequestMethod.GET)
	public String mailsendrTest(HttpServletRequest request, HttpServletResponse response) {

		logger.debug("=============================객체생성");
		MailSender mailSend = new MailSender();
		
		MailDTO mail = new MailDTO();
		mail.setMail_sender_email("webmaster@supergo.kr");/**	[필수]보내는사람 메일주소(발신자) 미기재시 "webmaster@supergo.kr" */
		mail.setMail_receiver_email("ccvf2@naver.com");/**		[필수]받는사람 메일주소(수신자) */
		mail.setMail_sender_name("관리자");/** 					[옵션]보내는사람 이름(발신자) */
		mail.setMail_receiver_name("고객님");/**					[옵션]받는사람 이름(수신자) */
		mail.setMail_title("메일 제목 라인");/**					[필수]제목 */
		mail.setMail_content("메일내용여기에기제");/**				[필수]내용 */
		
		logger.debug("=============================객체생성 완료");
		int checkMail = mailSend.mailSender(mail);
		logger.debug("=============================객체생성 함수호출완료");
		logger.debug("=============================객체생성 함수호출완료 result : [{}]",checkMail);
		if(checkMail > 0) {
			logger.debug("=============================메일이 보내짐");
		}
		
		
		
		
		return "home";
	}
}