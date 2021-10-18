package kr.mdhelp.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.mdhelp.member.model.MemberDTO;

@Repository
public class SignUpDAO implements SignUpDAOinterface{
	private static final Logger logger = LoggerFactory.getLogger(SignUpDAO.class);
	
	@Autowired
	private SqlSessionTemplate sql;

	/** 회원등록절차 */
	@Override
	public MemberDTO MembershipRegistrationProcess1(MemberDTO memberDTO) {
		sql.insert("insert_member", memberDTO);
		return memberDTO;
	}
	
	
}
