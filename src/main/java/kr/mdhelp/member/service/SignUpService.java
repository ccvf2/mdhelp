package kr.mdhelp.member.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.mdhelp.member.dao.SignUpDAOinterface;
import kr.mdhelp.member.model.MemberDTO;

@Service
public class SignUpService implements SignUpServiceInterface{
	private static final Logger logger = LoggerFactory.getLogger(SignUpService.class);
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private SignUpDAOinterface signUpDAO; 
	
	
	@Override
	public String PasswordEncryptorReturnToNULL(String pwd) {
		String encPwd = null;
		encPwd = passwordEncoder.encode(pwd);
		return encPwd;
	}

	/**회원가입 처리.*/
	@Override
	public MemberDTO MemberSignUpProcess1(MemberDTO memberDTO) {
		return signUpDAO.MembershipRegistrationProcess1(memberDTO);
	}

}
