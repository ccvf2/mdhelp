package kr.mdhelp.member.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.mdhelp.member.dao.SignInDAOInterface;
import kr.mdhelp.member.model.MemberDTO;

@Service
public class SignInService implements SignInServiceInterface{
	private static final Logger logger = LoggerFactory.getLogger(SignInService.class);
	
	@Autowired
	private SignInDAOInterface signInDAO;
	
	public MemberDTO signinProcess(MemberDTO memberDto) {
		//memberDto = signInDAO.loginProcess(memberDto);
		
		return memberDto;
	}


}
