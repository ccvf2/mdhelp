package kr.mdhelp.member.service;

import kr.mdhelp.member.model.MemberDTO;

public interface SignUpServiceInterface {
	
	//String PasswordEncryptorReturnToNULL (String pwd);
	
	MemberDTO MemberSignUpProcess1(MemberDTO memberDTO);

}
