package kr.mdhelp.common.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import kr.mdhelp.member.model.MemberDTO;


public class CustomUserDetails extends MemberDTO implements UserDetails, Serializable{
	private static final long serialVersionUID = 5117277687461102365L;

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
		
		String member_level = super.getMember_level();
		String memberAuthority = "ANONYMOUS";
		if( StringUtils.equals(member_level, "USERLEV1") ) {
			//일반 사용자
			memberAuthority = "USER";
		}else if(StringUtils.equals(member_level, "USERLEV12") ) {
			//관리자
			memberAuthority = "ADMIN";
		}else {
			//익명사용자(비로그인)
			memberAuthority = "ANONYMOUS";
		}
		auth.add(new SimpleGrantedAuthority(memberAuthority));
		//MemberDTO정보
		return auth;
	}

	@Override
	public String getPassword() {
		return getPwd();
	}

	@Override
	public String getUsername() {
		return getId();
	}
	/*- 계정이 만료되지 않았는 지 리턴한다. (true: 만료안됨) */
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	/**계정이 잠겨있지 않았는 지 리턴한다. (true: 잠기지 않음)*/
	@Override
	public boolean isAccountNonLocked() {
		String accountStatusCode = super.getAccount_active();
		if(StringUtils.equals(accountStatusCode, "UAUTH00") == false) {
			return true;
		}else {
			return false;
		}
	}
	/**비밀번호가 만료되지 않았는 지 리턴한다. (true: 만료안됨)*/
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	/** 계정이 활성화(사용가능)인 지 리턴한다. (true: 활성화)*/
	@Override
	public boolean isEnabled() {
		String activeStatusCode = super.getAccount_active();
		if(StringUtils.equals(activeStatusCode, "INACTIVE")) {
			return true;
		}else {
			return false;
		}
	}
	

	
}
