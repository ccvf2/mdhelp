package kr.mdhelp.member.dao;

import kr.mdhelp.common.model.CustomUserDetails;
import kr.mdhelp.member.model.MemberDTO;

public interface SignInDAOInterface {
	public CustomUserDetails loginProcess(MemberDTO memberDTO);
}
