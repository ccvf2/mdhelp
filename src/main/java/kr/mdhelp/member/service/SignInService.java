package kr.mdhelp.member.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.mdhelp.member.model.MemberDTO;

@Service
public class SignInService implements SignInServiceInterface{
	private static final Logger logger = LoggerFactory.getLogger(SignInService.class);
	
	
	public MemberDTO signinProcess(MemberDTO memberDto) {
	return null;	
	}

}
