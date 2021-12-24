package kr.mdhelp.config;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;

import kr.mdhelp.common.model.CustomUserDetails;

public class CustomAuthenticationProvide implements AuthenticationProvider {
	private static final Logger logger = LoggerFactory.getLogger(CustomAuthenticationProvide.class);
	private static final String sCPrefix = "▦▩▦▩▦ CustomAuthenticationProvide ▩ - ";
	@Autowired
	private UserDetailsService userDetailsService;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String username = authentication.getName();
		String password = (String)authentication.getCredentials();
		CustomUserDetails user = (CustomUserDetails) userDetailsService.loadUserByUsername(username);
		
		String dbPwd =user.getPwd();
		// password 일치하지 않으면!
		Authentication authenticationObj = null;
		if(!passwordEncoder.matches(password,dbPwd)){
			//logger.debug(sCPrefix +" !!!-- 비밀번호 불일치 --!!! ");
			throw new BadCredentialsException("BadCredentialsException");
		}else {
			//logger.debug(sCPrefix +" !!!-- 비밀번호 ●일치● --!!! ");
			//authenticationObj = new UsernamePasswordAuthenticationToken(username, password, user.getAuthorities());
			authenticationObj = new UsernamePasswordAuthenticationToken(user, password, user.getAuthorities());
		}
		//logger.debug(sCPrefix +" --------------------------------------------- > [{}] ",authenticationObj.isAuthenticated());
		return authenticationObj;
	}
	// 토큰 타입과 일치할 때 인증
	@Override
	public boolean supports(Class<?> authentication) {
		//logger.debug(sCPrefix +" !!!-- ●토큰 타입과 일치할 때 인증● --!!! ");
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}

}
