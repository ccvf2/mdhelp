package kr.mdhelp.config;

import java.io.IOException;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import kr.mdhelp.common.model.CustomUserDetails;

public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
	private static final Logger logger = LoggerFactory.getLogger(CustomAuthenticationSuccessHandler.class);
	//인증 성공 후 이동할 URL
	private String defaultSuccessUrl = "/";
	/** 생성자 */
	public CustomAuthenticationSuccessHandler(String defaultSuccessUrl) {
		this.defaultSuccessUrl = defaultSuccessUrl;
	}
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// 성공이후 로그를 님긴다
		// 성공이벤트를 발행한다.
		// 이메일을 발송한다.
		Authentication auth =  SecurityContextHolder.getContext().getAuthentication();
		/** 스프링 시큐리티 컨텍스트가 아닌 관리되는 다른 세션 정보롤 쓸떄 사용 
		CustomUserDetails user = (CustomUserDetails)auth.getPrincipal();
		HttpSession session = request.getSession();
		session.setAttribute("loginInfo", user);
		 * */

		String goURL =this.defaultSuccessUrl;
		
		boolean adminFlag = false;
		
		Collection<? extends GrantedAuthority> ga =auth.getAuthorities();
		Iterator<?> it = ga.iterator();
		while(it.hasNext()) {
			String keyString = it.next().toString();
			if(StringUtils.equals(keyString, "USERLEV2")) {
				adminFlag = true;
			}
		}
		
		if(StringUtils.equals(goURL, this.defaultSuccessUrl)) {
			if(adminFlag) {
				goURL = "/admin"+goURL;
			}else {
				goURL = "/member"+goURL;
			}
		}

		response.sendRedirect(goURL);
	}

}
