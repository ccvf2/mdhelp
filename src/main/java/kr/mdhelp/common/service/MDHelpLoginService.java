package kr.mdhelp.common.service;

import java.util.ArrayList;
import java.util.List;
//import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
//import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;


@Service
public class MDHelpLoginService implements MDHelpLoginServiceImp{
	private static final Logger logger = LoggerFactory.getLogger(MDHelpLoginService.class);

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		//Optional<MemberDTOInterface> memberEntityWrapper = memberDao.findByAccount(account);
		// Member memberEntity = memberEntityWrapper.orElse(null);

		List<GrantedAuthority> authorities = new ArrayList<>();

		authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));

		//return new User(memberEntity.getAccount(), memberEntity.getPassword(), authorities);
		logger.debug("==========================loadUserByUsername Service");
		return null;
	}
}
