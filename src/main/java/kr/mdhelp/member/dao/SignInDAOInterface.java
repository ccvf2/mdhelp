package kr.mdhelp.member.dao;

import kr.mdhelp.config.CustomUserDetails;
import kr.mdhelp.member.model.MemberDTO;

public interface SignInDAOInterface {
	CustomUserDetails loginProcess(MemberDTO memberDTO);
}
