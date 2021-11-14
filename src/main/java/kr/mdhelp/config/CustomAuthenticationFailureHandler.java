package kr.mdhelp.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.AuthenticationException;
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
		response.sendRedirect(defaultFailureUrl);
	}

}
