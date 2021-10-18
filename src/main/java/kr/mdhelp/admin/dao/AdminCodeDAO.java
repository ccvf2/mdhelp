package kr.mdhelp.admin.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.mdhelp.common.model.CodeDTO;

@Repository
public class AdminCodeDAO implements AdminCodeDAOInterface {
	private static final Logger logger = LoggerFactory.getLogger(AdminCodeDAO.class);
	
	@Autowired
	private SqlSessionTemplate sql;
	
	@Override
	public int insertCodeGroup(CodeDTO codeGroupDTO) {
		logger.info("=============================insertCodeGroup DAO");
		return sql.insert("insert_code_group", codeGroupDTO);
	}
	@Override
	public int deleteCodeGroup(CodeDTO codeGroupDTO) {
		return sql.delete("delete_code_group", codeGroupDTO);
	}
	@Override
	public int insertCode(CodeDTO codeDTO) {
		logger.info("=============================insertCode DAO");
		return sql.insert("insert_code", codeDTO);
	}
	@Override
	public int deleteCode(String code) {
		logger.info("=============================deleteCode DAO");
		return sql.delete("delete_code", code);
	}

}
