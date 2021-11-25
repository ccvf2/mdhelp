package kr.mdhelp.config;

import java.io.IOException;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
	private static final Logger logger = LoggerFactory.getLogger(CustomAuthenticationSuccessHandler.class);
	private static final String sCPrefix = "▦▩▦▩▦ CustomAuthentication ▦▩▦▩▦ Success ▦▩▦▩▦ Handler ▩ - ";
	//인증 성공 후 이동할 URL
	private String defaultSuccessUrl = "/";
	/** 생성자 */
	public CustomAuthenticationSuccessHandler(String defaultSuccessUrl) {
		logger.debug(sCPrefix +"생성자 defaultSuccessUrl:[{}]",defaultSuccessUrl);
		this.defaultSuccessUrl = defaultSuccessUrl;
		logger.debug(sCPrefix +"생성자 SET defaultSuccessUrl:[{}]",this.defaultSuccessUrl );
	}
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		// TODO Auto-generated method stub
		// 성공이후 로그를 님긴다
		// 성공이벤트를 발행한다.
		// 이메일을 발송한다.
		logger.debug(sCPrefix);
		logger.debug(sCPrefix +"defaultSuccessUrl:"+defaultSuccessUrl);
		Authentication auth =  SecurityContextHolder.getContext().getAuthentication();
		logger.debug(sCPrefix +"++++++++++++++++++++++++++++++직접 찾은 세션정보 Name[{}] - ROOT ",auth.getName());
		logger.debug(sCPrefix +"++++++++++++++++++++++++++++++직접 찾은 세션정보 Credentials[{}] - ROOT ",auth.getCredentials());
		logger.debug(sCPrefix +"++++++++++++++++++++++++++++++직접 찾은 세션정보 Details[{}] - ROOT ",auth.getDetails().toString());
		logger.debug(sCPrefix +"++++++++++++++++++++++++++++++직접 찾은 세션정보 AutZhorities[{}] - ROOT ",auth.getAuthorities());
		logger.debug(sCPrefix +"++++++++++++++++++++++++++++++직접 찾은 세션정보 Principal[{}] - ROOT ",auth.getPrincipal());
		String goURL =this.defaultSuccessUrl;
		
		boolean adminFlag = false;
		
		Collection<? extends GrantedAuthority> ga =auth.getAuthorities();
		Iterator<?> it = ga.iterator();
		while(it.hasNext()) {
			String keyString = it.next().toString();
			if(StringUtils.equals(keyString, "USERLEV2")) {
				logger.debug(sCPrefix +"♥ USERLEV2 AutZhorities 찾음 ");
				adminFlag = true;
			}
		}
		
		if(adminFlag) {
			logger.debug(sCPrefix +"♥ 관리자다");
			goURL = "/admin"+goURL;
		}else {
			logger.debug(sCPrefix +"♥ 사용자다");
			goURL = "/member"+goURL;
		}
		
		logger.debug(sCPrefix +"redirectURL:[{}]",goURL);
		response.sendRedirect(goURL);
	}

}
