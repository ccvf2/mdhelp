package kr.mdhelp.config;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler {
	private static final Logger logger = LoggerFactory.getLogger(CustomAuthenticationSuccessHandler.class);
	private static final String sCPrefix = "▦▩▦▩▦ CustomAuthentication ▦▩▦▩▦ Failure ▦▩▦▩▦ Handler ▩ - ";
	
	private String defaultFailureUrl = "/login-error";
	
	/** 생성자 */
	public CustomAuthenticationFailureHandler(String defaultFailureUrl) {
		this.defaultFailureUrl = defaultFailureUrl;
	}
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// 실패로그를 남긴다
		// 실패이벤트를 발송한다
		logger.debug(sCPrefix);
		logger.debug(sCPrefix +"defaultFailureUrl:"+defaultFailureUrl);
		Authentication auth =  SecurityContextHolder.getContext().getAuthentication();
		logger.debug(sCPrefix +"++++++++++++++++++++++++++++++직접 찾은 세션정보 Name[{}] - ROOT ",auth.getName());
		logger.debug(sCPrefix +"++++++++++++++++++++++++++++++직접 찾은 세션정보 Credentials[{}] - ROOT ",auth.getCredentials());
		logger.debug(sCPrefix +"++++++++++++++++++++++++++++++직접 찾은 세션정보 Details[{}] - ROOT ",auth.getDetails());
		logger.debug(sCPrefix +"++++++++++++++++++++++++++++++직접 찾은 세션정보 Authorities[{}] - ROOT ",auth.getAuthorities());
		Collection<? extends GrantedAuthority> a =auth.getAuthorities();
		if(a.contains("USERLEV2")) {
			logger.debug(sCPrefix +"++++++++++++++++++++++++++++++ a결과 TRUE ");
		}else{
			logger.debug(sCPrefix +"++++++++++++++++++++++++++++++ a결과 FALSE ");
		};
		response.sendRedirect(defaultFailureUrl);
	}

}
 