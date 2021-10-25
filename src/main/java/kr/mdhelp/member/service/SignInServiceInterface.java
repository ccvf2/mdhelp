package kr.mdhelp.member.service;

import org.springframework.security.core.userdetails.UserDetailsService;

import kr.mdhelp.member.model.MemberDTO;

public interface SignInServiceInterface {

	public MemberDTO signinProcess(MemberDTO memberDto);

}
