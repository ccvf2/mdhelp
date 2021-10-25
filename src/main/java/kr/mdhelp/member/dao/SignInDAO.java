package kr.mdhelp.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.mdhelp.config.CustomUserDetails;
import kr.mdhelp.member.model.MemberDTO;

@Repository
public class SignInDAO implements SignInDAOInterface {
	private static final Logger logger = LoggerFactory.getLogger(SignInDAO.class);
	
	@Autowired
	private SqlSessionTemplate sql;
	
	
	@Override
	public CustomUserDetails loginProcess(MemberDTO memberDTO) {
		return sql.selectOne("select_member_check", memberDTO);
	}
}
