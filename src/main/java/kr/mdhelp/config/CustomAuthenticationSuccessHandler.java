package kr.mdhelp.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
	private static final Logger logger = LoggerFactory.getLogger(CustomAuthenticationSuccessHandler.class);
	private static final String sCPrefix = "▦▩▦▩▦ CustomAuthentication ▦▩▦▩▦ Success ▦▩▦▩▦ Handler ▩ - ";
	//인증 성공 후 이동할 URL
	private String defaultSuccessUrl = "/";
	/** 생성자 */
	public CustomAuthenticationSuccessHandler(String defaultSuccessUrl) {
		this.defaultSuccessUrl = defaultSuccessUrl;
	}
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// 성공이후 로그를 님긴다
		// 성공이벤트를 발행한다.
		// 이메일을 발송한다.
		
		response.sendRedirect(defaultSuccessUrl);
	}

}
