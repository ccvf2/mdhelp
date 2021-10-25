package kr.mdhelp.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kr.mdhelp.common.model.CustomUserDetails;
import kr.mdhelp.member.dao.SignInDAOInterface;
import kr.mdhelp.member.model.MemberDTO;
@Service
public class CustomUserService implements CustomUserServiceInterface {
	private static final Logger logger = LoggerFactory.getLogger(CustomUserService.class);
	
	@Autowired
	private SignInDAOInterface signInDAO;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		logger.debug("======================================= 조회시작");
		MemberDTO memberDto = new MemberDTO();
		memberDto.setId(username);
		
		UserDetails user = (CustomUserDetails)signInDAO.loginProcess(memberDto);
		
		if(user==null) {
			throw new UsernameNotFoundException(username);
		}else {
			return user;
		}
		
	}

}
