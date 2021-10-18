package kr.mdhelp.common.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.mdhelp.common.model.CodeVO;

@Repository
public class CommonCodeDAO {
	private static final Logger logger = LoggerFactory.getLogger(CommonCodeDAO.class);
	
	@Autowired
	private SqlSessionTemplate sql;
	
	public List<CodeVO> getCodeGroupList(Map<String, Object> searchParam) {
		logger.info("=============================get_CodeGroup_List DAO");
		return sql.selectList("select_code_group_list", searchParam);
		
	}
	public int insertCodeGroup(CodeVO codeGroupVO) {
		logger.info("=============================insertCodeGroup DAO");
		return sql.insert("insert_code_group", codeGroupVO);
		//sql.selectList("insert_code_group", codeGroupVO);
	}

	public List<CodeVO> getCodeList(Map<String, Object> searchParam) {
		logger.info("=============================get_Code_List DAO");
		return sql.selectList("select_code_list", searchParam);
	}
	public int deleteCodeGroup(CodeVO codeGroupVO) {
		return sql.delete("delete_code_group", codeGroupVO);
	}
	public int insertCode(CodeVO codeVO) {
		logger.info("=============================insertCode DAO");
		return sql.insert("insert_code", codeVO);
	}
	public int deleteCode(String code) {
		logger.info("=============================deleteCode DAO");
		return sql.delete("delete_code", code);
	}


}
